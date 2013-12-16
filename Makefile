# The directory containing ralph_assets sources.
SOURCE_PATH = src/ralph_assets

# The directory containing build data.
BUILD_PATH = build

# The directory containing eggs.
EGG_PATH = src/ralph_assets.egg-info

# Just invoke make to check your code!

.PHONY: default

default: lint

# Help!

.PHONY: help

help:
	@echo "Available targets:"
	@echo "    clean-all                 clean-pyc clena-vim remove builds and eggs"
	@echo "    clean-pyc                 clean all *.pyc files"
	@echo "    clean-vim                 clean vim files like *.swo *.swp *.swn"
	@echo "    lint                      run flake8 exclude migrations"


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
