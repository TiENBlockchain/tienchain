# tienchain
Tienchain POC

How to run the chain

```
# Remove earlier installed files
tcd unsafe-reset-all
rm -rf ~/.tc*

# Install fresh new modules
make install
clear

# Initialize the chain and setup the configs 
tcd init node1 --chain-id tienchain
tcli config chain-id tienchain
tcli config output json
tcli config indent true
tcli config trust-node true

