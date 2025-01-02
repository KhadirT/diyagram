CREATE TABLE IF NOT EXISTS `kullanici` (
	`kullanici_ad` varchar(255) DEFAULT '50',
	`kullanici_soyad` varchar(255) DEFAULT '50',
	`kullanici_sifre` varchar(255) DEFAULT '100',
	`email` varchar(255) DEFAULT '100',
	`telefon` varchar(255) DEFAULT '15',
	`rol` enum DEFAULT '10',
	`id` int NOT NULL,
	`kayit_tarihi` datetime,
	`durum` boolean,
	`son_giris_tarihi` datetime,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `dersler` (
	`ders_id` int NOT NULL,
	`ders_ad` varchar(255) DEFAULT '100',
	`ders_saati` time,
	`kredi` int DEFAULT '3',
	`ogretmen_id` int,
	`semestr` enum DEFAULT '10',
	`aciklama` text,
	`durum` boolean,
	`yarin_ders` boolean,
	`sinif` varchar(255) DEFAULT '10',
	PRIMARY KEY (`ders_id`)
);

CREATE TABLE IF NOT EXISTS `ders_gunleri` (
	`durum` boolean,
	`notlar` text,
	`semestr` enum DEFAULT '10',
	`yil` year,
	`ders_id` int NOT NULL,
	`bitis_saati` time,
	`lokasyon` varchar(255) DEFAULT '100',
	`ogretmen_id` int,
	`gun` enum DEFAULT '10',
	`baslangic_saati` time,
	PRIMARY KEY (`ders_id`)
);

CREATE TABLE IF NOT EXISTS `odevler` (
	`odev_soyadi` varchar(255) DEFAULT '100',
	`id` int NOT NULL,
	`odev_id` int,
	`odev_adi` varchar(255) DEFAULT '100',
	`verilis_tarihi` datetime,
	`son_teslim_tarihi` datetime,
	`durum` boolean,
	`notlar` text,
	`ders_id` int,
	`ogretmen_id` int,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Sinavlar` (
	`kredi` int DEFAULT '3',
	`ogretmen_id` int,
	`sinav_id` int NOT NULL,
	`sinav_ad` varchar(255) DEFAULT '100',
	`sinav_saati` time,
	PRIMARY KEY (`sinav_id`)
);


ALTER TABLE `dersler` ADD CONSTRAINT `dersler_fk4` FOREIGN KEY (`ogretmen_id`) REFERENCES `kullanici`(`id`);
ALTER TABLE `ders_gunleri` ADD CONSTRAINT `ders_gunleri_fk4` FOREIGN KEY (`ders_id`) REFERENCES `dersler`(`ders_id`);

ALTER TABLE `ders_gunleri` ADD CONSTRAINT `ders_gunleri_fk7` FOREIGN KEY (`ogretmen_id`) REFERENCES `kullanici`(`id`);
ALTER TABLE `odevler` ADD CONSTRAINT `odevler_fk8` FOREIGN KEY (`ders_id`) REFERENCES `dersler`(`ders_id`);

ALTER TABLE `odevler` ADD CONSTRAINT `odevler_fk9` FOREIGN KEY (`ogretmen_id`) REFERENCES `kullanici`(`id`);
ALTER TABLE `Sinavlar` ADD CONSTRAINT `Sinavlar_fk1` FOREIGN KEY (`ogretmen_id`) REFERENCES `kullanici`(`id`);