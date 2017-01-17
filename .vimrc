" setting
set number
set title
set ambiwidth=double
set tabstop=4
set shiftwidth=4
set smartindent
set list
set nrformats-=octal
set hidden
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmode=longest:full,full

" display
syntax on               " syntax highlighting
"set ruler              " show cursor position
set laststatus=2        " status line
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
                        " status line format
set showcmd             " show (partial) command keys
set showmode            " display the current mode
set showmatch           " jump to matching bracket
set wrap                " long lines wrap
