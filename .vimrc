" Plugin derectory
call plug#begin('~/.local/share/nvim/plugged')

" Status line 
Plug 'nvim-lualine/lualine.nvim'  
" Icons                                                          
Plug 'nvim-tree/nvim-web-devicons'
" Buffer tabs
Plug 'ap/vim-buftabline'
" Deppends bloop theme
Plug 'rktjmp/lush.nvim'
" Bloop theme
Plug 'nocksock/bloop.nvim'
" NerdTree
Plug 'preservim/nerdtree'
" Project manager
Plug 'ahmedkhalf/project.nvim'
" Telescope deppens
Plug 'nvim-lua/plenary.nvim'
" Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

call plug#end()


" General config
set number
set termguicolors

" Theme
colorscheme bloop

" NerdTree
autocmd VimEnter * NERDTree | wincmd p

" Short cuts

" Cambiar entre buffers con Tab y Shift + Tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Cerrar buffer con Ctrl + W
nnoremap <C-w> :bd<CR>

" Guardar archivo con Ctrl + S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Salir de Neovim con Ctrl + Q
nnoremap <C-q> :q<CR>

" Abrir el explorador de archivos con Ctrl + e
nnoremap <C-e> :NERDTreeToggle<CR>

" Pibotar entre archivo actual y NerdTree
nnoremap <S-e> :wincmd w<CR>

" Moverse entre ventanas con Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Borrar un buffer sin cerrarlo con Ctrl + x
nnoremap <C-w> :bp \| bd! %<CR>

"
nnoremap <space>p :Telescope projects<cr>

" Buscar archivos con Telescope con Space + f
nnoremap <space>f :Telescope find_files<CR>

" Find files using Telescope command-line sugar.
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>


" Add config under this line ---

" Config of lualine
lua << END
require('lualine').setup{

options = {
    icons_enabled = true,
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('telescope').load_extension('projects')

require("project_nvim").setup {
    manual_mode = false,  -- Detecta automáticamente la raíz del proyecto
    detection_methods = { "lsp", "pattern" },  -- Usa LSP y patrones para detectar la raíz
    patterns = { ".git", "package.json", "Makefile", ".nvimroot" },  -- Archivos que marcan la raíz
    exclude_dirs = { "~/Downloads", "/tmp" },  -- Excluye estos directorios
    show_hidden = true,  -- Muestra archivos ocultos en Telescope
    silent_chdir = false,  -- Muestra mensajes cuando cambia de proyecto
    scope_chdir = "global",  -- Cambia de directorio globalmente
}

END
