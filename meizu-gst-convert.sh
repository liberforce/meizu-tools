#! /bin/bash
filename="$1"

gst-launch-1.0 filesrc location="$filename" ! decodebin name=decoder decoder.! queue ! videorate ! videoscale ! 'video/x-raw-yuv,framerate=(fraction)20/1,width=320,height=240' ! videoflip method=clockwise ! xvidenc bitrate=384000 max-bframes=0 ! queue ! avimux name=mux ! progressreport ! filesink location="gst-$filename" decoder.! queue ! audioconvert ! audioresample ! 'audio/x-raw-int,channels=2,rate=44100' ! lame mode=stereo vbr=none bitrate=128 ! mux.
