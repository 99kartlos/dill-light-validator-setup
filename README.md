![image](https://github.com/user-attachments/assets/94e0ba96-7db4-44db-88b3-577651358207)

------

|  | Minimum |
| --- | --- |
| CPU | 2 cores |
| Memory | 2G |
| Disk | 20G |
| Network | 1MB/s |

| Network Name | Dill Testnet Andes |
| --- | --- |
| RPC URL | https://rpc-andes.dill.xyz/ |
| Chain ID | 558329 |
| Currency symbol | DILL |
| Explorer URL | https://andes.dill.xyz/ |

## Instructions

1. **Download and run the setup script:**

Open your terminal and execute the following command to download and run the script:

   ```sh
   curl -O https://raw.githubusercontent.com/99kartlos/dill-light-validator-setup/main/setup_light_validator.sh && chmod +x setup_light_validator.sh && ./setup_light_validator.sh
   ```

2 **Do the following in order** 

- Wait for the files to download.
- Language selection: First, press 3 and enter. Then press 4. Select both in English
- Create a strong password. At least 8 characters long and confirm Keystore Password:
- Specify the amount of DILL tokens to be deposited for your validator. Choose the default amount: 2500 DILL tokens. So press Enter
- Record Mnemonic Phrase. Write down the mnemonic (seed phrase) as displayed. (Store it securely and safely. It is the ONLY way to retrieve your deposit if needed.)
- Configure and Save Keystore Password: Finalize the configuration by confirming and saving the keystore password for your imported accounts.
- Imported Account Password: Enter the password for your imported accounts to complete the configuration.
- Finally, run the Node by re-entering the password you wrote in the previous step.

If you completed all the steps correctly, you will get an output similar to this:

```
ubuntu      1981       1 86 08:09 pts/0    00:00:43 /home/ubuntu/dill/dill-node --light --embedded-geth --datadir /home/ubuntu/dill/light_node/data/beacondata --genesis-state /home/ubuntu/dill/genesis.ssz --grpc-gateway-host 0.0.0.0 --initial-validators /home/ubuntu/dill/validators.j
...
Setup complete!
```


## Staking

- First, get faucet into your wallet from the Andes channel. Use a different wallet than the one you created in Node and remember that you can only receive faucet once ($request xxxxx)

- visit https://staking.dill.xyz/

![image](https://github.com/user-attachments/assets/ede3c2bf-8687-413d-a766-ed33cf76a41a)

- Here you will upload your file with deposit_data-xxxx.json extension. If you want, you can create this file yourself. To do this, you can create and upload a file named deposit_data-xxxx.json with the output you receive using this code.
```
cat ./validator_keys/deposit_data-xxxx.json
```
- To get from SCP: First, connect to your server with an scp program (I usually use WinSCP). Then go to /dill/validator_keys directory and get your deposit_data-xxxx.json file and upload it to the site.

- 
