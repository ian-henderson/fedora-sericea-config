#!/bin/bash

if [[ ! -d "$NVM_DIR" ]]; then
	mkdir "$NVM_DIR"
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
