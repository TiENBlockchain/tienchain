# TienChain Application Tutorial

In this tutorial we will build a fully-functional Tienchain application on a blockchain with the Cosmos SDK



## Building and running the TienChain

Go inside the file where you have cloned the repository and open terminal.

##### Install the app into your $GOBIN
make install

##### Now you should be able to run the following commands:
nsd help
nscli help

#### Initialize configuration files and genesis file

moniker is the name of your node

nsd init <moniker> --chain-id tienchain

nscli keys add jack

nscli keys add alice

#### Add both accounts, with coins to the genesis file

nsd add-genesis-account $(nscli keys show jack -a) 1000tien,100000000t8t

nsd add-genesis-account $(nscli keys show alice -a) 1000tien,100000000t8t

#### Configure your CLI to eliminate need for chain-id flag

nscli config chain-id tienchain

nscli config output json

nscli config indent true

nscli config trust-node true

nsd gentx --name jack --amount 100000000t8t

nsd collect-gentxs

nsd validate-genesis

nsd start

#### First check the accounts to ensure they have funds

nscli query account $(nscli keys show jack -a)

nscli query account $(nscli keys show alice -a)

And to send coins from one account to another...

#### Usage: nscli tx send [from_key_or_address] [to_address] [amount] [flags]

$ nscli tx send $(nscli keys show alice -a) $(nscli keys show jack -a) 500tien,100000t8t
