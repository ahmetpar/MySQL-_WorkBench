create database batch59;

-- aciklama yazabilmek icin "--" ve sonrasinda bir bosluk olmali kullanilir
/* 
javada oldugu gibi 
boyle aciklama ekliyebiliyoruz 
*/
/*
create database bu komutla data base olusturuz. 
silmek icin solda sag tiklayip drop diyoruz.
*/
use batch59; -- birden fazla database var ve karisiklik olmamasi icin kullanacagimiz data base use komutu ile seciyoruz

-- Not: bu kodlar bizde oldugu surece sol tarafta database'leri silmemizin bir onemi yok
-- TABLO olusturma:  
/*
1: once asagidaki formatta create table komutu sonra tablonun ismi yazilir.
2: parantez olusturlur ve sonuna noktali virgul konulur. ();  
bu parantezin arasina tablonun basliklari headers ve onun ata turleri belirtilir.

*/
create table student
(
id varchar(4), -- varchar ile tablonun bu basliginin altindaki harf ya da rakam girisini 4 karakter olarak belirledim
name varchar(30),
age int
);

-- VERI Girisi:

insert into student values ('1000', 'Ali Can',25);   -- student tablosunun icine bu degerleri gir anlamina geliyor
insert into student values ('1001', 'Alem Canik',30);   
insert into student values ('1002', 'Ahmet Canim',35);   
insert into student values ('1003', 'Asli Cancan',15);   

-- VERI CAGIRMA:

select * from student; -- bu select * from ile secilen tablodaki tum verileri getirir.
select name from student; -- bu kez sadece student tablosundaki isim basligi altindaki verileri getirecek
select age, id from student; -- bu komutla hem yas hemde id leri yazma sirama gore getirecek.

-- TABLO SILME:
drop table student; -- student tablosu silinir istersek soldaki bolumdede sag tiklayip drop yapabiliyoruz.

