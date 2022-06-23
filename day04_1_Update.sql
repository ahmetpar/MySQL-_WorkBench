-- UPDATE - SET  

use batch59;

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

select * from tedarikciler;
    
CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
    
SELECT * FROM urunler;

-- SORU1: İki tabloyu birleştirerek listeleyiniz.
SELECT * from tedarikciler, urunler where tedarikciler.vergi_no = urunler.ted_vergino;
select * from urunler, tedarikciler where urunler.ted_vergino = tedarikciler.vergi_no; -- listeyi tersten yazdirdim


-- UPDATE - SET     
-- SYNTAX
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE koşul;


-- SORU2: vergi_no’su 102 olan tedarikcinin (firma) ismini 'Vestel' olarak güncelleyeniz.
update tedarikciler   -- tedarikciler listesi set edilecek
set firma_ismi = 'Vestel'  -- bu deger firma ismi sutununda bulunan deger olarak degistrilecek
where vergi_no= '102'; -- ilgili sutundaki hangi satirin degisecegi sarti

select * from tedarikciler;

--  SORU3: Tedarikciler tablosundaki tüm firma isimlerini 'CASPER' olarak güncelleyeniz.
update tedarikciler set firma_ismi = 'CASPER';

-- SORU4: vergi_no’su 101 olan tedarikcinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikciler set firma_ismi = 'casper' where vergi_no = 101;
update tedarikciler set irtibat_ismi = 'Ali Veli' where vergi_no = 101;

-- yukaridaki kod şu şekilde kisiltilabilir.
update tedarikciler set firma_ismi = 'casper', irtibat_ismi = 'Ali Veli' where vergi_no=101;
select * from tedarikciler;

-- SORU :Tum vergi no satirlarina farkli firmalar atayiniz ve her firmanin irtibat isimlerini guncelleyiniz
update tedarikciler set firma_ismi = 'Arcelik', irtibat_ismi= 'Fidan' where vergi_no=102;
update tedarikciler set firma_ismi = 'Beko', irtibat_ismi= 'Ahmet' where vergi_no=103;
update tedarikciler set firma_ismi = 'Grundig', irtibat_ismi= 'Zehra' where vergi_no=104;
update tedarikciler set firma_ismi = 'Istikbal', irtibat_ismi= 'Tahir Eren' where vergi_no=101;
 
 -- SORU: tedarikciler tablosu ile urunler tablosunu fk ve primary key'e gore birlikte listeleyiniz
 select * from tedarikciler, urunler where tedarikciler.vergi_no = urunler.ted_vergino;
    
-- SORU5: firma_ismi 'Arcelik' olan tedarikcinin irtibat_ismini 'Parlak' olarak güncelleyiniz.
update tedarikciler set irtibat_ismi = 'Parlak' where firma_ismi= 'Arcelik';
select * from tedarikciler;

-- SORU6: urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler set urun_isim = 'Telefon' where urun_isim = 'Phone';
SELECT * FROM urunler;

-- SORU7: urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id 1 arttrn/azaltin
update urunler set urun_id = urun_id+1 where urun_id>1004;
update urunler set urun_id = urun_id-1 where urun_id>1004; 

-- SORU8: urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urunler set urun_id = urun_id + ted_vergino where ted_vergino=101;

-- SORU9: urunler tablosundan Ali Bak’in aldigi urunun ismini, 
-- tedarikci  tablosunda irtibat_ismi 'Adam Eve' olan firma_ismi ile degistiriniz.
-- 9. soruyu çözmeden önce, tabloları eski haline getireceğiz.

-- update urunler set urun_isim = 'Apple' where musteri_isim = 'Ali Bak';  bu binlerce veri iceren tablolarda zor bulunur
-- bo soruyu yaparken iki tablonun birlikte listelenmesi soruyu anlamamiza destek saglayabilir
select * from tedarikciler, urunler where tedarikciler.vergi_no = urunler.ted_vergino;

update urunler set urun_isim = (select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve') -- tedarikciler tablosundan veri cagirdik
where musteri_isim = 'Ali Bak';

SELECT * FROM urunler;

-- Apple bu sorgu ile alindi:
--  select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve';

 -- SORU10: Laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
 
 update urunler set musteri_isim = 'Adam Eve' where urun_isim='Laptop';
 select irtibat_ismi from tedarikciler where firma_ismi ='Apple';
 
 update urunler set musteri_isim = (select irtibat_ismi from tedarikciler where firma_ismi ='Apple')
 where urun_isim='Laptop';