VERSION := $(shell echo $(shell git describe --tags) | sed 's/^v//')
COMMIT := $(shell git log -1 --format='%H')

ldflags = -X github.com/cosmos/cosmos-sdk/version.Name=TienChain \
	-X github.com/cosmos/cosmos-sdk/version.ServerName=tcd \
	-X github.com/cosmos/cosmos-sdk/version.ClientName=tcli \
	-X github.com/cosmos/cosmos-sdk/version.Version=$(VERSION) \
	-X github.com/cosmos/cosmos-sdk/version.Commit=$(COMMIT) 

BUILD_FLAGS := -ldflags '$(ldflags)'

all: install

install: go.sum
	go install $(BUILD_FLAGS) ./cmd/tcd
	go install $(BUILD_FLAGS) ./cmd/tcli

go.sum: go.mod
		@echo "--> Ensure dependencies have not been modified"
		go mod verify
