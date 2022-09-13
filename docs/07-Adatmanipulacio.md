# Adatmanipuláció {#adatmanipulacio}

<img src="images/ch_07_small.png" width="70%" style="display: block; margin: auto;" />


## Adatkezelés az Alap R-ben


\BeginKnitrBlock{rmdlevel1}<div class="rmdlevel1">
Ebben a fejezetben:
  </div>\EndKnitrBlock{rmdlevel1}


Ebben a fejezetben az adattáblák manipulációját tekintjük át, melyek az adatkezelés szempontjából a legfontosabb R objektumok. Mint korábban láttuk, a mátrixhoz hasonlóan sorokat és oszlopokat tartalmaz, illetve a listához hasonlóan elemekből, méghozzá azonos hosszúságú oszlopvektorokból épül fel (\@ref(fig:adatszerkezetek-1). ábra). Az adattábla kettős eredete jelentősen megkönnyíti az ilyen adatok kezelését.

Az adattábla sorai egyedekre (személyek, tárgyak, dolgok stb.) vonatkozó megfigyelések, az oszlopok pedig a megfigyelt tulajdonságok. A statisztikához közelebbi fogalmakkal, az adattáblában az adatmátrixunkat/többdimenziós mintánkat rögzíthetjük, a sorok a mintaelemek, az oszlopok a megfigyelt változók.

Az adattábla inhomogén adatszerkezet, oszlopai különböző típusú adatokat is tartalmazhatnak. Jellemzően kvalitatív (nominális és ordinális skálán mért) adatok tárolására a faktort használjuk, kvantitatív (intervallum és arányskálán mért) adatok tárolására a numerikus vektort. Természetesen adattáblában karakteres és logikai vektorok is szerepelhetnek, sőt dátumokat és időpontokat is kezelhetünk az adattáblában.


### Információ megtekintése

Az adatbázis beolvasása (\@ref(#beolvasas)) után következik az információk begyűjtése a beolvasott adatokról. A legfontosabb információkérő függvényeket a \@ref(tab:infofuggvenyek) táblázat tartalmazza. Az információ megszerzésének célja az egyszerű tájékozódáson kívül a beolvasás helyességének ellenőrzése: rendelkezésre áll-e a kívánt sor- és oszlopszám, az oszlopnevek rendben vannak-e, a numerikusnak szánt változók valóban számokat tartalmaznak-e és a karakteres oszlopokban az esetleges magyar ékezetek rendben megjelennek-e.


<table class="table table-striped table-hover" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:infofuggvenyek)Információt kérő függvények</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Függvény </th>
   <th style="text-align:left;"> Leírás </th>
   <th style="text-align:left;"> Példa </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">str(object)</span> </td>
   <td style="text-align:left;"> szerkezet kiírása </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">str(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">dim(x)</span> </td>
   <td style="text-align:left;"> x dimenziói </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">dim(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">nrow(x)</span> </td>
   <td style="text-align:left;"> x sorainak száma </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">nrow(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">ncol(x)</span> </td>
   <td style="text-align:left;"> x oszlopainak száma </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">ncol(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">names(x)</span> </td>
   <td style="text-align:left;"> x elemeinek neve </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">names(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">colnames(x)</span> </td>
   <td style="text-align:left;"> x oszlopnevei </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">colnames(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">rownames(x)</span> </td>
   <td style="text-align:left;"> x sornevei </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">rownames(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">head(x,n=6)</span> </td>
   <td style="text-align:left;"> x első sorai </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">head(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">tail(x,n=6)</span> </td>
   <td style="text-align:left;"> x utolsó sorai </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">tail(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">View(x)</span> </td>
   <td style="text-align:left;"> x teljes tartalma </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">View(df)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">class(x)</span> </td>
   <td style="text-align:left;"> x típusa </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">class(df);class(df\$oszlop)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">length(x)</span> </td>
   <td style="text-align:left;"> x hossza </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">length(df);length(df\$oszlop)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">unique(x)</span> </td>
   <td style="text-align:left;"> x különböző értékei </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">unique(df\$oszlop)</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">table(...,useNA)</span> </td>
   <td style="text-align:left;"> gyakorisági tábla </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">table(df\$oszlop,useNA='ifany')</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">summary(object)</span> </td>
   <td style="text-align:left;"> leíró adatok </td>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">summary(df);summary(df\$oszlop)</span> </td>
  </tr>
</tbody>
</table>


Az adatelemzési munkánk során a beolvasás előtt már sok ismeretünk összegyűlt az adatbázisról, de most tegyünk úgy, mintha egy ismeretlen `flow.xlsx` adatbázist kellene felfedeznünk.


```r
flow <- rio::import(file = "adat/flow.xlsx") # beolvasás
str(flow)    # a teljes szerkezet
#> 'data.frame':	100 obs. of  25 variables:
#>  $ alkatoi.tev    : chr  "Igen" "Igen" "Nem" "Nem" ...
#>  $ kor            : num  26 20 22 21 21 25 53 21 22 21 ...
#>  $ nem            : chr  "Férfi" "Nő" "Nő" "Férfi" ...
#>  $ csaladi.allapot: chr  "Egyedülálló" "Egyedülálló" "Élettársi kapcsolatban él" "Egyedülálló" ...
#>  $ isk.vegz       : chr  "Egyetem" "Gimnázium" "Gimnázium" "Gimnázium" ...
#>  $ flow.1         : num  2 4 4 3 5 5 5 4 5 5 ...
#>  $ flow.2         : num  4 4 4 4 5 5 5 4 4 5 ...
#>  $ flow.3         : num  5 5 3 3 5 5 3 4 4 5 ...
#>  $ flow.4         : num  5 5 4 4 2 5 3 4 5 5 ...
#>  $ flow.5         : num  5 5 5 3 3 5 5 5 5 5 ...
#>  $ flow.6         : num  1 4 2 3 4 1 3 2 2 4 ...
#>  $ flow.7         : num  2 4 1 4 4 3 5 3 5 5 ...
#>  $ flow.8         : num  4 5 4 4 4 5 4 4 5 5 ...
#>  $ flow.9         : num  5 5 3 4 5 5 3 4 5 5 ...
#>  $ flow.10        : num  4 5 4 3 5 5 5 4 4 5 ...
#>  $ flow.11        : num  4 5 2 3 5 5 3 3 5 5 ...
#>  $ flow.12        : num  4 4 1 3 4 5 5 4 5 5 ...
#>  $ flow.13        : num  5 4 2 4 5 3 5 4 5 5 ...
#>  $ flow.14        : num  3 4 2 4 5 5 3 3 5 5 ...
#>  $ flow.15        : num  3 5 3 4 4 5 5 4 5 5 ...
#>  $ flow.16        : num  3 3 3 3 4 2 4 2 3 5 ...
#>  $ flow.17        : num  4 5 3 4 3 2 4 4 5 5 ...
#>  $ flow.18        : num  5 5 4 4 2 5 5 5 5 5 ...
#>  $ flow.19        : num  4 5 4 2 5 5 5 2 5 5 ...
#>  $ flow.20        : num  3 4 1 2 4 5 1 2 3 5 ...
class(flow)  # típus                
#> [1] "data.frame"
dim(flow)    # sor- és oszlopszám
#> [1] 100  25
```

A fenti sorok után világossá válik, hogy egy 100 sort és 25 oszlopot tartalmazó *adattábla* (*data frame*) áll rendelkezésre. Az oszlopnevek a `names()`\index{names()} és a `colnames()`\index{colnames()} függvényekkel is megismerhetők


```r
names(flow)[1:4]    # az első 4 oszlop neve
#> [1] "alkatoi.tev"     "kor"             "nem"             "csaladi.allapot"
colnames(flow)[5:8] # a következő 4 oszlop neve
#> [1] "isk.vegz" "flow.1"   "flow.2"   "flow.3"
```

Az oszlopnevek viszonylag beszédesek, de jobban is megismerhetjük ezeket a változókat.


```r
class(flow$alkatoi.tev)   # az alkotoi.tev változó típusa
#> [1] "character"
unique(flow$alkatoi.tev)  # egyedi értékei
#> [1] "Igen" "Nem"
table(flow$alkatoi.tev, useNA = "ifany") # gyakorisági táblázata
#> 
#> Igen  Nem 
#>   39   61
class(flow$kor)                          # a kor változó típusa
#> [1] "numeric"
table(flow$kor, useNA = "ifany")         # gyakorisági táblázata
#> 
#> 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 36 39 40 42 43 45 50 51 52 53 
#>  1  2  2  4 22 18  4  4  3  5  4  1  2  1  1  1  1  1  2  1  1  3  3  4  5  3 
#> 69 
#>  1
```

Az adatbázis tetszőleges részét megjeleníthetjük a konzolban a szokásos indexelés segítségével:

```markdown
d.df[sorindex, oszlopindex]
```

Például 4 sorból az első 5 oszlopot így tekinthetjük meg: 


```r
flow[c(1:2, 50:51), 1:5]
#>    alkatoi.tev kor   nem csaladi.allapot  isk.vegz
#> 1         Igen  26 Férfi     Egyedülálló   Egyetem
#> 2         Igen  20    Nő     Egyedülálló Gimnázium
#> 50         Nem  22    Nő     Egyedülálló Gimnázium
#> 51        Igen  39    Nő           Házas   Egyetem
```


Ne feledjük, hogy az *RStudio*-ban az `Environment` fülön is megjelenik a `flow` adatbázis a sikeres beolvasás után. Kattintva a neven a teljes adatbázist áttekinthetjük a bal felső részben (ezt a `View(flow)` paranccsal is kezdeményezhetjük), de a `flow` előtti ikonon kattintva megjeleníthetjük az adatbázis `str()`-ból ismert szerkezete is.

További kényelmi lehetőség, ha a *tibble* típus kényelmes megjelenítését is kihasználjuk. Ehhez konvertáljuk át az adattáblánkat *tibble* típusúvá, és egyszerűen jelenítsük meg az objektumot:


```r
library(tidyverse)
flow.tbl <- as_tibble(flow) # tibble típusú adatbázis létrehozása
flow.tbl                    # kényelmes megjelenítés
#> # A tibble: 100 × 25
#>    alkat…¹   kor nem   csala…² isk.v…³ flow.1 flow.2 flow.3 flow.4 flow.5 flow.6
#>    <chr>   <dbl> <chr> <chr>   <chr>    <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#>  1 Igen       26 Férfi Egyedü… Egyetem      2      4      5      5      5      1
#>  2 Igen       20 Nő    Egyedü… Gimnáz…      4      4      5      5      5      4
#>  3 Nem        22 Nő    Élettá… Gimnáz…      4      4      3      4      5      2
#>  4 Nem        21 Férfi Egyedü… Gimnáz…      3      4      3      4      3      3
#>  5 Igen       21 Nő    Egyedü… Gimnáz…      5      5      5      2      3      4
#>  6 Igen       25 Nő    Elvált  Egyetem      5      5      5      5      5      1
#>  7 Nem        53 Nő    Özvegy  Gimnáz…      5      5      3      3      5      3
#>  8 Nem        21 Nő    Egyedü… Gimnáz…      4      4      4      4      5      2
#>  9 Nem        22 Nő    Élettá… Gimnáz…      5      4      4      5      5      2
#> 10 Nem        21 Nő    Egyedü… Gimnáz…      5      5      5      5      5      4
#> # … with 90 more rows, 14 more variables: flow.7 <dbl>, flow.8 <dbl>,
#> #   flow.9 <dbl>, flow.10 <dbl>, flow.11 <dbl>, flow.12 <dbl>, flow.13 <dbl>,
#> #   flow.14 <dbl>, flow.15 <dbl>, flow.16 <dbl>, flow.17 <dbl>, flow.18 <dbl>,
#> #   flow.19 <dbl>, flow.20 <dbl>, and abbreviated variable names ¹​alkatoi.tev,
#> #   ²​csaladi.allapot, ³​isk.vegz
#> # ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names
```


### Oszlopok kezelése

#### Oszlopnevek módosítása

A sikeres beolvasás és a szükséges tájékozódás után az oszlopnevek áttekintése és esetleges módosítása a következő lépés. Ez kulcsfontosságú a további munka szempontjából, ugyanis a jól megválasztott változónevek jelentősen meggyorsíthatják a további munkát, és fordítva, a kevésbe beszédes, következetlen, a túl rövid vagy túl hosszú változónevek akadályozhatják a sikeres adatelemzést. A változónevek mindig legyenek beszédesek, csak az angol ábécé kisbetűit és számjegyeket használjunk, több részből álló neveket aláhúzással (`_`) esetleg ponttal (`.`) tagoljuk ([R kódolási stílus](https://style.tidyverse.org/syntax.html)).

Egy adattábla oszlopait a `names()` vagy `colnames()`, a sorait a `rownames()` függvény használatával kérdezhetjük le és nevezhetjük át. A sornevek egymástól különböző, karakteres vagy numerikus egész értékek lehetnek, míg az oszlopnevek csak karakteres adatok. 

Az oszlopnevek módosításának több oka lehet. Példánkban magyar változónevekre váltunk, de sokszor rövidítjük vagy beszédesebbé tesszük az oszlopaink nevét. 


```r
bandak <- rio::import(file = "adat/metal_bandak.xlsx")
bandak
#>       banda  fan formed split      origin
#> 1     Kiuas  106   2000  2013  Finnország
#> 2    Accept  681   1968  <NA> Németország
#> 3 Metallica 4122   1981  <NA>         USA
#> 4    Zonata   23   1998  2003  Svédország
#> 5   Therion 1266   1987  <NA>  Svédország
names(bandak)                     # az összes oszlop neve 
#> [1] "banda"  "fan"    "formed" "split"  "origin"
names(bandak)[2] <- "rajongo"     # 2. oszlop nevének átírása
names(bandak)[3:5] <- c("alakulas","felbomlas","orszag") # 3-5. oszlopok átnevezése
names(bandak)[names(bandak)=="banda"] <- "nev" # a "banda" nevű oszlop átnevezése
bandak
#>         nev rajongo alakulas felbomlas      orszag
#> 1     Kiuas     106     2000      2013  Finnország
#> 2    Accept     681     1968      <NA> Németország
#> 3 Metallica    4122     1981      <NA>         USA
#> 4    Zonata      23     1998      2003  Svédország
#> 5   Therion    1266     1987      <NA>  Svédország
```


#### Oszlop indexelése

Az *Alap R*-ben az oszlopok indexelése a `[` vagy `[[` operátor segítségével történhet. Mivel az adattáblák örökölték a kétdimenziós mátrix és az egydimenziós lista adatszerkezet indexelési lehetőségeit, így az oszlopokra négyféle módon hivatkozhatunk:

```markdown
adattábla[,oszlopindex]  # hivatkozás egy vagy több oszlopra
adattábla[oszlopindex]   # hivatkozás egy vagy több oszlopra
adattábla[[oszlopnév]]   # hivatkozás egyetlen oszlopra
adattábla$oszlopnév      # hivatkozás egyetlen oszlopra
```

Az fenti példa első sorában mátrixszerűen, második sorában listaszerűen indexelünk. A továbbiakban a mátrixszerű, azaz vesszőt tartalmazó hivatkozást használjuk. Az oszlopindex lehet numerikus vektor pozitív vagy negatív értékekkel, karakteres vektor, vagy akár logikai vektor is. Ha csak egyetlen oszlopra vagyunk kíváncsiak, akkor a `[[` vagy még gyakrabban a `$` operátort használjuk az oszlop nevének megadásával.

Az oszlopok elérése mindennapos a statisztikai munka során, így ezeket az indexelési formákat ismernünk kell. 


```r
mean(flow$kor, na.rm=T)           # kor átlaga
#> [1] 29.26
summary(flow[c("kor", "flow.1")]) # kor és flow.1 leíró statisztikai adatai
#>       kor           flow.1    
#>  Min.   :17.0   Min.   :1.00  
#>  1st Qu.:21.0   1st Qu.:3.00  
#>  Median :23.0   Median :4.00  
#>  Mean   :29.3   Mean   :4.01  
#>  3rd Qu.:33.0   3rd Qu.:5.00  
#>  Max.   :69.0   Max.   :5.00
# "flow" szót tartalmazó oszlopok száma
ncol(flow[grepl(pattern = "flow", names(flow))]) 
#> [1] 20
```

Ne feledjük, hogy mátrixszerű indexelés során is kaphatunk egydimenziós eredményt, hiszen ha egyetlen oszlopra hivatkozunk, akkor a `[` operátor automatikusan az egydimenziós vektorra vált a kétdimenziós adattábla helyett. Ezt a `drop=F` használatával akadályozhatjuk meg.


```r
flow[1:3, c("kor", "nem")] # két oszlop, nincs dimenzióvesztés
#>   kor   nem
#> 1  26 Férfi
#> 2  20    Nő
#> 3  22    Nő
flow[1:3, "kor"]           # egy oszlop, dimenzióvesztés
#> [1] 26 20 22
flow[1:3, "kor", drop=F]   # egy oszlop, nincs dimenzióvesztés
#>   kor
#> 1  26
#> 2  20
#> 3  22
```

#### Oszlopok sorrendje

Ha már jól ismerjük az oszlopok indexelését, akkor számos további műveletre nyílik lehetőség. Ezek közül a legegyszerűbb az oszlopok sorrendjének megváltoztatása. Ha az oszlopindex hivatkozásai az eredeti oszlopsorrendtől eltérnek, akkor máris új oszlopsorrendet határoztunk meg.


```r
# a korábbi 1. oszlop (alkotoi.tev) átkerül a 3. oszlopba
flow <- flow[, c(2, 3, 1, 4:25)] 
flow[1:2, 1:3]
#>   kor   nem alkatoi.tev
#> 1  26 Férfi        Igen
#> 2  20    Nő        Igen
```

Természetesen oszlopsorszámok helyett változóneveket is használhatunk.


```r
bandak
#>         nev rajongo alakulas felbomlas      orszag
#> 1     Kiuas     106     2000      2013  Finnország
#> 2    Accept     681     1968      <NA> Németország
#> 3 Metallica    4122     1981      <NA>         USA
#> 4    Zonata      23     1998      2003  Svédország
#> 5   Therion    1266     1987      <NA>  Svédország
# a rajongo oszlop a végére kerül
bandak <- bandak[,c("nev", "alakulas", "felbomlas", "orszag", "rajongo")]
bandak
#>         nev alakulas felbomlas      orszag rajongo
#> 1     Kiuas     2000      2013  Finnország     106
#> 2    Accept     1968      <NA> Németország     681
#> 3 Metallica     1981      <NA>         USA    4122
#> 4    Zonata     1998      2003  Svédország      23
#> 5   Therion     1987      <NA>  Svédország    1266
```


#### Oszlopok létrehozása és törlése

Láttuk korábban, hogy a `cbind()` segítségével oszlopokat adhatunk a meglévő adatbázisunkhoz. Például a meglévő `bandak` adatbázishoz adjunk hozzá egy kétoszlopos új adatbázist, amely a bandák Wikipédia oldalának címét, és egy szubjektív rangsort tartalmaz.


```r
bandak.kieg <- data.frame(wikipedia=c("https://en.wikipedia.org/wiki/Kiuas",
                                      "https://hu.wikipedia.org/wiki/Accept",
                                      "https://hu.wikipedia.org/wiki/Metallica",
                                      "https://en.wikipedia.org/wiki/Zonata",
                                      "https://en.wikipedia.org/wiki/Therion_(band)"),
                          rangsor=c(2,4,1,3,5))
bandak.2 <- cbind(bandak, bandak.kieg)
str(bandak.2)
```

Egyetlen oszlop beszúrására is van lehetőségünk, és hasonlóan törölhetünk egyetlen oszlopot is:

```markdown
adattábla$új.oszlopnév       # új oszlop beszúrása a dataframe végére
adattábla$oszlopnév <- NULL  # oszlop törlése
```

Szúrjuk be a rangsor változót az eredeti `bandak` adatbázisba, majd távolítsuk el.


```r
bandak$rangsor <- c(2,4,1,3,5)  # új oszlop beszúrása
bandak$rangsor <- NULL          # oszlop törlése
```


#### Típuskonverzió

Az oszlopok nevének és sorrendjének optimális beállítása után meg kell vizsgálnunk, hogy az oszlopaink típusa megfelel-e az általa reprezentált statisztikai változók mérési skálájának. Nem léphetünk tovább az elemzés felé, amíg ez az összefüggés nem teljesül.


+-----------------------------+--------------------------------+
| Változó mérési skálája      | R típus                        |
+=============================+================================+
| nominális                   | faktor                         |
+-----------------------------+--------------------------------+
| ordinális                   | faktor (rendezett)             |
+-----------------------------+--------------------------------+
| intervallum                 | numerikus vektor               |
+-----------------------------+--------------------------------+
| arány                       | numerikus vektor               |
+-----------------------------+--------------------------------+



+------------------+------------------------------------+--------------------------------+
| Cél mérési skála |    Típuskonverzió                  | R függvény                     |
+==================+====================================+================================+
| - nominális      | - numerikusból faktor              | - `factor(x)`                  |
|                  | - karakteresből faktor             |                                |
+------------------+------------------------------------+--------------------------------+
| - ordinális      | - numerikusból faktor (rendezett)  | - `ordered(x)`                 |
|                  | - karakteresből faktor (rendezett) |                                |
+------------------+------------------------------------+--------------------------------+
| - intervallum    | - karakteresből numerikus          | - `as.numeric(x)`              |
| - arány          | - faktorból numerikus              | - `as.numeric(as.character(x))`|
+------------------+------------------------------------+--------------------------------+



A típuskonverzió két leggyakoribb esetével foglalkozunk itt. Az egyik faktorrá konvertálás teszi a típuskonverziók legnagyobb részét. Ezt a `factor()` függvénnyel végezzük el. A kiinduló változónk lehet numerikus vagy karakteres. 


```r
factor(c(1, 1, 2, 1, 1, 1, 2))
#> [1] 1 1 2 1 1 1 2
#> Levels: 1 2
factor(c("Dohányzik", "Dohányzik", "Nem dohányzik"))
#> [1] Dohányzik     Dohányzik     Nem dohányzik
#> Levels: Dohányzik Nem dohányzik
```

Mindkét esetben előfordulhat, hogy a kiinduló változóban lévő egyedi numerikus értékek 

A numerikus típuskonverzió kevésbé gyakori, de előfordulhat.

Például 



```r
kor <- c(44, 39, "55 év", 38)
kor[3] <- "55"
as.numeric(kor)
#> [1] 44 39 55 38
```



#### Transzformáció

Számos esetben szükség lehet az adattábla oszlopaiban lévő értéke átalakítására (transzformálására). Az értékeket vagy helyben (ugyanabban az oszlopban) változtatjuk meg, vagy új oszlopként szúrjuk be az adattáblába.
Adatok transzformálásához tekintsük a women adattáblát, amely a weight változójában font-ban mért értékeket tartalmaz. Ezt alakítsuk át kg-ban mért adatokká egy új oszlopban:

  

```r
data(women); women
#>    height weight
#> 1      58    115
#> 2      59    117
#> 3      60    120
#> 4      61    123
#> 5      62    126
#> 6      63    129
#> 7      64    132
#> 8      65    135
#> 9      66    139
#> 10     67    142
#> 11     68    146
#> 12     69    150
#> 13     70    154
#> 14     71    159
#> 15     72    164
```


```r
women$suly<-round(women$weight*0.45)
women
#>    height weight suly
#> 1      58    115   52
#> 2      59    117   53
#> 3      60    120   54
#> 4      61    123   55
#> 5      62    126   57
#> 6      63    129   58
#> 7      64    132   59
#> 8      65    135   61
#> 9      66    139   63
#> 10     67    142   64
#> 11     68    146   66
#> 12     69    150   68
#> 13     70    154   69
#> 14     71    159   72
#> 15     72    164   74
```

Ugyanezt az eredményt a transform() függvény segítségével is elérhetjük, ahol a subset()-hez hasonlóan némileg egyszerűbben hivatkozhatunk az adattábla változóira. Most alakítsuk át height változót inch-ről cm-re.


```r
transform(women, magassag=round(height*2.45))
#>    height weight suly magassag
#> 1      58    115   52      142
#> 2      59    117   53      145
#> 3      60    120   54      147
#> 4      61    123   55      149
#> 5      62    126   57      152
#> 6      63    129   58      154
#> 7      64    132   59      157
#> 8      65    135   61      159
#> 9      66    139   63      162
#> 10     67    142   64      164
#> 11     68    146   66      167
#> 12     69    150   68      169
#> 13     70    154   69      172
#> 14     71    159   72      174
#> 15     72    164   74      176
```

Amennyiben a fenti példákban nem új változónevek az átalakítás célpontjai, hanem már létező oszlopok, akkor helyben végezzük a transzformációt:
  

```r
transform(women, height=height-10)
#>    height weight suly
#> 1      48    115   52
#> 2      49    117   53
#> 3      50    120   54
#> 4      51    123   55
#> 5      52    126   57
#> 6      53    129   58
#> 7      54    132   59
#> 8      55    135   61
#> 9      56    139   63
#> 10     57    142   64
#> 11     58    146   66
#> 12     59    150   68
#> 13     60    154   69
#> 14     61    159   72
#> 15     62    164   74
```


A változók átalakításának másik gyakori esete, amikor az eredetileg folytonos változót kategórikus változóvá alakítjuk. A `cut()` függvény segítségével numerikus vektorból faktort állíthatunk elő.


```r
cut(1:10,3)
#>  [1] (0.991,4] (0.991,4] (0.991,4] (0.991,4] (4,7]     (4,7]     (4,7]    
#>  [8] (7,10]    (7,10]    (7,10]   
#> Levels: (0.991,4] (4,7] (7,10]
```


A fenti példában a 10 elemű bemenő vektortból 3 szintű faktort hoztunk létre. Ha az intervallumok határát magunk szeretnénk megadni, akkor a második (breaks) argumentumban egy vektort kell megadnunk:


```r
cut(1:10,breaks=c(0,2,10))
#>  [1] (0,2]  (0,2]  (2,10] (2,10] (2,10] (2,10] (2,10] (2,10] (2,10] (2,10]
#> Levels: (0,2] (2,10]
```

A létrejövő faktor szintjei az intervallumok leírásaiból állnak, természetesen ezeket megvaáltoztathatjuk, csak a `labels=` paramétert kell használnunk:


```r
cut(1:10,breaks=c(0,2,7,10),label=c("gyenge","közepes","erős"))
#>  [1] gyenge  gyenge  közepes közepes közepes közepes közepes erős    erős   
#> [10] erős   
#> Levels: gyenge közepes erős
```

Adattáblák esetében a `cut()` függvény használatára láthatunk egy példát:

  
  

```r
transform(women,height=cut(height,breaks=c(0,60,70,100),labels=c("alacsony","közepes","magas")))
#>      height weight suly
#> 1  alacsony    115   52
#> 2  alacsony    117   53
#> 3  alacsony    120   54
#> 4   közepes    123   55
#> 5   közepes    126   57
#> 6   közepes    129   58
#> 7   közepes    132   59
#> 8   közepes    135   61
#> 9   közepes    139   63
#> 10  közepes    142   64
#> 11  közepes    146   66
#> 12  közepes    150   68
#> 13  közepes    154   69
#> 14    magas    159   72
#> 15    magas    164   74
```


car csomag recode() függvénye


#### Faktor változó összefoglalás


#### Numerikus változó összefoglalás


### Sorok kezelése


Sokszor előfordul, hogy egy adattábla valamely változójának értékeivel szeretnénk a sorokat elnevezni, illetve fordítva, az adattábla sorneveit oszlopvektorban szeretnénk látni. A **fivethirtyeight** csomag `unisex_names` adattáblája adattábla állományból történő beolvasása során a read.table() függvényben a ”row.names=n” argumentum megadásával a szöveges állomány n. oszlopából nyerjük a sorok neveit.
Az mtcars adattábla sorneveit a következő parancs segítségével vihetjük be változóba:



```r
data(unisex_names, package = "fivethirtyeight")
head(unisex_names)
#> # A tibble: 6 × 5
#>   name     total male_share female_share    gap
#>   <chr>    <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Casey  176544.      0.584        0.416 0.169 
#> 2 Riley  154861.      0.508        0.492 0.0153
#> 3 Jessie 136382.      0.478        0.522 0.0443
#> 4 Jackie 132929.      0.421        0.579 0.158 
#> 5 Avery  121797.      0.335        0.665 0.330 
#> 6 Jaime  109870.      0.562        0.438 0.124
```



```r
rownames(unisex_names) <- unisex_names$name
head(unisex_names)
#> # A tibble: 6 × 5
#>   name     total male_share female_share    gap
#>   <chr>    <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Casey  176544.      0.584        0.416 0.169 
#> 2 Riley  154861.      0.508        0.492 0.0153
#> 3 Jessie 136382.      0.478        0.522 0.0443
#> 4 Jackie 132929.      0.421        0.579 0.158 
#> 5 Avery  121797.      0.335        0.665 0.330 
#> 6 Jaime  109870.      0.562        0.438 0.124
```




```r
mtcars2<-data.frame(name=rownames(mtcars),mtcars,row.names=1:32)
mtcars2[1:10,]
#>                 name  mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1          Mazda RX4 21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> 2      Mazda RX4 Wag 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> 3         Datsun 710 22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> 4     Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#> 5  Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
#> 6            Valiant 18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
#> 7         Duster 360 14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> 8          Merc 240D 24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> 9           Merc 230 22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> 10          Merc 280 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```

A fordított irányhoz a következő parancsot kell használnunk:


```r
mtcars3<-mtcars2                  # új adattábla
rownames(mtcars3)<-mtcars3$name   # sornevek meghatározása
mtcars3<-mtcars3[2:11]            # a felesleges első oszlop törlése
mtcars3[1:10,]
#>                    mpg cyl  disp  hp drat    wt  qsec vs am gear
#> Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4
#> Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4
#> Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4
#> Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3
#> Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3
#> Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3
#> Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3
#> Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4
#> Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4
#> Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4
```

#### Rendezés

A vektorok rendezésénél már megismertük az `order()` függvényt (3.1.8. fejezet), amelyet adattáblák rendezésére is használhatunk. Az mtcars adattábla sorait a fogyasztási adatok (mpg változó) alapján növekvő sorrendbe rendezhetjük, ha a sorok indexelésére az `order()` függvény visszatérési értékét használjuk:



```r
order(mtcars$mpg)
#>  [1] 15 16 24  7 17 31 14 23 22 29 12 13 11  6  5 10 25 30  1  2  4 32 21  3  9
#> [26]  8 27 26 19 28 18 20
```

A fenti indexeket a sorkoordináta helyére írva, megkapjuk a rendezett adattáblát (helytakarékosságból az első 10 sorát írjuk ki):


```r
mtcars[order(mtcars$mpg)[1:10],]
#>                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
#> Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
#> Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
#> Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
#> Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
#> Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
#> AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
#> Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
#> Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
```


Rendezési szempontnak a sorneveket is használhatjuk:



```r
mtcars[order(rownames(mtcars))[1:10],]
#>                     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> AMC Javelin        15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
#> Cadillac Fleetwood 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
#> Camaro Z28         13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
#> Chrysler Imperial  14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
#> Datsun 710         22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> Dodge Challenger   15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
#> Duster 360         14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> Ferrari Dino       19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
#> Fiat 128           32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
#> Fiat X1-9          27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
```


Rendezésnél egynél több változót is figyelembe vehetünk, ekkor az order() függvényben több változónevet kell felsorolnunk vesszővel elválasztva:


```r
mtcars[order(mtcars$mpg,mtcars$disp)[1:10],c("mpg","disp")]
#>                      mpg  disp
#> Lincoln Continental 10.4 460.0
#> Cadillac Fleetwood  10.4 472.0
#> Camaro Z28          13.3 350.0
#> Duster 360          14.3 360.0
#> Chrysler Imperial   14.7 440.0
#> Maserati Bora       15.0 301.0
#> Merc 450SLC         15.2 275.8
#> AMC Javelin         15.2 304.0
#> Dodge Challenger    15.5 318.0
#> Ford Pantera L      15.8 351.0
```


Csökkenő sorrendű rendezéshez használhatjuk az `order()` függvény ”decreasing=TRUE” argumentumát, vagy a rev() függvényt. Több rendezési szempont esetén ha keverni szeretnénk a rendezési irányokatt, akkor numerikus oszlopvektorok előtt a mínusz (-) jellel fordíthatjuk meg a rendezés irányát csökkenőre.



```r
mtcars[order(mtcars$mpg,-mtcars$disp)[1:10],c("mpg","disp")]
#>                      mpg  disp
#> Cadillac Fleetwood  10.4 472.0
#> Lincoln Continental 10.4 460.0
#> Camaro Z28          13.3 350.0
#> Duster 360          14.3 360.0
#> Chrysler Imperial   14.7 440.0
#> Maserati Bora       15.0 301.0
#> AMC Javelin         15.2 304.0
#> Merc 450SLC         15.2 275.8
#> Dodge Challenger    15.5 318.0
#> Ford Pantera L      15.8 351.0
```

### Adattábla szűrése


Sokszor előfordul, hogy az adattábla sorait egy vagy több változó (oszlop) értéke szerint szeretnénk leválogatni. Az adattábla indexelése során a sorkoordináta helyén logikai kifejezést szerepeltetünk. Ha például le szeretnénk kérdezni, azokat a sorokat, amelyekben a fogyásztás értéke kisebb mint 15 mérföld/gallon, akkor a következő logikai kifejezést használhatjuk:

  

```r
mtcars$mpg<15
#>  [1] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
#> [13] FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
#> [25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```


A fenti logikai vekorban pontosan azokban a pozíciókban szerepel TRUE érték, amelyik sorban fogyásztás értéke kisebb mint 15 mérföld/gallon. Ha ezt szerpeltetjük a sorkoordináta helyén, a kívánt sorokhoz jutunk:


```r
mtcars[mtcars$mpg<15,]
#>                      mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> Duster 360          14.3   8  360 245 3.21 3.570 15.84  0  0    3    4
#> Cadillac Fleetwood  10.4   8  472 205 2.93 5.250 17.98  0  0    3    4
#> Lincoln Continental 10.4   8  460 215 3.00 5.424 17.82  0  0    3    4
#> Chrysler Imperial   14.7   8  440 230 3.23 5.345 17.42  0  0    3    4
#> Camaro Z28          13.3   8  350 245 3.73 3.840 15.41  0  0    3    4
```


Több váltózón alapuló feltétel megadásához összetett logikai kifejezést kell írnunk:

  
  

```r
mtcars[mtcars$mpg<15 & mtcars$disp>400,]
#>                      mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> Cadillac Fleetwood  10.4   8  472 205 2.93 5.250 17.98  0  0    3    4
#> Lincoln Continental 10.4   8  460 215 3.00 5.424 17.82  0  0    3    4
#> Chrysler Imperial   14.7   8  440 230 3.23 5.345 17.42  0  0    3    4
```


Adattáblák szűrését egyszerűsíti a subset() függvény, amely az első paraméterében egy adattáblát, második paraméterében pedig a szűrést jelentő logikai kifejezést várja. A fenti szűrés subset() függvény használatával:

  
  

```r
subset(mtcars, mpg<15 & disp>400)
#>                      mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> Cadillac Fleetwood  10.4   8  472 205 2.93 5.250 17.98  0  0    3    4
#> Lincoln Continental 10.4   8  460 215 3.00 5.424 17.82  0  0    3    4
#> Chrysler Imperial   14.7   8  440 230 3.23 5.345 17.42  0  0    3    4
```


A subset() függvény egy select argumentumot is tartalmazhat, melynek sgítségével a szűrés eredményében megjelenő oszlopokat határozhatjuk meg:

  

```r
subset(mtcars, mpg<15 & disp>400, select=c("mpg","disp"))
#>                      mpg disp
#> Cadillac Fleetwood  10.4  472
#> Lincoln Continental 10.4  460
#> Chrysler Imperial   14.7  440
```

### Hiányzó értékeket tatalmazó sorok eltávolítása

Az `NA` értéket is tartalmazó adattáblánkból az na.omit() függvény használatával távolíthatjuk el azokat a sorokat, amelyekben a hiányzó érték előfordul.


```r
data(mtcars)
mtcars[c(2,5,7),1]<-NA
mtcars[1:10,]
#>                    mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> Mazda RX4 Wag       NA   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#> Hornet Sportabout   NA   8 360.0 175 3.15 3.440 17.02  0  0    3    2
#> Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
#> Duster 360          NA   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```



```r
na.omit(mtcars)[1:10,]
#>                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4      21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#> Valiant        18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
#> Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
#> Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
#> Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
#> Merc 450SE     16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
#> Merc 450SL     17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
```






### Adattáblák indexelése

Az adattáblák indexelésére a mátrixok és listák indexelési eljárásait is használhatjuk. A 3.5. fejezetben már áttekintettük az Alap R lehetőségeit. 


```r
data.file <- "https://github.com/abarik/rdata/raw/master/r_alapok/metacritic_games.csv"
library(tidyverse)
d.tbl <- read_delim(file = data.file, delim = ",")
d.tbl
#> # A tibble: 5,699 × 15
#>    game     platf…¹ devel…² genre numbe…³ rating relea…⁴ posit…⁵ neutr…⁶ negat…⁷
#>    <chr>    <chr>   <chr>   <chr> <chr>   <chr>  <chr>     <dbl>   <dbl>   <dbl>
#>  1 Portal 2 PC      Valve … Acti… <NA>    E10+   Apr 18…      51       1       0
#>  2 The Eld… PC      Bethes… Role… No Onl… M      Nov 10…      32       0       0
#>  3 The Leg… 3DS     GREZZO  Misc… No Onl… E10+   Jun 19…      84       1       0
#>  4 Batman:… PC      Rockst… Acti… <NA>    T      Nov 21…      27       0       0
#>  5 Super M… 3DS     Ninten… Acti… No Onl… E      Nov 13…      81       1       0
#>  6 Deus Ex… PC      Nixxes… Acti… No Onl… M      Aug 23…      52       0       0
#>  7 Pushmo   3DS     Intell… Misc… 1 Play… E      Dec  8…      31       0       0
#>  8 Total W… PC      Creati… Stra… Online… T      Mar 15…      62       0       0
#>  9 FIFA So… PC      Electr… Spor… <NA>    E      Sep 27…      14       0       0
#> 10 Battlef… PC      EA DICE Acti… <NA>    M      Oct 25…      60       1       0
#> # … with 5,689 more rows, 5 more variables: positive_users <dbl>,
#> #   neutral_users <dbl>, negative_users <dbl>, metascore <dbl>,
#> #   user_score <dbl>, and abbreviated variable names ¹​platform, ²​developer,
#> #   ³​number_players, ⁴​release_date, ⁵​positive_critics, ⁶​neutral_critics,
#> #   ⁷​negative_critics
d.df <- as.data.frame(d.tbl)
head(d.df)
#>                                      game platform             developer
#> 1                                Portal 2       PC        Valve Software
#> 2             The Elder Scrolls V: Skyrim       PC Bethesda Game Studios
#> 3 The Legend of Zelda: Ocarina of Time 3D      3DS                GREZZO
#> 4                     Batman: Arkham City       PC    Rocksteady Studios
#> 5                     Super Mario 3D Land      3DS              Nintendo
#> 6               Deus Ex: Human Revolution       PC       Nixxes Software
#>              genre        number_players rating release_date positive_critics
#> 1           Action                  <NA>   E10+ Apr 18, 2011               51
#> 2     Role-Playing No Online Multiplayer      M Nov 10, 2011               32
#> 3    Miscellaneous No Online Multiplayer   E10+ Jun 19, 2011               84
#> 4 Action Adventure                  <NA>      T Nov 21, 2011               27
#> 5           Action No Online Multiplayer      E Nov 13, 2011               81
#> 6           Action No Online Multiplayer      M Aug 23, 2011               52
#>   neutral_critics negative_critics positive_users neutral_users negative_users
#> 1               1                0           1700           107             19
#> 2               0                0           1616           322            451
#> 3               1                0            283            20              5
#> 4               0                0            240            34             27
#> 5               1                0            251            39             11
#> 6               0                0            520           112             78
#>   metascore user_score
#> 1        95         90
#> 2        94         82
#> 3        94         90
#> 4        91         87
#> 5        90         84
#> 6        90         85
```





### Válogatás az sorokból


A sorok leválogatatása nagyon fontos eszköz a kezünben ahhoz, hogy az elemzésünket a kívánt mintaelemekkel folytathassuk.

#### Sorok indexelése és a szűrés Alap R-ben

A sorok indexelésére a `[` operátort használhatjuk, a vessző előtti részbe, a sorkoordintátákba írhatunk neumerikus vektort, pozitív és negatív értékekkel, logikai vektort és karakteres vektort, bár ez utóbbi használta nagyon ritkkán fordul elő.

A példákhoz a **fivethirtyeight** csomag `unisex_names` adattáblájából indulunk ki, amely amerikában használt uniszex neveket tartalmaz.


```r
data("unisex_names", package = "fivethirtyeight")
unisex_names
#> # A tibble: 919 × 5
#>    name      total male_share female_share    gap
#>    <chr>     <dbl>      <dbl>        <dbl>  <dbl>
#>  1 Casey   176544.      0.584        0.416 0.169 
#>  2 Riley   154861.      0.508        0.492 0.0153
#>  3 Jessie  136382.      0.478        0.522 0.0443
#>  4 Jackie  132929.      0.421        0.579 0.158 
#>  5 Avery   121797.      0.335        0.665 0.330 
#>  6 Jaime   109870.      0.562        0.438 0.124 
#>  7 Peyton   94896.      0.434        0.566 0.133 
#>  8 Kerry    88964.      0.484        0.516 0.0321
#>  9 Jody     80401.      0.352        0.648 0.296 
#> 10 Kendall  79211.      0.372        0.628 0.255 
#> # … with 909 more rows
```

A sorkoordinátákba írjuk a sorok válogatását biztosító lehetőségeket:


```r
unisex_names[2, ]
#> # A tibble: 1 × 5
#>   name    total male_share female_share    gap
#>   <chr>   <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Riley 154861.      0.508        0.492 0.0153
unisex_names[1:3, ]
#> # A tibble: 3 × 5
#>   name     total male_share female_share    gap
#>   <chr>    <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Casey  176544.      0.584        0.416 0.169 
#> 2 Riley  154861.      0.508        0.492 0.0153
#> 3 Jessie 136382.      0.478        0.522 0.0443
unisex_names[-(1:3), ]
#> # A tibble: 916 × 5
#>    name      total male_share female_share    gap
#>    <chr>     <dbl>      <dbl>        <dbl>  <dbl>
#>  1 Jackie  132929.      0.421        0.579 0.158 
#>  2 Avery   121797.      0.335        0.665 0.330 
#>  3 Jaime   109870.      0.562        0.438 0.124 
#>  4 Peyton   94896.      0.434        0.566 0.133 
#>  5 Kerry    88964.      0.484        0.516 0.0321
#>  6 Jody     80401.      0.352        0.648 0.296 
#>  7 Kendall  79211.      0.372        0.628 0.255 
#>  8 Payton   64152.      0.334        0.666 0.331 
#>  9 Skyler   53486.      0.646        0.354 0.292 
#> 10 Frankie  51288.      0.624        0.376 0.247 
#> # … with 906 more rows
```

A `head()` és `tail()` függvény is a sorokból válogat, az első 6, illetve utolsó 3 sort így kaphatjuk meg: 


```r
head(unisex_names, n = 6)
#> # A tibble: 6 × 5
#>   name     total male_share female_share    gap
#>   <chr>    <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Casey  176544.      0.584        0.416 0.169 
#> 2 Riley  154861.      0.508        0.492 0.0153
#> 3 Jessie 136382.      0.478        0.522 0.0443
#> 4 Jackie 132929.      0.421        0.579 0.158 
#> 5 Avery  121797.      0.335        0.665 0.330 
#> 6 Jaime  109870.      0.562        0.438 0.124
tail(unisex_names, n = 3)
#> # A tibble: 3 × 5
#>   name   total male_share female_share    gap
#>   <chr>  <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Gwin    101.      0.562        0.438 0.124 
#> 2 Yacine  100.      0.545        0.455 0.0892
#> 3 Aeon    100.      0.465        0.535 0.0703
```


Bizonyos esetekben szükség lehet az adattábla soraiból véletlen módon néhányat kiválasztani. Ekkor a `sample()` függvényt használjuk:


```r
unisex_names[sample(x = 1:nrow(unisex_names), size = 10), ]
#> # A tibble: 10 × 5
#>    name    total male_share female_share    gap
#>    <chr>   <dbl>      <dbl>        <dbl>  <dbl>
#>  1 Amarri   438.      0.515        0.485 0.0292
#>  2 Wisdom   910.      0.464        0.536 0.0719
#>  3 Lennie  3533.      0.554        0.446 0.108 
#>  4 Hadyn    926.      0.545        0.455 0.0910
#>  5 Mell     197.      0.639        0.361 0.278 
#>  6 Toryn    442.      0.485        0.515 0.0304
#>  7 Schylar  327.      0.336        0.664 0.329 
#>  8 Child    130.      0.595        0.405 0.190 
#>  9 Laramie 1595.      0.564        0.436 0.129 
#> 10 Kadian   125.      0.349        0.651 0.302
```

A `sample()` függvény alapértelmezés szerint visszatevés nélküli választ véletlen értékeket az első paraméterből (esetünkben 919 számból 10-et), de ha a `replace=TRUE` argumentumot használjuk, akkor visszatevéssel fog választani:


```r
d.tbl <- unisex_names[sample(x = 11:14, size = 5, replace = T), ]
d.tbl
#> # A tibble: 5 × 5
#>   name     total male_share female_share   gap
#>   <chr>    <dbl>      <dbl>        <dbl> <dbl>
#> 1 Frankie 51288.      0.624        0.376 0.247
#> 2 Skyler  53486.      0.646        0.354 0.292
#> 3 Frankie 51288.      0.624        0.376 0.247
#> 4 Pat     44782.      0.369        0.631 0.262
#> 5 Skyler  53486.      0.646        0.354 0.292
```

A `sample()` függvény fenti paraméterezése mellett biztosan előfordul sorismétlés az új `d.tbl` adattáblában.
Az sorismétléseket tartalmazó adattáblák kezelésére a `duplicated()` és a `unique()` függvényeket használhatjuk. A sorismétlések felderítésére a `duplicated()` függvényt használjuk:



```r
duplicated(d.tbl)
#> [1] FALSE FALSE  TRUE FALSE  TRUE
d.tbl[duplicated(d.tbl), ]
#> # A tibble: 2 × 5
#>   name     total male_share female_share   gap
#>   <chr>    <dbl>      <dbl>        <dbl> <dbl>
#> 1 Frankie 51288.      0.624        0.376 0.247
#> 2 Skyler  53486.      0.646        0.354 0.292
```

A sorismétlések eltávolítására a `unique()` függvényt használhatjuk:
  

```r
unique(d.tbl)
#> # A tibble: 3 × 5
#>   name     total male_share female_share   gap
#>   <chr>    <dbl>      <dbl>        <dbl> <dbl>
#> 1 Frankie 51288.      0.624        0.376 0.247
#> 2 Skyler  53486.      0.646        0.354 0.292
#> 3 Pat     44782.      0.369        0.631 0.262
```



Ha a sorkoordítátákba logikai vektort írunk, akkor szűrést valósítunk meg:


```r
unisex_names[unisex_names$gap < 0.003, ]
#> # A tibble: 10 × 5
#>    name      total male_share female_share       gap
#>    <chr>     <dbl>      <dbl>        <dbl>     <dbl>
#>  1 Kris     24956.      0.499        0.501 0.00275  
#>  2 Camdyn    3275.      0.500        0.500 0.000154 
#>  3 Christan  2685.      0.501        0.499 0.00227  
#>  4 Kam        729.      0.501        0.499 0.00235  
#>  5 Jonel      613.      0.499        0.501 0.00237  
#>  6 Kodee      533.      0.500        0.500 0.000316 
#>  7 Callaway   292.      0.500        0.500 0.000455 
#>  8 Bless      280.      0.500        0.500 0.0000717
#>  9 Nike       206.      0.500        0.500 0.000782 
#> 10 Tkai       143.      0.500        0.500 0.000570
```



## Adatkezelés Tidyverse R-ben

\BeginKnitrBlock{rmdlevel2}<div class="rmdlevel2">
Ebben a fejezetben:
  </div>\EndKnitrBlock{rmdlevel2}


### A `%>%` operátor

Egy probléma megoldása több lépésben történik. A `survey` adatbázisból keressük ki a lányok testmagasságának az át gyakran függvényeket kell egymásba ágyaznunk. Ha például az 1, 2 és 3 számok természetes alapú logaritmusának az összegét szeretnénk kiszámolni, akkor a következő sorokat írhatjuk:



```r
x <- c(1, 2, 3)       # vektor előállítása
out <- log(x)         # természetes alapú logaritmus kiszámolása  
out <- sum(out)       # átlag kiszámolása
out                   # eredmény kírása
#> [1] 1.792
```

A részeredmények tárolására az `out` objektumot használtuk fel. A köztes eredmények tárolása azonos vagy eltérő nevek alatt szokásos gyakorlat a hagyományos R használata során.

A fenti lehetőség mellett választhatjuk a függvények egymásba ágyazását is:


```r
x   <- c(1, 2, 3)     # vektor előállítása
sum(log(x))           # eredmény kiírása
#> [1] 1.792
```

A fenti példa jóval tömörebb és nem szükséges köztes objektumok létrehozása, a hagyományos R-ben nagyon gyakori összetett függvényhívásokkal (rész)problémák megoldása.

A **magrittr** csomag kínál egy harmadik lehetőséget, a pipe operátor (`%>%`)\index{pipe operátor} használatával. Az operátor egyben a Tidyverse R része is.


```r
library(tidyverse)
x   <- c(1, 2, 3)     # vektor előállítása
x %>% log() %>% sum() # eredmény kiírása
#> [1] 1.792
```

A fenti sor olvasható úgy, hogy induljunk ki az `x` adatobjektumból, *azután* vegyük a 2-es alapú logaritmusát, *azután* vegyük az értékek összegét. A `%>%` pipe operátor az *azután* lehetőséget kínálja, és egyben egy rendkívül jól olvasható és karbantarható kód létrehozását teszi lehetővé. A fentebb látott függvények egymásba ágyazásánál sokkal könyebben javítható ez a kód, az azt megelőző, köztes objektumokkal dolgozó esetnél pedig jóval egyszerűbb és elegánsabb. A pipe operátort használó parancsok tipikusan adatobjektummal, vagy az azt létrehozó függvénnyel indítanak, majd azoknak a tevékenységeknek a felsorolása történik függvényhívások egymásutánjának megadásával, amelyeket a felsorolás sorrendjében az adatokkal tenni szeretnénk. Az adat rész ezekből a függvényhívásokból hiányzik, ugyanis a pipe operátor biztosítja, hogy mindegyik függvény első argumentumába megkapja azt.


```r
10 %>% log()                 # ekvivalens alak: log(x=10)
#> [1] 2.303
c(10, 100) %>% log()         # ekvivalens alak: log(x=c(10, 100))
#> [1] 2.303 4.605
c(10, 100) %>% log(base=10)  # ekvivalens alak: log(x=c(10, 100), base=10)
#> [1] 1 2
```

A fenti példában, látható, hogyan gondoskodik a pipe oprátor arról, hogy `log()` függvény első argumentuma (`x=`) megkapja a szükséges értékét. Néhány függvény esetében előfordul, hogy a kiinduló adat apaértelmezés szerint nem az első paraméter. Ekkor a pont `.` helyörző segítségével expliciten jelezzük, hogy hová kerül a pipe operátor bal oldaláról eérkező adat. Például a karakterstring cserére használatos `sub()` függvény `x=` argumentuma alapértelmezés szerint a harmadik:


```r
sub(pattern = "s", replacement = "z", x = letters)  # s cseréje z-re
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "z"
#> [20] "t" "u" "v" "w" "x" "y" "z"
```

A következő függvényhívás az argumentumok nevesítése miatt szintén működőképes, az pipe-ban `x=letters` argumentumhívás valósul meg.  


```r
letters %>% sub(pattern = "s", replacement = "z")
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "z"
#> [20] "t" "u" "v" "w" "x" "y" "z"
```

Azonban ha nem használunk argumentumneveket, akkor ez a hívás már nem kívánt eredményre vezet, mert alapértelmezés szerint az első argumentumba kerül az adat, amelyik a `sub()` esetében a `pattern=` argumentum.


```r
letters %>% sub("s", "z") # Nem ezt akartuk. Valójában ez hívódik: sub(pattern=letters, replacement="s", x="z") 
#> [1] "z"
```

Ha tehát nem az első argumentumban szeretnénk szerepeltetni a pipe bal oldaláról érkező adatot, akkor a `.` helyörzőt kell használnunk:


```r
letters %>% sub("s", "z", .) # letters %>% sub(pattern = "s", replacement = "z", x=letters)
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "z"
#> [20] "t" "u" "v" "w" "x" "y" "z"
```




```r
unisex_names %>% slice(1:3)  
#> # A tibble: 3 × 5
#>   name     total male_share female_share    gap
#>   <chr>    <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Casey  176544.      0.584        0.416 0.169 
#> 2 Riley  154861.      0.508        0.492 0.0153
#> 3 Jessie 136382.      0.478        0.522 0.0443
unisex_names %>% slice(n())         # csak az utolsó sor 
#> # A tibble: 1 × 5
#>   name  total male_share female_share    gap
#>   <chr> <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Aeon   100.      0.465        0.535 0.0703
unisex_names %>% slice((n()-4):n()) # utolsó 5 sor
#> # A tibble: 5 × 5
#>   name     total male_share female_share    gap
#>   <chr>    <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Eaden     102.      0.573        0.427 0.146 
#> 2 Inioluwa  101.      0.353        0.647 0.295 
#> 3 Gwin      101.      0.562        0.438 0.124 
#> 4 Yacine    100.      0.545        0.455 0.0892
#> 5 Aeon      100.      0.465        0.535 0.0703
unisex_names %>% slice(sample(1:n(), size=4)) # véletlen 4 sor
#> # A tibble: 4 × 5
#>   name   total male_share female_share    gap
#>   <chr>  <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Adisa   151.      0.413        0.587 0.174 
#> 2 Armoni 1707.      0.395        0.605 0.211 
#> 3 Kalani 4012.      0.411        0.589 0.178 
#> 4 Riyan   528.      0.509        0.491 0.0179
d.tbl <- unisex_names %>% slice(sample(21:24, size=5, replace = T )) # véletlen 4 sor
d.tbl
#> # A tibble: 5 × 5
#>   name     total male_share female_share     gap
#>   <chr>    <dbl>      <dbl>        <dbl>   <dbl>
#> 1 Carey   24790.      0.523        0.477 0.0465 
#> 2 Kris    24956.      0.499        0.501 0.00275
#> 3 Blair   23160.      0.490        0.510 0.0195 
#> 4 Emerson 24167.      0.526        0.474 0.0511 
#> 5 Kris    24956.      0.499        0.501 0.00275

d.tbl %>% distinct()   # a sorok egyedivé tétele
#> # A tibble: 4 × 5
#>   name     total male_share female_share     gap
#>   <chr>    <dbl>      <dbl>        <dbl>   <dbl>
#> 1 Carey   24790.      0.523        0.477 0.0465 
#> 2 Kris    24956.      0.499        0.501 0.00275
#> 3 Blair   23160.      0.490        0.510 0.0195 
#> 4 Emerson 24167.      0.526        0.474 0.0511


unisex_names %>% sample_n(3)        # véletlen 3 sor
#> # A tibble: 3 × 5
#>   name    total male_share female_share    gap
#>   <chr>   <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Lashaun 1978.      0.379        0.621 0.243 
#> 2 Ardell  2327.      0.523        0.477 0.0458
#> 3 Audi     149.      0.408        0.592 0.183
unisex_names %>% sample_frac(0.01)  # véletlen 1%-nyi sor
#> # A tibble: 9 × 5
#>   name   total male_share female_share    gap
#>   <chr>  <dbl>      <dbl>        <dbl>  <dbl>
#> 1 Areon   126.      0.646        0.354 0.291 
#> 2 Hudsyn  262.      0.409        0.591 0.182 
#> 3 Jari    448.      0.351        0.649 0.299 
#> 4 Danyl   126.      0.545        0.455 0.0891
#> 5 Currie  155.      0.661        0.339 0.322 
#> 6 Vail    106.      0.380        0.620 0.241 
#> 7 Raymie  265.      0.380        0.620 0.240 
#> 8 Shalom 2061.      0.659        0.341 0.318 
#> 9 Jahdai  113.      0.377        0.623 0.247
```



```r
unisex_names %>% filter(gap<0.003, grepl(pattern = "^C", x = name) | grepl(pattern = "^K", x = name))
#> # A tibble: 6 × 5
#>   name      total male_share female_share      gap
#>   <chr>     <dbl>      <dbl>        <dbl>    <dbl>
#> 1 Kris     24956.      0.499        0.501 0.00275 
#> 2 Camdyn    3275.      0.500        0.500 0.000154
#> 3 Christan  2685.      0.501        0.499 0.00227 
#> 4 Kam        729.      0.501        0.499 0.00235 
#> 5 Kodee      533.      0.500        0.500 0.000316
#> 6 Callaway   292.      0.500        0.500 0.000455
```


```r
unisex_names %>% filter_all(any_vars(.>0.4))
#> # A tibble: 919 × 5
#>    name      total male_share female_share    gap
#>    <chr>     <dbl>      <dbl>        <dbl>  <dbl>
#>  1 Casey   176544.      0.584        0.416 0.169 
#>  2 Riley   154861.      0.508        0.492 0.0153
#>  3 Jessie  136382.      0.478        0.522 0.0443
#>  4 Jackie  132929.      0.421        0.579 0.158 
#>  5 Avery   121797.      0.335        0.665 0.330 
#>  6 Jaime   109870.      0.562        0.438 0.124 
#>  7 Peyton   94896.      0.434        0.566 0.133 
#>  8 Kerry    88964.      0.484        0.516 0.0321
#>  9 Jody     80401.      0.352        0.648 0.296 
#> 10 Kendall  79211.      0.372        0.628 0.255 
#> # … with 909 more rows
```



```r
smiths %>% select(kor=age, suly=weight)
#> # A tibble: 2 × 2
#>     kor  suly
#>   <dbl> <dbl>
#> 1    33    90
#> 2    NA    NA
smiths %>% rename(kor=age, suly=weight)
#> # A tibble: 2 × 5
#>   subject     time   kor  suly height
#>   <chr>      <dbl> <dbl> <dbl>  <dbl>
#> 1 John Smith     1    33    90   1.87
#> 2 Mary Smith     1    NA    NA   1.54
```



```r
library(fivethirtyeight)
```


#### Oszlopok válogatása a Tidyverse R-ben

A Tidyverse R a `select()` függvényt kínálja az oszlopok indexelése. A `select()` függvény argumentumába az Alap R-ben látott fenti lehetőség mindegyikét használhatjuk, némi könnyítéssel:


```r
# library(tidyverse)
# smiths.tbl %>% select(1:3)
# smiths.tbl %>% select(1, 3, 5)
# smiths.tbl %>% select(-1, -3, -5)
# smiths.tbl %>% select(subject, height)

```

Láthatjuk a `select()` elbírja a pozitív vagy negatív indexek közvetlen megadását, nem kell vektorban felsorolni őket, illetve az oszlopneveket idézőjel nélkül is megadhatjuk.
További lehetőség, hogy az oszlopneveket úgy ishasználhatjuk, mintha számok lennének, a kettőspont operátor és a negtív előjel is használható velük:


```r
# smiths.tbl %>% select(subject:age)
# smiths.tbl %>% select(-subject, -age)
# smiths.tbl %>% select(-(subject:age))

```

Az oszlopok között az oszlopnevek alapján is lehet válogatni, ehhez a Tidyverse R számos függvényt ajánl:


```r
# smiths.tbl %>% select(starts_with("ti"))
# smiths.tbl %>% select(ends_with("t"))
# smiths.tbl %>% select(contains("ei"))
# d.df <- data.frame(id=1, kerd.1=10, kerd.2=20, kerd.3=30)
# d.df
# d.df %>% select(num_range("kerd.",1:3))

```

Válogathatunk az oszlopok közül az oszlop adataira vonatkozó logikai értéket szolgáltató függvények segítségével. Erre a `select_if()` ad lehetőséget.


```r
# smiths.tbl %>% select_if(is.numeric)
# smiths.tbl %>% select_if(is.character)

```





## Haladó adatkezelés


\BeginKnitrBlock{rmdlevel3}<div class="rmdlevel3">
Ebben a fejezetben:
</div>\EndKnitrBlock{rmdlevel3}


