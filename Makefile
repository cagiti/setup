SHELL := zsh

.PHONY: setup
setup: brewfile configure

.PHONY: brewfile
brewfile:
	if [ -f Brewfile ]; then \
		brew bundle install --file=Brewfile; \
	fi;

.PHONY: configure
configure: python-install oh-my-zsh

.PHONY: python-install
python-install:
	pip3 install boto3 boto botocore python-dateutil pyhcl grep --user

.PHONY: oh-my-zsh
oh-my-zsh:
	if [ ! -d ~/.oh-my-zsh ]; then \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	else; \
		chmod +x ~/.oh-my-zsh/tools/upgrade.sh; \
		sh -c "~/.oh-my-zsh/tools/upgrade.sh"; \
	fi;
		

