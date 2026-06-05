#!/bin/sh
# check txt files before commit

for file in $(git diff --cached --name-only)
do
    case "$file" in
        *.txt)
            if [ ! -s "$file" ]; then
                echo "File $file is empty, commit canceled"
                exit 1
            fi
            ;;
    esac
done

exit 0
