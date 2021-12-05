# G3N-Win64-Dependency-Script
 This is a simple script I created so Windows users do not have to fuss about with installing G3N and they can install it as easily as on Linux.

This is designed to be run-in-place, as in you set it somewhere you don't find gets in the way, run the script, and never look at it again until there's a major update.


I recommend \My Documents\

## **It is HIGHLY recommended you restart your computer after running this to reload your system's environment!**

Required software:

It is highly recommended you use the default install locations unless you want to rewrite part of the script for your specific Windows environment.

Go: https://go.dev

7-Zip: https://www.7-zip.org

Git: https://git-scm.com

## Issue/Solution:

### Duplicate %PATH% variables when running the script more than once

#### For now, this path will add duplicates to your Windows %PATH% when you run it more than once. If you do not want this, you can simply:

1. Type in "path" (without quotes) into the start menu
2. Click "Edit the system environmental variables
3. In the System Properties window, on the bottom there will be a button called "Environment Variables..."
4. Click that button
5. Under "User variables for USERNAMEHERE" click Path
6. Click the upper "Edit..." button
7. **BE EXTREMELY CAREFUL IN THIS WINDOW!**
8. The old paths that were added in (there are two of them next to each other) are there. Click them to highlight, then click delete
9. Click OK when you're done
10. Under "System variables" click Path
11. Click the lower "Edit..." button
12. **BE EXTREMELY CAREFUL IN THIS WINDOW!**
13. The old paths that were added in (there are two of them next to each other) are there. Click them to highlight, then click delete
14. Click OK when you're done
15. Click OK
16. Click OK (Yes I am giving verbose instructions)
17. You should now be able to run the script again without duplicates in the System and User paths. Enjoy!

### VSCODE:

    $ the term 'gcc' is not recognized as the name of a cmdlet

This is very simple, if you run gcc in command prompt, you will notice it works there. What you have to do is restart vscode, then close the open powershell terminals (the trash can icon) and open a new one to reload the environment.
