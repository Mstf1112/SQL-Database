create database NalburDB

use NalburDB

CREATE TABLE Marka (
    MarkaID INT,
    MarkaAdi NVARCHAR(100),
    Ulke NVARCHAR(50),
	constraint anahtar_pk_MAR PRIMARY KEY(MarkaID)
);

CREATE TABLE Urunler (
    UrunlerID INT,
    UrunAdi VARCHAR(255),
    BirimFiyat DECIMAL(10, 2),
    StokMiktar INT,
    Aciklama TEXT,
    Kategori_ID INT,
    Marka_ID INT,
	constraint anahtar_pk_URu PRIMARY KEY(UrunlerID),
   -- constraint anahtar_fk_k FOREIGN KEY (Kategori_ID) REFERENCES Kategori(KatagoriID),
   --constraint anahtar_fk_m FOREIGN KEY (Marka_ID) REFERENCES Marka(MarkaID)
);
ALTER TABLE Urunler
ADD CONSTRAINT anahtar_fk_k
FOREIGN KEY (Kategori_ID) REFERENCES Kategori(KatagoriID);
ALTER TABLE Urunler
ADD CONSTRAINT anahtar_fk_m
FOREIGN KEY (Marka_ID) REFERENCES Marka(MarkaID);

CREATE TABLE Kategori (
    KatagoriID INT not null,
    KatagoriAdi VARCHAR(255),
    Aciklama TEXT,
	MusterisiparisID int,
	constraint anahtar_pk PRIMARY KEY(KatagoriID),
	--constraint anahtar_fkMUSi FOREIGN KEY (MusterisiparisID) REFERENCES Musteri(MusteriID)
)
ALTER TABLE Kategori
ADD CONSTRAINT anahtar_fkMUSi
FOREIGN KEY (MusterisiparisID) REFERENCES Musteri(MusteriID);


CREATE TABLE Musteri (
    MusteriID INT,
	KatagoriID INT,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Telefon NVARCHAR(15),
    SirketAdi NVARCHAR(100),
    Adres NVARCHAR(255),
    Eposta NVARCHAR(100),
	constraint anahtar_pk_M PRIMARY KEY (MusteriID)
);
ALTER TABLE Musteri
ADD CONSTRAINT anahtar_fkKa
FOREIGN KEY (KatagoriID) REFERENCES Kategori(KatagoriID);

alter table  Musteri drop column KatagoriID

ALTER TABLE Musteri
DROP CONSTRAINT anahtar_fkKa;


CREATE TABLE Stok (
    StokID INT not null,
	UrunID INT,
    MevcutStokMiktari INT
	constraint anahtar primary key (StokID)
	constraint anahtar_UR FOREIGN KEY (UrunID) REFERENCES Urunler(UrunlerID)
)




/*
CREATE TABLE Depolanan (
    StokID INT,
    UrunID INT,
    constraint anahtar_pkur PRIMARY KEY (StokID, UrunID),
    constraint anahtar_fk FOREIGN KEY (StokID) REFERENCES Stok(StokID),
    constraint anahtar_fk1 FOREIGN KEY (UrunID) REFERENCES Urunler(UrunlerID)
);
*/

CREATE TABLE Tedarikci (
    TedarikciID INT,
    Adres NVARCHAR(255),
    Eposta NVARCHAR(100),
    Telefon NVARCHAR(15),
    TedarikciAdi NVARCHAR(100),
	UrunID INT,
	CONSTRAINT PK_Tedarikci PRIMARY KEY (TedarikciID),
	CONSTRAINT FK_TedarikciUrnler_Urunler FOREIGN KEY (UrunID) REFERENCES Urunler(UrunlerID)

);



/*
CREATE TABLE TedarikciUrnler (
    TedarikciID INT,
    UrunID INT,
    CONSTRAINT PK_Tedarikciurun PRIMARY KEY (TedarikciID, UrunID),
    CONSTRAINT FK_TedarikciUrnler_Tedarikci FOREIGN KEY (TedarikciID) REFERENCES Tedarikci(TedarikciID),
    CONSTRAINT FK_TedarikciUrnler_Urunler FOREIGN KEY (UrunID) REFERENCES Urunler(UrunlerID)
);

*/

/*
CREATE TABLE MustariSiparisGecmisi (
    MusterisiparisID INT,
    KatagoriID INT,
    constraint anahtar_pkMukat PRIMARY KEY (MusterisiparisID, KatagoriID),
    constraint anahtar_fkMUSi FOREIGN KEY (MusterisiparisID) REFERENCES Musteri(MusteriID),
    constraint anahtar_fkKa FOREIGN KEY (KatagoriID) REFERENCES Kategori(KatagoriID)
);
*/

CREATE TABLE Personel (
    PersonelID INT,
    Adi NVARCHAR(100),
    Soyadi NVARCHAR(100),
	Telefon NVARCHAR(15),
    Maas  DECIMAL(10, 2),
    izingunu NVARCHAR(10),
    Pozisyon NVARCHAR(30),
	iseGirisTarihi NVARCHAR(50),
	SiparisID int,
    CONSTRAINT anahtar_per PRIMARY KEY (PersonelID),
	CONSTRAINT FK_PersonelSiparis_Sip FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)
);

drop table Personel

CREATE TABLE Siparisler (
    SiparisID INT,
    BirimFiyat DECIMAL(10, 2),
    Detay NVARCHAR(255),
    SiparisTarihi DATE,
    ToplamTutar DECIMAL(10, 2),
    SiparisDurumu NVARCHAR(50),
    OdemeTuru NVARCHAR(50),
	siparis_numarasi NVARCHAR(50),
    Musteri_ID INT,
	kargo_ID int,
	CONSTRAINT PK_sipariss PRIMARY KEY (SiparisID),
    CONSTRAINT FK_MusteriSiparis FOREIGN KEY (Musteri_ID) REFERENCES Musteri(MusteriID),
	--CONSTRAINT FK_kargo FOREIGN KEY (kargo_ID) REFERENCES Kargo(Kargo_ID)

);
CREATE TABLE Kargo(
kargo_ID INT,
siparis_durumu NVARCHAR(max),
kargocu_personel NVARCHAR(max),
kargo_firmasý NVARCHAR(max),
tahmini_teslimat NVARCHAR(max),
personelin_telefonu NVARCHAR(max),
kargo_notu NVARCHAR(max),
SiparisID int,
CONSTRAINT anahtar_Kargo PRIMARY KEY (kargo_ID),
CONSTRAINT FK_Kargosip FOREIGN KEY (PersonelID) REFERENCES Personel(PersonelID)

alter table Kargo
add PersonelID int

ALTER TABLE kargo
ADD CONSTRAINT FK_KArgopersonel
FOREIGN KEY (PersonelID) REFERENCES Personel(PersonelID);


--CONSTRAINT FK_Kargosip FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)

alter table  Siparisler drop column kargo_ID
-- bu kargoyu hazýrlayan personeli siparis ýd ile görebiliyor muyuz personel ýd de gerekiyor mu

ALTER TABLE Siparisler
DROP CONSTRAINT FK_kargo;

ALTER TABLE Siparisler
ADD CONSTRAINT FK_MusteriSiparis
FOREIGN KEY (Musteri_ID) REFERENCES Musteri(MusteriID);

ALTER TABLE Siparisler
ADD CONSTRAINT FK_kargo
FOREIGN KEY (kargo_ID) REFERENCES Kargo(Kargo_ID);



CREATE TABLE KargoFirmalari(
FirmaID INT,
SiparisID int,
FirmaAdi NVARCHAR(30),
Telefon NVARCHAR(15),
OdemeTarihi DATE,
SevkTarihi DATE,
IslemUcreti DECIMAL(10, 2),
CONSTRAINT anahtar_KARgo_firma PRIMARY KEY (FirmaID),
CONSTRAINT FK_SiparisKargo FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)
);

ALTER TABLE KargoFirmalari
ADD CONSTRAINT FK_SiparisKargo
FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID);


-------------------------------------------------
/*
CREATE TABLE KargolanacakUrunler (
    FirmaID INT,
    SiparisID INT,
    CONSTRAINT PK_kargolanack PRIMARY KEY (FirmaID, SiparisID),
    CONSTRAINT FK_KargoSiparis FOREIGN KEY (FirmaID) REFERENCES KargoFirmalari(FirmaID),
    CONSTRAINT FK_SiparisKargo FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)
);
*/

/*
CREATE TABLE PersonelSiparis (
    PersonelID INT,
    SiparisID INT,
    PRIMARY KEY (PersonelID, SiparisID),
    CONSTRAINT FK_PersonelSiparis_Personel FOREIGN KEY (PersonelID) REFERENCES Personel(PersonelID),
    CONSTRAINT FK_PersonelSiparis_Siparis FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)
);
*/





