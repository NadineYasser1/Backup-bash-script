all: create_dir start
dir="abc"
backupdir="backup"
interval=10
maxbackups=5

create_dir:
	@if [ ! -d "$backupdir" ]; then mkdir -p backup ; fi

start: create_dir
	@export dir backupdir interval maxbackups count
	@./backupd.sh $(dir) $(backupdir) $(interval) $(maxbackups)
