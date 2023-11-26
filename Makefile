# without any arg, execute help
.DEFAULT_GOAL := help

# printf format
ESC=\033
ESC_START=${ESC}[
ESC_END=m
CYAN=${ESC_START}36${ESC_END}
RESET=${ESC_START}0${ESC_END}

help: ## self-documenting Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "${CYAN}%-30s${RESET}%s\n", $$1, $$2}'

#
# setup
#
zshsetup: ## set up vim config
	@printf '${CYAN}%s${RESET}\n' 'set up zsh config'
	@ln -sf ~/dotfiles/.zshrc ~/.zshrc
	@ln -sf ~/dotfiles/.zsh_functions ~/.zsh_functions

vimsetup: ## set up vim config
	@printf '${CYAN}%s${RESET}\n' 'set up vim config'
	@ln -sf ~/dotfiles/.vimrc ~/.vimrc

tmuxsetup: ## set up tmux config
	@printf '${CYAN}%s${RESET}\n' 'set up tmux config'
	@ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

gitsetup: ## set up tmux config
	@printf '${CYAN}%s${RESET}\n' 'set up git config'
	@ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

tigsetup: ## set up tig config
	@printf '${CYAN}%s${RESET}\n' 'set up tig config'
	@ln -sf ~/dotfiles/.tigrc ~/.tigrc

karabinersetup: ## set up karabiner config
	@printf '${CYAN}%s${RESET}\n' 'set up karabiner config'
	@ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
