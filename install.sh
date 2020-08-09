#!/bin/bash
#checking directory status

set -e
set -u
echo "installing dependencies"
sudo apt-get install gcc git wget make libncurses-dev flex bison gperf python python-serial
if [ -d "$HOME/esp" ]
then
echo "Directory exists."
else
echo "Error: Directory esp does not exists."
echo "creating directory esp"
fi
if [ -d "$HOME/esp/esp-id" ]
then
echo "esp-idf is already installed"
else
echo "Downloading esp-idf"
git clone --recursive https://github.com/gokulmaxi/pythoncalloverusb.git #change the url
mv pythoncalloverusb $HOME/esp/

export IDF_PATH=$HOME/esp/esp-idf

echo "Installing ESP-IDF tools"
${IDF_PATH}/tools/idf_tools.py install

echo "Installing Python environment and packages"
${IDF_PATH}/tools/idf_tools.py install-python-env

basedir="$(dirname $0)"
echo "All done! You can now run:"
echo ""
echo ""
fi
if [ -d "$HOME/esp/ESP8266_RTOS_SDK" ]
then
echo "esp-rtos sdk is already installed"
else
echo "installing RTOS sdk"
git clone --recursive https://github.com/espressif/ESP8266_RTOS_SDK.git
mv ESP8266_RTOS_SDK $HOME/esp/ESP8266_RTOS_SDK
fi
echo "checking for xtensa-elf "
if [ -d $HOME/esp/xtensa-lx106-elf]
then
echo "xtensa is installed"
else
wget https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-100-ge567ec7-5.2.0.tar.gz
echo "Extracting xtensa"
tar -xzf xtensa-lx106-elf-linux64-1.22.0-100-ge567ec7-5.2.0.tar.gz
mv xtensa-lx106-elf $HOME/esp
fi
echo "installation completed"
echo ""
echo "now use espexport.py"
