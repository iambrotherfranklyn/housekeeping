How to Use the Script
*Dont worry about git pull, both scripts will make a git pull  for you before push process*

NT: This also works same way as the powershell script for gitcmd.ps1


Initialize the Script:
Run the script in your terminal while inside a Git repository directory. You can drag and drop the script into the repository terminal.


Select Files to Stage:
The script will ask you whether you want to add all files (A), a specific file (S), or a group of files (G).
Note that the letters are case sensitive. Only capitalized letters.


If you choose A, all changes will be staged.
If you choose S, you will be prompted to enter the name of a specific file to stage.
If you choose G, you can enter multiple file names separated by spaces to stage them.
Commit and Push:
After staging the files, you'll be prompted to enter a commit message. Once entered, the script will commit the changes with your message and push the commit to the remote repository.


Prerequisites and Warnings
Git Installed: Ensure that Git is installed on your system and that you can run Git commands in the terminal.
Repository Initialized: This script should be run from within an initialized Git repository (i.e., a directory where git init has been run).


Permissions: You must have the necessary permissions to push to the repository. If it's a remote repository that requires authentication, ensure that your credentials are set up correctly (e.g., via SSH keys or a Git credential manager).
Correct Branch: Make sure you are on the correct branch where you want to commit your changes. The git branch command at the beginning of the script will show you the current branch.


Network Connection: A network connection is required to push changes to a remote repository.
Script Permissions: The script file itself must have execute permissions set (you can set this with chmod +x yourscript.sh).


Usage Warnings
Unsaved Work: Running this script will add and commit changes. Make sure you are ready to commit your work and that you don't have unsaved changes that you don't want to commit.
Check Before Pushing: Always review which files are being committed before pushing. Accidental commits can be difficult to revert.
Branch Awareness: Pushing to the wrong branch can cause conflicts, especially if you're working on a shared repository with a team. Always double-check that you're on the intended branch.


Final Notes
After the script pushes the commit, it will print "Push complete.", wait for 5 seconds (so you can read any messages), and then clear the terminal screen. It's good practice to check the output of the git push command before the screen is cleared to ensure there were no errors during the push.


Thank you
