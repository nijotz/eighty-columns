" Bind a key to toggle coloring lines past 80, in your vimrc:
" nnoremap <leader>8 :call eighty#ToggleColorColumn()<cr>
" Defaults to all columns after 80 being colored.
" Toggles between 80, 100, 120, and off
" Toggles globally

if !exists('g:eighty_columns')
    let g:eighty_columns = 80
endif
if !exists('g:eighty_columns_show')
    let g:eighty_columns_show = 1
endif
if !exists('g:eighty_columns_toggles')
    let g:eighty_columns_toggles = [80, 100, 120, 0]
endif

function! eighty#SetColorColumn(num_columns)
    if a:num_columns == 0 || a:num_columns == ""
        let &colorcolumn = ""
    else
        let &colorcolumn = join(range(a:num_columns+1,999),",")
    endif
endfunction

function! eighty#ToggleColorColumn()
    " First time this has been run in the current buffer
    if !exists('b:eighty_columns')
        let b:eighty_columns = g:eighty_columns
    endif

    let l:start = b:eighty_columns
    for i in g:eighty_columns_toggles
        let b:eighty_columns = i
        if i > l:start
            break
        endif
    endfor

    echo b:eighty_columns "column colors"
    call eighty#SetColorColumn(b:eighty_columns)
endfunction

" default to 80 columns if not set
if &colorcolumn == "" && g:eighty_columns_show
    call eighty#SetColorColumn(g:eighty_columns)
endif
