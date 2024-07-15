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

## Talimatlar

1. **Kurulum scriptini indirin ve çalıştırın:**

   Terminalinizi açın ve aşağıdaki komutu çalıştırarak scripti indirin ve çalıştırın:

   ```sh
   curl -O https://raw.githubusercontent.com/99kartlos/dill-light-validator-setup/main/setup_light_validator.sh && chmod +x setup_light_validator.sh && ./setup_light_validator.sh


2. **Sırasıyla Soruları yanıtlayın:**

- Dosyaları indirmesini bekleyin.

- Dil seçimi: Sırasıya 3 ve 4'e basın. İngilizce dışında bir şey seçmenize gerek yok.

- Parola oluşturma: Validator keystore(s) güvenliği için bir şifre oluşturun. Daha sonra onaylamak için tekrar girin.

- Yatırılacak DILL token miktarı (varsayılan olarak 2500) olarak seçin. Yani Enter deyip geçin.

- Mnemonic (Seed Phrase) Not Edinme: Mnemonic'leriniz size gösterilecektir. Bunu kopyalayıp onaylamak için tekrar girin ve güvenli bir yerde saklayın. Bu, depozitonuzu geri almanın TEK yoludur.

- Key'ler oluşturulduktan sonra  "Success! Your keys can be found at: ./validator_keys" çıktısını aldıtkan sonra enter deyip geçin.

- Daha sonra doğrulayıcı anahtar deponuz için bir şifre oluşturun ve onaylamak için tekrar girin.

- Şimdi sizden cüzdan şifresi girmenizi isteyecek. En az 8 karakterli bir şifre girin ve onaylamak için tekrar girin.

- Son olarak i

