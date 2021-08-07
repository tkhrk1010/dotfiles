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
karabinersetup: ## set up karabiner config
	@printf '${CYAN}%s${RESET}\n' 'set up karabiner config'
	@ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json

tigsetup: ## set up tig config
	@printf '${CYAN}%s${RESET}\n' 'set up tig config'
	@ln -sf ~/dotfiles/.tigrc ~/.tigrc

#
# backup
#
