use batch59;  -- bu adimi muhakkak ilk basta yapmak lazim

create table ogrenciler
(
id int,
isim varchar(40),
dogum_yeri varchar(100),
sinav_notu int
);

insert into ogrenciler values(1400, 'Ahmet', 'Kayseri', 92 );
insert into ogrenciler values(1401, 'Fidan', 'Adana', 65 );
insert into ogrenciler values(1402, 'Zehra','Urfa', 54 );
insert into ogrenciler values(1403, 'Tahir Eren','Malatya', 77 );
insert into ogrenciler values(1404, 'Parlak','Kocaeli', 82 );

select * from ogrenciler;

-- *********** SELECT _ WHERE  ---> Kosul belirtmek icin **********
/*
verileri veritabinindan cekerken filtreleme zapmak icin
selct ve where birlikte kullanilir
*/
-- soru: sinav notu 80 den buyuk olan ogrenci bilgileri listele
select * from ogrenciler where sinav_notu > 80; -- getir herseyi ogrenciler tablasundan ama sinav notu 80'den buyuk olsun
select id from ogrenciler where sinav_notu > 80; -- getir sadece id numaralarini 80'den fazla notu olan ogrencilerin
select id, isim from ogrenciler where sinav_notu > 80; -- getir sadece id ve isimlerini 80'den fazla notu olan ogrencilerin

-- soru: dogum yeri malatya olan ogrencilerin isim ve notlarini listele
select isim, sinav_notu from ogrenciler where dogum_yeri= 'Malatya';
 /*
eger bir yerde kirmizi icinde carpi hatasi
aliyorsak o bir onceki satirda hata var demektir
*/
-- soru: id'si 1402 olan ogrencilerin tum bilgilerini listele
select * from ogrenciler where id= 1402;

-- ************* Yeni Bir Tablo Olusturacagiz "PERSONEL" isminde *********************

create table personel (
id char (4),
isim varchar (30),
maas int
);
insert into personel values(1200, 'Ahmet',  70000 );
insert into personel values(1201, 'Fidan',  85000 );
insert into personel values(1202, 'Zehra', 105000 );
insert into personel values(1203, 'Tahir Eren', 110000 );
insert into personel values(1204, 'Parlak', 95000 );
insert into personel values(1205, 'Oguzhan', 55000 );

select * from personel;

-- ******** BETWEEN Belirtilen 2 sartin ya da veri  gerceklesmesi durumunda listeler *********
-- SELECT --> Where --> between
-- soru5 : id'si 1202 ve 1205 arasinda olan personel bilgilerinin tamamini listeleyiniz
select * from personel  where id  between 1202 and 1205;
select * from personel  where id>= 1202 and id<=1205; -- bu ikiside ayni sonucu verecek

-- soru 6: Ahmet ile Parlak arasindaki tum personel bilgileri
select * from personel where isim between 'Ahmet' and 'Parlak'; -- bu tur durumda alfabetik olarak listeledi

-- soru 7: Fidan ile Oguzhan arasindaki tum personel isim ve maas bilgilerini listele
select isim, maas from personel where isim between 'Fidan' and 'Oguzhan';

-- soru 8: 90000 ile 110000 maas alannlarin isim bilgilerini listele
select isim from personel where maas between 90000 and 110000;

-- ****** "in" Komutu ************* in(v1,v2,v3, ...); bu komutla cagrilmasi istenen ayni sutundaki verileri getirir.
-- soru 9: id'si 1001,1002 ve 1004 olan personel bilgilerini listele
select * from personel where id=1201 or id=1202 or id= 1204;
select * from personel where id in(1201,1202,1204); -- bu iki cevapta soruya dogru cevaptir

-- Soru 10: maasi sadece 70000 ve 105000 olan persenol listesi
select * from personel where maas in(70000, 105000);
select * from personel where maas=70000 or maas=105000; -- iki yontemde olur

-- OR ve AND
select * from personel where maas=70000 or isim='Fidan'; -- Maasi 70000 veya ismi fidan olanlari getir. hangileri varsa
select * from personel where maas=70000 and isim='Ahmet'; -- hem Maasi 70000 olacak hemde ismi ahmet olacak iki sart saglananlari getirecek


-- ******* SELECT ve Like (gibi) ********* orn: a ile baslayan gibi pattern isaretleri kullanilir.
-- % : 0 veya daha fazla karakteri belirtir.
-- _ : tek bir karakteri belirtir.

-- Soru 11 : ismi A harfi ile baslayan personeli listele
select * from personel where isim like 'A%'; -- like 'a&' = yani a ile baslayan tum isimler ==> 1200	Ahmet	70000

-- Soru 12: ismi N harfi ile biten personeli listele
select * from personel where isim like '%n'; -- buyuk kucuk harf farki yok

-- Soru 13: Isminin 2. harfi 'g' olan personeli listele
select * from personel where isim like '_g%'; -- ilk harf ne olursa olsun '_' ikinci harf 'g' geri kalan ne olursa olsun '%'

-- soru 14: isminin ilk harfi T, Son harfi 'N', ucuncu harfi 'h' ve maasi 100000 den fazla olan kisiyi listeleyin
select * from personel where isim like 't%'  and isim like'__h%' and isim like '%n' and maas >=100000;

-- soru 15: isminin 2. harfi e olup diger harflerinde r olan personel
select * from personel where isim like '_e%r%'; -- ikinci harf e ve %arasinda nerede olursa olsun r olan%

-- soru 16: isminde i harfi olmayan personeli listeleyin
select * from personel where isim not like '%i%'; -- herhangi bir yerinde o harfin olmamasi icin not like '%istenmeyen harf%'

-- soru 16: Maasi 6 haneli olan personeli listeleyin
select * from personel where maas like '______'; -- 6 tane alt cizgi yaptik

-- soru 17: 2. harfi A ve 5. harfi A olan personeli listeleyin
select * from personel where isim like '_a%' and isim like '____a%'; -- ya da alternatif cozum
select * from personel where isim like '_a__a%'; -- ya da alternatif cozum

-- **** CASE SENSITIVE***** 'c' olursa buyuk kucuk harf hassasiyeti vadir, 'i' tam tersi yoktur. default olarak boyledir

CREATE TABLE kelimeler
(
id int UNIQUE, -- ayni rakamlar gelmesin diye Unique kullandik
kelime VARCHAR(50) NOT NULL,
harf_sayisi int
);
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
    
select * from kelimeler;

-- SORU16: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat ederek listeleyiniz
-- VEYA işlemi için | karakteri kullanılır.
select * from kelimeler where regexp_like (kelime, 'ot|at', 'c' ); -- 'ot|at' yazarken aman bosluk birakmayin. 'c' case-sensitive
select * from kelimeler where kelime like '%oT%' or kelime like '%At%'; -- ya da bu sekilde sorgulariz ama case-sensitive olmaz DAHA COK BULUR

-- SORU17: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
select * from kelimeler where regexp_like (kelime, 'ot|at' );
select * from kelimeler where regexp_like (kelime, 'ot|at', 'i' ); -- ikiside ayni sonucu verir.

-- SORU18: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
-- Başlangıcı göstermek için ^ karakteri kullanılır.
select * from kelimeler where kelime like 'ho%' or kelime like 'hi%'; -- ya da
select * from kelimeler where regexp_like (kelime, '^ho|^hi', 'i' ); -- ya da
select * from kelimeler where regexp_like (kelime, '^ho|^hi' );

-- SORU18: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat etmeksizin listeleyeniz.
-- Bitişi göstermek için $ karakteri kullanılır.
select * from kelimeler where regexp_like (kelime, 't$|m$'); 

-- SORU19: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyeniz
select * from kelimeler where regexp_like (kelime, '^h|t$','c'); -- bu tum h ile baslayan t ile bitenleri getirdi ama bize sadece 3 harfli olnalar lazim
select * from kelimeler where regexp_like (kelime, 'h[0-9a-zA-Z]t','c');-- h[]t bu uc harfli bir kelimeyi tanimliyor ama [] bunun icine nelerin gelebilecegi tanimlanmali

-- SORU19A: h ile başlayıp t ile biten 4 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyeniz
select * from kelimeler where regexp_like (kelime, 'h[0-9a-zA-Z][0-9a-zA-Z]t','c'); -- [][] herbiri bir harfi temsil ediyor

-- SORU20: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
select * from kelimeler where regexp_like (kelime, 'h[a|i]t'); -- [a|i] 2. harf icin a yada i olanlari tanimlamak icin boylr yapilir

-- SORU21: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz
select * from kelimeler where regexp_like (kelime, '[a|i|e]');

-- SORU22: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like (kelime, '^a|^s');
select * from kelimeler where regexp_like (kelime, '^[as]'); -- ikiside ayni sonucu verir

-- SORU23: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like (kelime, 'oo');
select * from kelimeler where regexp_like (kelime, '[o][o]');
select * from kelimeler where regexp_like (kelime, '[o]{2}');-- bu uc yontemde olur {3} o harften 3 tane var demek

-- SORU24: içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like (kelime, 'oooo');
select * from kelimeler where regexp_like (kelime, '[o][o][o][o]');
select * from kelimeler where regexp_like (kelime, '[o]{4}'); -- bu uc yontemde ayni sonucu veriyor

-- SORU25: ilk harfi s veya b , 3. harfi l olan ve 5 harfli olan kelimelerin küçük harfe dikkat ederek listeleyiniz.
select * from kelimeler where regexp_like (kelime, '[sb][a-z][a-z][a-z]');


