SHELL := zsh
BREWFILE := Brewfile
BREWFILE_SHELL := Brewfile.shell
## Version information
TERRAFORM_VERSION := 0.12.18

.PHONY: detect-issues
detect-issues:
	@echo "---> attemptign to detect issues"; \
	for formula in $(shell brew list --unbrewed | egrep -v "xml|share" | sed 's/bin\///'); do \
		if [ $$(grep -ci $$formula $(BREWFILE) || :) -gt 0 ]; then \
			echo "'$$formula' has been installed manually and therefore might cause brew to fail."; \
			echo "We recommend removing '$$formula' before continuing with setup, thank you!"; \
		fi; \
		if [ $$(grep -ci $$formula $(BREWFILE_SHELL) || :) -gt 0 ]; then \
			echo "** only relevant if you wish to customize your terminal prompt and configuration **"
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
	@mkdir -p $(GOLANG_HOME)/go$(GOLANG_VERSION); \
	mkdir -p $(GO_WORKSPACE); \
	if [ ! -d $(GOLANG_HOME)/go$(GOLANG_VERSION)/bin ]; then \
		echo "---> downloading golang $(GOLANG_VERSION)"; \
		curl -sL https://golang.org/dl/go$(GOLANG_VERSION).darwin-amd64.tar.gz -o "$(GOLANG_HOME)/go$(GOLANG_VERSION)/golang.tar.gz"; \
		tar zxf $(GOLANG_HOME)/go$(GOLANG_VERSION)/golang.tar.gz --strip 1 -C $(GOLANG_HOME)/go$(GOLANG_VERSION); \
		rm $(GOLANG_HOME)/go$(GOLANG_VERSION)/golang.tar.gz; \
	fi; \
	echo "---> setting golang $(GOLANG_VERSION) as default"; \
	if [ ! -L $(GOLANG_HOME)/go ]; then \
		ln -s $(GOLANG_HOME)/go$(GOLANG_VERSION) $(GOLANG_HOME)/go; \
	fi; \
	if $(shell command -v go &> /dev/null); then \
		go version; \
	else; \
		echo "---> please restart your terminal for the changes to take effect."; \
	fi
