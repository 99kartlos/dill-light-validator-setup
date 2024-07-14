#!/bin/bash

# Download the light validator binary package
echo "Downloading the light validator binary package..."
curl -O https://dill-release.s3.ap-southeast-1.amazonaws.com/linux/dill.tar.gz

# Extract the package
echo "Extracting the package..."
tar -xzvf dill.tar.gz && cd dill

# Generate validator keys
echo "Generating validator keys..."
./dill_validators_gen new-mnemonic --num_validators=1 --chain=andes --folder=./

# Prompt user to create a password for the keystore
echo "Please create a password for your validator keystore:"
read -s -p "Enter password: " keystore_password
echo
read -s -p "Confirm password: " keystore_password_confirm
echo

# Check if passwords match
if [ "$keystore_password" != "$keystore_password_confirm" ]; then
  echo "Passwords do not match. Please run the script again and enter matching passwords."
  exit 1
fi

# Save the password to a file
echo "Saving the keystore password to a file..."
echo "$keystore_password" > walletPw.txt

# Import the keys to the keystore
echo "Importing your keys to the keystore..."
./dill-node accounts import --andes --wallet-dir ./keystore --keys-dir validator_keys/ --accept-terms-of-use

# Start the light validator node
echo "Starting the light validator node..."
./start_light.sh -p walletPw.txt

# Check if the node is running
echo "Checking if the node is up and running..."
ps -ef | grep dill | grep -v grep

echo "Light validator setup complete!"

# Ensure we are in the ~/dill directory
cd ~/dill
echo "You are now in the ~/dill directory."
