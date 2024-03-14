select Musteri_ID,Adi,SoyAdi,ToplamTutar,Detay from Siparisler S
inner join Personel P on S.SiparisID = P.SiparisID
inner join Musteri M on M.MusteriID=S.Musteri_ID 
where Musteri_ID<10 order by Adi asc


select SiparisID,detay,TedarikciAdi, TedarikciID from Siparisler S1 cross join Tedarikci C



SELECT MusteriID, Ad, SirketAdi, Adres
FROM     dbo.Musteri
WHERE  (Adres LIKE 'A%')

select UrunAdi,KatagoriAdi, (Urunler.BirimFiyat* StokMiktar)as 'Toplam' from Urunler inner join Stok
on Urunler.UrunlerID=Stok.UrunID inner join Kategori on Urunler.Kategori_ID=Kategori.KatagoriID

select Urunler.UrunlerID,Stok.UrunID, UrunAdi,Stok.MevcutStokMiktari 
from Urunler inner join Stok 
on Urunler.UrunlerID=Stok.UrunID

create view AdresM as
select MusteriID,Ad,Adres from Musteri where Adres like '�%'

select * from AdresM

select UrunAdi,BirimFiyat,T.TedarikciAdi from Urunler U join Tedarikci T on U.UrunlerID=T.UrunID 
where BirimFiyat>(select avg(BirimFiyaT) from Urunler)

create procedure kategoriUrun (@id int) as 
select KatagoriID,UrunlerID,UrunAdi,KatagoriAdi,(Birimfiyat*StokMiktar) as 'Tutar' from Kategori K join Urunler U on
U.Kategori_ID=K.KatagoriID where KatagoriID=@id

A�a��daki kod tan�mlanan procedure �u �a��rmak i�in kullan�l�r.
exec kategoriUrun '5'


select charindex('A',adi), len(Soyadi) from Personel

create function kategoriUrun1() returns table as
return
select KatagoriAdi,Urunadi,(Birimfiyat*StokMiktar) as 'Tutar'from Urunler U join Kategori k on U.Kategori_ID=k.KatagoriID
SELECT * FROM kategoriUrun1();

select * from Urunler

select * from Personel

select * from Marka

select * from Stok



INSERT INTO Stok (StokID, MevcutStokMiktari) VALUES
(1, 100),
(2, 150),
(3, 80),
(4, 200),
(5, 50),
(6, 120),
(7, 90),
(8, 180),
(9, 60),
(10, 220),
(11, 75),
(12, 110),
(13, 130),
(14, 95),
(15, 170),
(16, 40),
(17, 85),
(18, 160),
(19, 105),
(20, 190)



INSERT INTO Musteri (MusteriID, Ad, Soyad, Telefon, SirketAdi, Adres, Eposta) VALUES
(1, 'Ahmet', 'Y�lmaz', '5551234567', 'ABC Ltd. �ti.', '�stanbul', 'ahmet@abc.com'),
(2, 'Ay�e', 'Kaya', '5559876543', 'XYZ A�', 'Ankara', 'ayse@xyz.com'),
(3, 'Mehmet', '�zt�rk', '5552345678', 'MNO Ltd. �ti.', '�zmir', 'mehmet@mno.com'),
(4, 'Zeynep', 'G�ne�', '5558765432', 'PQR Holding', 'Bursa', 'zeynep@pqr.com'),
(5, 'Can', 'Erg�n', '5553456789', 'DEF Ticaret', 'Adana', 'can@def.com'),
(6, 'Seda', 'Bilgin', '5557654321', 'RST Limited', 'Antalya', 'seda@rst.com'),
(7, 'Efe', 'Kara', '5554567890', 'UVW A�', 'Eski�ehir', 'efe@uvw.com'),
(8, 'Deniz', '�zcan', '5556543210', 'GHI Holding', 'Trabzon', 'deniz@ghi.com'),
(9, 'Cemal', 'U�ar', '5557890123', 'JKL Ticaret', 'Gaziantep', 'cemal@jkl.com'),
(10, 'Gamze', 'Kurt', '5552109876', 'STU Ltd. �ti.', 'Diyarbak�r', 'gamze@stu.com'),
(11, 'Okan', 'Ko�', '5554321098', 'LMN Holding', 'Konya', 'okan@lmn.com'),
(12, 'Nalan', '�zt�rk', '5551098765', 'OPQ A�', 'Ad�yaman', 'nalan@opq.com'),
(13, 'Yasin', 'Demir', '5555678901', 'XYZ Ltd. �ti.', 'Samsun', 'yasin@xyz.com'),
(14, 'Asl�', '�elik', '5556789012', 'PQR A�', 'Erzurum', 'asli@pqr.com'),
(15, 'Umut', 'Y�ld�r�m', '5553456789', 'ABC Ticaret', '�orum', 'umut@abc.com'),
(16, 'Sibel', '�ahin', '5552345678', 'DEF Ltd. �ti.', 'Bal�kesir', 'sibel@def.com'),
(17, 'Yavuz', 'Kara', '5559876543', 'RST A�', 'Mersin', 'yavuz@rst.com'),
(18, 'Elif', 'G�ne�', '5558765432', 'GHI Ticaret', 'Edirne', 'elif@ghi.com'),
(19, 'Tolga', '�zcan', '5554567890', 'JKL Ltd. �ti.', 'Zonguldak', 'tolga@jkl.com'),
(20, 'Burcu', 'Ko�', '5557654321', 'STU A�', 'Van', 'burcu@stu.com');



INSERT INTO Siparisler (SiparisID, BirimFiyat, Detay, SiparisTarihi, ToplamTutar, SiparisDurumu, OdemeTuru, Musteri_ID) VALUES
(1, 15.99, '�r�n A ve �r�n B', '2023-01-01', 31.98, 'Haz�rlan�yor', 'Kredi Kart�', 1),
(2, 49.99, '�r�n C', '2023-01-05', 49.99, 'G�nderildi', 'Havale', 3),
(3, 9.95, '�r�n D (x3)', '2023-01-10', 29.85, 'Beklemede', 'Nakit', 5),
(4, 199.99, '�r�n E', '2023-01-15', 199.99, 'Tamamland�', 'Kredi Kart�', 2),
(5, 79.90, '�r�n F (x2)', '2023-01-20', 159.80, 'Beklemede', 'Havale', 4),
(6, 39.95, '�r�n G', '2023-01-25', 39.95, 'Haz�rlan�yor', 'Nakit', 6),
(7, 149.50, '�r�n H (x5)', '2023-02-01', 747.50, 'Tamamland�', 'Kredi Kart�', 7),
(8, 29.99, '�r�n I', '2023-02-05', 29.99, 'G�nderildi', 'Nakit', 9),
(9, 59.99, '�r�n J (x2)', '2023-02-10', 119.98, 'Beklemede', 'Kredi Kart�', 11),
(10, 19.99, '�r�n K', '2023-02-15', 19.99, 'Haz�rlan�yor', 'Havale', 10),
(11, 89.95, '�r�n L (x3)', '2023-02-20', 269.85, 'Beklemede', 'Nakit', 12),
(12, 159.99, '�r�n M', '2023-02-25', 159.99, 'G�nderildi', 'Kredi Kart�', 14),
(13, 45.50, '�r�n N (x4)', '2023-03-01', 182.00, 'Tamamland�', 'Havale', 16),
(14, 34.99, '�r�n O', '2023-03-05', 34.99, 'Haz�rlan�yor', 'Nakit', 18),
(15, 109.99, '�r�n P (x2)', '2023-03-10', 219.98, 'Beklemede', 'Kredi Kart�', 20);

INSERT INTO Marka (MarkaID, MarkaAdi, Ulke) VALUES
(1, 'ABC Marka', 'T�rkiye'),
(2, 'XYZ Electronics', '�in'),
(3, 'GHI Furniture', 'Almanya'),
(4, 'JKL Motors', 'Japonya'),
(5, 'MNO Textiles', 'Hindistan'),
(6, 'PQR Chemicals', 'ABD'),
(7, 'RST Foods', 'Fransa'),
(8, 'STU Electronics', 'G�ney Kore'),
(9, 'UVW Metals', '�ngiltere'),
(10, 'LMN Construction', 'Brezilya'),
(11, 'OPQ Appliances', '�talya'),
(12, 'EFG Appliances', 'Rusya'),
(13, 'HIJ Tools', 'Kanada'),
(14, 'KLM Textiles', 'Avustralya'),
(15, 'NOP Toys', 'Meksika'),
(16, 'QRS Kitchenware', '�spanya'),
(17, 'TUV Mobile', 'Hollanda'),
(18, 'VWX Computers', 'G�rcistan'),
(19, 'YZA Stationery', 'Portekiz'),
(20, 'BCD Hardware', 'Yeni Zelanda');


INSERT INTO Personel(PersonelID, Adi, Soyadi, Telefon, Maas,izingunu,Pozisyon,iseGirisTarihi) VALUES
(1,'Mehmet mert','K�l��arslan','5515654865','25000','30','CEO','2020-01-20'),
(2,'Mustafa','Yurtalan','5473518356','5000','5','Sat�� temsilcisi','2022-05-10'),
(3,'Alp','K�lah��o�lu','5473518345','5500','0','Sat�� temsilcisi','2022-11-10'),
(4,'Furkan','Yurtseven','5394956765','9500','0','Sat�� temsilcisi','2022-11-10'),
(5,'Mira�','x','5468975212','9500','0','Sat�� temsilcisi','2022-11-10');





INSERT INTO Kategori (KatagoriID, KatagoriAdi, Aciklama) VALUES
(1, 'Boya', 'Ev ve end�striyel boyalar i�in kategori'),
(2, 'Banyo', 'Banyo malzemeleri ve ekipmanlar� i�in kategori'),
(3, 'H�rdavat', 'H�rdavat malzemeleri ve aletleri i�in kategori'),
(4, 'Elektrik', 'Elektrik malzemeleri ve ekipmanlar� i�in kategori'),
(5, 'Tesisat', 'Su ve �s� tesisat� malzemeleri i�in kategori'),
(6, 'Yap� Kimyasallar�', '�n�aat ve yap� kimyasallar� i�in kategori'),
(7, '�n�aat', '�n�aat malzemeleri ve ekipmanlar� i�in kategori'),
(8, 'Bah�e', 'Bah�e d�zenleme ve bak�m �r�nleri i�in kategori');

INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Kap� Boyas� KX-500', 45.99, 80, 'Ah�ap kap�lar i�in �zel boyama', 1, 1),
('Tavan Boyas� TY-700', 29.99, 120, 'Tavanlar i�in beyaz renk boya', 1, 1),
('Sel�lozik Boya SX-200', 55.99, 50, 'Sel�lozik y�zeyler i�in profesyonel boya', 1, 2),
('End�striyel Metal Boya EM-100', 69.99, 40, 'Metal y�zeylerde kullan�lmak �zere end�striyel boya', 1, 3),
('Boya Tiner BT-300', 12.99, 200, 'Boya inceltici ve temizleyici', 1, 1),
('Ahsap Koruyucu Cila AC-800', 34.99, 60, 'Ah�ap y�zeyler i�in koruyucu cila', 1, 2),
('Su Bazl� Tavan Boyas� ST-200', 27.99, 90, 'Su bazl� tavan boyas�', 1, 1),
('Epoksi Zemin Kaplama EZ-400', 89.99, 30, 'End�striyel zeminler i�in epoksi kaplama', 1, 3),
('Otomotiv Boya OB-600', 49.99, 45, 'Ara�lar i�in �zel otomotiv boya', 1, 4),
('Cam Boya CB-100', 19.99, 100, 'Cam y�zeyler i�in renkli boya', 1, 2);

-- Yeni banyo �r�nlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Banyo Dolap Seti BD-1000', 249.99, 20, 'Modern banyo dolab� seti', 2, 1),
('Du� Ba�l��� DB-200', 39.99, 50, 'Ya�mur efektiyle modern du� ba�l���', 2, 2),
('Banyo Havluluk BH-300', 19.99, 80, 'Duvara monte banyo havlu ask�s�', 2, 3),
('Cam Du�a Kabin CK-400', 599.99, 10, '�effaf cam du�a kabin', 2, 4),
('Seramik Banyo Lavabo SL-500', 129.99, 30, 'Modern seramik banyo lavabo', 2, 5),
('Banyo Ayak Paspas� BA-600', 9.99, 100, 'Kaymaz banyo ayak paspas�', 2, 6),
('S�v� Sabunluk SS-700', 12.99, 150, 'Banyo lavabosu i�in s�v� sabunluk', 2, 7),
('Banyo Perdesi BP-800', 29.99, 70, 'Renkli desenli banyo perdesi', 2, 8),
('Ayna LED Ayd�nlatmal� AL-900', 79.99, 40, 'LED ���kl� banyo aynas�', 2, 9),
('Banyo Havlu Seti BHS-1000', 49.99, 60, 'Kaliteli banyo havlu seti', 2, 10);

-- Yeni h�rdavat �r�nlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Vida Seti VS-100', 14.99, 200, '�e�itli boy ve tiplerde vida seti', 3, 1),
('�eki� CH-200', 29.99, 100, 'Ah�ap ve metal i�leri i�in �eki�', 3, 2),
('Matkap Ucu Seti MUS-300', 24.99, 150, 'Farkl� boy ve tiplerde matkap ucu seti', 3, 3),
('Testere TS-400', 34.99, 80, 'Ah�ap ve metal kesimleri i�in testere', 3, 4),
('�elik Mengene CM-500', 49.99, 50, 'Ah�ap ve metal i�leri i�in �elik mengene', 3, 5),
('�l��m �eridi OS-600', 9.99, 300, '�l��mler i�in uzun �l��m �eridi', 3, 6),
('Ta�lama Makinesi TM-700', 89.99, 30, 'Metal y�zeyleri ta�lamak i�in makine', 3, 7),
('Pense Seti PS-800', 19.99, 120, 'Farkl� boy ve tiplerde pense seti', 3, 8),
('C�vata Seti CS-900', 12.99, 250, '�e�itli boy ve tiplerde c�vata seti', 3, 9),
('Tornavida TSV-1000', 7.99, 200, 'Farkl� u� tiplerine sahip tornavida seti', 3, 10);

INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Ayd�nlatma Led Ampul ALA-100', 12.99, 150, 'Enerji tasarruflu LED ampul', 4, 1),
('Priz ve Anahtar Seti PAS-200', 34.99, 80, 'Duvar prizi ve anahtar seti', 4, 2),
('G�� �eridi GS-300', 19.99, 120, '�oklu prizli g�� �eridi', 4, 3),
('Kablo Organizat�r KO-400', 9.99, 200, 'Kablo d�zenleyici set', 4, 4),
('Ak�ll� Priz AP-500', 49.99, 50, 'Wi-Fi ile kontrol edilebilen ak�ll� priz', 4, 5),
('Elektrikli Is�t�c� EI-600', 79.99, 30, 'Ta��nabilir elektrikli �s�t�c�', 4, 6),
('Kesintisiz G�� Kayna�� KGS-700', 199.99, 15, 'Kesintisiz g�� kayna��', 4, 7),
('G�ne� Enerjili Lamba GEL-800', 44.99, 60, 'G�ne� enerjisiyle �al��an bah�e lambas�', 4, 8),
('Ak�ll� Ev Kontrol Sistemi AKS-900', 299.99, 10, 'Wi-Fi ile ba�lanabilen ak�ll� ev kontrol sistemi', 4, 9),
('Elektrikli Tornavida ET-1000', 39.99, 40, 'Elektrikli �arjl� tornavida', 4, 10);

INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Sifon ve Lavabo Tak�m� SLT-200', 24.99, 120, 'Lavabo i�in sifon tak�m�', 5, 2),
('Musluk MK-300', 39.99, 80, 'Banyo veya mutfak muslu�u', 5, 3),
('Pompa P-400', 79.99, 50, 'S�v� transferi i�in su pompas�', 5, 4),
('Radyat�r RT-500', 89.99, 40, 'Is�tma sistemleri i�in panel radyat�r', 5, 5),
('Filtre ve Su Ar�tma Sistemi FAS-600', 149.99, 30, 'Su ar�tma filtresi ve sistem', 5, 6),
('Tesisat Conta Seti TCS-700', 14.99, 200, '�e�itli boy ve tiplerde conta seti', 5, 7),
('S�zd�rmazl�k Band� SB-800', 9.99, 250, 'Su s�z�nt�lar� i�in bant', 5, 8),
('Pis Su Tahliye Hortumu PTH-900', 7.99, 300, 'Pis su tahliyesi i�in esnek hortum', 5, 9),
('Su Sayac� SS-1000', 29.99, 60, 'Evlerde su t�ketimini �l�en saya�', 5, 10);

 --Yeni yap� kimyasallar� �r�nlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('�imento Katk� CEMK-100', 14.99, 200, '�imento kar���mlar�na katk� malzemesi', 6, 1),
('Su �zolasyon Malzemesi SIM-200', 29.99, 150, 'Y�zeylere su izolasyonu i�in malzeme', 6, 2),
('Epoksi Yap��t�r�c� EPOY-300', 44.99, 120, 'Ah�ap, metal ve seramik yap��t�r�c�', 6, 3),
('Yap� Yal�t�m K�p��� YK-400', 19.99, 180, 'Duvar yal�t�m� i�in k�p�k', 6, 4),
('Astar ve Primer AP-500', 9.99, 250, 'Y�zeylere astar ve primer uygulamas�', 6, 5),
('Kimyasal Ankraj Sistemi KAS-600', 49.99, 80, 'Beton ve duvar sabitleme i�in sistem', 6, 6),
('Kaplama ve Zemin Koruyucu KZK-700', 34.99, 100, 'Zemin ve kaplamalar� koruyucu malzeme', 6, 7),
('Kimyasal Enjeksiyon KE-800', 64.99, 60, '�atlaklar� doldurmak i�in enjeksiyon malzemesi', 6, 8),
('Ayarlanabilir Har� AH-900', 22.99, 130, 'Seramik ve ta� kaplamalar i�in ayarlanabilir har�', 6, 9),
('Yap��t�rma ve Tamirat Seti YTS-1000', 39.99, 90, '�e�itli y�zeylerde kullan�labilen tamirat seti', 6, 10);

-- Yeni in�aat �r�nlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('�elik �skele CI-100', 299.99, 30, '�n�aat alan�nda kullan�lan �elik iskele', 7, 1),
('Tu�la ve Blok TB-200', 1.99, 1000, '�n�aat duvarlar� i�in tu�la ve blok', 7, 2),
('Betopan BP-300', 19.99, 200, '�n�aat i�in yal�t�m panelleri', 7, 3),
('�at� Kaplama Malzemesi CKM-400', 49.99, 50, '�at� kaplama malzemesi', 7, 4),
('Al��pan AP-500', 9.99, 300, 'Duvar kaplama ve tavan uygulamalar� i�in al��pan', 7, 5),
('�n�aat Makas� IM-600', 149.99, 20, '�n�aat alan�nda kullan�lan kesme makas�', 7, 6),
('�zolasyon Malzemesi IZM-700', 29.99, 150, '�zolasyon i�in kullan�lan malzeme', 7, 7),
('Kiremit KK-800', 1.49, 5000, '�at� kaplama i�in kiremit', 7, 8),
('�n�aat Tel �iti ITC-900', 7.99, 400, '�n�aat alan�n� �evrelemek i�in tel �it', 7, 9),
('Haz�r Beton HB-1000', 79.99, 80, '�n�aat projeleri i�in haz�r beton', 7, 10);

-- Yeni ev �r�nlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Yatak Odas� Tak�m� YT-1000', 1499.99, 10, 'Modern tasar�ml� yatak odas� tak�m�', 8, 1),
('Kanepe ve Sehpa Seti KSS-200', 799.99, 15, 'Rahat kanepe ve sehpa seti', 8, 2),
('Yemek Masas� ve Sandalye Seti YMS-300', 599.99, 20, '��k yemek masas� ve sandalye seti', 8, 3),
('Dolap ve Raf Sistemi DRS-400', 399.99, 25, '�e�itli b�lmeli dolap ve raf sistemi', 8, 4),
('TV �nitesi TU-500', 299.99, 30, 'Modern tasar�ml� TV �nitesi', 8, 5),
('Kitapl�k KB-600', 149.99, 40, 'Duvara monte edilebilen kitapl�k', 8, 6),
('Mutfak Masas� ve Sandalye Seti MSS-700', 449.99, 18, '��k mutfak masas� ve sandalye seti', 8, 7),
('Ayna ve Komodin Seti AKS-800', 199.99, 12, 'Yatak odas� i�in ayna ve komodin seti', 8, 8),
('Dekoratif Lamba DL-900', 79.99, 22, 'Ev dekorasyonu i�in dekoratif lamba', 8, 9),
('Hal� ve Kilim Seti HKS-1000', 129.99, 35, 'Ev i�i zemin kaplamas� i�in hal� ve kilim seti', 8, 10);

-- Yeni k�rtasiye �r�nlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Kur�un Kalem Seti KK-100', 4.99, 100, 'Renkli kur�un kalem seti', 9, 1),
('Defter DN-200', 7.99, 80, '�izgili defter', 9, 2),
('Kalem Kutusu KK-300', 2.99, 150, 'Plastik kalem kutusu', 9, 3),
('Not Defteri ND-400', 5.99, 120, 'K���k not defteri', 9, 4),
('Silgi SL-500', 1.99, 200, 'Renkli silgi seti', 9, 5),
('Cetvel CR-600', 3.99, 100, '30 cm cetvel', 9, 6),
('Masa Lambas� ML-700', 12.99, 50, 'LED masa lambas�', 9, 7),
('Kur�un Kalem A�aca�� KA-800', 1.49, 180, 'Elmas u�lu kalem a�aca��', 9, 8),
('Bant Kesici BK-900', 2.49, 120, '�effaf bant kesici', 9, 9),
('Yap��t�r�c� YP-1000', 4.49, 90, 'S�v� yap��t�r�c�', 9, 10);

-- Yeni bah�e �r�nlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Bah�e �it BC-100', 24.99, 50, 'Bah�enizi �evrelemek i�in �it', 10, 1),
('Bah�e Mobilya Seti BMS-200', 349.99, 10, 'Bah�e oturma grubu', 10, 2),
('Bah�e Sulama Hortumu BSH-300', 14.99, 100, 'Bah�e sulama i�in uzun hortum', 10, 3),
('Bah�e Ayd�nlatma Seti BAS-400', 69.99, 30, 'G�ne� enerjili bah�e lambalar�', 10, 4),
('Bah�e Makas Seti BMS-500', 19.99, 80, 'Bah�e bak�m� i�in makas seti', 10, 5),
('Bah�e �emsiye BS-600', 29.99, 40, 'Bah�e masa �emsiyesi', 10, 6),
('Bah�e Tohum Seti BTS-700', 9.99, 150, 'Farkl� �i�ek tohumlar� i�eren set', 10, 7),
('Bah�e Dekoratif Ta� BDT-800', 5.99, 200, 'Bah�e dekorasyonu i�in ta�', 10, 8),
('Bah�e Makine Seti BMS-900', 199.99, 15, 'Bah�e bak�m makineleri seti', 10, 9),
('Bah�e Havuz BH-1000', 499.99, 5, 'Bah�e i�in k���k dekoratif havuz', 10, 10);

INSERT INTO Tedarikci (TedarikciID, Adres, Eposta, Telefon, TedarikciAdi)
VALUES
(1, '�stanbul', 'mehmet@example.com', '1234567890', 'Jmehmet �z'),
(2, 'Ankara', 'mert@example.com', '0987654321', 'mert simit'),
(3, '�zmir', 'ali@example.com', '5554443333', 'ali al'),
(4, 'Bursa', 'fatih@example.com', '7778889999', 'fatih terim'),
(5, 'Antalya', 'h�seyin@example.com', '1112223334', 'h�seyin kel'),
(6, 'Adana', 'mustafa@example.com', '9998887776', 'mustfa bat�'),
(7, 'Trabzon', 'hasan@example.com', '4445556667', 'hasan kara'),
(8, 'Eski�ehir', 'hasanK@example.com', '2223334448', 'hasan ak'),
(9, 'Gaziantep', 'zeynep@example.com', '6667778889', 'zeynep g�k'),
(10, 'Konya', 'ece@example.com', '3332221110', 'ece tok');

INSERT INTO KargoFirmalari (FirmaID, FirmaAdi, Telefon, OdemeTarihi, SevkTarihi, IslemUcreti)
VALUES
(1, 'ExpressCargo', '1234567890', '2023-11-28', '2023-12-05', 250.00),
(2, 'SpeedyDelivery', '0987654321', '2023-11-27', '2023-12-03', 300.00),
(3, 'GlobalShippers', '5554443333', '2023-11-26', '2023-12-04', 200.00),
(4, 'SwiftFreight', '7778889999', '2023-11-25', '2023-12-02', 280.00),
(5, 'RapidTransit', '1112223334', '2023-11-24', '2023-12-01', 320.00),
(6, 'ZoomLogistics', '9998887776', '2023-11-23', '2023-11-30', 270.00),
(7, 'QuickShip', '4445556667', '2023-11-22', '2023-11-29', 290.00),
(8, 'FastTrack', '2223334448', '2023-11-21', '2023-11-28', 310.00),
(9, 'SwiftCargo', '6667778889', '2023-11-20', '2023-11-27', 260.00),
(10, 'ExpressDelivery', '3332221110', '2023-11-19', '2023-11-26', 280.00);

-- Yeni sipari�leri ekleyin
INSERT INTO Siparisler (birimFiyat, Detay, SiparisTarihi, ToplamTutar, SiparisDurumu, OdemeTuru, Musteri_ID) VALUES
(19.99, 'Bah�e �it ve Bah�e Mobilya Seti', '2023-11-25', 249.98, 'Haz�rlan�yor', 'Kredi Kart�', 1),
(34.99, 'Priz ve Anahtar Seti', '2023-11-26', 104.97, 'G�nderildi', 'Nakit', 3),
(44.99, 'Ak�ll� Priz ve Elektrikli Is�t�c�', '2023-11-27', 89.98, 'Tamamland�', 'Havale', 2),
(299.99, 'Ak�ll� Ev Kontrol Sistemi', '2023-11-28', 299.99, 'Haz�rlan�yor', 'Kredi Kart�', 4),
(149.99, '�elik �skele', '2023-11-29', 599.96, 'G�nderildi', 'Kap�da �deme', 5),
(799.99, 'Yatak Odas� Tak�m� ve Mutfak Masas� Seti', '2023-11-30', 1599.98, 'Tamamland�', 'Havale', 6),
(4.99, 'Kur�un Kalem Seti', '2023-12-01', 49.90, 'Haz�rlan�yor', 'Kredi Kart�', 7),
(49.99, 'Bah�e Ayd�nlatma Seti', '2023-12-02', 149.97, 'G�nderildi', 'Nakit', 8),
(399.99, 'Dolap ve Raf Sistemi', '2023-12-03', 799.98, 'Tamamland�', 'Kap�da �deme', 9),
(14.99, 'Bah�e Sulama Hortumu', '2023-12-04', 44.97, 'Haz�rlan�yor', 'Kredi Kart�', 10),
(14.99, 'Bah�e Sulama Hortumu', '2023-12-04', 44.97, 'Haz�rlan�yor', 'Kredi Kart�', 10),
(14.99, 'Bah�e Sulama Hortumu', '2023-12-04', 44.97, 'Haz�rlan�yor', 'Kredi Kart�', 10),
(19.99, 'Bah�e �i�ek Tohumlar�', '2023-12-05', 39.98, 'G�nderildi', 'Havale', 11),
(9.99, 'Bah�e Makas�', '2023-12-06', 29.97, 'Onayland�', 'Nakit', 12),
(24.99, 'Bah�e Ayakkab�s�', '2023-12-07', 74.97, 'Teslim Edildi', 'Kredi Kart�', 13),
(34.99, 'Bah�e Saks�s� Seti', '2023-12-08', 104.97, 'Haz�rlan�yor', 'Havale', 14),
(12.99, 'Bah�e Dekoratif Lamba', '2023-12-09', 38.97, 'G�nderildi', 'Nakit', 15),
(39.99, 'Bah�e Oturma Grubu', '2023-12-10', 119.97, 'Onayland�', 'Kredi Kart�', 16),
(17.99, 'Bah�e Sulama Kovalar�', '2023-12-11', 53.97, 'Teslim Edildi', 'Havale', 17),
(29.99, 'Bah�e Duvar S�s�', '2023-12-12', 89.97, 'Haz�rlan�yor', 'Nakit', 18),
(22.99, 'Bah�e Ta�lar� Seti', '2023-12-13', 68.97, 'G�nderildi', 'Kredi Kart�', 19);








