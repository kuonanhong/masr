#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
cd ${SCRIPT_PATH}
[ ! -f "data_thchs30.tgz" ] && wget http://www.openslr.org/resources/18/data_thchs30.tgz
[ ! -d "data_thchs30" ] && tar xzf data_thchs30.tgz
[ ! -f "labels.json" ] && python prepare.py
pip install -r dev_requirements.txt
