" Vim plug-in to set the fold text of C++ code
" Last Change:  2016 May 5
" Maintainer:   Brendan Robeson (github.com/brobeson/Tools.git)

" I don't check if this file is already loaded. I found that if I do, then the
" fold settings don't take effect after closing and opening a C++ file

" adapted from http://dhruvasagar.com/2013/03/28/vim-better-foldtext
" and another that I accidentally erased. I'm not sure why, but I can't make
" this a script local function. if I do, then use
" 'set foldtext=<SID>CppFoldText', then the folding doesn't display correctly.
if !exists('*CppFoldText')
    function CppFoldText()
        " start by folding a doxygen comment
        let fold_text = ''
        if exists('*FoldDoxygen')
            let fold_text = FoldDoxygen()
        endif

        " if the folded block isn't a doxygen comment, the function will
        " return '' and we can try other blocks.
        if fold_text == ''
            " get the first line. we need it to determine what type of fold text
            " to create. also initialize the fold text in a way to indicate a
            " folding case I haven't handled.
            let first_line = getline(v:foldstart)
            let fold_text = 'NO FOLD TEXT DEFINED'

            " 'commented' code via #if 0, or #ifdef 0
            if match(first_line, '^\s*#if\(def\)\?\s*0') == 0
                let first_code_line = getline(v:foldstart + 1)
                let space_count = match(first_code_line, '\S')
                let fold_text = repeat(' ', space_count) . '[ commented code ] '
                let fold_text .= substitute(first_code_line, '^\s*', '', '')

            " C style comment
            elseif match(first_line, '\/\*') != -1
                " if the comment marker is only followed by white space, use
                " the next line as the fold text.
                if (first_line =~ '\/\*\s*$')
                    let first_code_line = getline(v:foldstart + 1)
                    let first_code_line = substitute(first_code_line, '^\s*\*\s*', '', '')
                    let fold_text = substitute(first_line, '\*.*', '\* ', '')
                    let fold_text .= first_code_line

                " if the comment text starts on the line with the /* use that
                " line as the fold text
                else
                    let fold_text = first_line
                endif
                let fold_text .= ' ... */'

            " code blocks
            elseif match(first_line, '{') != -1
                " remove text following the block's opening '{'. it's not just set
                " to a brace, because we want to keep the leading white space so
                " the fold text remains aligned with the block identifier
                " (function name, class name, etc).
                let fold_text = substitute(first_line, '{.*', '{', '')

                " the fill text is the number of folded lines, right justified
                let fold_text .= printf(' %5d lines }', v:foldend - v:foldstart + 1)
            endif
        endif

        " Vim sets the tab character to 1 space in the fold text.  I want
        " the braces to remain aligned as in the code, so swap out the
        " tabs for enough spaces to match the tab stop
        let spaces = repeat(' ', &tabstop)
        let fold_text = substitute(fold_text, '\t', spaces, 'g')
        return fold_text
    endfunction
endif

setlocal foldenable             " enable code folding
setlocal foldmethod=syntax      " let the syntax determine the folds
setlocal foldtext=CppFoldText() " use my text folding function

