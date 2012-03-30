# Standard Voonami Development vim configuration.

## Requirements include:
* Syntax Highlighting
    * 'syntax on' seems to handle this correctly
    * enhanced by vim-ruby and vim-rails
* Smart Completion
    * vim-ruby and vim-rails
* Command-T code searching
    * Command-T installed
* Split windows
    * Use <c-h><c-j><c-k><c-l> to navigate between splits
* Auto sizing of focused split windows
* Good color scheme
    * currently uses solarizer
* Some status bar information at the bottom
    * Default set in bottom of .vimrc
* Multi line editing
    * Visual column block seems to take care of most of this
* Refactoring (may just be search and replace)
* Code Templates
    * provided by snipmate.vim
* Format “helpers” (when inserting in a function the cursor should be at the right indent level)
    * 'filetype indent on' seems to take care of most of this
    * vim-ruby and vim-rails add some additional hints
* Auto formatter works correct
    * 'filetype indent on' seems to take care of most of this
    * vim-ruby and vim-rails add some additional hints
* Paste should respect current indentation
* OSX clipboard integration
    * 'set clipboard=unnamed' works in 7.3 on Mac OS X
* Disable mouse integration
    * Disabled by default
