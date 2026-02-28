#!/usr/bin/env bash

echo "Running user script"

install_custom_lib(){
    sudo apt-get remove iperf3 
    sudo apt-get autoremove 
    sudo apt-get install -y git lib32z1 libiperf0 clang llvm
    git clone -b jlim/dev https://github.com/JefferyLim/corundum /users/jlim/corundum 
    #git clone -b vswitch/dev https://github.com/JefferyLim/OS4C /users/jlim/OS4C
    git clone https://github.com/JefferyLim/oct_helper.git
    wget https://github.com/esnet/iperf/releases/download/3.20/iperf-3.20.tar.gz
    tar -xvf iperf-3.20.tar.gz
    cd iperf-3.20/
    ./configure
    make
    sudo make install
    hash iperf3
}

cd /users/jlim/

mkdir -p /users/jlim/vm-results


install_custom_lib

cd /users/jlim/corundum/modules/mqnic
make
cd ../../utils/
make

# File to modify
BASHRC="$HOME/.bashrc"

# Lines to add
cat << 'EOF' >> "$BASHRC"
alias thesisdriver="cd ~/OS4C/modules/mqnic"
alias resetsetup="sudo virsh destroy myvm; sudo virsh create ~/projects/OCT/oct_helper/vm/vm.xml; sudo virsh console myvm"
alias scripts="cd ~/OS4C/scripts/new"
export PATH="$PATH:/user/jlim/OS4C/fpga/lib/pcie/scripts:/user/jlim/oct-helper/fpga/:/user/jlim/oct-helper/vm/:/user/jlim/oct-helper/network"
EOF



