#!/usr/bin/bash
str='[a-zA-Z]'
int='^[0-9]+$'
if ! [[ $1 =~ $str ]]
then
	echo "please enter a valid name for your source directory"
else
	dir=$1
fi

if ! [[ $2 =~ $str ]]
then
	echo "please enter a valid name for your destination directory"
else
	backupdir=$2
fi

if ! [[ $3 =~ $int ]]
then
	echo "please enter a valid number for the interval between each backup in 		secs"
else
	interval=$3
fi

if ! [[ $4 =~ $int ]]
then
	echo "please enter a valid number for maximum backups"
else
	maxbackups=$4
fi
count=1

cd $backupdir
mkdir "$(date +"%Y-%m-%d-%r")"
touch directory-info.last directory-info.new
cd ..
cp -r $dir $backupdir/"$(date +"%Y-%m-%d-%r")"
ls -lR $dir > $backupdir/directory-info.last

while :
do
	ls -lR $dir > $backupdir/directory-info.new
	
if diff $backupdir/directory-info.new $backupdir/directory-info.last > /dev/null
then
	sleep $interval
elif [[ $count -le $maxbackups ]]
then
	cp -r $dir $backupdir/"$(date +"%Y-%m-%d-%r")"
	cp $backupdir/directory-info.new $backupdir/directory-info.last
	count=`expr $count + 1`
else
	cd $backupdir
	rm -R "$(ls -t | tail -1)"
	cd ..
	cp -r $dir $backupdir/"$(date +"%Y-%m-%d-%r")"
	cp $backupdir/directory-info.new $backupdir/directory-info.last
fi
done

