#!/bin/sh

for f in "$@"
do
	mencoder "$f"                                           \
	-idx                                                    \
	-noodml                                                 \
	-ofps 20                                                \
	-vf scale=320:-2,expand=:240:::1,crop=320:240,rotate=1  \
	-ovc lavc                                               \
	-ffourcc XVID                                           \
	-lavcopts vcodec=mpeg4:vbitrate=384:vmax_b_frames=0:vhq \
	-sws 9                                                  \
	-srate 44100                                            \
	-oac mp3lame                                            \
	-lameopts cbr:br=128:mode=0                             \
	-o "meizu-${f%.*}.avi"
done 
