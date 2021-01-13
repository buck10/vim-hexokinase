fun! hexokinase#patterns#full_hex#get_pattern() abort
    return '\(#\|{HEX}{\)\x\{6}}\?'
endf

fun! hexokinase#patterns#full_hex#process(str) abort
    return '#' . matchstr(a:str, '\(#\|{HEX}{\)\x\{6}}\?')
endf
