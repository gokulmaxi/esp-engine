import os
import sys
import enquiries
pwd = os.environ['ESP_ENGINE']
options = ['ESP32', 'ESP8266',]
choice = enquiries.choose('Choose one of these options: ', options)
print("configuring the session for "+choice)
if(choice=='ESP8266'):
    os.system("gnome-terminal -e 'bash -c \"sudo "+pwd+"/esp8266.sh; exec bash\"'")
if(choice=='ESP32'):
    os.system("gnome-terminal -e 'bash -c \"sudo "+pwd+"/esp32.sh; exec bash\"'")
    print('completed')