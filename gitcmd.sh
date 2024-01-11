#!/bin/bash

# Show current branch
git branch
git status

# Show git status and print result
git_status=$(git status --porcelain)
echo "$git_status"

# Get list of untracked and modified files
untracked_files=$(echo "$git_status" | grep "^??")
modified_files=$(echo "$git_status" | grep "^ M")

# Prompt user for input on which files to add
read -p "Enter 'A' to add all files, 'S' to add specific file, or 'G' to add a group of files: " input

if [ "$input" == "A" ]; then
    git add .
elif [ "$input" == "S" ]; then
    while true; do
        read -p "Enter the name of the file to add: " file
        if echo "$untracked_files $modified_files" | grep -q -w "$file"; then
            git add "$file"
            break
        else
            echo "File not found in untracked or modified files. Please try again."
        fi
    done
elif [ "$input" == "G" ]; then
    while true; do
        all_files_valid=true
        read -p "Enter the names of the files to add, separated by spaces: " files
        
        for file in $files; do
            if echo "$untracked_files $modified_files" | grep -q -w "$file"; then
                git add "$file"
            else
                echo "File $file not found in untracked or modified files. Please try again."
                all_files_valid=false
                break
            fi
        done

        if [ "$all_files_valid" == "true" ]; then
            break
        fi
    done
else
    echo "Invalid input"
fi

# Prompt user for commit message and push changes to repo.
read -p "Enter commit message: " message
git commit -m "$message"
git push

echo "Push complete."
sleep 5
clear
