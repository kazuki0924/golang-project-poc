#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# pip: install tools with pip

REQUIREMENTS=(
  pyenv
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "${REQUIREMENT}" &>/dev/null || brew install "${REQUIREMENT}"
done

brew update
brew upgrade pyenv --fetch-HEAD

echo "Choose which version of Python you want to install:"
# fuzzy find versions filtering out only the out-of-beta ones in reverse order
VERSION=$(pyenv install --list | awk '$0 !~ /[a-z]/' | sort -rn -k 2 -t "." | fzf --layout=reverse --height=20%)
#pyenv install "${VERSION//[[:space:]]/}"
pyenv global "${VERSION//[[:space:]]/}"
pip install --upgrade pip

echo ""
echo pyenv versions
echo "Installed python versions:"
pyenv versions

# recommended setups for rcfiles(~/.zshrc, etc) {{
export PATH="${HOME}/.local/bin:${PATH//:\/bin//}:/bin"
export PATH="${PYENV_ROOT}/shims:${PATH}"
export PYENV_ROOT="${HOME}/.pyenv}"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# }}

pip install -U --user sqlfluff
