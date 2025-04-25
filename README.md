# Malta

sebuah skrip Ruby untuk otomatisasi pendaftaran akun dengan menggunakan API. memungkinkan pengguna untuk menghasilkan data pengguna seperti nama, email, kata sandi, dan alamat Polygon secara acak, lalu mendaftarkannya ke endpoint API tertentu.

## 🚀 Fitur
- **Pembuatan Data Otomatis**: Menghasilkan nama, email, kata sandi, dan alamat Polygon menggunakan pustaka `Faker` dan `Eth`.
- **Integrasi API**: Mengirimkan data pendaftaran ke endpoint API menggunakan `HTTParty`.
- **Penyimpanan Data**: Menyimpan data pendaftaran yang berhasil ke file `information.json`.
- **Antarmuka CLI**: Menampilkan log pendaftaran dengan warna menggunakan `colorize` untuk memudahkan pelacakan.
- **Keamanan**: Menghasilkan kunci privat dan alamat Polygon untuk setiap akun.
- **Penundaan Antar Percobaan**: Menambahkan jeda 1 detik antar percobaan untuk menghindari pemblokiran API.

## 🛠️ Prasyarat
Sebelum menjalankan skrip, pastikan Anda telah menginstal:
- Ruby (versi 3.0 atau lebih tinggi)
- Bundler (untuk mengelola dependensi)

Dependensi Ruby yang diperlukan:
- `httparty`
- `faker`
- `json`
- `securerandom`
- `colorize`
- `eth`

## 📦 Instalasi
1. **Kloning Repository**:
   ```bash
   git clone https://github.com/Yuurichan-N3/Malta-Bot.git
   cd Malta-Bot
   ```

2. **Instal Dependensi**:
   ```bash
   bundle install
   ```

   Jika Anda belum memiliki `bundler`, instal terlebih dahulu:
   ```bash
   gem install bundler
   ```

3. **Siapkan Environment**:
   Pastikan Anda memiliki koneksi internet untuk mengakses API (`https://www.ulys.site/api/users`).

## 🖥️ Cara Penggunaan
1. Jalankan skrip menggunakan perintah:
   ```bash
   ruby bot.rb
   ```

2. Masukkan jumlah percobaan pendaftaran saat diminta:
   ```
   Enter number of registration attempts: 
   ```

3. Skrip akan:
   - Menghasilkan data pengguna secara acak.
   - Mengirimkan permintaan POST ke API.
   - Menyimpan data pendaftaran yang berhasil ke `information.json`.
   - Menampilkan log dengan warna untuk setiap percobaan.

4. Hasil pendaftaran yang berhasil akan disimpan di file `information.json` dalam format JSON.

## 📋 Contoh Output
```
╔══════════════════════════════════════════════╗
║      🌟 MALTA BOT - Automated Signups        ║
║   Automate your account registrations!       ║
║  Developed by: https://t.me/sentineldiscus   ║
╚══════════════════════════════════════════════╝

Enter number of registration attempts: 3
Attempt 1/3
Registration successful:
Name: John
Surname: Doe
Email: john.doe@gmail.com
Address: 0x1234...
Country: indonesia
Waiting 1 second before next attempt...
...
Data saved to information.json
Saved 2 successful registrations
```

## 🐛 Pemecahan Masalah
- **Error "Invalid input"**: Pastikan Anda memasukkan angka positif saat diminta jumlah percobaan.
- **Gagal terhubung ke API**: Periksa koneksi internet atau status endpoint API.
- **Dependensi tidak terinstal**: Jalankan `bundle install` untuk menginstal pustaka yang diperlukan.
- **File `information.json` tidak terbuat**: Pastikan direktori memiliki izin tulis.

## 📜 Lisensi
Script ini didistribusikan untuk keperluan pembelajaran dan pengujian. Penggunaan di luar tanggung jawab pengembang.

Untuk update terbaru, bergabunglah di grup **Telegram**: [Klik di sini](https://t.me/sentineldiscus).

## 💡 Disclaimer
Penggunaan bot ini sepenuhnya tanggung jawab pengguna. Kami tidak bertanggung jawab atas penyalahgunaan skrip ini.
