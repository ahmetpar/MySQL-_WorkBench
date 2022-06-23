/*=============================== ALTER TABLE =========================================
    
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin kullanılır.
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de kullanılır.
    
    constraint check ->  Bir sütuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır .
=======================================================================================*/

use batch59;

CREATE TABLE personel
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
sirket VARCHAR(20)
);


INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    
select * from personel;
   
-- SORU1: personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' olan yeni bir sutun ekleyiniz.
alter table personel add ulke_isim varchar(20) default 'Turkiye';
alter table personel add nufusu int;

-- cinsiyet sutunu ekleyiniz
alter table personel add cinsiyet char default 'E';

-- cinsiyet sutunu siliniz
alter table personel drop column cinsiyet;
alter table personel drop column nufusu;
select * from personel;


-- SORU2: personel tablosuna cinsiyet Varchar(20), yas int, dogum tarihi seklinde yeni sutunlar ekleyiniz.
alter table personel add column (cinsiyet varchar (20), yas int, dogum_tarihi date default '2018-04-14');
select * from personel;

alter table personel add (cinsiyet1 varchar (20), yas1 int);
select * from personel;

alter table personel drop column cinsiyet1;
alter table personel drop column yas1;


-- SORU3: personel tablosundan sirket sutununu siliniz.
alter table personel drop column sirket;


-- SORU4: personel tablosundaki ulke_isim sutununun adini ulke_adi olarak degistiriniz.
alter table personel rename column ulke_isim to ulke_adi;
alter table personel rename column maas to ucret;
select * from personel;

-- SORU5: personel tablosunun adini isciler olarak degistiriniz.
alter table personel rename to isciler;
select * from isciler;

-- SORU6: isciler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz ve veri tipini VARCHAR(30) olarak değiştiriniz. 
alter table isciler modify ulke_adi varchar(30) not null;

-- maas 3000 e eşit ve büyük olan değerler veri olarak girilebilir.
alter table isciler add constraint check (maas>=3000); -- tablomuza maasi 3000 den az olan degerler girmeyecek


alter table isciler drop column cinsiyet;
alter table isciler drop column yas;
alter table isciler drop column dogum_tarihi; -- bu 4sutunu sildikki asagidaki verileri girebilelim. amacimiz 3000 ve alti maaslarin engellenmesi
alter table isciler drop column sirket;
select * from isciler;
delete from isciler where id=127456716;
alter table isciler add ulke_adi varchar (20);


INSERT INTO isciler VALUES(123456710, 'Ali Yilmaz', 'Istanbul', 3000, 'USA'); -- bu 3000'e esit oldugu icin girdi.
INSERT INTO isciler VALUES(127456716, 'Ahmet Yilmaz', 'Istanbul', 2000, 'CANADA'); --
INSERT INTO isciler VALUES(123456234, 'Ali Yilmaz', 'Istanbul', 1000, 'England');
INSERT INTO isciler VALUES(127456456, 'Ali Yilmaz', 'Istanbul', 1000, 'France'); --
INSERT INTO isciler VALUES(234456456, 'Ali Yilmaz', 'Istanbul', 7500, 'Germany');
