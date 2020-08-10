#!/bin/bash
export PATH="$PATH:$HOME/esp/xtensa-lx106-elf/bin"
export IDF_PATH=$HOME/esp/esp-idf
if [ -z ${IDF_PATH} ]; then
	echo "IDF_PATH must be set before including this script."
else
	IDF_ADD_PATHS_EXTRAS="${IDF_PATH}/components/esptool_py/esptool"
	IDF_ADD_PATHS_EXTRAS="${IDF_ADD_PATHS_EXTRAS}:${IDF_PATH}/components/espcoredump"
	IDF_ADD_PATHS_EXTRAS="${IDF_ADD_PATHS_EXTRAS}:${IDF_PATH}/components/partition_table/"
	IDF_ADD_PATHS_EXTRAS="${IDF_ADD_PATHS_EXTRAS}:${IDF_PATH}/tools/"
	export PATH="${IDF_ADD_PATHS_EXTRAS}:${PATH}"
	echo "Added to PATH: ${IDF_ADD_PATHS_EXTRAS}"
fi
source $IDF_PATH/export.sh