import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# Local 
import weio

# General
#   area which is ->  area that is
#   referred to as "bla bla" <- put the quotes
#  - Never use passive, use we instead
#  - Dot after citation/footnote at end of line
# 
# Abbreviations:
#  - Abbreviations introduced at the begining, use them everywhere
#    Computational fluid dynamics (CFD) <--- NOTE no capitalization
# 
# Tense:
#  - don't use future for current study
# 
# UpperCase:
#  - Section   also change autoref behavior to Section for everything (e.g. subsection)
#  - NO uppercase after colon
#  - Uppercase all first letters in Table columns
# 
# Figures:
#  - (Left) bla bla bla ; (right) bla bla bla
# 
# WIND ENERGY:
#   - GE 1.5-MW
#   - NREL 5-MW
# 
# Comma/punctiations,spaces:
#  - Yet, the.. -> Yet the...
#  - Use a dot after each item
#  - see e.g. -> see, e.g.,~\cite{}
#  - i.e. -> i.e.,
#  - 3m/s -> 3 m/s (Space before units)
#  - ``this'', and ``that''. -> ``this,'' and ``that.'' (Punctuation in quotes)
#  - item1, item2 and item3 - > item1, item2, and item3
# 
# Ideas for comments:
#   - for the most part
# 
# When to use which and since??


# --- Replacements that are context dependent, we'll throw a warning

REP_CONTEXT={
'consist in'              : ['consist of'  , 'followed by -ing verb'], 
'consists in'             : ['consists of'  , 'followed by -ing verb'], 
'consisted in'            : ['consisted of'  , 'followed by -ing verb'], 
' etc'                    : ['removed'     , 'when used with for instance or example'], 
'referred to as '         : ['needing quotes' , ''], 
' so-called '             : ['no quote after' , ''], 
'which'                   : ['that', 'unless in comes straight after a comma maybe']

# in the particular case X -> in the particular case of X
# may (may implies permission) -> can, could, might, will (imply ability)
#  - similar to
# 'low computational cost'  : 'low-computational-cost',
# 'high computational cost' : 'high-computational-cost',
# 'GE 1.5-MW'               : 'GE 1.5-MW', # <- HYPHEN
}
REP_CONTEXT_ADJ={
'boundary layer'         : 'boundary-layer',
'far wake'               : 'far-wake',    
'first order'            : 'first-order', 
'flow field'             : 'flow-field',
'high thrust'            : 'high-thrust', 
'hub height'             : 'hub-height',
'low thrust'             : 'low-thrust',  
'near wake'              : 'near-wake',   
'rotor plane'            : 'rotor-plane',
'second order'           : 'second-order',
'smaller scale'          : 'smaller-scale',
'steady state'           : 'steady-state',
'tower top'              : 'tower-top'   ,
'time domain'            : 'time-domain',
}
for k,v in REP_CONTEXT_ADJ.items():
    REP_CONTEXT[k] = [v, 'if adjective']
    REP_CONTEXT[v] = [k, 'if noun']
# --- Replacements that are recommendations, preferred "Synonymes":
REP_RECOM={
'2 , 6'              : 'two six',
'about $'            : 'approximately',
'but also'           : 'as well as',
'consisting of'      : 'Comprising (e.g. 111 turbines)',
'due to'             : 'because of, as a result of',
'extends on'         : 'extends xxx',
'for example'        : 'such as',
'From Fig it is seen': 'Fig shows',
'indeed'             : '(remove it)',
'hence'              : 'thereby',
'more discussion'    : 'further discussion',
'mostly'             : 'primarily',
'proceed to'         : '(remove it)',
'paper'              : 'work, article',
'paragraph'          : 'section',
'onshore'            : 'land-based',
'RPM'                : 'rpm',
'since'              : 'because',
'seen'               : 'observed, shown',
'thanks to'          : 'because of',
'Thanks to'          : 'Because of',
'upperscript'        : 'superscript',
'yet'                : 'however',
'wind farm'          : 'wind plant',
'which in turn'      : 'resulting',
}

# --- Replacements where the first letter may be an uppercase 
REP_CAP={
# --- Hyphen tricky
'tower top coordinate'   : 'tower-top coordinate',
'tower top position'     : 'tower-top position',
'tower top velocity'     : 'tower-top velocity',
'tower top acceleration' : 'tower-top acceleration',
'tower top point'        : 'tower-top point',
# 'first-order'          : 'first-order', # NOTE as adjectif
# 'second-order'         : 'second-order', #NOTE (as adjectif)
# 'tower top'            : 'tower-top', # NOTE(as adjective)
# 'GE 1.5-MW'              : 'GE 1.5-MW', # <- HYPHEN
# 'low computational cost' : 'low-computational-cost',
# 'high computational cost' : 'high-computational-cost',
# --- Need Hyphen
' MW'                    : '-MW',
'cost prohibitive'       : 'cost-prohibitive',
'deep array'             : 'deep-array',
'free stream'            : 'free-stream',
'full scale'             : 'full-scale',
'full velocity field'    : 'full-velocity field',
'ground effect'          : 'ground-effect',
'high speed'             : 'high-speed',
'horizontal axis'        : 'horizontal-axis',
'large scale'            : 'large-scale',
'large eddy'             : 'large-eddy',
'left hand side'         : 'left-hand side',
'low speed'              : 'low-speed',
'no flow through'        : 'no-flow-through',
'open source'            : 'open-source',
'real time'              : 'real-time',
'reduced order'          : 'reduced-order',
'right hand side'        : 'right-hand side',
'speed up'               : 'speed-up',
'standalone'             : 'stand-alone',
'state space'            : 'state-space',
'subgrid scale'          : 'subgrid-scale',
'tip speed'              : 'tip-speed',
'three dimensional'      : 'three-dimensional',
'vertical axis'          : 'vertical-axis',
'well captured'          : 'well-captured',
'$x$ axis'               : '$x$-axis',
'$y$ axis'               : '$y$-axis',
'$z$ axis'               : '$z$-axis',
# --- No space or hyphen
'axi symmetric'          : 'axisymmetric',
'build up'               : 'buildup',
'life time'              : 'lifetime',
'non rotating'           : 'nonrotating',
'non expanding'          : 'nonexpanding',
'non zero'               : 'nonzero',
'non linear'             : 'nonlinear',
'mid fidelity'           : 'midfidelity',
'several fold'           : 'severalfold',
'two fold'               : 'twofold',
'axi-symmetric'          : 'axisymmetric',
'life-time'              : 'lifetime',
'non-dimensional'        : 'nondimensional',
'non-expanding'          : 'nonexpanding',
'non-linear'             : 'nonlinear',
'non-rotating'           : 'nonrotating',
'non-turbulent'          : 'nonturbulent',
'non-zero'               : 'nonzero',
'mid-fidelity'           : 'midfidelity',
'several-fold'           : 'severalfold',
'sub-cycling'            : 'subcycling',
'two-fold'               : 'twofold',
# No Hyphen
'curled-wake'            : 'curled wake',
'digital-twin'           : 'digital twin',
'finite-difference'      : 'finite difference',
'fully-coupled'          : 'fully coupled',
'life-cycle'             : 'life cycle',
# --- Math
'is written $'           : 'is written as $',
'are written $'          : 'are written as $',
'be written $'           : 'be written as $',
'expressed as:'          : 'expressed as',
'as function of:'        : 'as a function of',
# '$x$-axis'               : 'x-axis',
# '$y$-axis'               : 'y-axis',
# '$z$-axis'               : 'z-axis',
# '$x$ axis'               : 'x-axis',
# '$y$ axis'               : 'y-axis',
# '$z$ axis'               : 'z-axis',
# 'x axis'                 : 'x-axis',
# 'y axis'                 : 'y-axis',
# 'z axis'                 : 'z-axis',
#  - The radial coordinate, $r$, <- NOTE commas
# --- Commas
'First '   : 'First, ',
'Then '    : 'Then, ',
'Finally ' : 'Finally, ',
'In this section ' : 'In this section, ',
'e.g. ' : 'e.g.,',
'i.e. ' : 'i.e.,',
# --- Ortho/language:
'modelling'     : 'modeling',
'modelled'      : 'modeled',
'labelled'      : 'labeled',
'has intensity' : 'has an intensity of',
'only possible' : 'possible only',
'coupled to'    : 'coupled with',
'writting'      : 'writing',
'compared to each other':'compared',
'equation of motions':'equations of motion',
'equations of motions':'equations of motion',
'well captured':'captured well',
'damaged equivalent':'damage equivalent',
'the need of':'the need for',
# --- capitalization
'github'       : 'GitHub',
# --- Figure
'shown in the right': 'shown on the right',
'given in the right': 'given on the right',
'shown in the left': 'shown on the left',
'given in the left': 'given on the left',
# --- Misc
'LES simulation': 'LES',
}



# --- Replacements where first letter shouldn't be capitalized
REP_NOCAP={
  'python':'Python',
}

def replace_in_file(infile, outfile):
    """"""
    print('>>> Reading: ',infile)
    with open(infile, errors='ignore', encoding='utf-8') as f:
        lines = f.readlines()
    print('')

    # Perform replacements
    DONE  = dict()
    RECOM = dict()
    RECOM_ADJ = dict()
    for i,l in enumerate(lines):
        #print(l)
        # Items where first letter may be capitalized
        for bad,good in REP_CAP.items():
            if l.find(bad)>=0:
                l=l.replace(bad,good)
                if bad in DONE.keys():
                    DONE[bad]+=1
                else:
                    DONE[bad]=1
            if l.find(bad.capitalize())>0:
                l=l.replace(bad.capitalize(),good.capitalize())
                if bad in DONE.keys():
                    DONE[bad]+=1
                else:
                    DONE[bad]=1
        # Items to be taken without capitalization of first letter
        for bad,good in REP_NOCAP.items():
            if l.find(bad)>=0:
                l=l.replace(bad,good)
                if bad in DONE.keys():
                    DONE[bad]+=1
                else:
                    DONE[bad]=1

        # Warnings (context dependent)
        for bad,good in REP_CONTEXT.items():
            if l.find(bad)>=0:
                print('Warning: line {:5d}, `{}` could be `{}` {}'.format(i+1,bad,good[0],good[1]))
        # Warnings (context dependent)
        for bad,good in REP_RECOM.items():
            if l.lower().find(bad)>=0:
                if bad in RECOM.keys():
                    RECOM[bad]+=1
                else:
                    RECOM[bad]=1
        #print(l)
        lines[i]=l

    # --- Showing info to screen 
    print('')
    print('>>> Recommendations:')
    for k,v in RECOM.items():
        print('{:20s}'.format(k),v,' consider alternative: ', REP_RECOM[k])
        #print('Warning: line {:5d}, `{}` consider alternative: `{}`'.format(i+1,bad,good))
    print('')

    print('>>> Replacements done:')
    for k,v in DONE.items():
        try:
            alt = REP_CAP[k]
        except:
            alt = REP_NOCAP[k]
        print('{:20s}  {}      (->{})'.format(k,v,alt))

    print('')
    print('>>> Writing to: ',outfile)
    with open(outfile, 'w', encoding='utf-8') as f:
        for l in lines:
            f.write(l)


        
if __name__ == '__main__':
    import sys
    #replace_in_file('test.tex', 'test_out.tex')
    if len(sys.argv)<3:
        print('Two arguments required: FileIn FileOut')
#         replace_in_file('Ch4_Struct.tex', 'test_out.tex')
    elif len(sys.argv)==2:
        print('Performing in-place replacements!')
        #replace_in_file(sys.argv[1], sys.argv[1])
    elif len(sys.argv)==3:
        replace_in_file(sys.argv[1], sys.argv[2])

    pass



