 Backup Directory
 
 this program creates a backup directory if it does not exist then makes a copy of all the files/directories of the source directory you want to backup to the destination directory called backup.
 the makefile provides the name of the source and destination directories, the interval of time between each backup and the maximum number of backups
 
 installation:
 
 in the terminal type the command:
 $sudo apt make
  
 running:
 
 1- Open the terminal
 2- change the directory to the file containing makefile.sh:
  $cd 7154-lab2.tar.gz
 3- type the command $make in shell
 4- to exit press ctrl+C
 
 how the program works:
 
  1- makefile:
the makefile contains the arguments/parameters that the code needs to run,
which are dir,backupdir,interval and maxbackups.
it contains 2 functions; directory_creation and start, directory_creation   is a pre-build step that checks for existence of the destination directory, if not found, the function makes it. it is also a pre-requisite to the function start that exports the arguments to the bash script and starts execution.

  2- backupd.sh:
 this is the bash script that contains the main program:
 -it starts by validating the parameters exported by the makefile
 -copies the current files from source directory to a subdirectory in destination directory named by date and time of first backup
 -as the first backup is done in the previous step count is initialized to 1 which will be used to determine the number of backups done since the program started executing
 -creates 2 new files directory-info.new and directory-info.last, the latter contains info about the source directory while the first one is empty and will be updated later on.
 -in an infinite while loop first, information about the source directory is copied to directory-info.new file, then, the content of both files is compared, if the result is null then no changes happend since the last backup so the program will pause (sleep) for the interval of time provided by the makefile.
 if the content of both files is different, there are 2 options:
 first one being that the count, defined above, is less than or equal to the number of maximum backups also provided by the makefile, in this case a new backup is done with current date and time being the name of the subdirectory containing the updated source directory, the content of directory-info.last is updated to match the current state and count is incremented by one.
 the second case being that the maximum number of backups was exceeded so the oldest backup will be replaced by the newest one this is done by a piping command rm -R "$(ls -t | tail -1)" that sorts by date a list of the directories in the backup directory, tail provides the oldest file/directory and rm -R removes it. after removing the oldest backup, the newest one will be backed up as done in the first case but the count will not be incremented as the number of backups resulting will be the same.
 
  3-abc:
 it is a directory containing a number of files used as source directory for case testing
 
  
  

 
 
 
 
