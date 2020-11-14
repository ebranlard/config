#!/usr/bin/env python
#############################################################
# MakeStandaloneFigs:
#############################################################
# Description : Takes a latex file (with preamble) and generate standalone pdf figures for each figure environment
#               Use --help option argument for more.
# Written by : Emmanuel Branlard
# Date : February 2014
# Dependencies : python, latex
# License : Feel free to modify and adapt it
#############################################################
import platform
import os, re
import glob
import sys
import argparse
import subprocess
import shutil

DESCRIPTION="""Description:
Takes one latex file (should have preamble for now) and generate standalone pdf figures for each figure environment. 

If you have custom commands to generate your figure, run de-macro on it before.
"""

# --------------------------------------------------------------------------------
# --- PARAMETERS
# --------------------------------------------------------------------------------
NoCaption=True  # remove the caption in the figure environment

# Latex options
EPS_CMD     = 'pdftops -eps '
CROP_CMD    = 'pdfcrop '
COMPILE_CMD = 'pdflatex --interaction=nonstopmode '
BIBTEX_CMD  = 'bibtex '
CMD_OUT=' >/dev/null'
if platform.system() == 'Windows':
    CMD_OUT=' >nul'

HEADERS0=r"""
\usepackage[xetex,active,displaymath,tightpage]{preview}
\PreviewSnarfEnvironment[{[]}]{figure}
\setlength\PreviewBorder{"""
HEADERS1=r"""pt}  %  CHANGE ME if you want more spacing
\begin{document}
\pagestyle{empty}\thispagestyle{empty}
"""

# --------------------------------------------------------------------------------
# ---  
# --------------------------------------------------------------------------------

# pattern_latex_figure = re.compile(r'\\begin\{(document|abstract)')
pattern_document   = re.compile(r'\\begin\{document')
pattern_figure     = re.compile(r'.*\\begin\{figure')
pattern_figure_end = re.compile(r'.*\\end\{figure')
pattern_comment    = re.compile(r'\s*%') # matching either " % " or anything different than "\ % " i.e. "sldjfksdfsfsldfkj % ?dskfjskf"

pattern_command_1opt_1arg = re.compile(r'\\(?P<command>\w+)(?P<optional>(\[\w*\])?)\{(?P<arg1>.*?)\}',re.DOTALL)
pattern_command_caption   = re.compile(r'\\(?P<command>caption)(?P<optional>(\[.*\])?)\{(?P<arg>.*?)\}',re.DOTALL)
pattern_command_label     = re.compile(r'\\(?P<command>label)(?P<optional>(\[.*\])?)\{(?P<arg>.*?)\}',re.DOTALL)
pattern_command_figure    = re.compile(r'.*\\begin\{(?P<command>figure[\*]?)\}(?P<arg>(\[[^\]]+\]))',re.DOTALL)
pattern_command_graphicspath = re.compile(r'.*\\graphicspath')

def main(argv):
    # Configure argument parser
    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,description=DESCRIPTION)
    parser.add_argument('--version', action='version', version='%(prog)s 1.0')
    parser.add_argument('--dry'          , help='perform a dry run',action='store_true')
    parser.add_argument('--fullwidth'    , help='use full page width',action='store_true')
    parser.add_argument('--cropafter'    , help='crop figure after creation',action='store_true')
    parser.add_argument('--toeps'        , help='covert figure to eps at the end',action='store_true')
    parser.add_argument('--folder'       , help='Folder for all outputs',default='./')
    parser.add_argument('--notexfile'    , help='do not create a tex file',action='store_true')
    parser.add_argument('--nocompilation', help='do not perform final compilation of tex file',action='store_true')
    parser.add_argument('--nofigs'       , help='do not create the figures (assuming they exist)',action='store_true')
    parser.add_argument('--border'       , help='add a border of `n` pt)',type=int, default=0)
#     parser.add_argument('tex_file', nargs='+', help='List of files')
    parser.add_argument('tex_file', nargs=1, help='Tex file containing figure environments')

    opts = parser.parse_args(argv)
    tex_file=opts.tex_file[0]

    if opts.dry:
        print('[INFO] Dry run')
    if opts.fullwidth:
        print('[INFO] Figure will use full page width')
    if opts.cropafter:
        print('[INFO] Figure will be cropped afterward')

    if opts.notexfile and (not opts.nocompilation):
        fail('You cannot have the option `notexfile` if you want the compilation')

    if opts.folder!='./':
        COMPILE_CMD_DIR=COMPILE_CMD+'--output-directory '+opts.folder+' '
    print('[INFO] Output folder: '+opts.folder)
    print('------------------------------------------------------')
 



    with open(tex_file,'r') as f:
        # --------------------------------------------------------------------------------
        # ---  Extracting Headers
        # --------------------------------------------------------------------------------
        Headers=[];
        line = f.readline()
        while line :
            if pattern_document.match(line):
                break;
            else:
                Headers.append(line);
            line=f.readline()
        # --------------------------------------------------------------------------------
        # ---  Adding useful package to header
        # --------------------------------------------------------------------------------
        Headers.append(HEADERS0+str(opts.border)+HEADERS1)
        if NoCaption:
            Headers.append(r'\renewcommand{\caption}[2][]{}'+'\n')

        # --------------------------------------------------------------------------------
        # ---  Finding figure environment
        # --------------------------------------------------------------------------------
        Figures=[];
        while line:
            if pattern_comment.match(line):
                pass
            elif pattern_figure.match(line):
                print('[INFO] found figure on line: '+line.strip())
                # we match a begin figure, we'll store the figure lines
                if opts.fullwidth:
                    # Let's do a hack to ensure that we use full page width
                    m=pattern_command_figure.match(line);
                    iend=m.end()
                    if iend<=len(line):
                        rest_of_line=line[iend:];
                    else:
                        rest_of_line=''
        #             line=line[0:iend]+'\\noindent\\rule{\linewidth}{0pt}\\\\'+rest_of_line
                    line=line[0:iend]+'\\begin{minipage}[c]{\\textwidth}'+rest_of_line
                #
                FigureLines=[];
                while ( not pattern_figure_end.match(line) ):
                    FigureLines.append(line)
                    line = f.readline()

                if opts.fullwidth:
                    istart=line.find('\\end{figure')
                    if istart!=0:
                        rest_of_line=line[0:istart];
                    else:
                        rest_of_line==''
                    line=rest_of_line+'\\end{minipage}'+line[istart:]
                    #print(line)
                
                # we append also the last line (which might be the first)
                FigureLines.append(line) 

                # We store a list of those figure lines
                Figures.append(FigureLines)

            #
            line = f.readline()
    


    # --------------------------------------------------------------------------------
    # ---  Looping on figure environments and compile standalones
    # --------------------------------------------------------------------------------
    if not os.path.exists(opts.folder):
        os.makedirs(opts.folder)
    print('[INFO] Number of figure found: {}'.format(len(Figures)))
    if not opts.nofigs:
        for i,fig in enumerate(Figures):
            print('--------------------- Creating figure {} --------------'.format(i+1))
            tmpfile_content=''.join(Headers)+''.join(fig)+'\n'+'\end{document}' ;
            outfile=os.path.join(opts.folder,str(i+1)+'.pdf') # TODO possible imnprovements on filename based on label for instance
            compile_this(COMPILE_CMD_DIR,tmpfile_content,outfile,opts.dry)
            if opts.cropafter:
                crop_this(outfile,opts.dry)
            if opts.toeps:
                eps_this(outfile,opts.dry)
    print('------------------------------------------------------')
    
    # --------------------------------------------------------------------------------
    # ---  if wanted, we create a new tex file
    # --------------------------------------------------------------------------------
    if not opts.nocompilation:
        tex_file_out_base = os.path.splitext(os.path.basename(tex_file))[0]+'-final'
        tex_file_out      = os.path.join(opts.folder,tex_file_out_base+'.tex')
        print('[INFO] Creating new tex file: '+tex_file_out)
        # reopen input file for reading
        f=open(tex_file,'r')     ; 
        # open output
        fout=open(tex_file_out,'w') ; 
        # Loop overlines
        line=f.readline()
        cpt=0
        while line:
            if pattern_comment.match(line):
                fout.write(line)
            #elif pattern_command_graphicspath.match(line):
            #    print(line.strip())
            #    fout.write(line)
                
            elif pattern_figure.match(line):
                # we match a begin figure, we'll store the figure lines igen!(quick and dirty)
                cpt=cpt+1
                FigureLines=[];
                while ( not pattern_figure_end.match(line) ):
                    FigureLines.append(line)
                    line = f.readline()
                FigureLines.append(line) # we append also the end figure

                FigureLines=''.join(FigureLines)
                ### Some nasty handling
                bPrintFigLines=False

                # Iterator over Matching Caption commands
                iter_match_caption=pattern_command_caption.finditer(FigureLines);
                match_caption = None
                for match_caption in iter_match_caption:
                    pass
                # Captions are not that easy (involve matching brackets, so we have to loop
                if match_caption is not None:
                    i=match_caption.start()
                    no=0
                    nc=0
                    istart=0 #safety..
                    while i<len(FigureLines):
                        if FigureLines[i]=='{':
                            no=no+1;
                            if no==1:#first opening bracket
                                istart=i+1;
                        elif FigureLines[i]=='}':
                            nc=nc+1;
                            if nc==no:
                                # Find we found our position
                                break
                        i=i+1; 
                    caption=FigureLines[istart:i]


                # Iterator over Matching Label commands
                iter_match_label=pattern_command_label.finditer(FigureLines);

                # matching figure arguments \begin{figure}[!htpb]
                match_figure=pattern_command_figure.match(FigureLines);
                if match_figure:
                    fig_pos=match_figure.group('arg');
                else:
                    print('WARNING: NO FIGURE POSITIONING FOUND IN FIGURE BELOW')
                    fig_pos='[h]'
                    bPrintFigLines=True

                ### Writting figure back to latex 
                fout.write('\\noindent\\begin{figure}%s\\centering%%\n' % fig_pos)
                fout.write('\\includegraphics[width=\\textwidth]{%d}%%\n' % cpt)
                if match_caption is not None:
                    fout.write('\\caption%s{%s}' %(match_caption.group('optional'),caption))
                else:
                    print('WARNING: NO CAPTION FOUND IN FIGURE BELOW')
                    bPrintFigLines=True
                match_label = None
                for match_label in iter_match_label:
                    # For backward compatibility, we display all labels
                    if(len(match_label.group('arg'))>0):
                        fout.write(' \\label{%s}%%\n' %match_label.group('arg'))
                if match_label is None:
#                 else:
                    print('WARNING: NO LABEL FOUND IN FIGURE BELOW')
                    bPrintFigLines=True


                if bPrintFigLines:
                    fout.write('\n')
                    print(FigureLines)

                fout.write(r'\end{figure}'+'\n')

            else:
                fout.write(line)

            line=f.readline()
        fout.close()
        f.close()
    # --------------------------------------------------------------------------------}
    # --- Copying some regular files
    # --------------------------------------------------------------------------------{
    bOtherFolder=False
    if opts.folder!='./':
        bOtherFolder=True
        copy_by_pattern(r'*.bib',opts.folder)
        copy_by_pattern(r'*.cls',opts.folder)
        copy_by_pattern(r'*.sty',opts.folder)
        copy_by_pattern(r'*.bst',opts.folder)
        copy_by_pattern(r'*.ist',opts.folder)
        copy_by_pattern(r'*.cfg',opts.folder) # needed for copernicus
        # Creating a makefile
        with open(os.path.join(opts.folder,'Makefile'),'w') as f:
            f.write('ifdef SYSTEMROOT\n')
            f.write('	RM=del\n')
            f.write('else\n')
            f.write('	RM=rm\n')
            f.write('endif\n')
            f.write('all:\n')
            f.write('\t'+COMPILE_CMD+tex_file_out_base+'\n')
            f.write('\t'+BIBTEX_CMD +tex_file_out_base+'\n')
            f.write('\t'+COMPILE_CMD+tex_file_out_base+'\n')
            f.write('\t'+COMPILE_CMD+tex_file_out_base+'\n')
            f.write('pdf:\n')
            f.write('\t'+COMPILE_CMD+tex_file_out_base+'\n')
            f.write('clean:\n')
            f.write('\t@$(RM) *.aux *.bbl *.blg *.log *.dvi *.idx *.ilg *.ind *.toc *.lot *.thm *.cb *.cb2 *.gls *.mtc0\ \n')
            f.write('\t@$(RM) *.lof *~ *.bak *.blg *.exa *.adx *.bmt *.mtc *.out *.som *.glo *.glx *.tns *.tpt *.maf *.brf *.pag \n')
    # --------------------------------------------------------------------------------}
    # --- Compiling final document
    # --------------------------------------------------------------------------------{
    if not opts.nocompilation:
        if not os.path.exists(tex_file_out):
            fail('File not found {}'.tex_file_out)
        
        run_me(COMPILE_CMD_DIR+tex_file_out+CMD_OUT, opts.dry)
        if not os.path.exists(tex_file_out.replace('.tex','.pdf')):
            fail('Pdf not created from {}'.format(tex_file_out))
    
        if not bOtherFolder or platform.system() == 'Windows':
            run_me(BIBTEX_CMD+tex_file_out.replace('.tex','')+CMD_OUT, opts.dry)
            check_biblog(tex_file_out)
            run_me(COMPILE_CMD_DIR+tex_file_out+CMD_OUT, opts.dry)
            run_me(COMPILE_CMD_DIR+tex_file_out+CMD_OUT, opts.dry)
            check_texlog(tex_file_out)
        else:
            if bOtherFolder:
                run_me('make -C '+opts.folder+CMD_OUT, opts.dry)
                check_biblog(tex_file_out)
                check_texlog(tex_file_out)
            else:
                raise NotImplementedError('Maybe something wrong')

        # Deleting temp files
        for f in glob.glob(tex_file_out.replace('.tex','.*')):
            ext=os.path.splitext(f)[-1].lower()
            if ext=='.tex' or ext=='.pdf':
                pass
            else:
                pass
                #os.remove(f)



# --------------------------------------------------------------------------------}
# --- Small helper
# --------------------------------------------------------------------------------{
def check_texlog(texfile):
    pattern_error       = re.compile(r'.*Error:')
    pattern_undefined   = re.compile(r'.*undefined reference')
    with open(texfile.replace('.tex','.log'),'r') as f:
        for line in f.readlines():
            if pattern_undefined.match(line):
                fail('Undefined references found in latex log file!')
            if pattern_error.match(line):
                fail('Errors found in latex log file!')
    print('[ OK ] Texlog fine')

def check_biblog(texfile):
    pattern_error       = re.compile(r'.*error message')
    with open(texfile.replace('.tex','.blg'),'r') as f:
        for line in f.readlines():
            if pattern_error.match(line):
                fail('Errors found in bibtex log file!')
    print('[ OK ] Biblog fine')

def run_me(cmd,bDryRun):
    print('[INFO] Running: '+cmd)
    if(not bDryRun):
        os.system(cmd)
def fail(msg):
    print('[FAIL] '+msg)
    sys.exit(-1)

def copy_by_pattern(pattern,dest_dir):
    for f in glob.glob(pattern):
        shutil.copy(f, dest_dir)

def rm_by_pattern(pattern):
    for f in glob.glob(pattern):
        os.remove(f)

# --------------------------------------------------------------------------------}
# --- Pdf compilation 
# --------------------------------------------------------------------------------{
def compile_this(compile_cmd,content,outfile,bDryRun):
    # Use pdflatex to compile a standalone figure

    # TODO use tmp file and detached command for potential parallel computation
    basedir=os.path.dirname(outfile)
    tmpfile_name=os.path.join(basedir,'tmpfile.tex')
    pdffile_name=os.path.join(basedir,'tmpfile.pdf')
    if os.path.exists(pdffile_name):
        if not bDryRun:
            os.remove(pdffile_name)
    ftmp=open(tmpfile_name,'w');
    ftmp.write(content); 
    ftmp.close(); 

    if os.path.exists(outfile):
        print('[WARN] Deleting: {}'.format(outfile))
        if not bDryRun:
            os.remove(outfile)

    run_me(compile_cmd+tmpfile_name+CMD_OUT, bDryRun)
    if(not bDryRun):
        os.rename(pdffile_name,outfile)
        if os.path.exists(outfile):
            print('[INFO] Created: '+outfile)
            rm_by_pattern(tmpfile_name.replace('.tex','.*'))
        else:
            fail('Creation of: '+outfile)


# --------------------------------------------------------------------------------}
# --- Cropping
# --------------------------------------------------------------------------------{
def crop_this(outfile,bDryRun,bVertOnly=False):
    bkp_name=outfile.replace('.pdf','-full.pdf')
    print('[INFO] Renaming to: '+bkp_name)
    if(not bDryRun):
        if os.path.exists(bkp_name):
            os.remove(bkp_name)
        os.rename(outfile,bkp_name)
    run_me(CROP_CMD+bkp_name+' '+outfile+CMD_OUT, bDryRun)
    if(not bDryRun):
        if os.path.exists(outfile):
            print('[INFO] Created: '+outfile)
        else:
            fail('Creation of: '+outfile)

# --------------------------------------------------------------------------------}
# --- To eps
# --------------------------------------------------------------------------------{
def eps_this(infile,bDryRun):
    outfile=infile.replace('.pdf','.eps')
    run_me(EPS_CMD+infile+' '+outfile+CMD_OUT , bDryRun)
    if(not bDryRun):
        if os.path.exists(outfile):
            print('[INFO] Created: '+outfile)
        else:
            fail('Creation of: '+outfile)



def launch_cmd_detached(cmd):
    #print('Calling external:'+cmd)
    from subprocess import Popen, PIPE
    
    try:
        # set system/version dependent "start_new_session" analogs
        kwargs = {}
        if platform.system() == 'Windows':
            # from msdn [1]
            CREATE_NEW_PROCESS_GROUP = 0x00000200  # note: could get it from subprocess
            DETACHED_PROCESS = 0x00000008          # 0x8 | 0x200 == 0x208
            kwargs.update(creationflags=DETACHED_PROCESS | CREATE_NEW_PROCESS_GROUP)  
        elif sys.version_info < (3, 2):  # assume posix
            kwargs.update(preexec_fn=os.setsid)
        else:  # Python 3.2+ and Unix
            kwargs.update(start_new_session=True)

        p = Popen(cmd.split(' '), stdin=PIPE, stdout=PIPE, stderr=PIPE, **kwargs)
        assert not p.poll()
        #print('Command has returned')


    except OSError:
        print('Impossible to execute command: ' + cmd)




if __name__ == "__main__":
    main(sys.argv[1:])

