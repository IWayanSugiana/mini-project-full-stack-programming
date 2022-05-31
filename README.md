# mini-project-full-stack-programming
## description
Repositori ini berisi tugas mini project milik saya dan @anantaw81.
Pada mini project ini kami belajar mengimplementasikan microservice pada server yang kami bangun.
Adapun server yang kami bangun terdiri dari 3 server yakni :
- Server 1 : Server Gateway
- Server 2 : Server yang terhubung ke API Public
- Server 3 : Server yang terhubung ke database lokal
Pada project ini kami memilih menggunakan toko komputer sebagai study case untuk kami implementasikan pembuatan server dengan microservice.

## server 1
Pada server 1 terhubung ke databases menggunakan Flask. Library yang digunakan:
- Flask
- PyMySQL
- yang lainnya dapat di lihat pada requirements.txt

## server 2
Pada server 2 kami memilih menggunakan API iPaymu untuk melakukan payment. Server 2 akan terhubung ke API iPaymu dan mengirim request untuk redirect payment ke API iPaymu dan akan menampilkan hasil respond dari API iPaymu.
Adapun dependecny yang digunakan untuk membangun server 2 adalah sebagai berikut:
- Axios
- Crypto-js
- Dotenv
- Express

*Notes: untuk menjalankan server 2, anda perlu membuat file .env untuk menyimpan variable VIRTUAL_ACCOUNT, API_KEY, dan PORT. 

**Nilai PORT yang digunakan adalah 7000.
## server 3
- Pada server 1 terhubung ke databases menggunakan Flask. Library yang digunakan:
- Flask
- PyMySQL
- yang lainnya dapat di lihat pada requirements.txt
