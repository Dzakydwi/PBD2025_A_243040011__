 --MEMBUAT DATABASE	
 CREATE DATABASE unpas;
 
USE unpas;

--membuat table
CREATE TABLE Mahasiswa (
	nama VARCHAR(100),
	npm CHAR(9),
	alamat VARCHAR(100)
	);

--MENGUBAH table
--menambahkan kolom semester
ALTER TABLE Mahasiswa
ADD semester CHAR(2);

--mengubah kolom alamat
ALTER TABLE Mahasiswa
ALTER COLUMN alamat VARCHAR(50);

--mengecek sturuktur table
EXEC sp_help 'Mahasiswa';


--membuat table dosen
CREATE TABLE Dosen (
	Nama VARCHAR(100) NOT NULL,
	Nip CHAR(9) UNIQUE,
	Alamat VARCHAR(50),
	Prodi VARCHAR(100),
);

--menghapus kolom 
ALTER TABLE Dosen
DROP COLUMN Alamat;

EXEC sp_help 'Dosen';

--nambahin constraint pada kolom 
ALTER TABLE Mahasiswa
ADD CONSTRAINT UQ_npm_Mahasiswa UNIQUE (npm);

--nambahin kolom nilai di table mahasiswa
ALTER TABLE Mahasiswa
ADD nilai INT;

--NAMBAHIN CONSTRAINT DEFAULT
ALTER TABLE Mahasiswa
ADD CONSTRAINT DF_nilai_Mahasiswa DEFAULT 100 FOR nilai;


--latihan 1
CREATE TABLE Tokopedia (
	ProdukID INT,
	SKU VARCHAR(15),
	NamaProduk VARCHAR(100),
	Harga DECIMAL(10, 2),
	Stok INT
);

CREATE TABLE Pelanggan (
	PelangganID INT IDENTITY(1,1) PRIMARY KEY,
	NamaDepan VARCHAR(50) NOT NULL,
	NamaBelakang VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE,
	TanggalDaftar DATE DEFAULT GETDATE()
);

EXEC sp_help 'Pelanggan';

DROP TABLE IF EXISTS Pesanan;

CREATE TABLE PesananTokped (
	PesananID INT IDENTITY(1,1) PRIMARY KEY

	TanggalPesanan DATETIME2 NOT NULL,

	PelangganId INT NOT NULL,
	StatusPesanan VARCHAR(10) NOT NULL,
);