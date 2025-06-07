#!/usr/bin/env bash

echo "Running user script"

install_custom_lib(){
    sudo apt-get install -y iperf
    git clone https://github.com/JefferyLim/corundum ~/corundum 
    git clone https://github.com/JefferyLim/OS4C ~/OS4C
    git clone https://github.com/JefferyLim/oct_helper ~/oct_helper
}

install_custom_lib


cd ~/corundum/modules/mqnic
make
cd ../../utils/
make

cd ~/OS4C/modules/mqnic
make
