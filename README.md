# TienChain Application Tutorial

In this tutorial we will build a fully-functional Tienchain application on a blockchain with the Cosmos SDK



## Building and running the TienChain


#### Initialize configuration files and genesis file

moniker- name of node
nsd init moniker --chain-id tienchain

nscli keys add jack

nscli keys add alice

#### Add both accounts, with coins to the genesis file

nsd add-genesis-account $(nscli keys show jack) 1000tien,100000000t8t

nsd add-genesis-account $(nscli keys show alice) 1000tien,100000000t8t

#### Configure your CLI to eliminate need for chain-id flag

nscli config chain-id tienchain

nscli config output json

nscli config indent true

nscli config trust-node true

nsd start

#### First check the accounts to ensure they have funds

nscli query account $(nscli keys show jack -a)

nscli query account $(nscli keys show alice -a)

### And to send coins from one account to another...

###### Usage: nscli tx send [from_key_or_address] [to_address] [amount] [flags]
nscli tx send $(nscli keys show alice -a) $(nscli keys show jack -a) 500tien,100000t8t

###### Now its time to start the rest-server in another terminal window:

nscli rest-server --chain-id tienchain --trust-node
