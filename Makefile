# Makefile for no-public-s3 lab

CONTEST_VERSION=0.47.0
CONTEST_URL=https://github.com/open-policy-agent/conftest/releases/download/v$(CONTEST_VERSION)/conftest_$(CONTEST_VERSION)_Linux_x86_64.tar.gz

.PHONY: all install test clean

all: install test

install:
	wget -q $(CONTEST_URL) -O conftest.tar.gz
	tar -xzf conftest.tar.gz
	sudo mv conftest /usr/local/bin/
	rm conftest.tar.gz
	@echo "Conftest installed successfully!"
	conftest --version

test:
	conftest test input.json --all-namespaces

clean:
	rm -f conftest.tar.gz
	@echo "Cleanup complete!"

# Use this for later - run below in Codespaces terminal
# make install   # Installs conftest
# make test      # Runs your Rego test
# make           # Does both install and test
# make clean     # Cleans up any leftovers
