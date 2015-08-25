#! /bin/bash
filename="$1"

fps=20
width=320
height=240

gst-launch-1.0 filesrc location="$filename" \
	! decodebin name=decoder decoder.! queue \
	! videorate ! videoscale \
	! "video/x-raw,format=yuv,framerate=(fraction)${fps}/1,width=${width},height=${height}" \
	! videoflip method=clockwise \
	! avenc_mpeg4 bitrate=384000 max-bframes=0 \
	! queue \
	! avimux name=mux \
	! progressreport \
	! filesink location="gst-$filename" decoder.! queue \
	! audioconvert \
	! audioresample ! "audio/x-raw,format=int,channels=2,rate=44100" \
	! lamemp3enc cbr=true bitrate=128 \
	! mux.
