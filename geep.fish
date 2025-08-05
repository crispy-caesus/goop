#!/usr/bin/fish

set extention (string trim -c '.' (path extension $argv))

mkdir -p /tmp/gpg
cat $argv | gpg -se -r "Rexiel Scarlet (Rexiel's Persephone Key)" -u crispy-caesus > /tmp/gpg/$extention.gpg
