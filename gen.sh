#!/usr/bin/env bash

FD_OUT="$(lsof -p $$ | awk '$4=="1u"{print $NF}')"

find /Applications -name '*app' -maxdepth 1 | sed 's|/Applications/||;s|\.app||'
