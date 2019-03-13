# Smalltalk code snippets in pharo

Pharo is a language where you make live modifications to the codebase running in the Pharo VM. To view the code you can
use 'inspect-*' commands below . The image should start up with the code browser open to the snippets and the 'Playground'
should have a line of code to run the program. Optionally, the code can be run without starting the GUI by using the 
'run-*' make commands below.

Installing pharo:

    make install 


Installing pharo will create two executable scripts in the directory, 'pharo' which will allow you to run the st scripts
from the command line and 'pharo-ui' which will start the VM containing the live code snippets. 

Pharo can be deleted from the directory with:

    make clean

Hello World can be run with the command

    make run-hello-world


