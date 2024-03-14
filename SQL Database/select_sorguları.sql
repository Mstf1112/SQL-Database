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
select MusteriID,Ad,Adres from Musteri where Adres like 'Ý%'

select * from AdresM

select UrunAdi,BirimFiyat,T.TedarikciAdi from Urunler U join Tedarikci T on U.UrunlerID=T.UrunID 
where BirimFiyat>(select avg(BirimFiyaT) from Urunler)

create procedure kategoriUrun (@id int) as 
select KatagoriID,UrunlerID,UrunAdi,KatagoriAdi,(Birimfiyat*StokMiktar) as 'Tutar' from Kategori K join Urunler U on
U.Kategori_ID=K.KatagoriID where KatagoriID=@id

Aþaðýdaki kod tanýmlanan procedure ‘u çaðýrmak için kullanýlýr.
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
(1, 'Ahmet', 'Yýlmaz', '5551234567', 'ABC Ltd. Þti.', 'Ýstanbul', 'ahmet@abc.com'),
(2, 'Ayþe', 'Kaya', '5559876543', 'XYZ AÞ', 'Ankara', 'ayse@xyz.com'),
(3, 'Mehmet', 'Öztürk', '5552345678', 'MNO Ltd. Þti.', 'Ýzmir', 'mehmet@mno.com'),
(4, 'Zeynep', 'Güneþ', '5558765432', 'PQR Holding', 'Bursa', 'zeynep@pqr.com'),
(5, 'Can', 'Ergün', '5553456789', 'DEF Ticaret', 'Adana', 'can@def.com'),
(6, 'Seda', 'Bilgin', '5557654321', 'RST Limited', 'Antalya', 'seda@rst.com'),
(7, 'Efe', 'Kara', '5554567890', 'UVW AÞ', 'Eskiþehir', 'efe@uvw.com'),
(8, 'Deniz', 'Özcan', '5556543210', 'GHI Holding', 'Trabzon', 'deniz@ghi.com'),
(9, 'Cemal', 'Uçar', '5557890123', 'JKL Ticaret', 'Gaziantep', 'cemal@jkl.com'),
(10, 'Gamze', 'Kurt', '5552109876', 'STU Ltd. Þti.', 'Diyarbakýr', 'gamze@stu.com'),
(11, 'Okan', 'Koç', '5554321098', 'LMN Holding', 'Konya', 'okan@lmn.com'),
(12, 'Nalan', 'Öztürk', '5551098765', 'OPQ AÞ', 'Adýyaman', 'nalan@opq.com'),
(13, 'Yasin', 'Demir', '5555678901', 'XYZ Ltd. Þti.', 'Samsun', 'yasin@xyz.com'),
(14, 'Aslý', 'Çelik', '5556789012', 'PQR AÞ', 'Erzurum', 'asli@pqr.com'),
(15, 'Umut', 'Yýldýrým', '5553456789', 'ABC Ticaret', 'Çorum', 'umut@abc.com'),
(16, 'Sibel', 'Þahin', '5552345678', 'DEF Ltd. Þti.', 'Balýkesir', 'sibel@def.com'),
(17, 'Yavuz', 'Kara', '5559876543', 'RST AÞ', 'Mersin', 'yavuz@rst.com'),
(18, 'Elif', 'Güneþ', '5558765432', 'GHI Ticaret', 'Edirne', 'elif@ghi.com'),
(19, 'Tolga', 'Özcan', '5554567890', 'JKL Ltd. Þti.', 'Zonguldak', 'tolga@jkl.com'),
(20, 'Burcu', 'Koç', '5557654321', 'STU AÞ', 'Van', 'burcu@stu.com');



INSERT INTO Siparisler (SiparisID, BirimFiyat, Detay, SiparisTarihi, ToplamTutar, SiparisDurumu, OdemeTuru, Musteri_ID) VALUES
(1, 15.99, 'Ürün A ve Ürün B', '2023-01-01', 31.98, 'Hazýrlanýyor', 'Kredi Kartý', 1),
(2, 49.99, 'Ürün C', '2023-01-05', 49.99, 'Gönderildi', 'Havale', 3),
(3, 9.95, 'Ürün D (x3)', '2023-01-10', 29.85, 'Beklemede', 'Nakit', 5),
(4, 199.99, 'Ürün E', '2023-01-15', 199.99, 'Tamamlandý', 'Kredi Kartý', 2),
(5, 79.90, 'Ürün F (x2)', '2023-01-20', 159.80, 'Beklemede', 'Havale', 4),
(6, 39.95, 'Ürün G', '2023-01-25', 39.95, 'Hazýrlanýyor', 'Nakit', 6),
(7, 149.50, 'Ürün H (x5)', '2023-02-01', 747.50, 'Tamamlandý', 'Kredi Kartý', 7),
(8, 29.99, 'Ürün I', '2023-02-05', 29.99, 'Gönderildi', 'Nakit', 9),
(9, 59.99, 'Ürün J (x2)', '2023-02-10', 119.98, 'Beklemede', 'Kredi Kartý', 11),
(10, 19.99, 'Ürün K', '2023-02-15', 19.99, 'Hazýrlanýyor', 'Havale', 10),
(11, 89.95, 'Ürün L (x3)', '2023-02-20', 269.85, 'Beklemede', 'Nakit', 12),
(12, 159.99, 'Ürün M', '2023-02-25', 159.99, 'Gönderildi', 'Kredi Kartý', 14),
(13, 45.50, 'Ürün N (x4)', '2023-03-01', 182.00, 'Tamamlandý', 'Havale', 16),
(14, 34.99, 'Ürün O', '2023-03-05', 34.99, 'Hazýrlanýyor', 'Nakit', 18),
(15, 109.99, 'Ürün P (x2)', '2023-03-10', 219.98, 'Beklemede', 'Kredi Kartý', 20);

INSERT INTO Marka (MarkaID, MarkaAdi, Ulke) VALUES
(1, 'ABC Marka', 'Türkiye'),
(2, 'XYZ Electronics', 'Çin'),
(3, 'GHI Furniture', 'Almanya'),
(4, 'JKL Motors', 'Japonya'),
(5, 'MNO Textiles', 'Hindistan'),
(6, 'PQR Chemicals', 'ABD'),
(7, 'RST Foods', 'Fransa'),
(8, 'STU Electronics', 'Güney Kore'),
(9, 'UVW Metals', 'Ýngiltere'),
(10, 'LMN Construction', 'Brezilya'),
(11, 'OPQ Appliances', 'Ýtalya'),
(12, 'EFG Appliances', 'Rusya'),
(13, 'HIJ Tools', 'Kanada'),
(14, 'KLM Textiles', 'Avustralya'),
(15, 'NOP Toys', 'Meksika'),
(16, 'QRS Kitchenware', 'Ýspanya'),
(17, 'TUV Mobile', 'Hollanda'),
(18, 'VWX Computers', 'Gürcistan'),
(19, 'YZA Stationery', 'Portekiz'),
(20, 'BCD Hardware', 'Yeni Zelanda');


INSERT INTO Personel(PersonelID, Adi, Soyadi, Telefon, Maas,izingunu,Pozisyon,iseGirisTarihi) VALUES
(1,'Mehmet mert','Kýlýçarslan','5515654865','25000','30','CEO','2020-01-20'),
(2,'Mustafa','Yurtalan','5473518356','5000','5','Satýþ temsilcisi','2022-05-10'),
(3,'Alp','Külahçýoðlu','5473518345','5500','0','Satýþ temsilcisi','2022-11-10'),
(4,'Furkan','Yurtseven','5394956765','9500','0','Satýþ temsilcisi','2022-11-10'),
(5,'Miraç','x','5468975212','9500','0','Satýþ temsilcisi','2022-11-10');





INSERT INTO Kategori (KatagoriID, KatagoriAdi, Aciklama) VALUES
(1, 'Boya', 'Ev ve endüstriyel boyalar için kategori'),
(2, 'Banyo', 'Banyo malzemeleri ve ekipmanlarý için kategori'),
(3, 'Hýrdavat', 'Hýrdavat malzemeleri ve aletleri için kategori'),
(4, 'Elektrik', 'Elektrik malzemeleri ve ekipmanlarý için kategori'),
(5, 'Tesisat', 'Su ve ýsý tesisatý malzemeleri için kategori'),
(6, 'Yapý Kimyasallarý', 'Ýnþaat ve yapý kimyasallarý için kategori'),
(7, 'Ýnþaat', 'Ýnþaat malzemeleri ve ekipmanlarý için kategori'),
(8, 'Bahçe', 'Bahçe düzenleme ve bakým ürünleri için kategori');

INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Kapý Boyasý KX-500', 45.99, 80, 'Ahþap kapýlar için özel boyama', 1, 1),
('Tavan Boyasý TY-700', 29.99, 120, 'Tavanlar için beyaz renk boya', 1, 1),
('Selülozik Boya SX-200', 55.99, 50, 'Selülozik yüzeyler için profesyonel boya', 1, 2),
('Endüstriyel Metal Boya EM-100', 69.99, 40, 'Metal yüzeylerde kullanýlmak üzere endüstriyel boya', 1, 3),
('Boya Tiner BT-300', 12.99, 200, 'Boya inceltici ve temizleyici', 1, 1),
('Ahsap Koruyucu Cila AC-800', 34.99, 60, 'Ahþap yüzeyler için koruyucu cila', 1, 2),
('Su Bazlý Tavan Boyasý ST-200', 27.99, 90, 'Su bazlý tavan boyasý', 1, 1),
('Epoksi Zemin Kaplama EZ-400', 89.99, 30, 'Endüstriyel zeminler için epoksi kaplama', 1, 3),
('Otomotiv Boya OB-600', 49.99, 45, 'Araçlar için özel otomotiv boya', 1, 4),
('Cam Boya CB-100', 19.99, 100, 'Cam yüzeyler için renkli boya', 1, 2);

-- Yeni banyo ürünlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Banyo Dolap Seti BD-1000', 249.99, 20, 'Modern banyo dolabý seti', 2, 1),
('Duþ Baþlýðý DB-200', 39.99, 50, 'Yaðmur efektiyle modern duþ baþlýðý', 2, 2),
('Banyo Havluluk BH-300', 19.99, 80, 'Duvara monte banyo havlu askýsý', 2, 3),
('Cam Duþa Kabin CK-400', 599.99, 10, 'Þeffaf cam duþa kabin', 2, 4),
('Seramik Banyo Lavabo SL-500', 129.99, 30, 'Modern seramik banyo lavabo', 2, 5),
('Banyo Ayak Paspasý BA-600', 9.99, 100, 'Kaymaz banyo ayak paspasý', 2, 6),
('Sývý Sabunluk SS-700', 12.99, 150, 'Banyo lavabosu için sývý sabunluk', 2, 7),
('Banyo Perdesi BP-800', 29.99, 70, 'Renkli desenli banyo perdesi', 2, 8),
('Ayna LED Aydýnlatmalý AL-900', 79.99, 40, 'LED ýþýklý banyo aynasý', 2, 9),
('Banyo Havlu Seti BHS-1000', 49.99, 60, 'Kaliteli banyo havlu seti', 2, 10);

-- Yeni hýrdavat ürünlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Vida Seti VS-100', 14.99, 200, 'Çeþitli boy ve tiplerde vida seti', 3, 1),
('Çekiç CH-200', 29.99, 100, 'Ahþap ve metal iþleri için çekiç', 3, 2),
('Matkap Ucu Seti MUS-300', 24.99, 150, 'Farklý boy ve tiplerde matkap ucu seti', 3, 3),
('Testere TS-400', 34.99, 80, 'Ahþap ve metal kesimleri için testere', 3, 4),
('Çelik Mengene CM-500', 49.99, 50, 'Ahþap ve metal iþleri için çelik mengene', 3, 5),
('Ölçüm Þeridi OS-600', 9.99, 300, 'Ölçümler için uzun ölçüm þeridi', 3, 6),
('Taþlama Makinesi TM-700', 89.99, 30, 'Metal yüzeyleri taþlamak için makine', 3, 7),
('Pense Seti PS-800', 19.99, 120, 'Farklý boy ve tiplerde pense seti', 3, 8),
('Cývata Seti CS-900', 12.99, 250, 'Çeþitli boy ve tiplerde cývata seti', 3, 9),
('Tornavida TSV-1000', 7.99, 200, 'Farklý uç tiplerine sahip tornavida seti', 3, 10);

INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Aydýnlatma Led Ampul ALA-100', 12.99, 150, 'Enerji tasarruflu LED ampul', 4, 1),
('Priz ve Anahtar Seti PAS-200', 34.99, 80, 'Duvar prizi ve anahtar seti', 4, 2),
('Güç Þeridi GS-300', 19.99, 120, 'Çoklu prizli güç þeridi', 4, 3),
('Kablo Organizatör KO-400', 9.99, 200, 'Kablo düzenleyici set', 4, 4),
('Akýllý Priz AP-500', 49.99, 50, 'Wi-Fi ile kontrol edilebilen akýllý priz', 4, 5),
('Elektrikli Isýtýcý EI-600', 79.99, 30, 'Taþýnabilir elektrikli ýsýtýcý', 4, 6),
('Kesintisiz Güç Kaynaðý KGS-700', 199.99, 15, 'Kesintisiz güç kaynaðý', 4, 7),
('Güneþ Enerjili Lamba GEL-800', 44.99, 60, 'Güneþ enerjisiyle çalýþan bahçe lambasý', 4, 8),
('Akýllý Ev Kontrol Sistemi AKS-900', 299.99, 10, 'Wi-Fi ile baðlanabilen akýllý ev kontrol sistemi', 4, 9),
('Elektrikli Tornavida ET-1000', 39.99, 40, 'Elektrikli þarjlý tornavida', 4, 10);

INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Sifon ve Lavabo Takýmý SLT-200', 24.99, 120, 'Lavabo için sifon takýmý', 5, 2),
('Musluk MK-300', 39.99, 80, 'Banyo veya mutfak musluðu', 5, 3),
('Pompa P-400', 79.99, 50, 'Sývý transferi için su pompasý', 5, 4),
('Radyatör RT-500', 89.99, 40, 'Isýtma sistemleri için panel radyatör', 5, 5),
('Filtre ve Su Arýtma Sistemi FAS-600', 149.99, 30, 'Su arýtma filtresi ve sistem', 5, 6),
('Tesisat Conta Seti TCS-700', 14.99, 200, 'Çeþitli boy ve tiplerde conta seti', 5, 7),
('Sýzdýrmazlýk Bandý SB-800', 9.99, 250, 'Su sýzýntýlarý için bant', 5, 8),
('Pis Su Tahliye Hortumu PTH-900', 7.99, 300, 'Pis su tahliyesi için esnek hortum', 5, 9),
('Su Sayacý SS-1000', 29.99, 60, 'Evlerde su tüketimini ölçen sayaç', 5, 10);

 --Yeni yapý kimyasallarý ürünlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Çimento Katký CEMK-100', 14.99, 200, 'Çimento karýþýmlarýna katký malzemesi', 6, 1),
('Su Ýzolasyon Malzemesi SIM-200', 29.99, 150, 'Yüzeylere su izolasyonu için malzeme', 6, 2),
('Epoksi Yapýþtýrýcý EPOY-300', 44.99, 120, 'Ahþap, metal ve seramik yapýþtýrýcý', 6, 3),
('Yapý Yalýtým Köpüðü YK-400', 19.99, 180, 'Duvar yalýtýmý için köpük', 6, 4),
('Astar ve Primer AP-500', 9.99, 250, 'Yüzeylere astar ve primer uygulamasý', 6, 5),
('Kimyasal Ankraj Sistemi KAS-600', 49.99, 80, 'Beton ve duvar sabitleme için sistem', 6, 6),
('Kaplama ve Zemin Koruyucu KZK-700', 34.99, 100, 'Zemin ve kaplamalarý koruyucu malzeme', 6, 7),
('Kimyasal Enjeksiyon KE-800', 64.99, 60, 'Çatlaklarý doldurmak için enjeksiyon malzemesi', 6, 8),
('Ayarlanabilir Harç AH-900', 22.99, 130, 'Seramik ve taþ kaplamalar için ayarlanabilir harç', 6, 9),
('Yapýþtýrma ve Tamirat Seti YTS-1000', 39.99, 90, 'Çeþitli yüzeylerde kullanýlabilen tamirat seti', 6, 10);

-- Yeni inþaat ürünlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Çelik Ýskele CI-100', 299.99, 30, 'Ýnþaat alanýnda kullanýlan çelik iskele', 7, 1),
('Tuðla ve Blok TB-200', 1.99, 1000, 'Ýnþaat duvarlarý için tuðla ve blok', 7, 2),
('Betopan BP-300', 19.99, 200, 'Ýnþaat için yalýtým panelleri', 7, 3),
('Çatý Kaplama Malzemesi CKM-400', 49.99, 50, 'Çatý kaplama malzemesi', 7, 4),
('Alçýpan AP-500', 9.99, 300, 'Duvar kaplama ve tavan uygulamalarý için alçýpan', 7, 5),
('Ýnþaat Makasý IM-600', 149.99, 20, 'Ýnþaat alanýnda kullanýlan kesme makasý', 7, 6),
('Ýzolasyon Malzemesi IZM-700', 29.99, 150, 'Ýzolasyon için kullanýlan malzeme', 7, 7),
('Kiremit KK-800', 1.49, 5000, 'Çatý kaplama için kiremit', 7, 8),
('Ýnþaat Tel Çiti ITC-900', 7.99, 400, 'Ýnþaat alanýný çevrelemek için tel çit', 7, 9),
('Hazýr Beton HB-1000', 79.99, 80, 'Ýnþaat projeleri için hazýr beton', 7, 10);

-- Yeni ev ürünlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Yatak Odasý Takýmý YT-1000', 1499.99, 10, 'Modern tasarýmlý yatak odasý takýmý', 8, 1),
('Kanepe ve Sehpa Seti KSS-200', 799.99, 15, 'Rahat kanepe ve sehpa seti', 8, 2),
('Yemek Masasý ve Sandalye Seti YMS-300', 599.99, 20, 'Þýk yemek masasý ve sandalye seti', 8, 3),
('Dolap ve Raf Sistemi DRS-400', 399.99, 25, 'Çeþitli bölmeli dolap ve raf sistemi', 8, 4),
('TV Ünitesi TU-500', 299.99, 30, 'Modern tasarýmlý TV ünitesi', 8, 5),
('Kitaplýk KB-600', 149.99, 40, 'Duvara monte edilebilen kitaplýk', 8, 6),
('Mutfak Masasý ve Sandalye Seti MSS-700', 449.99, 18, 'Þýk mutfak masasý ve sandalye seti', 8, 7),
('Ayna ve Komodin Seti AKS-800', 199.99, 12, 'Yatak odasý için ayna ve komodin seti', 8, 8),
('Dekoratif Lamba DL-900', 79.99, 22, 'Ev dekorasyonu için dekoratif lamba', 8, 9),
('Halý ve Kilim Seti HKS-1000', 129.99, 35, 'Ev içi zemin kaplamasý için halý ve kilim seti', 8, 10);

-- Yeni kýrtasiye ürünlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Kurþun Kalem Seti KK-100', 4.99, 100, 'Renkli kurþun kalem seti', 9, 1),
('Defter DN-200', 7.99, 80, 'Çizgili defter', 9, 2),
('Kalem Kutusu KK-300', 2.99, 150, 'Plastik kalem kutusu', 9, 3),
('Not Defteri ND-400', 5.99, 120, 'Küçük not defteri', 9, 4),
('Silgi SL-500', 1.99, 200, 'Renkli silgi seti', 9, 5),
('Cetvel CR-600', 3.99, 100, '30 cm cetvel', 9, 6),
('Masa Lambasý ML-700', 12.99, 50, 'LED masa lambasý', 9, 7),
('Kurþun Kalem Açacaðý KA-800', 1.49, 180, 'Elmas uçlu kalem açacaðý', 9, 8),
('Bant Kesici BK-900', 2.49, 120, 'Þeffaf bant kesici', 9, 9),
('Yapýþtýrýcý YP-1000', 4.49, 90, 'Sývý yapýþtýrýcý', 9, 10);

-- Yeni bahçe ürünlerini ekleyin
INSERT INTO Urunler (UrunAdi, BirimFiyat, StokMiktar, Aciklama, Kategori_ID, Marka_ID) VALUES
('Bahçe Çit BC-100', 24.99, 50, 'Bahçenizi çevrelemek için çit', 10, 1),
('Bahçe Mobilya Seti BMS-200', 349.99, 10, 'Bahçe oturma grubu', 10, 2),
('Bahçe Sulama Hortumu BSH-300', 14.99, 100, 'Bahçe sulama için uzun hortum', 10, 3),
('Bahçe Aydýnlatma Seti BAS-400', 69.99, 30, 'Güneþ enerjili bahçe lambalarý', 10, 4),
('Bahçe Makas Seti BMS-500', 19.99, 80, 'Bahçe bakýmý için makas seti', 10, 5),
('Bahçe Þemsiye BS-600', 29.99, 40, 'Bahçe masa þemsiyesi', 10, 6),
('Bahçe Tohum Seti BTS-700', 9.99, 150, 'Farklý çiçek tohumlarý içeren set', 10, 7),
('Bahçe Dekoratif Taþ BDT-800', 5.99, 200, 'Bahçe dekorasyonu için taþ', 10, 8),
('Bahçe Makine Seti BMS-900', 199.99, 15, 'Bahçe bakým makineleri seti', 10, 9),
('Bahçe Havuz BH-1000', 499.99, 5, 'Bahçe için küçük dekoratif havuz', 10, 10);

INSERT INTO Tedarikci (TedarikciID, Adres, Eposta, Telefon, TedarikciAdi)
VALUES
(1, 'Ýstanbul', 'mehmet@example.com', '1234567890', 'Jmehmet öz'),
(2, 'Ankara', 'mert@example.com', '0987654321', 'mert simit'),
(3, 'Ýzmir', 'ali@example.com', '5554443333', 'ali al'),
(4, 'Bursa', 'fatih@example.com', '7778889999', 'fatih terim'),
(5, 'Antalya', 'hüseyin@example.com', '1112223334', 'hüseyin kel'),
(6, 'Adana', 'mustafa@example.com', '9998887776', 'mustfa batý'),
(7, 'Trabzon', 'hasan@example.com', '4445556667', 'hasan kara'),
(8, 'Eskiþehir', 'hasanK@example.com', '2223334448', 'hasan ak'),
(9, 'Gaziantep', 'zeynep@example.com', '6667778889', 'zeynep gök'),
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

-- Yeni sipariþleri ekleyin
INSERT INTO Siparisler (birimFiyat, Detay, SiparisTarihi, ToplamTutar, SiparisDurumu, OdemeTuru, Musteri_ID) VALUES
(19.99, 'Bahçe Çit ve Bahçe Mobilya Seti', '2023-11-25', 249.98, 'Hazýrlanýyor', 'Kredi Kartý', 1),
(34.99, 'Priz ve Anahtar Seti', '2023-11-26', 104.97, 'Gönderildi', 'Nakit', 3),
(44.99, 'Akýllý Priz ve Elektrikli Isýtýcý', '2023-11-27', 89.98, 'Tamamlandý', 'Havale', 2),
(299.99, 'Akýllý Ev Kontrol Sistemi', '2023-11-28', 299.99, 'Hazýrlanýyor', 'Kredi Kartý', 4),
(149.99, 'Çelik Ýskele', '2023-11-29', 599.96, 'Gönderildi', 'Kapýda Ödeme', 5),
(799.99, 'Yatak Odasý Takýmý ve Mutfak Masasý Seti', '2023-11-30', 1599.98, 'Tamamlandý', 'Havale', 6),
(4.99, 'Kurþun Kalem Seti', '2023-12-01', 49.90, 'Hazýrlanýyor', 'Kredi Kartý', 7),
(49.99, 'Bahçe Aydýnlatma Seti', '2023-12-02', 149.97, 'Gönderildi', 'Nakit', 8),
(399.99, 'Dolap ve Raf Sistemi', '2023-12-03', 799.98, 'Tamamlandý', 'Kapýda Ödeme', 9),
(14.99, 'Bahçe Sulama Hortumu', '2023-12-04', 44.97, 'Hazýrlanýyor', 'Kredi Kartý', 10),
(14.99, 'Bahçe Sulama Hortumu', '2023-12-04', 44.97, 'Hazýrlanýyor', 'Kredi Kartý', 10),
(14.99, 'Bahçe Sulama Hortumu', '2023-12-04', 44.97, 'Hazýrlanýyor', 'Kredi Kartý', 10),
(19.99, 'Bahçe Çiçek Tohumlarý', '2023-12-05', 39.98, 'Gönderildi', 'Havale', 11),
(9.99, 'Bahçe Makasý', '2023-12-06', 29.97, 'Onaylandý', 'Nakit', 12),
(24.99, 'Bahçe Ayakkabýsý', '2023-12-07', 74.97, 'Teslim Edildi', 'Kredi Kartý', 13),
(34.99, 'Bahçe Saksýsý Seti', '2023-12-08', 104.97, 'Hazýrlanýyor', 'Havale', 14),
(12.99, 'Bahçe Dekoratif Lamba', '2023-12-09', 38.97, 'Gönderildi', 'Nakit', 15),
(39.99, 'Bahçe Oturma Grubu', '2023-12-10', 119.97, 'Onaylandý', 'Kredi Kartý', 16),
(17.99, 'Bahçe Sulama Kovalarý', '2023-12-11', 53.97, 'Teslim Edildi', 'Havale', 17),
(29.99, 'Bahçe Duvar Süsü', '2023-12-12', 89.97, 'Hazýrlanýyor', 'Nakit', 18),
(22.99, 'Bahçe Taþlarý Seti', '2023-12-13', 68.97, 'Gönderildi', 'Kredi Kartý', 19);








