#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
cd ${SCRIPT_PATH}
[ ! -d "data_thchs30" ] && wget -qO- http://www.openslr.org/resources/18/data_thchs30.tgz | tar xz -
[ ! -f "labels.json" ] && python prepare.py
pip install -r dev_requiements.txt
