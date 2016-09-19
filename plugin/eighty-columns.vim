" Bind a key to toggle coloring lines past 80, in your vimrc:
" nnoremap <leader>8 :call ToggleColorColumn()<cr>
" Toggles per buffer
" Defaults to all columns after 80 being colored.
" If colorcolumn is set in a buffer, it will toggle between that and 0.
" To use 100, for example, in your vimrc:
" windo let &colorcolumn = join(range(100,999),",")

function! g:ToggleColorColumn()
    " Default to all columns after 80
    if !exists('b:color_column_old')
        if &colorcolumn == 0
            let b:color_column_old = join(range(81,999),",")
        else
            let b:color_column_old = 0
        endif
    endif

    " Swap between 0 and whatever the value was before
    if b:color_column_old == 0
        let b:color_column_old = &colorcolumn
        let &colorcolumn = 0
    else
        let &colorcolumn=b:color_column_old
        let b:color_column_old = 0
    endif
endfunction
