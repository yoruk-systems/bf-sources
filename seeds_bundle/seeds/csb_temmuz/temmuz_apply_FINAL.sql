-- ÇŞB Temmuz UYGULAMA (staging dolduktan SONRA çalıştır)
-- 1) Ocak fiyatlarını arşivle (sadece değişecek pozlar)
insert into csb_poz_fiyat_arsiv (poz_no, donem, fiyat)
select p.poz_no, '2026-01', p.fiyat
from csb_poz p join csb_temmuz_staging s on s.poz_no=p.poz_no
where p.fiyat is distinct from s.fiyat
on conflict (poz_no,donem) do nothing;
-- 2) Güncel fiyatı yaz
update csb_poz p set fiyat = s.fiyat
from csb_temmuz_staging s
where s.poz_no=p.poz_no and p.fiyat is distinct from s.fiyat;
-- 3) Özet
select
 (select count(*) from csb_poz_fiyat_arsiv where donem='2026-01') as arsivlenen,
 (select count(*) from csb_temmuz_staging s join csb_poz p on p.poz_no=s.poz_no) as eslesen,
 (select count(*) from csb_temmuz_staging s where not exists (select 1 from csb_poz p where p.poz_no=s.poz_no)) as kitapta_olmayan;
