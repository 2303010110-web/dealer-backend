-- ============================================================
-- DEALER MITSUBISHI - Database Schema
-- ============================================================
-- Versi   : 2.0
-- Update  : 2026
-- ============================================================

CREATE DATABASE IF NOT EXISTS dealer_mitsubishi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE dealer_mitsubishi;

-- ============================================================
-- TABLE: admin
-- ============================================================
-- Password disimpan dalam format MD5 (32 karakter hex)
-- ============================================================
-- AKUN DEFAULT ADMIN:
--   Username : admin
--   Password : Admin123
--   MD5 Hash : 3a0d9fa5c82f2c3d30ac8d6a91a3e7b2
--              (hasil dari MD5('Admin@2026'))
--
-- Cara ganti password:
--   UPDATE admin SET password = MD5('PasswordBaru') WHERE username = 'admin';
-- ============================================================
CREATE TABLE IF NOT EXISTS admin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(32) NOT NULL COMMENT 'MD5 hash — gunakan MD5() untuk set password',
  nama_lengkap VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Insert admin default: username=admin | password=admin123 (MD5)
INSERT INTO admin (username, password, nama_lengkap, email) VALUES
('admin', MD5('admin123'), 'Administrator', 'admin@mitsubishidealer.com');

-- ============================================================
-- TABLE: mobil
-- ============================================================
-- Kolom 'gambar' menyimpan path relatif file (assets/uploads/mobil/namafile.jpg)
-- atau URL eksternal (https://...)
-- ============================================================
CREATE TABLE IF NOT EXISTS mobil (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_mobil VARCHAR(100) NOT NULL,
  merk VARCHAR(50) NOT NULL DEFAULT 'Mitsubishi',
  tipe VARCHAR(50) NOT NULL,
  tahun INT NOT NULL,
  warna VARCHAR(50),
  mesin VARCHAR(100),
  transmisi ENUM('Manual','Automatic','CVT') DEFAULT 'Automatic',
  bahan_bakar ENUM('Bensin','Solar','Hybrid','Listrik') DEFAULT 'Bensin',
  harga BIGINT NOT NULL,
  stok INT DEFAULT 0,
  gambar VARCHAR(255) COMMENT 'Path lokal: assets/uploads/mobil/file.jpg — ATAU — URL: https://...',
  deskripsi TEXT,
  badge VARCHAR(30),
  featured TINYINT(1) DEFAULT 0,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO mobil (nama_mobil, merk, tipe, tahun, warna, mesin, transmisi, bahan_bakar, harga, stok, gambar, deskripsi, badge, featured) VALUES
('Mitsubishi Xpander','Mitsubishi','MPV',2024,'Putih Pearl','1.5L MIVEC','Automatic','Bensin',298000000,5,'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=600&q=80','Mitsubishi Xpander hadir sebagai MPV modern dengan desain sporty dan kabin lega. Dilengkapi mesin 1.5L MIVEC bertenaga tinggi, transmisi otomatis halus, serta fitur keselamatan terkini. Cocok untuk keluarga aktif yang membutuhkan kenyamanan dan gaya sekaligus.','BEST SELLER',1),
('Mitsubishi Xpander Cross','Mitsubishi','MPV',2024,'Hitam Metalik','1.5L MIVEC','Automatic','Bensin',325000000,4,'https://images.unsplash.com/photo-1606016159991-dfe4f2746ad5?w=600&q=80','Mitsubishi Xpander Cross menghadirkan keanggunan SUV dengan kepraktisan MPV. Desain yang lebih tinggi dan gagah dengan ground clearance optimal, dilengkapi fitur terkini untuk kenyamanan berkendara keluarga.','NEW 2024',1),
('Mitsubishi Pajero Sport','Mitsubishi','SUV',2024,'Putih Diamond','2.4L MIVEC Diesel','Automatic','Solar',715000000,2,'https://images.unsplash.com/photo-1489824904134-891ab64532f1?w=600&q=80','Mitsubishi Pajero Sport menghadirkan kemewahan bercampur ketangguhan. Mesin diesel MIVEC 2.4L bertenaga besar, sistem 4WD canggih, dan interior premium menjadikan Pajero Sport sebagai SUV premium terbaik.','PREMIUM',1),
('Mitsubishi Outlander PHEV','Mitsubishi','SUV',2024,'Merah Metalik','2.4L PHEV','Automatic','Hybrid',865000000,2,'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=600&q=80','Mitsubishi Outlander PHEV adalah SUV hybrid plug-in pertama di kelasnya. Teknologi Twin Motor 4WD memberikan akselerasi luar biasa dengan konsumsi bahan bakar yang sangat efisien dan emisi rendah.','HYBRID',1),
('Mitsubishi Eclipse Cross','Mitsubishi','SUV',2024,'Biru Metalik','1.5L Turbo MIVEC','Automatic','Bensin',485000000,3,'https://images.unsplash.com/photo-1620891549027-942fdc95d3f5?w=600&q=80','Mitsubishi Eclipse Cross hadir dengan desain coupe yang memukau dan aerodinamis. Mesin turbo 1.5L bertenaga tinggi dengan sistem S-AWC memberikan pengalaman berkendara yang sporty dan menyenangkan.','SPORTY',1),
('Mitsubishi Colt L300','Mitsubishi','Pick Up',2024,'Putih','2.5L Diesel','Manual','Solar',235000000,8,'https://images.unsplash.com/photo-1532974297617-c0f05fe48bff?w=600&q=80','Mitsubishi Colt L300 adalah kendaraan niaga andalan yang telah teruji lebih dari 40 tahun di Indonesia. Mesin diesel bertenaga, daya angkut besar, dan perawatan mudah menjadikannya pilihan utama usaha.','NIAGA',0),
('Mitsubishi Triton','Mitsubishi','Pick Up',2024,'Hitam','2.4L MIVEC Diesel','Automatic','Solar',435000000,4,'https://images.unsplash.com/photo-1502877338535-766e1452684a?w=600&q=80','Mitsubishi Triton adalah double cabin premium yang menggabungkan kemampuan kerja keras dengan kenyamanan penumpang. Teknologi 4WD Super Select II membuatnya tak tertandingi di segala medan.','4WD',1),
('Mitsubishi Delica','Mitsubishi','Van',2024,'Silver','2.4L MIVEC','Automatic','Bensin',680000000,2,'https://images.unsplash.com/photo-1616788494672-ec7ca25fdda9?w=600&q=80','Mitsubishi Delica hadir sebagai MPV premium dengan kemampuan off-road yang memukau. Desain futuristik, kabin mewah 7-penumpang, dan ketinggian ground clearance tinggi menjadikannya kendaraan petualangan premium.','PREMIUM MPV',0),
('Mitsubishi Mirage','Mitsubishi','Hatchback',2024,'Merah','1.2L MIVEC','CVT','Bensin',195000000,6,'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=600&q=80','Mitsubishi Mirage adalah city car paling hemat bahan bakar di kelasnya. Desain modern, teknologi MIVEC canggih, dan dimensi kompak menjadikannya pilihan sempurna untuk mobilitas perkotaan.','CITY CAR',0),
('Mitsubishi Galant','Mitsubishi','Sedan',2024,'Hitam','2.0L MIVEC Turbo','Automatic','Bensin',520000000,1,'https://images.unsplash.com/photo-1583121274602-3e2820c69888?w=600&q=80','Mitsubishi Galant adalah sedan premium dengan perpaduan sempurna antara kemewahan dan performa. Mesin turbo 2.0L MIVEC bertenaga tinggi dengan teknologi active safety terkini untuk ketenangan berkendara.','LUXURY',0);

-- ============================================================
-- TABLE: booking
-- ============================================================
CREATE TABLE IF NOT EXISTS booking (
  id INT AUTO_INCREMENT PRIMARY KEY,
  kode_booking VARCHAR(20) NOT NULL UNIQUE,
  mobil_id INT NOT NULL,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  no_hp VARCHAR(20) NOT NULL,
  alamat TEXT NOT NULL,
  jumlah INT DEFAULT 1,
  metode ENUM('cash','kredit','leasing') NOT NULL,
  tanggal_booking DATE NOT NULL,
  total_harga BIGINT NOT NULL,
  catatan TEXT,
  status ENUM('pending','dikonfirmasi','ditolak','selesai') DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (mobil_id) REFERENCES mobil(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ============================================================
-- TABLE: kontak
-- ============================================================
CREATE TABLE IF NOT EXISTS kontak (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  no_hp VARCHAR(20),
  subjek VARCHAR(150),
  pesan TEXT NOT NULL,
  status ENUM('belum_dibaca','sudah_dibaca') DEFAULT 'belum_dibaca',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ============================================================
-- TABLE: testimonial
-- ============================================================
CREATE TABLE IF NOT EXISTS testimonial (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  kota VARCHAR(50),
  teks TEXT NOT NULL,
  rating TINYINT DEFAULT 5,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO testimonial (nama, kota, teks, rating) VALUES
('Budi Santoso','Jakarta','Pelayanan sangat memuaskan! Proses pembelian Mitsubishi Xpander saya cepat dan transparan. Mobil yang saya beli kondisinya sempurna. Sangat rekomendasikan dealer Mitsubishi ini kepada teman-teman.',5),
('Siti Rahayu','Surabaya','Dealer Mitsubishi terpercaya dengan harga kompetitif. Staff sangat ramah dan membantu dalam proses kredit Pajero Sport. Saya sudah beli 2 mobil di sini dan tidak pernah kecewa dengan pelayanannya.',5),
('Ahmad Fauzi','Bandung','Koleksi Mitsubishinya sangat lengkap dari berbagai tipe. Harganya sesuai pasaran bahkan lebih terjangkau. Proses STNK dan BPKB Xpander Cross saya juga cepat beres hanya dalam seminggu.',5);

-- ============================================================
-- TABLE: pengaturan
-- ============================================================
CREATE TABLE IF NOT EXISTS pengaturan (
  id INT AUTO_INCREMENT PRIMARY KEY,
  kunci VARCHAR(50) NOT NULL UNIQUE,
  nilai TEXT,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO pengaturan (kunci, nilai) VALUES
('nama_dealer','Dealer Mitsubishi Resmi'),
('alamat','Jl. Raya Mitsubishi No. 99, Jakarta, Indonesia'),
('telepon','+62 812-3456-7890'),
('email','info@mitsubishidealer.com'),
('jam_operasional','Senin – Sabtu, 08:00 – 20:00 WIB'),
('whatsapp','6281234567890'),
('tagline','Dealer Resmi Mitsubishi Terpercaya di Indonesia'),
('google_maps','https://maps.google.com');

-- ============================================================
-- CATATAN PENTING - RINGKASAN AKUN & KEAMANAN
-- ============================================================
--
-- [AKUN ADMIN]
--   Username : admin
--   Password : Admin@2026
--   Hash MD5 : MD5('Admin@2026')
--
-- [CARA UBAH PASSWORD VIA SQL]
--   UPDATE admin SET password = MD5('PasswordBaruAnda123') WHERE username = 'admin';
--
-- [CARA TAMBAH ADMIN BARU]
--   INSERT INTO admin (username, password, nama_lengkap, email)
--   VALUES ('namauser', MD5('PasswordBaru'), 'Nama Lengkap', 'email@domain.com');
--
-- [FOLDER UPLOAD GAMBAR MOBIL]
--   Path : mitsubishi/assets/uploads/mobil/
--   Format: JPG, PNG, WEBP, GIF (maks 5MB)
--   Pastikan folder ini writable (chmod 755 atau 775)
--
-- ============================================================
