#!/bin/sh

if [ $# -ne 1 ]
then
	echo "Usage: `basename $0` label"
	exit 1
fi


encoders="avenc_msmpeg4 avenc_msmpeg4v2 avenc_mpeg4 avenc_mpeg2video"
label="$1"

for encoder in $encoders
do
	filename="test-$label-$encoder.avi"
	cmdfile="test-$label-$encoder.cmd"
	cat > "$cmdfile" << EOF
gst-launch-1.0 videotestsrc num-buffers=200 \\
	! 'video/x-raw,framerate=(fraction)20/1,width=320,height=240' \\
	! videoflip method=clockwise \\
	! $encoder bitrate=384000 \\
	! queue \\
	! avimux name=mux \\
	! progressreport \\
	! filesink location="$filename"
EOF

	echo -n "Generating $filename: "
	bash $cmdfile &> /dev/null
	if (( $? == 0 ))
	then
		echo "OK"
	else
		echo "Failed"
	fi
done
