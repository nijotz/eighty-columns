A simple vim plugin for toggling the coloring of the 80 column limit.  This was
in my vimrc, but thought I'd pull it out to a plugin share with others.  Just
drop this in the bundle directory if you have pathogen. Otherwise, the contents
of eighty-cols.vim can simply be placed in vimrc.

Toggles per buffer

Defaults to all columns after 80 being colored.

If colorcolumn is set in a buffer, it will toggle between that and 0.

Bind a key to toggle coloring lines past 80, in your vimrc:
```vimrc
nnoremap <leader>8 :call ToggleColorColumn()<cr>
```

To use 100, for example, in your vimrc:
```vimrc
windo let &colorcolumn = join(range(100,999),",")
```
