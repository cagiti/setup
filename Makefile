SHELL := zsh
BREWFILE := Brewfile
## Version information
TERRAFORM_VERSION := 0.12.18

.PHONY: detect-issues
detect-issues:
	@for formula in $(shell brew list --unbrewed | egrep -v "xml|share" | sed 's/bin\///'); do \
		if [ $$(grep -ci $$formula $(BREWFILE) || :) -gt 0 ]; then \
			echo "'$$formula' has been instaled manually and therefore might cause brew to fail."; \
			echo "We recommend removing '$$formula' before continuing with setup, thank you!"; \
		fi; \
	done

.PHONY: init
init:
	if [ ! -d /usr/local/sbin ]; then \
		sudo mkdir /usr/local/sbin; \
		sudo chmod 777 /usr/local/sbin; \
	fi;

.PHONY: setup
setup: init brewfile configure dotfiles

.PHONY: brewfile
brewfile:
	if [ -f $(BREWFILE) ]; then \
		brew update; \
		brew bundle install --file=$(BREWFILE); \
	fi;

.PHONY: configure
configure: python-install oh-my-zsh terraform

.PHONY: check
check:
	if [ -f $(BREWFILE) ]; then \
		brew bundle check --file=$(BREWFILE); \
	fi;

.PHONY: python-install
python-install:
	pip3 install boto3 \
		     boto \
		     botocore \
		     python-dateutil \
		     pyhcl \
		     pytest \
		     testinfra \
		     grep --user

.PHONY: oh-my-zsh
oh-my-zsh:
	if [ ! -d ~/.oh-my-zsh ]; then \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	else; \
		chmod +x ~/.oh-my-zsh/tools/upgrade.sh; \
		sh -c "~/.oh-my-zsh/tools/upgrade.sh"; \
	fi;

.PHONY: dotfiles
dotfiles:
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".config" -not -name ".github" -not -name ".*.swp" -not -name ".gnupg"); do \
		f=$$(basename $$file); \
		if [[ ! -L $(HOME)/$$f && -f $(HOME)/$$f ]]; then \
			mv $(HOME)/$$f $(HOME)/$${f}.old; \
		fi; \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

.PHONY: terraform
terraform:
	tfenv install $(TERRAFORM_VERSION)
	tfenv use $(TERRAFORM_VERSION)
