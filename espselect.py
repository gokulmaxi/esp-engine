import os
import sys
import enquiries
os.system('pwd')

options = ['ESP32', 'ESP8266',]
choice = enquiries.choose('Choose one of these options: ', options)
#/home/gokul/projects/python/espexport/test.sh
print("configuring the session for "+choice)
os.system('export PATH="$PATH:$HOME/esp/xtensa-lx106-elf/bin"')
if(choice=='ESP8266'):
    os.system('unset IDF_PATH')
    os.system('export PATH="$PATH:$HOME/esp/xtensa-lx106-elf/bin"')
    os.system('export IDF_PATH=~/esp/ESP8266_RTOS_SDK')
if(choice=='ESP32'):
    os.system('unset IDF_PATH')
    print("deleting the default path")
    os.system('export IDF_PATH=~/esp/esp-idf')
    print('exporting the idfpath')
    os.system('')
    print('completed')