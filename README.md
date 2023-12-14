 Backup Directory
 
 this program creates a backup directory if it does not exist then makes a copy of all the files/directories of the source directory you want to backup to the destination directory called backup.
 the makefile provides the name of the source and destination directories, the interval of time between each backup and the maximum number of backups
 
 installation:
 
 in the terminal type the command:
 $sudo apt make
  
 running:
 
 1- Open the terminal
 2- change the directory to the file containing makefile.sh
 3- type the command $make in shell
 4- to exit press ctrl+C
 
 how the program works:
 
  1- makefile:
the makefile contains the arguments/parameters that the code needs to run,
which are dir,backupdir,interval and maxbackups.
it contains 2 functions; directory_creation and start, directory_creation   is a pre-build step that checks for existence of the destination directory, if not found, the function makes it. it is also a pre-requisite to the function start that exports the arguments to the bash script and starts execution.

  2- backupd.sh:
 this is the bash script that contains the main program.

 
 
 
  
  

 
 
 
 
