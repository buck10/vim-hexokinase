fun! hexokinase#patterns#latex_hex#get_pattern() abort
    return '{HTML}{\x\{6}}'
endf

fun! hexokinase#patterns#latex_hex#process(str) abort
    return '#' . matchstr(a:str, '\x\{6}')
endf
