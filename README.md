# G3N-Win64-Dependency-Script
 This is a simple script I created so Windows users do not have to fuss about with installing G3N and they can install it as easily as on Linux.

This is designed to be run-in-place, as in you set it somewhere you don't find gets in the way, run the script, and never look at it again until there's a major update.

For now, this path will add duplicates to your Windows %PATH% when you run it more than once. If you do not want this, you can simply:

- Type in "path" (without quotes) into the start menu
- Click "Edit the system environmental variables
- In the System Properties window, on the bottom there will be a button called "Environment Variables..."
- Click that button
- Under "User variables for USERNAMEHERE" click Path
- Click the upper "Edit..." button
- **BE EXTREMELY CAREFUL IN THIS WINDOW!**
- The old paths that were added in (there are two of them next to each other) are there. Click them to highlight, then click delete
- Click OK when you're done
- Under "System variables" click Path
- Click the lower "Edit..." button
- **BE EXTREMELY CAREFUL IN THIS WINDOW!**
- The old paths that were added in (there are two of them next to each other) are there. Click them to highlight, then click delete
- Click OK when you're done
- Click OK
- Click OK (Yes I am giving verbose instructions)
- You should now be able to run the script again without duplicates in the System and User paths. Enjoy!


I recommend \My Documents\

## **It is HIGHLY recommended you restart your computer after running this to reload your system's environment!**

Required software:

It is highly recommended you use the default install locations unless you want to rewrite part of the script for your specific Windows environment.

Go: https://go.dev

7-Zip: https://www.7-zip.org

Git: https://git-scm.com

## Issue/Solution:

### VSCODE:

    $ the term 'gcc' is not recognized as the name of a cmdlet

This is very simple, if you run gcc in command prompt, you will notice it works there. What you have to do is restart vscode, then close the open powershell terminals (the trash can icon) and open a new one to reload the environment.
