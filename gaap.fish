#!/usr/bin/fish

echo $argv
set filetype (path basename --no-extension $argv)
echo $filetype

if test "$filetype" = "md"
    set viewer mdcat
else if test "$filetype" = "png" -o "$filetype" = "jpg" -o "$filetype" = "jpeg" -o "$filetype" = "gif"
    set viewer chafa
else if test "$filetype" = "mkv" -o "$filetype" = "mp4" -o "$filetype" = "webm" -o "$filetype" = "mov"
    set viewer mpv -
else if test "$filetype" = "flac" -o "$filetype" = "opus" -o "$filetype" = "wav" -o "$filetype" = "mp3" -o "$filetype" = "ogg"
    set viewer mpv -
else
    set viewer bat
end

gpg -d $argv | $viewer
