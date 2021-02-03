The latest version os Sonic Pi (currently 3.3.1) accommodates the switch made on the Raspberry Pi OS release 2021-01-11 to utilise pulseaudio as the default audio system in use. Sonic Pi depends on the SuperCollider scsynth, and on linux this uses jack for audio connection. In Sonic Pi 3.3.1 ue is made of the pulusaudio-module-jack to route audio from jack into the pulseaudio system, as teh default setting. This works well, and allows the audio output source to be selected and changed whilst Sonic Pi is running between available output devices, which on. Pi4 with be HDMI (via speakers in your monitor if available) or AV JACK via the 3.5mm on board audio jack. On the Pi400 HDMI will be the only available output.
However it is possible to add further soundvards to your {i usually as a USB plugin. These can range from a simple device such as the TechRise USB Sound Card for about £9 up to more sophisticated and expensive devices such as the FocusRite range of interfaces. Most of these are capable of a higher performance particularly in terms of low latency than can be achieved using the standard setup utilising pulseaudio.
This repository contains a simple bash script which will enable you to make use of such an external sound card and to configure the connection between it and Sonic Pi utilising just jack, and bypassing pulseaudio. One additional program which is used is QjackCtl which is already installed on the Raspbery Pi OS, although not activated on the Menu system.

The best way to see how to use the script is by watching an associated video at https://youtu.be/u7JtInemsJY