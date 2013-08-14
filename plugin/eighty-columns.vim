" Toggle columns after 80 being colored using keystroke.
" Toggles per buffer
" Defaults to all columns after 80 being colored.
" If colorcolumn is set in a buffer, it will toggle between that and 0.

set colorcolumn=0

function! s:ToggleColorColumn()

    " Default to all columns after 80
    if !exists('b:color_column_old')
        let b:color_column_old = join(range(81,999),",")
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

" Bind a key to toggle function
nnoremap <Leader>80 :call <SID>ToggleColorColumn()<cr>

" Assumes 256 colors, a dark grey color
highlight ColorColumn ctermbg=233
