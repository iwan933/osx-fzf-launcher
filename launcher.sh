#!/usr/bin/env bash
PATH="$PATH:/opt/homebrew/bin"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$SCRIPT_DIR/alacritty -o "window.dimensions.columns=120" -o "window.dimensions.lines=9" --class "fzfmenu" -o "window.decorations='None'" -e bash -c "$SCRIPT_DIR/gen.sh | fzf $* | $SCRIPT_DIR/runner.sh"
