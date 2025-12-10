USE KampusDB;

--CROSS JOIN, menampilkan mahasiswa dan matakuliah
SELECT NamaMahasiswa FROM Mahasiswa
SELECT NamaMK FROM MataKuliah

SELECT M.NamaMahasiswa, MK.NamaMK
FROM Mahasiswa AS M
CROSS JOIN MataKuliah AS MK;

--menampilkan semua kombinasi dosen dan ruangan
SELECT NamaDosen FROM Dosen
SELECT KodeRuangan FROM Ruangan;


SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
CROSS JOIN Ruangan R;

--LEFT JOIN 
--MENAMPILKAN smua mahasiswwa termasuk yang bekum ambil krs
SELECT M.NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa M
LEFT JOIN KRS K ON M.MahasiswaID = K.MahasiswaID;

--menampilkan semua matakuliah termasuk yang belum mempunyai jadwal
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK
LEFT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--right join 
--menamapilkan semua jadwal walaupun tidaj ada matakuliah
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK
RIGHT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--menampilkan semua ruangan apakah dipakai  di jadwal atau tidak
SELECT R.KodeRuangan, J.Hari
FROM JadwalKuliah J
RIGHT JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--inner join
--menggambungkan tabel mahasiswa + matakuliah melalui tebel KRS
SELECT * FROM Mahasiswa
SELECT * FROM KRS
SELECT * FROM MataKuliah

SELECT M.NamaMahasiswa, MK.NamaMK
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID;

--menampilkan matakuliah dan dosen pengmpunya
SELECT MK.NamaMK, D.NamaDosen
FROM MataKuliah MK
JOIN Dosen D ON MK.DosenID = D.DosenID;

--menampilkan jadwal lengkap MK + Dosen + Ruangan
SELECT MK.NamaMK, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--menampilkan nama mahasiswa, nama mata kuliah, dan nilai akhir
SELECT M.NamaMahasiswa, MK.NamaMK, N.Nilaiakhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID;

--Menapilkan nama dosen dan matakuliah yang diajar
SELECT D.NamaDosen, MK.NamaMK
FROM Dosen D
INNER JOIN MataKuliah MK ON D.DosenID = MK.DosenID;

--SELF JOIN
SELECT A.NamaMahasiswa AS Mahasiswa1,
		B.NamaMahasiswa AS Mahasiswa2, 
		A.Prodi
FROM Mahasiswa A 
INNER JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID < B.MahasiswaID; --AGAR tidak duplikat


--1. tampilkan nama mahasiswa beserta prodi nya dari tabel mahasiswa tetapi hanya mahasiswa yang memiliki nilai di tabel nilai
SELECT M.NamaMahasiswa, M.Prodi, N.NilaiAkhir
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = M.MahasiswaID;

--2.Tampilkan nama dosen dan ruangan tempat dosen tersebut mengajar
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
INNER JOIN Ruangan R ON D.DosenID = R.RuanganID

--3. tampilkan daftar mahasiswa yang mengambil suatu mata kuliah beserta nama mata kuliah dan dosen pengampu
SELECT 
    M.NamaMahasiswa, 
    MK.NamaMK, 
    D.NamaDosen
FROM Mahasiswa M
INNER JOIN KRS K ON M.MahasiswaID = K.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;

--4. tampilkan jadwal kuliah berisi nama mata kuliah, nama dosen, dan hari kuliah tetapi tidak perlu menampilkan ruanganya
SELECT MK.NamaMK, D.NamaDosen, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID; 

--5. Tampilkan nilai mahasiswa lengkap dengan nama mahasiswa, nama mata kuliah, nama dosen pengampu, dan nilai akhirnya
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen , N.Nilaiakhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;