# 📘 Blockchain & Web3 Cheat Sheet

> Panduan praktis dan terstruktur untuk memahami konsep blockchain, token, smart contract, dan tools Web3 secara teknis dan intuitif.

---

## 🧱 Blockchain Dasar

| Konsep                    | Penjelasan                                                                                                                     |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| **Blockchain**            | Jaringan publik terdesentralisasi tempat data dicatat permanen dan transparan. Ibarat "internet", tapi untuk data transaksi.   |
| **Node**                  | Komputer dalam jaringan blockchain yang menyimpan salinan data dan memverifikasi transaksi.                                    |
| **Desentralisasi**        | Tidak ada pusat kendali. Semua peserta punya salinan data dan menyetujui transaksi bersama.                                    |
| **Blockchain ≠ Aplikasi** | Ethereum, Solana, Avalanche = platform. DApp (seperti Uniswap, Opensea) dibangun di atas platform itu.                         |
| **Interoperabilitas**     | Blockchain berbeda tidak saling terhubung secara default, tapi bisa melalui Bridges dan protokol seperti Polkadot atau Cosmos. |

---

## 🪙 Token

| Jenis Token             | Standar ERC | Penjelasan & Analogi                                                      |
| ----------------------- | ----------- | ------------------------------------------------------------------------- |
| **Fungible**            | ERC-20      | Seperti uang. Semua token bernilai sama. Digunakan di stablecoin, dll.    |
| **Fungible+**           | ERC-777     | Versi canggih ERC20. Mendukung hooks & callbacks. Kurang luas didukung.   |
| **Non-Fungible**        | ERC-721     | NFT unik. Setiap token punya identitas/tokenId berbeda.                   |
| **Hybrid**              | ERC-1155    | Gabungan NFT dan Fungible Token. Hemat gas dan cocok untuk game.          |
| **Account Abstraction** | ERC-4337    | Akun tidak bergantung private key. Bisa support sponsor gas, plugin, dll. |

---

## 📄 Smart Contract

| Komponen           | Penjelasan                                                                 |
| ------------------ | -------------------------------------------------------------------------- |
| **Solidity**       | Bahasa utama untuk membuat smart contract (mirip JavaScript/C++).          |
| **Smart Contract** | Aturan digital yang otomatis berjalan di blockchain (seperti backend API). |
| **payable**        | Fungsi yang bisa menerima ETH.                                             |
| **view**           | Fungsi hanya baca data, tanpa gas.                                         |
| **returns**        | Digunakan untuk mendefinisikan nilai keluaran dari fungsi.                 |
| **public**         | Fungsi bisa dipanggil dari mana saja.                                      |

---

## 🔧 Tools & Frameworks

### 🔨 Development Frameworks

| Tools                    | Penjelasan                                                              |
| ------------------------ | ----------------------------------------------------------------------- |
| **Hardhat**              | Framework modern untuk develop, test, debug, dan deploy smart contract. |
| **Truffle**              | Framework stabil dan lengkap. Mirip Laravel di dunia blockchain.        |
| **OpenZeppelin**         | Library smart contract siap pakai. Aman, audit-ready, dan modular.      |
| **Ganache (deprecated)** | Local blockchain untuk testing cepat. Digantikan oleh Anvil.            |
| **Geth (Go Ethereum)**   | Implementasi Ethereum node menggunakan bahasa Go.                       |

### 🧪 Testing

| Tools     | Penjelasan                                 |
| --------- | ------------------------------------------ |
| **Chai**  | Library assertion untuk unit testing (JS). |
| **Mocha** | Framework testing JavaScript.              |

---

## 🌐 Node & Infrastruktur

| Komponen                        | Penjelasan                                                                        |
| ------------------------------- | --------------------------------------------------------------------------------- |
| **RPC (Remote Procedure Call)** | Koneksi HTTP. Seperti `fetch()` di web. Simpel dan umum.                          |
| **WebSocket**                   | Real-time events. Digunakan untuk listening event smart contract.                 |
| **IPC (Inter Process Comm)**    | Koneksi cepat tapi hanya lokal. Untuk advanced use-case.                          |
| **Infura**                      | Layanan node Ethereum berbasis cloud (RPC/WebSocket). Digunakan oleh banyak dApp. |
| **Alchemy**                     | Seperti Infura + analytics, mempool access, dll.                                  |

---

## 🔑 Wallet & Identity

| Wallet Type                 | Penjelasan                                                                |
| --------------------------- | ------------------------------------------------------------------------- |
| **HD Wallet**               | Wallet turunan. 1 seed phrase bisa generate banyak address (mirip pohon). |
| **Ledger**                  | Hardware wallet. Kunci privat disimpan fisik, lebih aman.                 |
| **SimpleWallet**            | Smart contract wallet dasar.                                              |
| **Safe Wallet (ex Gnosis)** | Multi-sig wallet. Bisa kolaboratif, plugin, dan aman.                     |

---

## 💻 Frontend Integration (React / Next.js)

| Tools                   | Penjelasan                                                         |
| ----------------------- | ------------------------------------------------------------------ |
| **Web3.js / Ethers.js** | Library JS untuk interaksi dengan Ethereum.                        |
| **Wagmi**               | React hooks untuk interaksi blockchain (baca data, kirim tx, dsb). |
| **Viem**                | Library modular dan cepat (pengganti ethers.js di Wagmi v1).       |
| **RainbowKit**          | UI kit wallet connection berbasis Wagmi. UX sangat bagus.          |

---

## 🧠 Konsep Lainnya

| Konsep                           | Penjelasan                                                                |
| -------------------------------- | ------------------------------------------------------------------------- |
| **Bridge**                       | Jembatan antar blockchain. Transfer aset lintas chain.                    |
| **Polkadot / Cosmos**            | Blockchain interoperable. Bisa saling bicara antar chain.                 |
| **Stackup Paymaster (ERC-4337)** | Sponsor biaya gas user. Seperti perusahaan bayar ongkos ojek online kamu. |

---

## 🔐 Contoh Seed Phrase (Metamask, HD Wallet)

```
ensure water begin always provide strategy theory truly govern tourist now napkin
```

> Jangan gunakan seed phrase ini untuk wallet nyata. Ini hanya contoh!

---

## 📚 Referensi Tambahan

* [Solidity Docs](https://docs.soliditylang.org)
* [Ethereum.org](https://ethereum.org/en/developers/)
* [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)
* [Hardhat](https://hardhat.org)
* [Wagmi.sh](https://wagmi.sh)
* [RainbowKit](https://www.rainbowkit.com)
* [Alchemy](https://www.alchemy.com)

---

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




REMIX DEFAULT WORKSPACE

Remix default workspace is present when:
i. Remix loads for the very first time 
ii. A new workspace is created with 'Default' template
iii. There are no files existing in the File Explorer

This workspace contains 3 directories:

1. 'contracts': Holds three contracts with increasing levels of complexity.
2. 'scripts': Contains four typescript files to deploy a contract. It is explained below.
3. 'tests': Contains one Solidity test file for 'Ballot' contract & one JS test file for 'Storage' contract.

SCRIPTS

The 'scripts' folder has four typescript files which help to deploy the 'Storage' contract using 'web3.js' and 'ethers.js' libraries.

For the deployment of any other contract, just update the contract name from 'Storage' to the desired contract and provide constructor arguments accordingly 
in the file `deploy_with_ethers.ts` or  `deploy_with_web3.ts`

In the 'tests' folder there is a script containing Mocha-Chai unit tests for 'Storage' contract.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, require/import is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, multihashes, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE' will be shown.
