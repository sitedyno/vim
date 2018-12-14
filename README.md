# Vim cheat sheet

My current vim configuration. Trying to use neovim where possible.

As for the cheat sheet bit; I find it so easy to forget a plugin or how to do
useful things in vim. This is an effort to rectify that.

Currently `<leader>` is `,`.

## General vim stuff

### Folding

Command | Mode   | Description
------- | ----   | -----------
`zj`    | normal | Move down to the next fold
`zk`    | normal | Move up to the next fold
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

### Phpactor

Commands useful for PHP development.

Command | Mode   | Description
------- | ----   | -----------
`,u`    | normal | Include use statement for class member under the cursor
`,mm`   | normal | Invoke the context menu
`,nn`   | normal | Invoke the navigation menu
`,o`    | normal | Goto definition of class or class member under the cursor
`,K`    | normal | Show brief information about the symbol under the cursor
