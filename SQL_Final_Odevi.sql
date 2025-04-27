
-- Tabloların oluşturulması

CREATE TABLE uyeler (
    id BIGSERIAL PRIMARY KEY,
    kullanici_adi VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    ad_soyad VARCHAR(100),
    sifre VARCHAR(100),
    kayit_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE kategoriler (
    id BIGSERIAL PRIMARY KEY,
    ad VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE kurslar (
    id BIGSERIAL PRIMARY KEY,
    baslik VARCHAR(100) NOT NULL,
    aciklama TEXT,
    kategori_id BIGINT REFERENCES kategoriler(id),
    kayit_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE kayitlar (
    id BIGSERIAL PRIMARY KEY,
    uye_id BIGINT NOT NULL REFERENCES uyeler(id),
    kurs_id BIGINT NOT NULL REFERENCES kurslar(id),
    kayit_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sertifikalar (
    id BIGSERIAL PRIMARY KEY,
    baslik VARCHAR(100) NOT NULL,
    aciklama TEXT
);

CREATE TABLE sertifika_atalari (
    id BIGSERIAL PRIMARY KEY,
    uye_id BIGINT NOT NULL REFERENCES uyeler(id),
    sertifika_id BIGINT NOT NULL REFERENCES sertifikalar(id),
    atama_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE blog_yazilari (
    id BIGSERIAL PRIMARY KEY,
    baslik VARCHAR(150),
    icerik TEXT,
    yazar_id BIGINT REFERENCES uyeler(id),
    yayin_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
