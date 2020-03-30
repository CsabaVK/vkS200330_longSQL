-- 1. feladat
SELECT rendeles_torzs.rszam 
FROM rendeles_torzs, vevo
WHERE rendeles_torzs.vkod = vevo.vkod AND
rendeles_torzs.vkod in (SELECT vevo.vkod FROM vevo WHERE vevo.vnev='Kovács István')

-- 2. feladat
SELECT rendeles_tetel.rszam, rendeles_tetel.cikkszam, cikkek.cikknev, rendeles_tetel.menny, cikkek.bruttoar, 
(rendeles_tetel.menny * cikkek.bruttoar) as "Tételosszeg" 
FROM cikkek, rendeles_tetel 
WHERE rendeles_tetel.cikkszam=cikkek.cikkszam

-- 3. feladat
SELECT rendeles_tetel.rszam,SUM(rendeles_tetel.menny * cikkek.bruttoar) as "Tételosszeg"
FROM cikkek, rendeles_tetel, rendeles_torzs
WHERE rendeles_tetel.cikkszam=cikkek.cikkszam and rendeles_tetel.rszam='R002'
and rendeles_torzs.rszam=rendeles_tetel.rszam

-- 4. feladat
SELECT rendeles_tetel.rszam,SUM(rendeles_tetel.menny * cikkek.bruttoar) as "Tételosszeg"
FROM cikkek, rendeles_tetel, rendeles_torzs
WHERE rendeles_tetel.cikkszam=cikkek.cikkszam and rendeles_torzs.vkod ='V003'
and rendeles_torzs.rszam=rendeles_tetel.rszam
GROUP BY rendeles_torzs.rszam

-- 5. feladat
SELECT rendeles_tetel.rszam, SUM(rendeles_tetel.menny * cikkek.bruttoar) as "Tételosszeg"
FROM cikkek, rendeles_tetel, rendeles_torzs
WHERE rendeles_tetel.cikkszam=cikkek.cikkszam and rendeles_torzs.vkod ='V003'
and rendeles_torzs.rszam=rendeles_tetel.rszam AND
rendeles_torzs.vkod in(SELECT vevo.vkod FROM vevo WHERE vevo.vnev='Nagy Jolán')
GROUP BY rendeles_torzs.rszam

-- 6. feladat
CREATE VIEW rendlesek(ar, mennyiseg, ertek) as 
SELECT cikkek.cikknev, rendeles_tetel.menny, rendeles_tetel*cikkek.bruttoar
FROM cikkek, rendeles_tetel
WHERE cikkek.cikkszam = rendeles_tetel.rszam


