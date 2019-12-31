DOTFILES_EXCLUDES := .git .DS_Store README.md .gitignore .gitmodules
TARGET := $(wildcard .??*) bin
DOTFILES := $(filter-out $(DOTFILES_EXCLUDES), $(TARGET))

list:
	@$(foreach file, $(DOTFILES), ls -dF $(file);)

deploy:
	@$(foreach file, $(DOTFILES), ln -svnf $(abspath $(file)) $(HOME)/$(file);)
	@ln -svnf $(abspath prezto) $(HOME)/.zprezto;
