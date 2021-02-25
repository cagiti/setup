SHELL := zsh
BREWFILE := Brewfile
BREWFILE_SHELL := Brewfile.shell
## Version information
TERRAFORM_VERSION := 0.12.18
HELM_VERSIONS := latest:2 latest:3
GO_VERSION := 1.16

.PHONY: detect-issues
detect-issues:
	@echo "---> attempting to detect issues"; \
	for formula in $(shell brew --prefix --unbrewed | egrep -v "xml|share" | sed 's/bin\///'); do \
		if [ $$(grep -ci $$formula $(BREWFILE) || :) -gt 0 ]; then \
			echo "'$$formula' has been installed manually and therefore might cause brew to fail."; \
			echo "We recommend removing '$$formula' before continuing with setup, thank you!"; \
		fi; \
		if [ $$(grep -ci $$formula $(BREWFILE_SHELL) || :) -gt 0 ]; then \
			echo "** only relevant if you wish to customize your terminal prompt and configuration **"; \
			echo "'$$formula' has been installed manually and therefore might cause brew to fail."; \
			echo "We recommend removing '$$formula' before continuing with setup, thank you!"; \
		fi; \
	done

.PHONY: init
init:
	@echo "---> initialising"; \
	if [ ! -d /usr/local/sbin ]; then \
		sudo mkdir /usr/local/sbin; \
		sudo chmod 777 /usr/local/sbin; \
	fi;

.PHONY: setup
setup: configure configure-shell

.PHONY: brewfile
brewfile: init
	@echo "---> installing via brew"; \
	if [ -f $(BREWFILE) ]; then \
		brew update; \
		brew bundle install --file=$(BREWFILE); \
	fi;

.PHONY: configure
configure: brewfile python-install terraform


.PHONY: check
check:
	@echo "---> checking brew install"; \
	if [ -f $(BREWFILE) ]; then \
		brew bundle check --file=$(BREWFILE); \
	fi;

.PHONY: python-install
python-install:
	@echo "---> installing via pip"; \
	pip3 install boto3 \
		     boto \
		     botocore \
		     diagrams \
		     python-dateutil \
		     pyhcl \
		     pytest \
		     testinfra \
		     grep --user

.PHONY: terraform
terraform:
	@echo "---> setting up terraform"; \
	tfenv install $(TERRAFORM_VERSION); \
	tfenv use $(TERRAFORM_VERSION)

.PHONY: configure-shell
configure-shell: brewfile-shell oh-my-zsh dotfiles

.PHONY: brewfile-shell
brewfile-shell: init
	@echo "---> installing shell customisations via brew"; \
	if [ -f $(BREWFILE_SHELL) ]; then \
		brew update; \
		brew bundle install --file=$(BREWFILE_SHELL); \
	fi;

.PHONY: oh-my-zsh
oh-my-zsh:
	@echo "---> configurnig oh-my-zsh"; \
	if [ ! -d ~/.oh-my-zsh ]; then \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	else; \
		chmod +x ~/.oh-my-zsh/tools/upgrade.sh; \
		sh -c "~/.oh-my-zsh/tools/upgrade.sh"; \
	fi;

.PHONY: dotfiles
dotfiles:
	@echo "---> configuring dotfiles"; \
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".config" -not -name ".github" -not -name ".*.swp" -not -name ".gnupg"); do \
		f=$$(basename $$file); \
		if [[ ! -L $(HOME)/$$f && -f $(HOME)/$$f ]]; then \
			mv $(HOME)/$$f $(HOME)/$${f}.old; \
		fi; \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

.PHONY: check-shell
check-shell:
	@echo "---> checking brew install for shell customisation"; \
	if [ -f $(BREWFILE_SHELL) ]; then \
		brew bundle check --file=$(BREWFILE_SHELL); \
	fi;

.PHONY: golang
golang:
	@if command -v asdf >/dev/null; then \
		brew uninstall golang 2>/dev/null || true; \
		asdf plugin-list | grep -iq golang || asdf plugin-add golang; \
		asdf list golang | grep -iq $GO_VERSION || asdf install golang $GO_VERSION; \
		echo "For information on how to select and use your required version of Golang, see the '#Setup Golang' section of the README"; \
	fi

.PHONY: setup-versions
helm:
	@if command -v asdf >/dev/null; then \
		brew uninstall helm 2>/dev/null || true; \
		asdf plugin-list | grep -iq helm || asdf plugin-add helm; \
		for helm_version in $(HELM_VERSIONS); do \
			asdf list helm | grep -iq $$helm_version || asdf install helm $$helm_version; \
		done; \
		echo "For information on how to select and use your required version of Helm, see the '#Setup Helm' section of the README"; \
	fi

.PHONY: spacevim
spacevim:
		@echo "---> installing/updating spacevim"; \
		curl -sLf https://spacevim.org/install.sh | bash; \
		pip3 install --user pynvim; \
		brew install --HEAD universal-ctags/universal-ctags/universal-ctags 2>/dev/null; \
		if [ ! -L $(HOME)/.SpaceVim.d ]; then \
				if [ -d $(HOME)/.SpaceVim.d ]; then \
						echo "---> backing up current SpaceVim configuration"; \
						mv $(HOME)/.SpaceVim.d $(HOME)/.SpaceVim.d_old; \
				fi; \
				echo "---> symbolically linking SpaceVim configuration"; \
				ln -sfn $(realpath .SpaceVim.d) $(HOME)/.SpaceVim.d; \
		fi
