let s:REGEX_NUM = '\d*\.\?\d*'

fun! hexokinase#patterns#latex_rgb#get_pattern() abort
    let _ = '\s*'
    return '{\(rgb|RGB\)}{'._.s:REGEX_NUM._.','._.s:REGEX_NUM._.','._.s:REGEX_NUM._.'}'
endf

fun! hexokinase#patterns#latex_rgb#process(str) abort
    let [r, g, b] = hexokinase#patterns#latex_rgb#latex_rgb2_str_to_nums(a:str)
    if !hexokinase#utils#valid_rgb([r, g, b])
        return ''
    endif
    return hexokinase#utils#rgb_to_hex([r, g, b])
endf

fun! hexokinase#patterns#latex_rgb#latex_rgb2_str_to_nums(rgb_str) abort
    let multiplier = matchstr(a:rgb_str, '\(rgb|RGB\)') ==# 'rgb' ? 255 : 1
    let r = floor(s:get_formatted_value('{', ',', a:rgb_str) * multiplier)
    let g = floor(s:get_formatted_value(',', ',', a:rgb_str) * multiplier)
    let b = floor(s:get_formatted_value(',', '}', a:rgb_str) * multiplier)
    return [r, g, b]
endf

fun! s:get_formatted_value(prefix, postfix, str) abort
    let _ = '\s*'
    return str2nr(matchstr(a:str, a:prefix._.'\zs'.s:REGEX_NUM.'\ze'._.a:postfix))
endf
