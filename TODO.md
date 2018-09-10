# Things to do...

## Learning

- [ ] Learn about marks in vim

### Plugins

#### BufExplorer

- [ ] Investigate customizations

#### FZF

- [ ] Learn about Ag and how to use it w/ FZF
- [ ] Learn about using marks w/ FZF

#### Surround

- [ ] Learn more ways to use surround ie: ysiw

#### Text Objects

- [ ] Better than motions...

## The Language Server Protocol Journey...

- Use vim-plug for plugin management (tangential really)
- `pip3 install --upgrade neovim` to enable python3 bindings
- see new vimrc sections NCM2 & vim-plug for configurations
- install 'autozimu/LanguageClient-neovimj' using vim-plug
- run `nvim +PlugInstall +UpdateRemotePlugins +qa` to complete install
- install `roxma/LanguageServer-php-neovim`
- it worksish, no argument helpers..., feels slowish & janky
- Combination to get completion + argument/parameter hints (not really language server
  after all):
  - ncm2/ncm2
  - roxma/nvim-yarp
  - ncm2/ncm2-ultisnips
  - SirVer/ultisnips
  - phpactor/phpactor
  - phpactor/ncm2-phpactor

