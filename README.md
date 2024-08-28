# GP
Mungkin Anda bertanya apa itu GP, jadi GP adalah singkatan dari Git Push, sebuah alat sederhana yang dirancang untuk memudahkan proses push ke GitHub.  Dengan GP, Anda dapat memanfaatkan berbagai fitur yang dirancang untuk menyederhanakan workflow Git Anda. Oiya, jika Anda tertarik silahkan melakukan fork pada repositori ini dan mengirimkan pull request.

## Daftar Isi

-   [Instalasi](#instalasi)
-   [Fitur](#fitur)

## Instalasi

Langkah-langkah untuk menginstal GP pada mesin Anda, sebagai berikut:

1. Clone repositori ini
    ```bash
    git clone git@github.com:rizkijanuarr/gp.git atau git clone https://github.com/rizkijanuarr/gp.git
    ```
2. Masuk ke direktori
    ```bash
    cd gp
    ```
3. Beri izin 
    ```bash
    chmod +x gp.sh
    ```
4. Jalankan script
    ```bash
    ./gp.sh
    ```
5. Atau Anda bisa ke bash / zshrc 
    ```bash
    cd ~
    sudo nano ~/.zshrc
    ```
    Tambahkan baris ini di bagian paling bawah :
   ```bash
    alias gp='~/gp/gp.sh'
   save and exit!
   ```
   Anda bisa muat ulang konfigurasi
   ```bash
    source ~/.zshrc
   ```
   Just that, sekarang Anda dapat menjalankan GP dimana saja!


## Fitur

| **KEY**                 | **#**| **VALUE**                       |
|-------------------------|------|---------------------------------|
| Initial Commit          | ✅   | Untuk project baru              |
| All in one              | ✅   | Push to feat, fix, style, etc   |
| New branch              | ✅   | Membuat branch baru             |
| Switch branch           | ✅   | Berpindah branch                |
| Push branch             | ✅   | Push in branch                  |
| Switch branch main      | ✅   | Berpindah Branch Main (Wajib PR)|
