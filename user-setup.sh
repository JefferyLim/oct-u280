#!/usr/bin/env bash

echo "Running user script"

install_custom_lib(){
    sudo apt-get install -y iperf git
    git clone -b jlim/dev https://github.com/JefferyLim/corundum /users/jlim/corundum 
    git clone -b vswitch/dev https://github.com/JefferyLim/OS4C /users/jlim/OS4C
    git clone https://github.com/JefferyLim/oct_helper /users/jlim/oct_helper
}

install_custom_lib

cd /users/jlim/corundum/modules/mqnic
make
cd ../../utils/
make

cd /users/jlim/OS4C/modules/mqnic
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



