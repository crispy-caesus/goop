#!/usr/bin/env fish

set -g MESSAGE __HORAI_NONE
set -g RECEIVER __HORAI_NONE
set -g IN_FILE __HORAI_NONE
set -g OUT_DIR __HORAI_NONE
set -g USE_EDITOR __HORAI_NONE
set -g EDIT_FILE_EXT __HORAI_NONE
set -g USE_STDIN __HORAI_NONE

# primary loop that sets up the above values
while test -n "$argv"
  switch $argv[1]
    case -m --message
      set -g MESSAGE $argv[2]
      set argv $argv[3..]
    case -f --file
      set -g IN_FILE $argv[2]
      set argv $argv[3..]
    case -e --edit
      set -g USE_EDITOR true
      set argv $argv[2..]
    case -ex --edit-ext
      set -g USE_EDITOR true
      set -g EDIT_FILE_EXT $argv[2]
      set argv $argv[3..]
    case -o --output
      set -g OUT_DIR $argv[2]
      set argv $argv[3..]
    case -si --stdin
      set -g USE_STDIN true
      set argv $argv[2..]
    case '*'
      # TODO optional attr logic goes here
      set argv $argv[2..]
  end
end

# DEBUGING, ensure that these values are filled when flags are used
echo "MSG: $MESSAGE"
echo "INF: $IN_FILE"
echo "UE: $USE_EDITOR"
echo "EXT: $EDIT_FILE_EXT"
echo "ODR: $OUT_DIR"
echo "USI: $USE_STDIN"
