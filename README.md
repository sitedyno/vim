# Vim cheat sheet

My current vim configuration. Trying to use neovim where possible.

As for the cheat sheet bit; I find it so easy to forget a plugin or how to do
useful things in vim. This is an effort to rectify that.

Currently `<leader>` is `,`.

## General vim stuff

### Folding

Command | Mode   | Description
------- | ----   | -----------
`za`    | normal | Toggle one level of folding where the cursor is
`zA`    | normal | Toggle all levels of folding where the cursor is
`zr`    | normal | Opens one level of folding throught the buffer
`zR`    | normal | Opens all folding throughout the buffer
`zm`    | normal | Closes one level of folding throughout the buffer
`zM`    | normal | Closes all folding throughout the buffer

### Mapping keys

Keep in mind that you can use :map to view mappings!

- :nmap Display normal mode maps
- :imap Display insert mode maps
- :vmap Display visual and select mode maps
- :smap Display select mode maps
- :xmap Display visual mode maps
- :cmap Display command-line mode maps
- :omap Display operator pending mode maps

## Plugins

### BufExplorer

Streamlined buffer listing and selection.

Command | Mode   | Description
------- | ----   | -----------
`,be`   | normal | open BufExplorer buffer list
`,bt`   | normal | toggle BufExplorer buffer list
`,bs`   | normal | horizontal split (opens below)
`,bv`   | normal | vertical split (opens to the right)

Enter to view a buffer. Pressing `t` on selected buffer will open it in a tab.

### FZF

Fuzzy finder for files or buffer lines.

Command      | Mode   | Description
-------      | ----   | -----------
`,,`         | normal | call :Files command to find & open files
`,C`         | normal | call :Colors command to find & select a colorscheme
`,<Enter>`   | normal | call :Buffers to find & select a buffer
`<c-x><c-f>` | insert | complete a path
`<c-x><c-l>` | insert | complete a line
`,<tab>`     | n,v,o  | see mappings for the current mode

Use `<c-j>` and `<c-k>` to navigate in the FZF results if needed.

### Surround

Easily delete, change and add surrounding parentheses, brackets, quotes,
XML tags, and more.

Command  | Mode   | Description
-------  | ----   | -----------
`cs"'`   | normal | change surround dquotes `"Hello World"` to squotes `'Hello World'`
`cs'<q>` | normal | change surround squotes `'Hello World'` to tags `<q>Hello World</q>`
`cst"`   | normal | change surround tags `<q>Hello World</q>` to dquotes `"Hello World"`
`ds"`    | normal | delete surround dquotes `"Hello World"` to `Hello World`
`ysiw]`  | normal | add surround brackets `Hello World` to `[Hello] World` (iw is a text
object)
