A simple vim plugin for toggling the coloring of the 80 column limit.  This was
in my vimrc, but thought I'd pull it out to a plugin share with others.  Just
drop this in the bundle directory if you have pathogen. Otherwise, the contents
of eighty-cols.vim can simply be placed in your vimrc.

* Defaults to all columns after 80 being colored.
* Toggles globally
* Toggles between 80, 100, 120, and off

Bind a key to toggle coloring lines past 80, in your vimrc:
```vimrc
nnoremap <leader>8 :call eighty#ToggleColorColumn()<cr>
```

To use different values set eighty_columns_toggles
```vimrc
let g:eighty_columns_toggles = [90, 105, 0]
```

Default to no coloring (toggle eighty columns off on new buffers)
```vimrc
let g:eighty_columns_show = 0
```
