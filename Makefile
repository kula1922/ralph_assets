# The directory containing ralph_assets sources.
SOURCE_PATH = src/ralph_assets

# The directory containing ralph_assets sources.
BUILD_PATH = build

# Just invoke make to check your code!

.PHONY: default

default: lint

# Help!

.PHONY: help

help:
	@echo "Available targets:"
	@echo "    clean                     clean the source tree"
	@echo "    clean-pyc                 clean all *.pyc files"
	@echo "    lint                      run pep8 and pylint"
	@echo "    pre-commit                run pre-commit testing"
	@echo "    setup                     initialize the repositiory for development"


# Cleaning

.PHONY: clean-all clean-pyc clean-vim
.IGNORE: clean-all clean-pyc clean-vim

clean-pyc:
	find . -name '*.pyc' -exec rm {} \;

clean-vim:
	find . -name '*.swn' -exec rm {} \;
	find . -name '*.swo' -exec rm {} \;
	find . -name '*.swp' -exec rm {} \;

clean-all: clean-pyc clean-vim
	rm -rf "$(BUILD_PATH)"
	rm -rf "$(EGG_PATH)"
	rm -rf "dist"


# Linters

.PHONY: lint flake8

lint: flake8

flake8:
	flake8 --exclude=migrations $(SOURCE_PATH)


# Pre-commit testing.

.PHONY: pre-commit

pre-commit: lint


# Development environment setup.

.PHONY: setup git-hooks

setup-hooks:
	ln -fs ../../scripts/pre-commit .git/hooks/pre-commit
