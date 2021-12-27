# Itt kezdődik {#itt-kezdodik}


<img src="images/ch_01_small.png" width="70%" style="display: block; margin: auto;" />


## Elindulás {#Itt-kezdodik-1-szint}


<div class="rmdlevel1">
<p>Ebben a fejezetben:</p>
<ul>
<li>bemutatunk egy konkrét adatelemzési példát,</li>
<li>és áttekintjük a könyv tartalmát,</li>
<li>lehetőséget adunk az előzetes R ismeretek felmérésére,</li>
<li>és segítünk a megfelelő fejezet kiválasztására a folytatáshoz.</li>
</ul>
</div>

Könyvünk elsődleges célja az R bemutatása kezdő felhasználók számára, de minden bizonnyal azok is találni fognak hasznos részeket, akik már rendelkeznek R ismeretekkel. Bevezetést nyújtunk az R által lefedett három nagy terület mindegyikébe: az adatkezelésbe, a grafikus megjelenítésbe és az adatelemzésbe is. A leírtak megértéséhez a statisztikai alapismereteken túl semmilyen előzetes tudás nem szükséges.

Most egy konkrét adatelemzési példa segítségével bemutatjuk, hogy mit nyújt e könyv az Olvasó számára. A bevezető példa megoldása során az előismeretekkel rendelkező Olvasó a saját R tudását is felmérheti, és ezzel egyben segítséget kaphat az ismeretéhez és céljához legjobban illeszkedő fejezet kiválasztására, amellyel tovább folytathatja az olvasást.

*Bevezető példa: A lányok és fiúk eltérő Instagram használata*  
Feltételezésünk szerint az Instagram népszerűbb a lányok körében, mint a fiúknál. Egy 2017-es kutatásunkban 10-14 éves lányok és fiúk mobilhasználati szokásait hasonlítottuk össze, és az Instagram használat gyakoriságára is rákérdeztünk. Az összegyűjtött adatok a `mobil_2017.xlsx` állományban állnak rendelkezésre. 
Nézzük az adatelemzés lépéseit és egyben könyvünk felépítését!

**2. fejezet: Mi az R?** A bevezető példa megoldását R-ben fogjuk elvégezni (és nem más eszközben, mint például az SPSS, jamovi, JASP, SAS stb.). Érdemes tehát ismerni az R céljait és lehetőségeit, jó ha van egy összképünk a használt statisztikai programcsomagunkról. Ezeket az áttekintő ismereteket nyújtja 2 fejezet. 

**3. fejezet: Az R telepítése.** Az adatelemzés konkrét lépéseinek elvégzéséhez telepített *Alap R* és *RStudio* szükséges. Ha ezek nem állnak rendelkezésre, vagy még nem is találkoztunk ezekkel az eszközökkel, akkor a 3. fejezet nekünk szól. 

**4. fejezet: Munka az R-ben.** Az adatelemzés végrehajtásához az *RStudio*-t ajánljuk, és azon belül pedig a projektek használatát szorgalmazzuk. A 4. fejezetben megismerjük az *RStudio* legalapvetőbb funkcióit, a parancsállományok létrehozását és futtatását.

A fenti előzmények után elkezdhetjük a bevezető példa megoldását:

1. indítsuk el az *RStudio*-t,
1. hozzunk létre egy új projektet,
1. hozzunk létre egy új RMarkdown állományt,
1. helyezzük el a lentebb szereplő R parancsokat az RMarkdown állomány egyes csonkjaiban.

**5. fejezet: Az R nyelv.** Az R parancsok létrehozásának vannak szabályai, amelyeket a munka során be kell tartanunk. Ismernünk kell jó néhány függvényt, és általában el kell tudnunk igazodni az R nyelvben. Az 5. fejezet ezért kulcsfontosságú, tanulmányozzuk alaposan, és lehetőleg minden kitűzött feladatát oldjuk meg.

**6. fejezet: Beolvasás** Az adatelemzés első lépése az adatállomány beolvasása. Adataink változatos formában állhatnak rendelkezésre, a 6. fejezetben ezek beolvasására kapunk receptet.

A bevezető példa megoldásához az RMarkdown állomány egyik csonkját bővítsük a lenti sorokkal.


```r
library(rio)                                   # rio csomag betöltése
mobil <- import(file = "adat/mobil_2017.xlsx") # beolvasás
```


**7. fejezet: Adatkezelés** A statisztikai elemzés elkezdése előtt számos adatkezelési tevékenységre lehet szükség. Ezeket a sokszor rendkívül időigényes folyamatokat a 7. fejezetben részletezzük.   

A bevezető példa megoldásához az RMarkdown állomány egyik csonkját bővítsük a lenti sorokkal. Az adatkezelés legtöbbször a beolvasott állomány *jellemzőinek lekérésével* kezdődik.


```r
str(mobil)              # dataframe szerkezete
names(mobil)            # változónevek  
unique(mobil$nem)       # különböző értékek - nem
unique(mobil$instagram) # különböző értékek - instagram
```

A *karakteres vagy numerikus vektorok faktorrá* konvertálása az egyik leggyakoribb előkészítő parancs.


```r
mobil$nem <- factor(mobil$nem, levels = c("Nő", "Férfi"))
mobil$instagram <- factor(mobil$instagram)
```

A *faktor szintjeinek elnevezésével* beszédesebb szintneveket hozhatunk létre.


```r
levels(mobil$instagram) <- c("Soha","Ritkán","Hav.t","Het.t","Nap.e","Nap.t")
```


A *faktorból faktor transzformáció* során összevonhatunk faktorszinteket, így csökkenthetjük a kiinduló faktor szintszámát.


```r
mobil$instagram <- car::recode(mobil$instagram,'c("Hav.t","Het.t")="Gyakran";
                                       c("Nap.t", "Nap.e")="Nagyon gyakran"')
```

A táblázatok és ábrák megfelelő megjelenéséhez, ordinális változók esetében, végezzük el a *faktorszintek sorrendbe állítását*.  


```r
mobil$instagram <- factor(mobil$instagram, 
          levels=c("Soha", "Ritkán", "Gyakran", "Nagyon gyakran"))
```

**8. fejezet: Mutatók és táblázatok.** Ha az adatainkat már megfelelő formába hoztuk, akkor továbbléphetünk az elemzés felé. A 8. fejezet a leíró statisztikai elemzésekből a mutatók és a táblázatok létrehozását mutatja be. Most kétdimenzós gyakorisági táblázatot hozunk létre, `tab` néven, a két faktor változó segítségével.


```r
tab <- table(x = mobil$nem, y = mobil$instagram)
names(dimnames(tab)) <- c("Nem", "Instagram")
addmargins(tab)
#>        Instagram
#> Nem     Soha Ritkán Gyakran Nagyon gyakran Sum
#>   Nő      15      1       4             26  46
#>   Férfi   13      1       1              6  21
#>   Sum     28      2       5             32  67
```

**9. fejezet: Grafika.** A grafikus megjelenítés is a leíró statisztikai elemzés része. A 9. fejezetben részletesebben olvashatunk az ábrák létrehozásáról. Faktor változók esetén az oszlopdiagram megfelelő ábrázolási forma lehet, most egy ilyen ábrát hozunk létre.


```r
library(ggplot2)
ggplot(data = mobil, aes(x=instagram, y=stat(prop), group=nem, fill=nem)) + 
  geom_bar(position = "dodge", col="gray9") + theme_bw() + 
  scale_y_continuous(labels = scales::label_percent(), limits=c(0,0.8)) +
  geom_text(stat="count", aes(y=stat(prop), group=nem,
                              label=scales::percent(stat(prop), accuracy=1)), 
            position=position_dodge(0.9), vjust=-0.26, size=3.1) +
  scale_fill_brewer() + labs(x="Instagram használat", y="")
```

<img src="01-Itt-kezdodik_files/figure-html/unnamed-chunk-10-1.png" width="90%" style="display: block; margin: auto;" />

**10. fejezet: Hipotézisvizsgálatok.** A statisztikai hipotézisvizsgálat minden adatelemzés központi része. A 10. fejezetben az egy- és kétváltozós elemzéseket mutatjuk be. Most függetlenség-vizsgálatot hajtunk végre a nominális és az ordinális változók között, a korábban létrehozott `tab` objektum felhasználásával.



```r
library(coin)
lbl_test(tab)
#> 
#> 	Asymptotic Linear-by-Linear Association Test
#> 
#> data:  Instagram (ordered) by Nem (Nő, Férfi)
#> Z = 2.3584, p-value = 0.01835
#> alternative hypothesis: two.sided
```

**11. fejezet: Publikálás.** Az elemzés eredményének publikációkész formába alakítása az adatelemzési folyamat utolsó lépése. A 11. fejezetben megismerjük azokat a legegyszerűbb folyamatokat, amelyekkel többnyire formanyelvtől függetlenül, publikációkész eredményközlést végezhetünk.

A bevezető példa elemzése során kapott eredmények publikálását segíti, ha a következő sorokkal kiegészítjük a fenti, leíró statisztikai elemzéseket. Egy soronként vett kétdimenziós gyakorisági táblázat és egy háttértárra mentett ábra a lenti sorok eredménye. Végül fordítsuk le az RMarkdown állományt a **Knit** nyomógomb segítségével. A kapott HTML (vagy Word/PDF) állomány és a háttértáron keletkezett képállomány jelentősen segíti az eredmények publikálását.


```r
pander::pander(descr::CrossTable(x = mobil$nem, y = mobil$instagram, 
    format = "SPSS", prop.c = F, prop.chisq = F, prop.t = F), digits=1)
p1 <- ggplot(data = mobil, aes(x=nem, fill=instagram)) + 
  geom_bar(position = "dodge") + theme_bw()
ggsave(filename = "output/kep/instagram_1.png", plot=p1)
```

A bevezető példa megoldásához természetesen a hipotézisvizsgálat szöveges értékelés is hozzátartozik, de ezt most az alfejezet végén szereplő egyik kitűzött feladatra halasztjuk. A hangsúly a könyv vázlatos tartalomjegyzékének bemutatásán volt, részletesebb, de felsorolásszerű tartalomjegyzéket a következő két alfejezetben találunk.


<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>Ebben az 1. alfejezetben egy bevezető példát oldottunk meg. Ennek segítségével illusztrálni tudtuk a további alfejezetek tartalmát. A 2. fejezetben áttekintést fogunk adni az R-ről, a 3.-ban az <em>Alap R</em> és <em>RStudio</em> telepítését, a 4.-ben az <em>RStudio</em> használatát mutatjuk be. Az 5. fejezetben kellő részletességgel ismertetjük az R nyelvet. A további fejezetekben az adatelemzés szokásos lépéseit vesszük sorra, a 6. fejezetben a beolvasást, a 7. fejezetben az adatok előkészítését, a 8. és 9. fejezetben a leíró statisztikai műveleteket mutatjuk be. A 10. fejezet az egy- és kétváltozós hipotézisvizsgálatoké, az utolsó 11. fejezet az eredmények publikálását foglalja össze.</p>
</div>



<div class="rmdexercise">
<p><strong>Feladatok</strong></p>
<ol style="list-style-type: decimal">
<li>Milyen online vagy nyomtat könyvek segítik az R elsajátítását? Próbáljuk összegyűjteni a magyar nyelvű könyveket is!</li>
<li>Térképezzük fel az online videókurzusokat is az R tanulásához!</li>
<li>A bevezető példa (<em>A lányok és fiúk eltérő Instagram használata</em>) megoldásában a hipotézisvizsgálat alapján adjunk szöveges értékelést!</li>
</ol>
</div>


## A könyv felépítése


<div class="rmdlevel2">
<p>Ebben a fejezetben:</p>
<ul>
<li>bemutatjuk a könyv részletes felépítését,</li>
<li>ezzel tovább segítjük a választást a folytatáshoz.</li>
</ul>
</div>






A könyv 11 fejezetből áll, és fejezetenként 3 vagy több alfejezetből. Most röviden bemutatjuk az egyes alfejezetek tartalmát. 









+-------------------------------------------+-----------------------------------------------------------------------------------+
| Fejezet/alfejezet                         | Leírás                                                                            |
+===========================================+===================================================================================+
| **1. Itt kezdődik**                       |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 1.1. Elindulás                            | A könyv fejezeteinek bemutatása egy konkrét adatelemzésen keresztül               |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 1.2. A könyv felépítése                   | A könyv egyes alfejezeteinek rövid bemutatása (jelen alfejezet)                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 1.3. Próbák listája                       | A könyvben szereplő egy- és kétváltozós statisztikai eljárások listája            |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **2. Mi az R?**                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 2.1. Az R bemutatása                      | A parancssoros R jellemzői, az R nyelv, az *Alap R* és a csomag fogalma           |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 2.2. A modern R                           | Megtanuljuk a *Tidyverse R* fogalmát, megtudjuk mi a modern R                     |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 2.3. Múlt és jelen                        | Az R rövid története, alapelvek az R tanulásához, és az R alaptudás elemei        |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **3. Az R telepítése**                    |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 3.1. Az Alap R és az RStudio telepítése   | Megismerjük az *Alap R* és az *RStudio* telepítését                               |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 3.2. A Tidyverse R telepítése             | A **tidyverse** csomag(gyűjtemény) telepítése                                     |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 3.3. Az R frissítése                      | Az *Alap R*, az *RStudio* és a csomagok frissítésének módszerei                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **4. Munka az R-ben**                     |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 4.1. Az RStudio használata                | Az *RStudio* jellemzői és felépítése, a projektek használata és a segítségkérés   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 4.2. Segítség az R használatához          | Segítségkérési lehetőségek az R-ben, a beépített súgó használata
+-------------------------------------------+-----------------------------------------------------------------------------------+
| 4.3. Az Alap R használata                 | Az *Alap R* konzola, az *RGui*, az *R Commander* és a kötegelt üzemmód lehetőségei|
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **5. Az R nyelv**                         |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **6. Beolvasás**                          |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **7. Adatmanipuláció**                    |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **8. Mutatók és táblázatok**              |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **9. Grafika**                            |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **10. Hipotézisvizsgálatok**              |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
|                                           |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+
| **11. Publikáció**                        |                                                                                   |
+-------------------------------------------+-----------------------------------------------------------------------------------+














<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>Ebben a részben röviden bemutattuk a könyv összes alfejezetét. A későbbiekben térképként használhatja az Olvasó az itt ismertetett táblázatot.</p>
</div>




\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
**Feladatok**

1. Az adatfeldolgozás 4 lépése a következő: (1) adatok beolvasása, (2) adatok előkészítése elemzésre, (3) adatok elemzése és (4) az eredmények publikálása. A könyv mely fejezetei tartoznak az adatfeldolgozás fenti lépéseihez?
1. Az R-rel való munka általunk javasolt módja: *RStudio*-ban, projektmódban, R vagy RMarkdown állományokat szerkesztünk és hajtunk végre. Mely fejezetekben találunk hasznos információkat az R ezen használatával kapcsolatban?

</div>\EndKnitrBlock{rmdexercise}


## Próbák listája

<div class="rmdlevel3">
<p>Ebben a fejezetben:</p>
<ul>
<li>áttekintést adunk az egy- és kétváltozós hipotézisvizsgálatokról.</li>
</ul>
</div>


A 10. fejezetben bemutatjuk az egy- és kétváltozós hipotézisvizsgálatok végrehajtását. Ebben a fejezetben felsoroljuk a legfontosabb próbákat, összesen öt táblázatban soroljuk fel őket:

* egy mintát vizsgáló próbák (\@ref(tab:egyminta1) táblázat),
* páros mintát vizsgáló próbák (\@ref(tab:parosminta1) táblázat),
* két független mintát vizsgáló próbák (\@ref(tab:ketminta1) táblázat),
* több összetartozó mintát vizsgáló próbák (\@ref(tab:tobbosszeminta1) táblázat),
* több független mintát vizsgáló próbák (\@ref(tab:tobbminta1) táblázat).

A táblázatokban megadjuk, hogy a vizsgálatnak mi a célja, vagyis a populációbeli változó(k) melyik paraméterére vonatkoznak a próbák, a várható értékre, a mediánra, a varianciára vagy a valószínűségre. A 10. fejezetben foglalkozunk az eloszlásvizsgálatok közül a normalitást ellenőrző próbákkal is, így a \@ref(tab:egyminta1) táblázat ezeket is számba veszi.


Table: (\#tab:egyminta1) Egy minta vizsgálata


+------------------+-------------------------------------------+---------------------------+
| Cél              | Próba neve                                | R függvény                |
+==================+===========================================+===========================+
| várható érték    | egymintás u-próba                         | `BSDA::z.test()`          |
+------------------+-------------------------------------------+---------------------------+
|                  | egymintás t-próba                         | `t.test()`                |
+------------------+-------------------------------------------+---------------------------+
| medián           | előjel-próba                              | `BSDA::SIGN.test()`       |
+------------------+-------------------------------------------+---------------------------+
|                  | Mood-féle medián-próba                    |                           |
+------------------+-------------------------------------------+---------------------------+
|                  | egymintás Wilcoxon-próba                  | `wilcox.test()`           |
+------------------+-------------------------------------------+---------------------------+
| variancia        | khí-négyzet próba                         | `chisq.test()`            |
+------------------+-------------------------------------------+---------------------------+
| valószínűség     | khí-négyzet próba                         | `chisq.test()`            |
+------------------+-------------------------------------------+---------------------------+
| normalitás       | Shapiro-Wilk próba                        | `shapiro.test()`          |
+------------------+-------------------------------------------+---------------------------+
|                  | Kolmogorov-Szmirnov próba                 | `DescTools:LillieTest()`  |
+------------------+-------------------------------------------+---------------------------+
      

Table: (\#tab:parosminta1) Páros minta vizsgálata


+------------------+-------------------------------------------+---------------------------+
| Cél              | Próba neve                                | R függvény                |
+==================+===========================================+===========================+
| várható érték    | páros t-próba                             | `t.test(paired=T)`        |
+------------------+-------------------------------------------+---------------------------+
| medián           | páros előjel-próba                        | `BSDA::SIGN.test()`       |
+------------------+-------------------------------------------+---------------------------+
|                  | páros Wilcoxon-próba                      | `wilcox.test(paired=T)`   |
+------------------+-------------------------------------------+---------------------------+
| variancia        |                                           | `var.test()`              |
+------------------+-------------------------------------------+---------------------------+
| valószínűség     | McNemar-próba                             | `mcnemar.test()`          |
+------------------+-------------------------------------------+---------------------------+
|                  | Cohran-Q próba                            | `mcnemar.test()`          |
+------------------+-------------------------------------------+---------------------------+



Table: (\#tab:ketminta1) Két független minta vizsgálata


+------------------+-------------------------------------------+---------------------------+
| Cél              | Próba neve                                | R függvény                |
+==================+===========================================+===========================+
| várható érték    | kétmintás u-próba                         | `BSDA::z.test()`          |
+------------------+-------------------------------------------+---------------------------+
|                  | kétmintás t-próba                         | `t.test()`                |
+------------------+-------------------------------------------+---------------------------+
|                  | Welch-féle d-próba                        | `t.test(var.equal=F)`     |
+------------------+-------------------------------------------+---------------------------+
| medián           | Mann--Whitney-próba                       | `wilcox.test()`           |
+------------------+-------------------------------------------+---------------------------+
| variancia        | F-próba                                   | `var.test()`              |
+------------------+-------------------------------------------+---------------------------+
| valószínűség     | khí-négyzet próba                         | `chisq.test()`            |
+------------------+-------------------------------------------+---------------------------+
|                  | Fisher-féle egzakt próba                  | `fisher.test()`           |
+------------------+-------------------------------------------+---------------------------+



Table: (\#tab:tobbosszeminta1) Több összetartozó minta vizsgálata


+------------------+-----------------------------+--------------------+
| Cél              | Próba neve                  | R függvény         |
+==================+=============================+====================+
| várható érték    | egyszempontos összetartozó\ | `ez::ezANOVA()`    |
|                  | mintás varianciaelemzés     |                    |
+------------------+-----------------------------+--------------------+
| medián           | Friedman-próba              | `friedman.test()`  |
+------------------+-----------------------------+--------------------+



Table: (\#tab:tobbminta1) Több független minta vizsgálata

+------------------+-------------------------------------------+---------------------------+
| Cél              | Próba neve                                | R függvény                |
+==================+===========================================+===========================+
| várható érték    | egyszempontos varianciaelemzés            | `aov()`                   |
+------------------+-------------------------------------------+---------------------------+
|                  | Welch-féle egyszempontos varianciaelemzés | `oneway.test(var.equal=F)`|
+------------------+-------------------------------------------+---------------------------+
| medián           | Kruskal--Wallis-próba                     | `kruskal.test()`          |
+------------------+-------------------------------------------+---------------------------+
| variancia        | Levene-próba                              | `DescTools::LeveneTest()` |
+------------------+-------------------------------------------+---------------------------+
|                  | Bartlett-próba                            | `bartlett.test()`         |
+------------------+-------------------------------------------+---------------------------+




<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>Ebben a részben rövid áttekintést adtunk a könyv 10. fejezetében sorra kerülő statisztikai próbákról. Megneveztük a próbákat, R parancsokkal szemléltettük használatukat, valamint jeleztük a céljukat. A táblázatok áttekintésével képet kaphatunk arról, hogy a későbbiekben milyen jellegű statisztikai következtetéseket tudunk levonni az R használatával.</p>
</div>







\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
**Feladatok**
  
1. Minden statisztikai próba esetében négy dolgot érdemes tudni: (1) a statisztikai próba neve, (2) null- és ellenhipotézise, (3) alkalmazási feltételei, és (4) a próba végrehajtásának módja valamely statisztikai programcsomagban. A 10. fejezetben a statisztikai próbák végrehajtását természetesen R-beli eszközökkel mutatjuk be. Ismerjük a fenti táblázatokban megnevezett próbák null- és ellenhipotézisét, valamint az alkalmazási feltételeit? Próbáljuk ezeket felidézni! Hol találunk ezekről információt?
1. Mely próbák maradtak ki ebből a könyvből? Hol találunk ezek R-beli végrehajtására példát? 
  </div>\EndKnitrBlock{rmdexercise}


