if exists(':GuiFont')
    :GuiTabline 0
    set linespace=0
endif

nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv

echo "Neovim-QT Loading"
