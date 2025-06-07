#!/usr/bin/env bash

echo "Running user script"

install_custom_lib(){
    sudo apt-get install -y iperf
    git clone https://github.com/JefferyLim/corundum /user/jlim/corundum 
    git clone https://github.com/JefferyLim/OS4C /user/jlim/OS4C
    git clone https://github.com/JefferyLim/oct_helper /user/jlim/oct_helper
}

install_custom_lib


cd /user/jlim/corundum/modules/mqnic
make
cd ../../utils/
make

cd /user/jlim/OS4C/modules/mqnic
make
