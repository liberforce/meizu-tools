#!/bin/sh
if [ $# -ne 1 ]
then
	echo "Usage: `basename $0` outputfile.avi"
	exit
fi

OUTFILE=$1

gst-launch-1.0 videotestsrc num-buffers=200 \
	! 'video/x-raw-yuv,framerate=(fraction)20/1,width=320,height=240' \
	! videoflip method=clockwise \
	! xvidenc bitrate=384000 \
	! queue \
	! avimux name=mux \
	! progressreport \
	! filesink location=$OUTFILE
