#!/bin/sh

set -e

BASE="$(cd "$(dirname "$0")" && pwd)"

echo "ln -sf $BASE -> ~/.dotfiles"
ln -sf $BASE ~/.dotfiles

# Very simple install script

for file in `find ${BASE} -maxdepth 1 -not -name '.*' -not -name install.sh -not -name bin -not -name etc -not -name README.txt -not -name LICENSE -type f`; do
    filename=`basename "$file"`
    echo "ln -sf $BASE/$filename -> ~/.$filename"
    ln -sf "$BASE/$filename" ~/.$filename
done

mkdir -p ~/bin/
for file in "$BASE"/bin/*; do
    filename=`basename "$file"`
    echo "ln -sf $BASE/$filename -> ~/bin/$filename"
    ln -sf "$BASE/bin/$filename" ~/bin/$filename
done

