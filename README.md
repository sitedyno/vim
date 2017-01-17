# Vim cheat sheet

I find it so easy to forget a plugin or how to do useful things in vim. This is an effort to rectify that.

## General vim stuff

### Mapping keys

Keep in mind that you can use :map to view bound key combos!

:nmap - Display normal mode maps
:imap - Display insert mode maps
:vmap - Display visual and select mode maps
:smap - Display select mode maps
:xmap - Display visual mode maps
:cmap - Display command-line mode maps
:omap - Display operator pending mode maps

## Plugins

### BufExplorer

Streamlined buffer listing and selection.

- ,be normal open
- ,bt toggle
- ,bs horizontal split (opens below)
- ,bv vertical split (opens to the right)

Enter to view a buffer. Pressing t on selected buffer will open it in a tab.

### FZF

Fuzzy finder for files or buffer lines.

- ,, call :Files command to find & open files
- ,C call :Colors command to find & select a colorscheme
- ,<Enter> call :Buffers to find & select a buffer
- ,ag call :Ag Incomplete
- ,AG call :Ag Incomplete
- ,ag call y:Ag Incomplete
