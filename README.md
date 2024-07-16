# Dill Light Validator Kurulum 

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


2. **Answer the questions in sequence:**

- Answer the questions in sequence:

- Wait for the files to download.

- Language selection: Press 3 and then 4 in sequence. You do not need to select anything other than English.

- Create a password: Create a password for validator keystore(s) security. Enter it again to confirm.

- Choose the amount of DILL tokens to deposit (default is 2500). Simply press Enter to proceed with the default.

- Note your Mnemonic (Seed Phrase): Your mnemonic will be shown to you. Copy it and enter it again to confirm. Store it securely as this is the ONLY way to recover your deposit.

- After keys are generated, proceed with pressing Enter after seeing the message "Success! Your keys can be found at: ./validator_keys".

- Now it will ask you to enter your wallet password. Enter a password of at least 8 characters and confirm it.

- Next, you will be prompted to enter the password for the accounts you imported.

- Finally, enter the wallet password you created earlier.
 
NOTE: Remember to store the passwords you enter securely.

