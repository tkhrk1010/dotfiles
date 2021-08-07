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

karabinersetup: ## set up karabiner config
	@printf '${CYAN}%s${RESET}\n' 'set up karabiner config'
	@mv ~/.config/karabiner/karabiner.json ~/dotfiles/
	@ln -sf ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
