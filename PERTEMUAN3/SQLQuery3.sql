--menampilkan semua data pada tabel
SELECT * 
FROM Production.Product;

-- menampilkan name, productnumber, dan listprice
SELECT Name, ProductNumber, ListPrice
FROM  Production.product;

--menampilkan data  menggunakan 
SELECT Name AS [EJA STORE], ListPrice AS 'Harga Jual'
FROM Production.product;

--menampilkan harga baru = listprice *1.1
SELECT Name, ListPrice, (ListPrice * 1.1) AS HargaBaru
FROM Production.Product;

--menampilkan data dengan menggunakan string
SELECT Name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.Product;

--filterisasi Data
--menampilkan product yang bernama
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'Red';

--menampilkan data yang listprice lebih  dari 1000
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 1000;

--menampilkan produk yg berwarna black DAN harganya di atas 500
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'Blue' AND ListPrice > 500;

--menampilkan produk yang red, blue atau black
SELECT Name, Color
FROM Production.Product
WHERE Color IN ('Red', 'Blue', 'Black')
ORDER BY Color DESC;

--menampilkan data yang  namanya kata 'Road'
SELECT Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%Road%';

--agregasi dan pengelompokkan
-- hitung total baris
SELECT COUNT(*) AS TotalProduk
FROM Production.Product;

--Menampilkan warna dan jumlahnya
SELECT Color, COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

--menghitung jumlah orderqty dan rata2 unit price dari table sales
SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS
RataRataHarga
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

--Group lebih dari satu kelompok
SELECT Color, Size, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color, Size;

--filter agregasi memakai having
--query eror
SELECT Color, Name, COUNT(*)
FROM Production.Product
GROUP BY Color;

--menampilkan warna dan jumlah nya tetapi jumlahnya lebih dari 20
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color
HAVING COUNT(*) > 1;


--yg listprice 
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
WHERE ListPrice > 50 --filter baris
GROUP BY Color		--kelompokkan sisa baris
HAVING COUNT(*) > 1;	-- filter hasil kelompok

--menampilkan data yang jumlah penjualaannya lebih dari 10
SELECT ProductID, SUM(OrderQty) AS TotalQty
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) > 10;

--menampilkan data yang rata2 qty nya lebih dari 2
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) > 2;

--menampilkan product yang lebih dari 3000 mennggunakan MAX 
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX(ListPrice) > 3000;

SELECT Color, ListPrice
FROM Production.Product;

--Afvance Select dan ORder By
--Menampilkan jobtitle dari tabel employee tapi tidak boleh ada duplikat
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

--menampilkan produk yang termahal ke termurah
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--mengambil data 5 produk termahal
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--offset fetch
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 2 ROWS
FETCH NEXT 4 ROWS ONLY;

SELECT *
FROM Production.Product;


--
SELECT TOP 3 Color, SUM(ListPrice) AS TotalNilaiStok
FROM Production.Product
WHERE ListPrice > 0 -- Step 2: Filter sampah
GROUP BY Color -- Step 3: Kelompokkan
ORDER BY TotalNilaiStok DESC;