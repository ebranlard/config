import sys
import os
import sys, os
import re
import unittest

# 
def clean_line(line,bNoRef=False):
    if bNoRef:
        line = re.sub(r'\{reference-type="ref" reference="[0-9a-zA-Z:-_]*"\}', '', line)
        # Sections [1.1](sec:AAA) -> [@sec:AAA]
        line = re.sub(r'\[[0-9.]*\]\(#([0-9a-zA-Z:-_]*)\)', r'[\1]', line)
        # Sections [1.1](sec:AAA) -> [@sec:AAA]
        line = re.sub(r'\[[0-9.]*\]\(#([0-9a-zA-Z:-_]*)\)', r'[\1]', line)
        # Equations [](#eq:AAA) -> [@eq:AAA]
        line = re.sub(r'\[[\[\]\\0-9a-zA-Z:]*\]\(#([0-9a-zA-Z:-_]*)\)', r'[\1]', line)
        # Equations [\[eq:AAA\]]{#eq:AAA label="eq:AAA"} -> [@eq:AAA]
        line = re.sub(r'\[\\\[([0-9a-zA-Z:-_]*)\\\]\]\{#[0-9a-zA-Z:-_\ ]*label="[0-9a-zA-Z:-_]*"\}', r'[\1]', line)

        # Label  -> 
        line = re.sub(r'\\label\{([0-9a-zA-Z:-_]*)\}[\ ]*\$\$', r'  {\1} $$ ', line)
        # Label  -> 
        line = re.sub(r'\\label\{([0-9a-zA-Z:-_]*)\}[\ ]*\\end\{aligned\}[\ ]*\$\$', r'\\end{aligned}  {\1} $$ ', line)
    else:
        line = re.sub(r'\{reference-type="ref" reference="[0-9a-zA-Z:-_]*"\}', '', line)
        # Sections [1.1](sec:AAA) -> [@sec:AAA]
        line = re.sub(r'\[[0-9.]*\]\(#([0-9a-zA-Z:-_]*)\)', r'[@\1]', line)
        # Sections [1.1](sec:AAA) -> [@sec:AAA]
        line = re.sub(r'\[[0-9.]*\]\(#([0-9a-zA-Z:-_]*)\)', r'[@\1]', line)
        # Equations [](#eq:AAA) -> [@eq:AAA]
        line = re.sub(r'\[[\[\]\\0-9a-zA-Z:]*\]\(#([0-9a-zA-Z:-_]*)\)', r'[@\1]', line)
        # Equations [\[eq:AAA\]]{#eq:AAA label="eq:AAA"} -> [@eq:AAA]
        line = re.sub(r'\[\\\[([0-9a-zA-Z:-_]*)\\\]\]\{#[0-9a-zA-Z:-_\ ]*label="[0-9a-zA-Z:-_]*"\}', r'[@\1]', line)

        # Label  -> 
        line = re.sub(r'\\label\{([0-9a-zA-Z:-_]*)\}[\ ]*\$\$', r'$$ {#\1}', line)
        # Label  -> 
        line = re.sub(r'\\label\{([0-9a-zA-Z:-_]*)\}[\ ]*\\end\{aligned\}[\ ]*\$\$', r'\\end{aligned}$$ {#\1}', line)

    return line


def parsefile(filein,fileout,bNoRef=False):
    with open(filein, 'r') as f_in:
        with open(fileout, 'w') as f_out:
            for line in iter((f_in.readline),""):
                line=clean_line(line,bNoRef)
                f_out.write(line)


class Test(unittest.TestCase):
    def setUp(self):
            self.junk = """ "} )# 0 a \"' """

    def linetest(self,line,lineref):
        line_in  = line+self.junk
        line_out = clean_line(line_in)
        line_ref = lineref+self.junk
        print('')
        print('In : '+line_in)
        print('Out: '+line_out)
        print('Ref: '+line_ref)
        print('')
        self.assertEqual( line_out, line_ref)
        
    def test_section(self):
        line="""In section [1.1](#sec:Mysection){reference-type="ref" reference="sec:Mysection"}"""
        self.linetest(line, 'In section [@sec:Mysection]')

    def test_eqref(self):
        line="""In equation [\[eq:try\]](#eq:try){reference-type="ref" reference="eq:try"}"""
        self.linetest(line, 'In equation [@eq:try]')

        line="""[\[eq:second\]]{#eq:second label="eq:second"}"""
        self.linetest(line, '[@eq:second]')

        line="""given in [\[eq:flowrate1D\]](#eq:flowrate1D){reference-type="ref" reference="eq:flowrate1D"} the """
        self.linetest(line, 'given in [@eq:flowrate1D] the ')



    def test_eqlabel(self):
        line="""$$x=1 \label{eq:try}$$"""
        self.linetest(line, '$$x=1 $$ {#eq:try}')
#         line="""$$ \label{eq:firsteq} $$"""
#         self.linetest(line, '$$x=1 $$ {#eq:try}')


    def test_eqlabel_align(self):
        line="""$$\\begin{aligned}z &= 100\label{eq:last}\end{aligned}$$"""
        self.linetest(line, '$$\\begin{aligned}z &= 100\end{aligned}$$ {#eq:last}')





if __name__ == '__main__':
    if len(sys.argv)==1:
        unittest.main()
    else:
        if len(sys.argv)==4:
            bNoRef=True
        else:
            bNoRef=False
        filein=sys.argv[1]
        fileout=sys.argv[2]
        parsefile(filein,fileout,bNoRef)

