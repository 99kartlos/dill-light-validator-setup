#!/bin/bash

# Define variables
BINARY_URL_LINUX="https://dill-release.s3.ap-southeast-1.amazonaws.com/linux/dill.tar.gz"
BINARY_URL_MACOS="https://dill-release.s3.ap-southeast-1.amazonaws.com/macos/dill.tar.gz"
BINARY_URL=$BINARY_URL_LINUX
DOWNLOAD_DIR="$HOME/dill"
KEYS_DIR="$DOWNLOAD_DIR/validator_keys"
KEYSTORE_DIR="$DOWNLOAD_DIR/keystore"
PASSWORD_FILE="$DOWNLOAD_DIR/walletPw.txt"
HEALTH_CHECK_FILE="$DOWNLOAD_DIR/health_check.sh"

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


echo "Setup complete!"
