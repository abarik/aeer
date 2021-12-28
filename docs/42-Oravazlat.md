---
editor_options: 
  markdown: 
    wrap: 72
---

# Óravázlat az R tanításához {#oravazlat-az-r-tanitasahoz}

Az R oktatásához és tanulásához egy lehetséges tanmenet vázlatát
mutatjuk be. Az R tanulmányozását két féléves rendszerben, félévenként
10 duplaórában képzeltük el. A lent felsorolt óravázlat összesen 20
duplaórában sorolja fel azokat az ismeretelemeket, amelyek az R
gyakorlati felhasználásához nem nélkülözhetők.

## 1. félév {- #felev-1}

**1. óra**  
Az *Alap R* és az *RStudio* letöltése és telepítése, dokumentációk az
R használatához. Az *RGui* áttekintése, a konzol használata, a
szkriptablak használata, parancsok végrehajtása. Az *RStudio*
használata.

**2. óra**  
Számok írása, numerikus operátorok. Karakteres konstansok az R-ben.
Logikai konstansok és a logikai műveletek. Objektum létrehozása, értékének megváltoztatása. Objektumokat is tartalmazó kifejezések. 

**3. óra**  
Függvények hívása, például a `log()` és `exp()` függvények bemutatása, egyéb matematikai függvények. Függvényparaméterek elnevezése, sorrendjük cseréje. Kifejezés definíciója. Vektor adatszerkezet definíciója. Vektor létrehozása: `c()`, `:` (kettőspont operátor), `seq()`, `rep()`

**4. óra**  
A faktor adatszerkezet definíciója, faktor létrehozása a `factor()` függvénnyel. Objektumok adattípusának megtekintése és az objektum hossza: `class()`, `typeof()`, `length()`. Adattábla definíciója, létrehozása a `data.frame()` függvénnyel. Mátrix adatszerkezet, létrehozása a `matrix()` függvénnyel. Tömb adatszerkezet, létrehozása az `array()` függvénnyel. Lista adatszerkezet, létrehozása a `list()` függvénnyel. Indexelés vektor, mátrix, tömb és adattábla esetén. Hivatkozás listaelemekre lista és adattábla esetén.

**5. óra**  
Tagolt szöveges állomány létrehozása táblázatkezelővel és szövegszerkesztővel. Tagolt szöveges állomány beolvasása a `read.table()` függvénnyel. A paraméterek megbeszélése (`file=`, `sep=`, `header=`, `dec=`, `quote=`, `stringsAsFactors=`, `comment.char=`, `na.strings=`, `strip.white=`, `fileEncode=`). Táblázatkezelők és más statisztikai programcsomagok saját formátomú állományainak beolvasása a `rio::import()` segítségével. A beolvasás helyességének ellenőrzése az `str()` függvénnyel A `read.table()` argumentumainak hatása az `str()` outputjára. Adatállomány kiírása a `write.table()` és a `rio::export()` segítségével.

**6. óra**  
Egyszerű típuskonverziók (numerikus vektorból faktor és karakteres vektorból faktor előállítása a `factor()` függvénnyel, valamint az `as.character()` és `as.numeric()` használata). Kapcsolat a statisztikai skálák és a változók típusai között. Faktor szintjeinek átnevezése, a szintek sorrendjének meghatározása. Vektor rendezése a `sort()` és `order()` függvénnyel. Adattábla rendezése az `order()` függvénnyel. Adattábla szűrése egyszerű logikai kifejezéssel és összetett logikai kifejezéssel.

**7. óra**  
Az R környezet fogalmai: munkakönyvtár, munkaterület, csomag. Munkakönyvtár kezelése Objektum létrehozása és eltávolítása a munkaterületről, objektumok listája. Csomag telepítése, telepített csomagok listája, csomag betöltése, csomag eltávolítása, betöltött csomagok listája. Az R Commander telepítése és használatának bemutatása. A jamovi telepítése és használata. Az RGUI, RStudio, jamovi és az R Commander összehasonlítása.

**8. óra**  
Leíró statisztikai mérőszámok meghatározása: `summary()`, `mean()`, `median()`, `sd()` stb. Hiányzó értékek kezelése (`na.rm=T`, `is.na()`, `na.ommit()`). Műveletek több változóra és csoportra (`apply()`, `sapply()`, `tapply()`, `aggregate()`, `by()`). A `psych::describe()`, `psych::describeBy()` és a `DescTools::Desc()` függvényének bemutatása.

**9. óra**  
Gyakorisági táblázatok létrehozása a `table()` és `xtabs()` függvénnyel. Hiányzó értékek kezelése (`useNA="ifany"`). Relatív gyakorisági táblázatok. Kumulált gyakorisági táblázatok. Soronként vagy oszloponként vett kétdimenziós gyakorisági táblázatok. Három vagy többdimenziós táblázatok (`array()` és `ftable()`). Gyakorisági táblázatok a `DescTools::Desc()` függvénnyel.

**10. óra**  
A hagyományos grafika magasszintű függvényei. Oszlopdiagram rajzolása (`barplot()`). Egydimenziós pontdiagram létrehozása (`stripchart()`). Grafikus paraméterek fogalma és beállítása a `par()` függvénnyel. Feliratok (`main=`, `sub=`, `xlab=`, `ylab=`, `las=`), tengelyek (`xlim=`, `ylim=`, `mgp=`, `tcl=`), pontkarakterek (`pch=`), margók (`mar=`), színek (`col=`) beállítása. Pontdiagram és vonaldiagram rajzolása (`plot()`). Dobozdiagram rajzolása (`boxplot()`). Hisztogram rajzolása (`hist()`). További grafikus paraméterek: rajzterület felosztása (`mfrow=`, `mfcol=`). Grafikus eszközök típusai (`windows()`, `png()`, `jpeg()`, `pdf()`). Képállományok létrehozása és beállítási lehetőségek (`res=`, `width=`, `height=`). Grafikus eszközök bezárása.

## 2. félév {- #felev-2}

**11. óra**  
A reprodukálható kutatás elvének bemutatása. Az RStudio és a jamovi lehetőségei a reprodukálható kutatásban. RMarkdown állomány (`*.Rmd`) létrehozása, szintaxisának bemutatása. A fejléc lehetőségei. A szöveges rész formázása Markdown segítségével. Az R csonkok lehetőségei. PDF, Word és HTML állomány generálása. Egyedi template-ek használata.

**12. óra**  
Információk az adatobjektumokról (`str()`, `head()`, `dim()`, `nrow()`, `ncol()`, `names()`, `colnames()`, `rownames()`, `levels()`, `nlevels()`). Egyszerű típuskonverzió a karakters, numerikus, logikai és faktor típusok között (`factor()`, `as.factor()`, `as.numeric()`, `as.character()`, `as.logical()`). Mátrix és adattábla sor- és oszlopmanipulációja: sor és oszlopnevek megadása, átnevezése, sorok és oszlopok törlése, beszúrása és cseréje (pl. `rbind()`, `cbind()`) Numerikusból numerikus transzformáció (tetszőleges matematikai függvény, `transform()`, `recode()`). Numerikusból faktor transzformáció (`cut()`, `car::recode()`). Faktorból faktor transzformáció (`car::recode()`).

**13. óra**  
Adatelőkészítés egy- és kétmintás próbákhoz. Adatbázis létrehozás a `data.frame()` függvénnyel a varianciaelemzés számára (kiegyensúlyozott és nem kiegyensúlyozott esetek). A hosszú és széles adatbázisok fogalma Adatbázis átalakítása a két formátum között (`reshape()`, `melt()`, `dcast()`) Adattáblák összefűzése (`merge()`).

**14. óra**  
Egymintás és kétmintás próbák végrehajtása Argumentumok és outputok értelmezése. Például a `BSDA::z.test()`, `t.test()`, `prop.test()`, `binom.test()`, `fisher.test()`, `mcnemar.test()`, `wilcox.test()`, `kruskal.test()` és `friedman.test()` függvényekkel. A varianciaelemzés különböző változatainak végrehajtása. Argumentumok és outputok értelmezése az `aov()` és `lm()` függvények esetében. Korreláció- és regressziószámítás végrehajtása. Argumentumok és outputok értelmezése a `cor()`, `cor.test()` és `lm()` esetében.

**15. óra**  
Véletlen a `sample()` függvény segítségével. Eloszlások függvényei (`r...()`, `d...()`, `q...()`, `p...()`). Kritikus értékek és p-értékek meghatározása a `q...()`, `p...()` függvényekkel. Eloszlások sűrűségfüggvényeinek rajzolása a `curve()` függvény segítségével.


**16. óra**  
A Tidyverse R bemutatása. A pipe operátor (`%>%`) használata. A tibble adatobjektumok kezelése. Adatállományok beolvasás és kiírása. Adatobjektom vizsgálata, sor- és oszlopnevek manipulációja. Oszlopok leválogatása, beszúrása és törlése. Adatobjektum rendezése.  

**17. óra**  
A Tidyverse R bemutatása. Sorok szűrése, törlése és beszúrása. Adatok összesítése, csoportosítása és transzformációja, valamint adattáblák összefűzése a **dplyr** csomag segítségével. Kategorikus változók kezelése a **forcats** csomag segítségével.

**18. óra**  
A Tidyverse R bemutatása. Széles-hosszú átalakítás a **tidyr** csomag segítségével (`pivot_wider()`, `pivot_longer()`). Hiányzó, duplikált és kiugró értékek kezelése a **dplyr** csomag segítségével. Karakterláncok kezelése a **stringr** csomag segítségével.

**19. óra**  
A ggplot2 grafikus rendszer elemei: az adat, az alakzat (geom) és a megjelenés (aes) rétegek. Az `x=`, `y=`, `alpha=`, `colour=`, `fill=`, `group=`, `shape=` és `size=` paraméterek használata az `aes()` függvényben. Jelmagyarázat megjelenítése. Több ábra megjelenítése kategorikus változó alapján (faceting). Ábra elemeinek beállítása: feliratok, tengelyek, színek és témák. Ábrák mentése.

**20. óra**  
Az alavető ábratípusok megjelenítése és paraméterezései: oszlopdiagram, egydimenziós pontdiagram, hisztogram, dobozdiagram, pontdiagram, vonaldiagram, Q-Q ábra, hegedűdiagram, lollipop ábra és terület diagram.  

**20+1. óra**  
Az R programozási lehetőségei: szekvencia, feltételes utasítások, ciklusok. Függvények létrehozása. Objektum-orientált lehetőségek.
