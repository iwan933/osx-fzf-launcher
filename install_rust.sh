#!/usr/bin/env bash

sh -c "$(curl --proto '=https' --tlsv1.2 -fsSL https://sh.rustup.rs)" "" -y

rustup override set stable
rustup update stable
