#!/bin/bash
# script to switch Raspberry Pi QjackCtl connections from pulseaudio to jack or viceversa
# for use with Sonic Pi 3.3.1 and RPi OS 2021-01-11
# watch video BEFORE use on https://youtu.be/u7JtInemsJY
if [[ $1 = "jack" ]]
  then
    #via system when using QjackCtl
    jack_disconnect PulseAudio_to_JACK:front-left SuperCollider:in_1
    jack_disconnect PulseAudio_to_JACK:front-right SuperCollider:in_2 
    jack_disconnect SuperCollider:out_1 JACK_to_PulseAudio:front-left
    jack_disconnect SuperCollider:out_2 JACK_to_PulseAudio:front-right
    
    jack_connect SuperCollider:out_1 system:playback_1
    jack_connect SuperCollider:out_2 system:playback_2
    jack_connect system:capture_1 SuperCollider:in_1 
    jack_connect system:capture_2 SuperCollider:in_2

    echo "Connected via jack only"
elif [[ $1 = "pulseaudio" ]]
  then
    #via PulseAudio
    jack_disconnect SuperCollider:out_1 system:playback_1
    jack_disconnect SuperCollider:out_2 system:playback_2
    jack_disconnect system:capture_1 SuperCollider:in_1 
    jack_disconnect system:capture_2 SuperCollider:in_2
  
    jack_connect PulseAudio_to_JACK:front-left SuperCollider:in_1
    jack_connect PulseAudio_to_JACK:front-right SuperCollider:in_2 
    jack_connect SuperCollider:out_1 JACK_to_PulseAudio:front-left
    jack_connect SuperCollider:out_2 JACK_to_PulseAudio:front-right
  
    echo "Connected via pulseaudio"
else
  echo "call with argument jack or pulseaudio"
fi
exit 0 