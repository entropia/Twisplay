# Twisplay
Hardware by [Timo Widdau](https://github.com/twiddau) and [Peter Brantsch](https://github.com/brantsch)  
Original code by [Peter Brantsch](https://github.com/brantsch)  
Bugfixes and documentation by [GityUpNow](https://github.com/gityupnow)  
  
## Hardware
The used display is a Epson DM-D110. Any compatible dipslay should be fine.  

A ESP8266 is required due to the use of the [NodeMCU-Framework](https://github.com/nodemcu/nodemcu-firmware).   
If a ESP32 would work too hasn't been tested yet.

## Setup
1. Flash the newest [NodeMCU-Firmware](https://github.com/nodemcu/nodemcu-firmware)
1. Install a NodeMCU Lua-Tool. 
Examples would be [NodeMCU-Tool](https://github.com/AndiDittrich/NodeMCU-Tool)(console) or [ESPlorer](https://github.com/4refr0nt/ESPlorer)(graphical)
1. Fill in your WiFi-Credentials into the setup.lua and execute it on the ESP
1. Upload the init.lua to the ESP

**Congratulations, you now have a running Twisplay!**

## Use
The display simply prints everything it gets via the tcp-socket!

The easiest way of doing this(under Linux) is to simple use netcat.   
Simply pipe the desired text into netcat like this:  
`echo "<Text>" | nc <IP> <Port>`  
or when printing from a file:  
`cat <Filename> | nc <IP> <Port>`   
  
You can also send special control codes to the display like "clear" or "cursor off". Please consult the display-documentation for these.
