<<<<<<< HEAD
# 🚗 Dealer Mitsubishi — Website PHP

Website dealer mobil Mitsubishi berbasis PHP + MySQL dengan panel admin lengkap.

---

## 📋 Fitur Utama

- **Halaman User**: Beranda, Daftar Mobil, Detail Mobil, Booking, Tentang, Kontak
- **Panel Admin**: Kelola mobil, booking, testimonial, kontak, pengaturan
- **Upload Foto Lokal**: Admin bisa upload foto JPG/PNG/WEBP/GIF langsung dari komputer
- **Akses Admin Tersembunyi**: Klik teks **DealerMobil** di footer untuk ke halaman login

---

## ⚙️ Instalasi

1. **Copy folder** `mitsubishi/` ke dalam `htdocs/` (XAMPP) atau `www/` (WAMP/Laragon)
2. **Buat database** bernama `dealer_mitsubishi` di phpMyAdmin
3. **Import SQL**: jalankan file `database.sql`
4. **Sesuaikan koneksi** di `includes/config.php`:
   ```php
   define('DB_HOST', 'localhost');
   define('DB_USER', 'root');
   define('DB_PASS', '');       // ← sesuaikan password MySQL Anda
   define('DB_NAME', 'dealer_mitsubishi');
   ```
5. **Permission folder upload** (Linux/Mac):
   ```bash
   chmod 775 assets/uploads/mobil/
   ```
6. Buka browser: `http://localhost/mitsubishi/`

---

## 🔐 Akun Admin

| Field    | Value        |
|----------|-------------|
| Username | `admin`      |
| Password | `Admin@2026` |
| Enkripsi | MD5          |

**URL Login Admin**: `http://localhost/mitsubishi/admin/login.php`

> **Akses Tersembunyi**: Dari halaman website, klik teks **DealerMobil** di bagian bawah footer (©) untuk langsung diarahkan ke halaman login admin.

### Ganti Password Admin (via SQL):
```sql
UPDATE admin SET password = MD5('PasswordBaruAnda') WHERE username = 'admin';
```

### Tambah Admin Baru:
```sql
INSERT INTO admin (username, password, nama_lengkap, email)
VALUES ('user2', MD5('Password123'), 'Nama Admin', 'email@domain.com');
```

---

## 🖼️ Upload Foto Mobil

Foto mobil kini bisa diupload langsung dari komputer (tidak perlu URL):

- **Format**: JPG, JPEG, PNG, WEBP, GIF
- **Ukuran maks**: 5MB per file
- **Lokasi tersimpan**: `assets/uploads/mobil/`
- **Cara upload**: Panel Admin → Data Mitsubishi → Tambah/Edit → klik area upload foto

> Foto lama berupa URL eksternal tetap ditampilkan normal. Upload foto baru untuk menggantinya dengan file lokal.

---

## 📁 Struktur Folder

```
mitsubishi/
├── index.php              # Halaman beranda
├── mobil.php              # Daftar mobil
├── detail-mobil.php       # Detail mobil
├── booking.php            # Form booking
├── tentang.php            # Tentang kami
├── kontak.php             # Kontak
├── database.sql           # Schema + data awal
├── .htaccess              # URL rewrite & keamanan
├── includes/
│   ├── config.php         # Koneksi DB + helper functions
│   ├── navbar.php         # Navigasi
│   └── footer.php         # Footer (dengan link admin tersembunyi)
├── assets/
│   ├── css/               # Stylesheet
│   ├── js/                # JavaScript
│   └── uploads/
│       └── mobil/         # ← Foto upload disimpan di sini
│           └── .htaccess  # Keamanan (blok eksekusi PHP)
└── admin/
    ├── login.php          # Halaman login (tampil kredensial default)
    ├── dashboard.php      # Dashboard admin
    ├── mobil.php          # Kelola data mobil + upload foto
    ├── booking.php        # Kelola booking
    ├── testimonial.php    # Kelola testimonial
    ├── kontak.php         # Kelola pesan kontak
    ├── pengaturan.php     # Pengaturan website
    ├── password.php       # Ganti password admin
    ├── logout.php         # Logout
    └── includes/
        ├── header.php     # Header panel admin
        └── footer.php     # Footer panel admin
```

---

## 🛠️ Teknologi

- **Backend**: PHP 8.x (MySQLi, Session)
- **Database**: MySQL / MariaDB
- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Icons**: Font Awesome 6
- **Fonts**: Google Fonts (Poppins)

---

## 📝 Catatan

- Password admin disimpan dengan **enkripsi MD5**
- Folder `assets/uploads/mobil/` harus **writable** oleh web server
- File PHP tidak bisa dieksekusi di dalam folder uploads (dilindungi `.htaccess`)
=======

>>>>>>> 20c1e223d846345e893658d18c2bd0949006bcee
