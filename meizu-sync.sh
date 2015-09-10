#!/bin/sh
# l'option -n fait un dry run
#rsync -rLtvvu ~/Musique/Meizu/ /media/68DE-5DE7/
# good one: rsync -rLtvv --modify-window=2 --delete --progress -h ~/Musique/Meizu/ /media/68DE-5DE7/
#rsync -rLtv --size-only --delete --progress -h ~/Musique/Meizu/ /media/68DE-5DE7/

rsync -rLtvv --modify-window=2 --delete --progress -h /run/media/luis/DATA/musique/Meizu/ /run/media/luis/68DE-5DE7/
