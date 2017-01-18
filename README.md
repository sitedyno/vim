# Vim cheat sheet

My current vim configuration. Trying to use neovim where possible.

As for the cheat sheet bit; I find it so easy to forget a plugin or how to do useful things in vim. This is an effort to rectify that.

Currently `<leader>` is `,`.

## General vim stuff

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
