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
'high thrust'             : ['high-thrust',  'if adjective'],
'first order'             : ['first-order',  'if adjective'],
'second order'            : ['second-order', 'if adjective'],
'tower top'               : ['tower-top'   , 'if adjective'],
'near wake'               : ['near-wake',    'if adjective'],
'far wake'                : ['far-wake',     'if adjective'],
'low thrust'              : ['low-thrust',   'if adjective'],
'high thrust'             : ['high-thrust',  'if adjective'],
'consist in'              : ['consist of'  , 'followed by -ing verb'], 
' etc'                    : ['removed'     , 'when used with for instance or example'], 
'referred to as '         : ['needing quotes' , ''], 
# in the particular case X -> in the particular case of X
# may (may implies permission) -> can, could, might, will (imply ability)
#  - similar to
# 'low computational cost'  : 'low-computational-cost',
# 'high computational cost' : 'high-computational-cost',
# 'GE 1.5-MW'               : 'GE 1.5-MW', # <- HYPHEN
}
# --- Replacements that are recommendations, preferred "Synonymes":
REP_RECOM={
'for example': 'such as',
'yet'                : 'however',
'seen'               : 'observed, shown',
'paper'              : 'work, article',
'paragraph'          : 'section',
'since'              : 'because',
'due to'             : 'because of, as a result of',
'which in turn'      : 'resulting',
'From Fig it is seen': 'Fig shows',
'hence'              : 'thereby',
'wind farm'          : 'wind plant',
'extends on'         : 'extends xxx',
'2 , 6'              : 'two six',
'more discussion'    : 'further discussion',
'about $'            : 'approximately',
'but also'           : 'as well as',
'mostly'             : 'primarily',
'consisting of'      : 'Comprising (e.g. 111 turbines)',
'indeed'             : '(remove it)',
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
'full scale'             : 'full-scale',
'tip speed'              : 'tip-speed',
'reduced order'          : 'reduced-order',
'free stream'            : 'free-stream',
'real time'              : 'real-time',
'three dimensional'      : 'three-dimensional',
'no flow through'        : 'no-flow-through',
'large scale'            : 'large-scale',
'low speed'              : 'low-speed',
'high speed'             : 'high-speed',
'state space'            : 'state-space',
'steady state'           : 'steady-state',
'full velocity field'    : 'full-velocity field',
'ground effect'          : 'ground-effect',
'well captured'          : 'well-captured',
'speed up'               : 'speed-up',
'deep array'             : 'deep-array',
'cost prohibitive'       : 'cost-prohibitive',
'open source'            : 'open-source',
'left hand side'         : 'left-hand side',
'right hand side'        : 'right-hand side',
'subgrid scale'          : 'subgrid-scale',
' MW'                    : '-MW',
# --- No space or hyphen
'axi symmetric'          : 'axisymmetric',
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
# --- No Hyphen
'hub-height'             : 'hub height',
'boundary-layer'         : 'boundary layer',
'fully-coupled'          : 'fully coupled',
'life-cycle'             : 'life cycle',
'digital-twin'           : 'digital twin',
'flow-field'             : 'flow field',
'rotor-plane'            : 'rotor plane',
# --- Math
'is written $'           : 'is written as $',
'are written $'          : 'are written as $',
'be written $'           : 'be written as $',
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
# --- Figure
'shown in the right': 'shown on the right',
'given in the right': 'given on the right',
'shown in the left': 'shown on the left',
'given in the left': 'given on the left',
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



