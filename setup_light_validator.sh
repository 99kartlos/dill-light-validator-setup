#!/bin/bash

# Define variables
BINARY_URL_LINUX="https://dill-release.s3.ap-southeast-1.amazonaws.com/linux/dill.tar.gz"
BINARY_URL_MACOS="https://dill-release.s3.ap-southeast-1.amazonaws.com/macos/dill.tar.gz"
BINARY_URL=$BINARY_URL_LINUX
DOWNLOAD_DIR="$HOME/dill"
KEYS_DIR="$DOWNLOAD_DIR/validator_keys"
KEYSTORE_DIR="$DOWNLOAD_DIR/keystore"
PASSWORD_FILE="$DOWNLOAD_DIR/walletPw.txt"
HEALTH_CHECK_SCRIPT="$DOWNLOAD_DIR/health_check.sh"

# Ask for OS type
read -p "Are you using macOS? (yes/no): " os_type
if [ "$os_type" == "yes" ]; then
    BINARY_URL=$BINARY_URL_MACOS
fi

# Download the binary package
echo "Downloading binary package..."
curl -O $BINARY_URL

# Extract the package
echo "Extracting package..."
tar -xzvf dill.tar.gz && cd dill

# Generate validator keys
echo "Generating validator keys..."
./dill_validators_gen new-mnemonic --num_validators=1 --chain=andes --folder=./

# Import your keys to your keystore
echo "Importing keys to keystore..."
./dill-node accounts import --andes --wallet-dir $KEYSTORE_DIR --keys-dir $KEYS_DIR --accept-terms-of-use

# Ask for wallet password
read -sp "Enter your wallet password: " wallet_password
echo
echo $wallet_password > $PASSWORD_FILE

# Start the light validator node
echo "Starting light validator node..."
./start_light.sh -p $PASSWORD_FILE

# Check if the node is up and running
echo "Checking if the node is up and running..."
ps -ef | grep dill

# Add health check script
echo "Creating health check script..."
cat << 'EOF' > $HEALTH_CHECK_SCRIPT
#! /bin/bash

usage(){
    echo "usage:" 
    echo "      $0"
    echo "to print verbose information:"
    echo "      $0 -v"
}

if [ $# -gt 1 ];then
    usage
    exit
fi

if [ $# -eq 1 ] && [ "$1" != "-v" ];then
    usage
    exit
fi

if [ "$1" == "-v" ]; then
    verbose="yes"
fi

tlog() {
    echo "$(date '+%Y-%m-%d %H:%M:%S %Z') > $*"
}

vlog(){
    if [ -z "${verbose}" ]; then
        return
    fi
    echo "$(date '+%Y-%m-%d %H:%M:%S %Z') > $*"
}

is_running=`ps -ef | grep dill | grep -v grep | grep 0x1a5E568E5b26A95526f469E8d9AC6d1C30432B33`

if [ ! -z "$is_running" ]; then
    vlog "node running"
else 
    tlog "node not running"
    exit 1
fi

peers_count=`curl -s localhost:8080/p2p | grep -m 1 peers | awk '{print $1}'`
vlog "node peers count $peers_count"
if [ $peers_count -gt 0 ]; then
    vlog "node's network connectivity check passed"
else
    vlog "node has no peers for now, please wait for 30s and re-run this script"
    tlog "connectivity check failed, please wait and retry this script"
    exit 1
fi

syncing_res=`curl -s localhost:3500/eth/v1/node/syncing`
done=`echo $syncing_res | grep "\"is_syncing\":false"`
slot=`echo $syncing_res | grep  -o -E "[0-9]*" | head -n 1`
if [ ! -z "$done" ]; then
    vlog "Synchronization done, current slot is ${slot}"
    tlog "Node health check passed."
else
    vlog "node is synchronizing, current slot is ${slot}"
    tlog "Node health check passed."
fi
EOF

# Make health check script executable
chmod +x $HEALTH_CHECK_SCRIPT

# Run health check script
echo "Running health check script..."
./health_check.sh -v

echo "Setup complete!"
