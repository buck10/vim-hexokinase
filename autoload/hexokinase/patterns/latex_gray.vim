let s:REGEX_NUM = '\d*\.\?\d*'

fun! hexokinase#patterns#latex_gray#get_pattern() abort
    let _ = '\s*'
    return '{gray}{'._.s:REGEX_NUM._.'}'
endf

fun! hexokinase#patterns#latex_gray#process(str) abort
    let _ = '\s*'
    let g = floor(str2nr(matchstr(a:str, s:REGEX_NUM)) * 255)
    if !hexokinase#utils#valid_rgb([g, g, g])
        return ''
    endif
    return hexokinase#utils#rgb_to_hex([g, g, g])
endf
