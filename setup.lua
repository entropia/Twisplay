--Define Wifi-Mode
wifi.setmode(wifi.STATION)

--WiFi-Configuration
station_config = {}
station_config.ssid = "<enter AP name here>"
station_config.pwd  = "<enter Wifi Password here>"

wifi.sta.config(station_config)
