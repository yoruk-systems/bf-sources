# Yörük ERP — Birim Fiyat Seed Arşivi (Batch-2, 24 Tem 2026)

Bu klasör, `bf_sources` + `bf_poz` (+ `csb_poz_changes`, ÇŞB Temmuz revizyonu)
tablolarını dolduran SQL seed dosyalarının kalıcı arşividir.
Tümü idempotent — iki kez çalıştırmak zarar vermez.

## İçerik / çalıştırma sırası (felaket kurtarma senaryosu)
Önkoşul: bf_sources & bf_poz tabloları + registry satırları (migration'larda).
Kaynak UUID'leri dosyaların içine gömülü — registry satırları silinirse
dosyalardaki insert'ler orphan kalır; önce bf_sources'u geri yükle.

| Klasör | Kurum / iş | Dosya | Satır |
|---|---|---|---|
| kgm | Karayolları 2026 | 4 | 1.356 |
| ilbank_altyapi | İlbank Altyapı 2026-1 | 8 | 2.959 |
| ilbank_rayic | İlbank Rayiç 06/2026 | 7 | 2.575 |
| ptt | PTT Özel BF + Rayiç 06/2026 | 3 | 698 |
| uab | Liman + TAK + Nisan/Mayıs rayiç | 8 | 2.044 |
| kultur | Kültür/VGM eski eser | 10 | 3.583 |
| ogm | Orman GM cetveli | 3 | 863 |
| msb | MSB inşaat | 1 | 79 |
| dsi | DSİ 2026 | 6 | 1.974 |
| csb_changes | ÇŞB Ek.2/5/6 (2025→2026) | 6 | 2.268 |
| csb_temmuz | ÇŞB Temmuz revizyonu (staging+apply+19x) | 7 | 1.876+219 |

## Doğrulama standardı
Her kurum: kaynak PDF'e karşı 12-20 rastgele satır kuruş-exact spot check + satır sayımı.
TEDAŞ: lisanslı ürün (TİP-4), veri YOK — bilerek.
