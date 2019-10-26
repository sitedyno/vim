# Vim cheat sheet

My current vim configuration. Trying to use neovim where possible.

As for the cheat sheet bit; I find it so easy to forget a plugin or how to do
useful things in vim. This is an effort to rectify that.

Currently `<leader>` is `,`.

## General vim stuff

### Vim Text Objects

Taken from https://www.reddit.com/r/vim/comments/cuy9zh/vim_text_objects_an_effective_and_powerful/
 
`<number><command><text object or motion>`
 
* number of times to repeat (optional)
* command: (c)hange, (d)elete, (y)ank, (p)aste
* objects: see table below `highlight` indicates cursor position
 
Code                         | Keystrokes | Result
----                         | ---------- | ------
const sqr = `(`a,b) => {}    | `di)`      | const = `(`) => {}
const sqr = `(`a,b) => {}    | `da)`      | const = ` ` => {}
let profile = `{`name:"vim"} | `di}`      | let profile = `{`}
let profile = `{`name:"vim"} | `da}`      | let profile = ` `
var score = `[`"B"]          | `di]`      | var score = `[`]
var score = `[`"B"]          | `da]`      | var score = ` `
var name = `"`Vimnator";     | `di"`      | var name = `"`";
var name = `"`Vimnator";     | `da"`      | var name = ` `;
`<`h2>Practical Vim< /h2>    | `dit`      | < h2>`<`/h2>
`<`h2>Practical Vim< /h2>    | `dat`      | ` `
A `w`ord or a WORD           | `diw`      | A ` `  or a WORD
A `w`ord or a WORD           | `daw`      | A` `or a WORD
 
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
`ysiw]`  | normal | add surround brackets `Hello World` to `[Hello] World` (iw is a text object)

### Phpactor

Commands useful for PHP development.

Command | Mode   | Description
------- | ----   | -----------
`,u`    | normal | Include use statement for class member under the cursor
`,mm`   | normal | Invoke the context menu
`,nn`   | normal | Invoke the navigation menu
`,o`    | normal | Goto definition of class or class member under the cursor
`,K`    | normal | Show brief information about the symbol under the cursor

### UltiSnips

Commands in `Snippet` mode.

Command | Mode    | Description
------- | ----    | -----------
`<c-j>` | snippet | Jump forward to the next placeholder
`<c-k>` | snippet | Jump backward to the previous placeholder
