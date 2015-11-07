function! MarkdownFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^##') >= 0
        return ">2"
    elseif match(thisline, '^#') >= 0
        return ">1"
    else
        return "="
    endif
    return "1"
endfunction
setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()
