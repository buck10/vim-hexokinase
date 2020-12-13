let s:REGEX_NUM = '\d*\.\?\d*'

fun! hexokinase#patterns#latex_cmyk#get_pattern() abort
    let _ = '\s*'
    return '{cmyk}{'._.s:REGEX_NUM._.','._.s:REGEX_NUM._.','._.s:REGEX_NUM._.','._.s:REGEX_NUM._.'}'
endf

fun! hexokinase#patterns#latex_cmyk#process(str) abort
    let [r, g, b] = hexokinase#patterns#latex_cmyk#latex_cmyk_str_to_nums(a:str)
    if !hexokinase#utils#valid_rgb([r, g, b])
        return ''
    endif
    return hexokinase#utils#rgb_to_hex([r, g, b])
endf

fun! hexokinase#patterns#latex_cmyk#latex_cmyk_str_to_nums(rgb_str) abort
    let k = s:get_formatted_value(',', '}', a:rgb_str, 1)
    let r = floor(255 * (1 - s:get_formatted_value('{', ',', a:rgb_str, 1)) * (1 - k))
    let g = floor(255 * (1 - s:get_formatted_value(',', ',', a:rgb_str, 1)) * (1 - k))
    let b = floor(255 * (1 - s:get_formatted_value(',', ',', a:rgb_str, 2)) * (1 - k))
    return [r, g, b]
endf

fun! s:get_formatted_value(prefix, postfix, str, count) abort
    let _ = '\s*'
    return str2nr(matchstr(a:str, a:prefix._.'\zs'.s:REGEX_NUM.'\ze'._.a:postfix, a:count))
endf
