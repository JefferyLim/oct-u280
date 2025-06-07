#!/usr/bin/env bash

echo "Running user script"

install_custom_lib(){
    sudo apt-get install -y iperf git
    git clone https://github.com/JefferyLim/corundum /users/jlim/corundum 
    git clone https://github.com/JefferyLim/OS4C /users/jlim/OS4C
    git clone https://github.com/JefferyLim/oct_helper /users/jlim/oct_helper
}

install_custom_lib

cd /users/jlim/corundum/modules/mqnic
make
cd ../../utils/
make

cd /users/jlim/OS4C/modules/mqnic
make
