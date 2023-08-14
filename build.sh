#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

PREV_DIR="$(pwd)"

rm -rf $SCRIPT_DIR/target

mkdir -p $SCRIPT_DIR/target
mkdir -p $SCRIPT_DIR/build

cd build

git clone https://github.com/alacritty/alacritty.git
cd alacritty

CARGO_BIN=$HOME/.cargo/bin
$CARGO_BIN/cargo build --release --no-default-features


APP_NAME=FZFLauncher
APP_DIR=$SCRIPT_DIR/target/release/$APP_NAME.app

mkdir -p $APP_DIR
cp $SCRIPT_DIR/launcher.sh $APP_DIR/$APP_NAME
chmod +x $APP_DIR/$APP_NAME
cp target/release/alacritty $APP_DIR/alacritty

declare -a SCRIPTS=( gen.sh runner.sh )

for script in "${SCRIPTS[@]}"
do
    cp $SCRIPT_DIR/$script $APP_DIR/$script
done

cd $PREV_DIR

rm -rf $SCRIPT_DIR/build
