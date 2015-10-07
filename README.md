# bash-dir-collapse
Add a smartly condensed current working directory to the bash prompt

The prompt normally looks like:
    [User@host](~/foo)$

But once the current directory gets overly long it will start to collapse sections into two letters.
For example the directory "~/Library/Caches/Adobe/Flash Player/AssetCache" would look like:
    [User@host](~/Li/Ca/Ad/Fl/AssetCache)$

with an underline on the last letter of each collapsed part of the path


To use it copy the contents of bashrc.example.sh into your local ~/.bashrc
