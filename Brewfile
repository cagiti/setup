# Brewfile
#
# Maintained by Cai Cooper

# Install and manage GUI macOS applications
tap 'homebrew/cask'

# Alternate versions of Casks
tap 'homebrew/cask-versions'

# Integrates Homebrew formulae with macOS' `launchctl` manager
tap 'homebrew/services'

# A CLI tool upgrading every outdated app installed by Homebrew Cask
# INFO: brew cu
tap 'buo/cask-upgrade'

# Cloudfoundry binaries
tap 'cloudfoundry/tap'

# VMWare Tanzu binaries
tap 'vmware-tanzu/carvel'

### System {{{
  ## System Libraries
  # GNU internationalization (i18n) and localization (l10n) library
  brew 'gettext'
  # GNU Transport Layer Security (TLS) Library
  brew 'gnutls'
  # Asynchronous event library
  brew 'libevent'
  # Portable Foreign Function Interface library
  brew 'libffi'
  # Cryptographic library based on the code from GnuPG
  brew 'libgcrypt'
  # Common error values for all GnuPG components
  brew 'libgpg-error'
  # International domain name library (IDNA2008, Punycode and TR46)
  brew 'libidn2'
  # X.509 and CMS library
  brew 'libksba'
  # ASN.1 structure parser library
  brew 'libtasn1'
  # Library for processing keyboard entry from the terminal
  brew 'libtermkey'
  # C string library for manipulating Unicode strings
  brew 'libunistring'
  # Multi-platform support library with a focus on asynchronous I/O
  brew 'libuv'
  # C99 library which implements a VT220 or xterm terminal emulator
  brew 'libvterm'
  # YAML Parser
  brew 'libyaml'
  # Text-based UI library
  brew 'ncurses'
  # Low-level cryptographic library
  brew 'nettle'
  # New GNU portable threads library
  brew 'npth'
  # Regular expressions library
  brew 'oniguruma'
  # Pinentry for GPG on Mac
  brew 'pinentry-mac'
  # Manage compile and link flags for libraries
  brew 'pkg-config'
  # Perl compatible regular expressions library with a new API
  brew 'pcre2'
  # Library for command-line editing
  brew 'readline'
  # Markdown editor
  cask 'typora'
  # Markdown viewer
  brew 'glow'

  ## Mac OS X
  # Mac App Store command line interface
  brew 'mas'

  ## Mac OS X: Quick Look Plugins
  # An Application for Inspecting macOS Installer Packages
  cask 'suspicious-package'
  # View plain text files without a file extension
  cask 'qlstephen'
  # Preview source code files with syntax highlighting
  cask 'qlcolorcode'
  # Preview JSON files
  cask 'quicklook-json'
  # Display image size and resolution
  cask 'qlimagesize'

  ## Monitoring
  # An interactive process viewer for Unix
  brew 'htop'
  # Display an interface's bandwidth usage
  brew 'iftop'
  # Top-like interface for container metrics
  brew 'ctop'
### }}}


### Web {{{
  # Industry-Leading Container Runtime
  cask 'docker'

  ## HTTP Request
  # API Development Environment
  cask 'postman'
  # The most advanced API tool for Mac
  cask 'paw'
  # Internet file retriever
  brew 'wget'
### }}}

### Network {{{
  ## Analysis
  # The world’s foremost and widely-used network protocol analyzer
  cask 'wireshark'
  # Port scanning utility for large networks
  brew 'nmap'

  ## Proxy & VPN
  # Free software for OpenVPN on OS X
  cask 'tunnelblick'

  ## DNS
  # Command line DNS client https://dns.lookup.dog/
  brew 'dog'

  ## Utility
  # User interface to the TELNET protocol
  brew 'telnet'
  # Graphical network analyzer and capture tool
  brew 'wireshark'
  # Utility to display the output from any script or program in the menu bar
  cask 'bitbar'
### }}}


### Keyboard & Mouse {{{
  # A simple utility application to trigger haptic feedback when tapping Touch Bar
  cask 'haptickey'
### }}}


### Utility {{{
  # Command-line benchmark tool
  brew 'bench'
  # GNU File, Shell, and Text utilities
  brew 'coreutils'
  # Command-line fuzzy finder written in Go
  brew 'fzf'
  # Graph visualization software from AT&T and Bell Labs
  brew 'graphviz'

  ## Compress/Uncompress
  # 7-Zip (high compression file archiver) implementation
  brew 'p7zip'
  # Executes a program periodically, showing output fullscreen
  brew 'watch'
  # Simplified and community-driven man pages
  brew 'tldr'

  # GNU version of awk and sed
  brew 'gawk'
  brew 'gnu-sed'

  # JSON, YAML, XML transformation
  brew 'jq'
  brew 'yj'
  brew 'yq'
  brew 'xmlstarlet'
  brew 'ytt'

  # Tracks most-used directories to make cd smarter
  brew 'z'
### }}}

### Database {{{
  # Object-relational database system
  brew 'postgresql'
  # Command-line interface for SQLite
  brew 'sqlite'
  # MySQL Client
  brew 'mysql-client'
### }}}

### Programming Language {{{
  ## Node.js
  # Platform built on V8 to build network applications
  brew 'node@10'
  # Alternative JavaScript package manager by Facebook
  brew 'yarn'

  ## Python
  # Python3
  brew 'python'
  # Python version management
  brew 'pyenv'
  # Python dependency management tool
  brew 'pipenv'

  ## Java
  # Java Standard Edition Development Kit 12
  # INFO: Need to reboot
  # cask 'java'
  # An open and reproducible build & test system for OpenJDK
  # INFO: Need to install OpenJDK 8
  cask 'adoptopenjdk/openjdk/adoptopenjdk8'
  # Java build tool
  brew 'ant'
  # Java-based project management
  brew 'maven'

  ## Shellscript
  # Static analysis and lint tool, for (ba)sh scripts
  brew 'shellcheck'

  ## Ruby
  # Powerful, clean, object-oriented scripting language
  brew 'ruby'
  brew 'rbenv'
  brew 'rbspy'
### }}}

### VCS {{{
  ## Git & GitHub
  # Distributed revision control system
  brew 'git'
  # Git extension for versioning large files
  brew 'git-lfs'
  # Small git utilities
  brew 'git-extras'
  # Extensions to follow Vincent Driessen's branching model
  brew 'git-flow'
  # Prevents you from committing sensitive information to a git repo
  brew 'git-secrets'
  # Remove crazy big files, passwords, credentials and other private data
  brew 'bfg'
  # Text interface for Git repositories
  brew 'tig'
  # A simple terminal UI for git commands
  brew 'lazygit'
  # OS X status bar application for Github
  cask 'gitee'
  # GitHub CLI tool
  brew 'gh'
  # Extend your GitHub workflow beyond your browser <Paste>
  cask 'github'

  ## ETC
  # Clone of cat with syntax highlighting and Git integration
  brew 'bat'

  # GitHub workflow
  brew 'hub'

  ## Developer workflow
  # dx
  tap 'plumming/homebrew-tap'
  brew 'dx'
### }}}


### Code Editor & IDE {{{
  ## Editor: Vim
  # Vi 'workalike' with many additional features
  brew 'vim'
  # Fast, highly customisable system info script
  brew 'neofetch'
  # Ambitious Vim-fork focused on extensibility and agility
  brew 'neovim'
### }}}


### Terminal {{{
  ## Terminal Multiplexer
  # Terminal multiplexer with VT100/ANSI terminal emulation
  brew 'screen'
  # A terminal multiplexer, allowing to access multiple separate terminal sessions
  # brew 'tmux', args: ['with-utf8proc']
  brew 'tmux'
  # Reattach process (e.g., tmux) to background
  brew 'reattach-to-user-namespace'

  ## Utility
  # Search tool like grep, but optimized for programmers
  brew 'ack'
  # Search tool like grep and The Silver Searcher
  brew 'ripgrep'
  # Modern replacement for `ls`
  brew 'exa'
  # Display directories as trees (with optional color/HTML output)
  brew 'tree'
  # A simple, fast and user-friendly alternative to find
  brew 'fd'
  # Manage multiple runtime versions with a single CLI tool
  brew 'asdf'

  ## Shell: Bash
  # Bourne-Again SHell, a UNIX command interpreter
  brew 'bash'
  # Programmable completion for Bash 4.1+
  brew 'bash-completion@2'

  ## Shell: Zsh
  # UNIX shell (command interpreter)
  # INFO: Need to add `/usr/local/bin/zsh` to `/etc/shells`
  brew 'zsh'
  # Tips, tricks, and examples for zsh
  brew 'zsh-lovers'
  # Fish shell like syntax highlighting for zsh
  brew 'zsh-syntax-highlighting'

#}}}

### Virtualization {{{

  ## Container
  # Kubernetes command-line interface
  brew 'kubernetes-cli'
  # Customization of kubernetes YAML configurations
  brew 'kustomize'
  # Tool that can switch between kubectl contexts easily and create aliases
  brew 'kubectx'
  # Kubernetes CLI to manage cluters in style
  tap 'derailed/k9s'
  brew 'k9s'
  # Package manager for kubectl plugins
  brew 'krew'
  # ksd is a tool, whose aim is help you to visualize in text plain your kubernetes secrets
  brew 'mfuentesg/tap/ksd'
  # Tool that can switch between kubectl contexts
  brew 'kubectx'
  # Jenkins-X cli
  tap 'jenkins-x/jx'
  brew 'jenkins-x/jx/jx'

  # Cloudfoundry command-line interface
  brew 'cf-cli'
  # BOSH command-line interface
  brew 'bosh-cli'
  # Credhub command-line interface
  brew 'credhub-cli'

# Tool for repeatable Kubernetes development
  brew 'skaffold'
  # Kubernetes log viewer
  tap 'boz/repo'
  # Tail multiple Kubernetes deployments/applications
  brew 'kail'
  # Tail multiple Kubernetes pods & their containers
  brew 'stern'
  # Production Grade K8s Installation, Upgrades, and Management
  brew 'kops'
  # Kube in Docker
  brew 'kind'
### }}}


### Development {{{
  # Automatic configure script builder
  brew 'autoconf'
  # Tool for generating GNU Standards-compliant Makefiles
  brew 'automake'
  # Cross-platform make
  brew 'cmake'
  # Generic library support script
  # INFO: In order to prevent conflicts with Apple's own libtool we have prepended a "g"
  brew 'libtool'
  # File watching daemon
  brew 'fswatch'
### }}}



### Ansible {{{
  # Automate deployment, configuration, and upgrading
  brew 'ansible'
  # Checks ansible playbooks for practices and behaviour
  brew 'ansible-lint'
### }}}

### Terraform {{{
  # Tool to generate documentation from Terraform modules
  brew 'terraform-docs'
  # Terraform linter for detecting errors that can not be detected by `terraform plan`
  tap 'wata727/tflint'
  brew 'tflint'
  # Terraform static analysis tool
  brew 'tfsec'
  # Terraform version manager
  brew 'tfenv'
### }}}

### cloud cli binaries {{{
  brew 'awscli'
  brew 'awslogs'
  brew 'aws-iam-authenticator'
  # This tool will request and set temporary credentials in your shell environment variables for a given role.
  brew 'remind101/formulae/assume-role'
  # Azure Binaries
  brew 'azure-cli'
  # GCloud Libraries
  cask 'google-cloud-sdk'
### }}}


### Cryptography {{{
  # SSL/TLS cryptography library
  brew 'openssl'

  ## PGP(Pretty Good Privacy)
  # GNU Pretty Good Privacy (PGP) package
  brew 'gnupg'

  # Library access to GnuPG
  brew 'gpgme'

  # A password manager
  brew 'lastpass-cli'

  # 1Password password manager
  cask '1password-cli'

### }}}
