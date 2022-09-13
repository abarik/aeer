# Mutatók és táblázatok {#mutatok-tablazatok}



<img src="images/ch_08_small.png" width="70%" style="display: block; margin: auto;" />


## Alap R lehetőségei

\BeginKnitrBlock{rmdlevel1}<div class="rmdlevel1">
Ebben a fejezetben áttekintjük

* az *Alap R* mutatószámoló és
* táblázat készítő függvényeit
* 
  </div>\EndKnitrBlock{rmdlevel1}


A leíró statisztika célja az adatstruktúrába való elsődleges betekintés, az adatok eloszlásának felderítése. A leíró statisztika eszközei a statisztikai mérőszámok (mutatók), a táblázatok és a grafikonok. Ebben a fejezetben a mutatókkal és a táblázatokkal foglalkozunk, az ábrák készítése a következő fejezet témája lesz.

### Mutatók

#### Egy változó, egy mutató

A statisztikai mérőszámok vagy mutatók a mintából számolt statisztikai függvények. A két legfontosabb a mintaátlag és a minta szórása. A **MASS** csomag `survey` adattáblája például 237 egyetemista testmagasságát tartalmazza a `Height` oszlopában. Számoljuk ki ezt a két fontos mutatót:


```r
data(survey, package = "MASS") # survey betöltése
mean(survey$Height, na.rm = T) # testmagasság átlaga
#> [1] 172.4
sd(survey$Height, na.rm = T) # testmagasság szórása
#> [1] 9.848
```

Az `na.rm=T` argumentum megadására szükség van, mivel a `Height` változó tartalmaz hiányzó értékeket, csak így kapjuk meg a mintaátlagot és a minta szórását.

Természetesen további mutatók is számolhatók:


```r
median(survey$Height, na.rm = T) # medián
#> [1] 171
var(survey$Height, na.rm = T) # variancia
#> [1] 96.97
min(survey$Height, na.rm = T) # minimum
#> [1] 150
max(survey$Height, na.rm = T) # maximum
#> [1] 200
range(survey$Height, na.rm = T) # minimum és maximum
#> [1] 150 200
diff(range(survey$Height, na.rm = T)) # terjedelem
#> [1] 50
IQR(survey$Height, na.rm = T) # interkvartilis-eltérés
#> [1] 15
quantile(survey$Height, na.rm = T) # kvantilisek
#>   0%  25%  50%  75% 100% 
#>  150  165  171  180  200
moments::skewness(survey$Height, na.rm = T) # ferdeség
#> [1] 0.2174
moments::kurtosis(survey$Height, na.rm = T) # csúcsosság
#> [1] 2.587
```


#### Több változó, egy mutató

Sokszor, egyszerre több numerikus változó statisztikai mutatóit szeretnénk meghatározni, ehhez az `apply(MARGIN=2)` vagy az `sapply()` függvényt használhatjuk. Az `apply()` általánosabb, így a `MARGIN=2` segítségével tudjuk az oszloponkénti függvényvégrehajtására utasítani, míg az `sapply()` esetében ez a működés lényege. Most három numerikus változó (kézméret, testmagasság és életkor) legfontosabb statisztikai mutatóit írtajuk ki:



```r
# mutatók 3 változóra: apply()
apply(survey[, c("Wr.Hnd", "Height", "Age")], MARGIN = 2, FUN = mean, na.rm = T)
#> Wr.Hnd Height    Age 
#>  18.67 172.38  20.37
apply(survey[, c("Wr.Hnd", "Height", "Age")], MARGIN = 2, FUN = sd, na.rm = T)
#> Wr.Hnd Height    Age 
#>  1.879  9.848  6.474
apply(survey[, c("Wr.Hnd", "Height", "Age")], MARGIN = 2, FUN = range, na.rm = T)
#>      Wr.Hnd Height   Age
#> [1,]   13.0    150 16.75
#> [2,]   23.2    200 73.00
apply(survey[, c("Wr.Hnd", "Height", "Age")], MARGIN = 2, FUN = quantile, na.rm = T)
#>      Wr.Hnd Height   Age
#> 0%     13.0    150 16.75
#> 25%    17.5    165 17.67
#> 50%    18.5    171 18.58
#> 75%    19.8    180 20.17
#> 100%   23.2    200 73.00

# mutatók 3 változóra: sapply()
sapply(survey[, c("Wr.Hnd", "Height", "Age")], FUN = mean, na.rm = T)
#> Wr.Hnd Height    Age 
#>  18.67 172.38  20.37
sapply(survey[, c("Wr.Hnd", "Height", "Age")], FUN = sd, na.rm = T)
#> Wr.Hnd Height    Age 
#>  1.879  9.848  6.474
sapply(survey[, c("Wr.Hnd", "Height", "Age")], FUN = range, na.rm = T)
#>      Wr.Hnd Height   Age
#> [1,]   13.0    150 16.75
#> [2,]   23.2    200 73.00
sapply(survey[, c("Wr.Hnd", "Height", "Age")], FUN = quantile, na.rm = T)
#>      Wr.Hnd Height   Age
#> 0%     13.0    150 16.75
#> 25%    17.5    165 17.67
#> 50%    18.5    171 18.58
#> 75%    19.8    180 20.17
#> 100%   23.2    200 73.00
```


#### Egy változó, több mutató

Amennyiben egyszerre több statisztikai mutatóra van szükségünk, akkor az *Alap R* lehetőségei közül a `summary()` függvény az első lehetőség. 



```r
summary(survey$Wr.Hnd)  # kézméret mutatói
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#>    13.0    17.5    18.5    18.7    19.8    23.2       1
summary(survey$Height)  # testmagasság mutatói
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#>     150     165     171     172     180     200      28
summary(survey$Age)     # életkor mutatói
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    16.8    17.7    18.6    20.4    20.2    73.0
```


#### Mutatók csoportokra

Nagyon fontos lehetőség a mutatók meghatározása különböző csoportokban. Csoportok alatt a faktor által meghatározott, adott faktorszinthez tartozó mintaelemeket értjük. Például a `survey` adattábla nem (`Sex`) faktora két csoportra osztja a 237 elemű mintát.


```r
table(survey$Sex, useNA = "ifany")  # nem faktor eloszlása
#> 
#> Female   Male   <NA> 
#>    118    118      1
```

A nem szerint meghatározott két csoport azonos elemszámú, 118 személy tartozik a nők csoportjába, és 118 a férfiak csoportjába is. Egy másik faktor, a dohányzási szokás (`Smoke`) már nem mutat egyenletes eloszlást:


```r
table(survey$Smoke, useNA = "ifany")  # dohányzási szokás faktor eloszlása
#> 
#> Heavy Never Occas Regul  <NA> 
#>    11   189    19    17     1
```


Az erős dohányosok mindössze 11-en vannak, míg a legtöbben a nem dohányzók táborába tartoznak (189 fő).


A faktor által meghatározott csoportok nagyon fontosak lehetnek az adatelemzés során. Például kíváncsiak lehetünk a nem faktor két csoportjában (nők és férfiak) a testmagasság átlagára. Az *Alap R* az ilyen jellegű kérdések megválaszolására 3 függvényt is nyújt számunkra: `tapply()`, `aggregate()` és `by()`.

A `tapply()` egyetlen numerikus változó egy faktor egy vagy több csoportjában képes statisztikai mutató meghatározására. Fontos, hogy a statisztikai mutató egyetlen értékkel térjen vissza (pl. `mean()` vagy `sd()`), mert a táblázatos elrendezés az outputban csak így lehetséges, tehát a `range()` és a `quantile()` nem használható.


```r
# mintaátlag csoportokra
tapply(survey$Wr.Hnd, INDEX = survey$Sex, FUN = mean, na.rm=T)
#> Female   Male 
#>  17.60  19.74
tapply(survey$Wr.Hnd, INDEX = survey[,c("Sex", "Smoke")], FUN = mean, na.rm=T)
#>         Smoke
#> Sex      Heavy Never Occas Regul
#>   Female 17.90 17.66 16.82 17.48
#>   Male   20.32 19.61 19.83 20.27
tapply(survey$Wr.Hnd, INDEX = survey[,c("Sex", "Smoke", "Exer")], FUN = mean, na.rm=T)
#> , , Exer = Freq
#> 
#>         Smoke
#> Sex      Heavy Never Occas Regul
#>   Female 17.73 17.53 15.92 19.55
#>   Male   18.93 19.75 20.27 20.86
#> 
#> , , Exer = None
#> 
#>         Smoke
#> Sex      Heavy Never Occas Regul
#>   Female    NA 17.59 18.50    NA
#>   Male    23.2 19.29 17.95  19.5
#> 
#> , , Exer = Some
#> 
#>         Smoke
#> Sex      Heavy Never Occas Regul
#>   Female 18.15 17.77 17.77 16.10
#>   Male   23.00 19.47 20.50 19.45
```


A `tapply()` függvényt tipikusan egy vagy két faktor esetén használjuk, a táblázatos output kényelmes áttekintést ad az egyes csoportok statisztikai mutatóiról. A legnagyobb szabadságot az `aggregate()` és a `by()` nyújtja számunkra, ezek használatát érdemes elsajátítani. Paraméterezésük megegyezik (az argumentumok neve nem), csak az outputban térnek el. Az `aggregate()` visszatérési értéke egy *adattábla* típusú objektum, amelyet később kényelmesen felhasználhatunk, a `by()` egy egyszerűbb szöveges listával tér vissza.


```r
# mintaátlag csoportokra
aggregate(survey[, "Wr.Hnd"], by=survey[, "Sex", drop=F], FUN = mean, na.rm=T)
#>      Sex     x
#> 1 Female 17.60
#> 2   Male 19.74
by(survey[, "Wr.Hnd"], INDICES = survey[, "Sex", drop=F], FUN = mean, na.rm=T)
#> Sex: Female
#> [1] 17.6
#> ------------------------------------------------------------ 
#> Sex: Male
#> [1] 19.74
aggregate(survey[, "Wr.Hnd"], by=survey[, c("Sex", "Smoke")], FUN = mean, na.rm=T)
#>      Sex Smoke     x
#> 1 Female Heavy 17.90
#> 2   Male Heavy 20.32
#> 3 Female Never 17.66
#> 4   Male Never 19.61
#> 5 Female Occas 16.82
#> 6   Male Occas 19.83
#> 7 Female Regul 17.48
#> 8   Male Regul 20.27
by(survey[, "Wr.Hnd"], INDICES = survey[, c("Sex", "Smoke")], FUN = mean, na.rm=T)
#> Sex: Female
#> Smoke: Heavy
#> [1] 17.9
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Heavy
#> [1] 20.32
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Never
#> [1] 17.66
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Never
#> [1] 19.61
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Occas
#> [1] 16.82
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Occas
#> [1] 19.83
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Regul
#> [1] 17.48
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Regul
#> [1] 20.27
aggregate(survey[, "Wr.Hnd"], by=survey[, c("Sex", "Smoke", "Exer")], FUN = mean, na.rm=T)
#>       Sex Smoke Exer     x
#> 1  Female Heavy Freq 17.73
#> 2    Male Heavy Freq 18.93
#> 3  Female Never Freq 17.53
#> 4    Male Never Freq 19.75
#> 5  Female Occas Freq 15.92
#> 6    Male Occas Freq 20.27
#> 7  Female Regul Freq 19.55
#> 8    Male Regul Freq 20.86
#> 9    Male Heavy None 23.20
#> 10 Female Never None 17.59
#> 11   Male Never None 19.29
#> 12 Female Occas None 18.50
#> 13   Male Occas None 17.95
#> 14   Male Regul None 19.50
#> 15 Female Heavy Some 18.15
#> 16   Male Heavy Some 23.00
#> 17 Female Never Some 17.77
#> 18   Male Never Some 19.47
#> 19 Female Occas Some 17.77
#> 20   Male Occas Some 20.50
#> 21 Female Regul Some 16.10
#> 22   Male Regul Some 19.45
by(survey[, "Wr.Hnd"], INDICES = survey[, c("Sex", "Smoke", "Exer")], FUN = mean, na.rm=T)
#> Sex: Female
#> Smoke: Heavy
#> Exer: Freq
#> [1] 17.73
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Heavy
#> Exer: Freq
#> [1] 18.93
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Never
#> Exer: Freq
#> [1] 17.53
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Never
#> Exer: Freq
#> [1] 19.75
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Occas
#> Exer: Freq
#> [1] 15.92
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Occas
#> Exer: Freq
#> [1] 20.27
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Regul
#> Exer: Freq
#> [1] 19.55
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Regul
#> Exer: Freq
#> [1] 20.86
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Heavy
#> Exer: None
#> [1] NA
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Heavy
#> Exer: None
#> [1] 23.2
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Never
#> Exer: None
#> [1] 17.59
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Never
#> Exer: None
#> [1] 19.29
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Occas
#> Exer: None
#> [1] 18.5
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Occas
#> Exer: None
#> [1] 17.95
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Regul
#> Exer: None
#> [1] NA
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Regul
#> Exer: None
#> [1] 19.5
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Heavy
#> Exer: Some
#> [1] 18.15
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Heavy
#> Exer: Some
#> [1] 23
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Never
#> Exer: Some
#> [1] 17.77
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Never
#> Exer: Some
#> [1] 19.47
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Occas
#> Exer: Some
#> [1] 17.77
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Occas
#> Exer: Some
#> [1] 20.5
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Regul
#> Exer: Some
#> [1] 16.1
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Regul
#> Exer: Some
#> [1] 19.45
```


Az `aggregate()` legnagyobb előnye, hogy több numerikus változót megadhatunk az első paraméterükben, a `by()` esetében pedig olyan függvényeket is alkalmazhatunk az egyes csoportokra, amelyek nem egyetlen értékkel térnek vissza.


```r
# mintaátlag csoportokra
aggregate(survey[,  c("Wr.Hnd", "Height", "Age")], by=survey[, "Sex", drop=F], FUN = mean, na.rm=T)
#>      Sex Wr.Hnd Height   Age
#> 1 Female  17.60  165.7 20.41
#> 2   Male  19.74  178.8 20.33
aggregate(survey[,  c("Wr.Hnd", "Height", "Age")], by=survey[, c("Sex", "Smoke")], FUN = mean, na.rm=T)
#>      Sex Smoke Wr.Hnd Height   Age
#> 1 Female Heavy  17.90  166.9 22.73
#> 2   Male Heavy  20.32  180.6 20.28
#> 3 Female Never  17.66  165.7 20.03
#> 4   Male Never  19.61  178.3 20.51
#> 5 Female Occas  16.82  167.4 21.91
#> 6   Male Occas  19.83  178.6 18.93
#> 7 Female Regul  17.48  159.8 22.87
#> 8   Male Regul  20.27  182.2 20.40
aggregate(survey[,  c("Wr.Hnd", "Height", "Age")], by=survey[, c("Sex", "Smoke", "Exer")], FUN = mean, na.rm=T)
#>       Sex Smoke Exer Wr.Hnd Height   Age
#> 1  Female Heavy Freq  17.73  167.2 25.86
#> 2    Male Heavy Freq  18.93  179.7 20.46
#> 3  Female Never Freq  17.53  167.2 19.73
#> 4    Male Never Freq  19.75  180.3 20.47
#> 5  Female Occas Freq  15.92  166.9 19.75
#> 6    Male Occas Freq  20.27  178.4 19.26
#> 7  Female Regul Freq  19.55  167.0 19.79
#> 8    Male Regul Freq  20.86  182.6 21.99
#> 9    Male Heavy None  23.20  171.0 20.92
#> 10 Female Never None  17.59  163.0 20.40
#> 11   Male Never None  19.29  173.6 22.15
#> 12 Female Occas None  18.50    NaN 41.58
#> 13   Male Occas None  17.95  176.0 17.92
#> 14   Male Regul None  19.50  177.8 17.58
#> 15 Female Heavy Some  18.15  166.6 18.04
#> 16   Male Heavy Some  23.00  193.0 18.92
#> 17 Female Never Some  17.77  164.9 20.19
#> 18   Male Never Some  19.47  176.7 20.17
#> 19 Female Occas Some  17.77  168.3 18.94
#> 20   Male Occas Some  20.50  182.9 18.67
#> 21 Female Regul Some  16.10  156.2 24.92
#> 22   Male Regul Some  19.45  182.8 18.33

by(survey[,  "Wr.Hnd"], INDICES = survey[, c("Sex", "Smoke")], FUN = shapiro.test)
#> Sex: Female
#> Smoke: Heavy
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  dd[x, ]
#> W = 0.86, p-value = 0.2
#> 
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Heavy
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  dd[x, ]
#> W = 0.84, p-value = 0.1
#> 
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Never
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  dd[x, ]
#> W = 0.95, p-value = 5e-04
#> 
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Never
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  dd[x, ]
#> W = 0.99, p-value = 0.5
#> 
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Occas
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  dd[x, ]
#> W = 0.97, p-value = 0.9
#> 
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Occas
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  dd[x, ]
#> W = 0.92, p-value = 0.3
#> 
#> ------------------------------------------------------------ 
#> Sex: Female
#> Smoke: Regul
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  dd[x, ]
#> W = 0.9, p-value = 0.4
#> 
#> ------------------------------------------------------------ 
#> Sex: Male
#> Smoke: Regul
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  dd[x, ]
#> W = 0.93, p-value = 0.3
by(survey[,  c("Wr.Hnd", "Height", "Age")], INDICES = survey[, "Sex", drop=F], FUN = summary, na.rm=T)
#> Sex: Female
#>      Wr.Hnd         Height         Age      
#>  Min.   :13.0   Min.   :150   Min.   :16.9  
#>  1st Qu.:17.0   1st Qu.:163   1st Qu.:17.5  
#>  Median :17.5   Median :167   Median :18.4  
#>  Mean   :17.6   Mean   :166   Mean   :20.4  
#>  3rd Qu.:18.5   3rd Qu.:170   3rd Qu.:20.0  
#>  Max.   :20.8   Max.   :180   Max.   :73.0  
#>                 NA's   :16                  
#> ------------------------------------------------------------ 
#> Sex: Male
#>      Wr.Hnd         Height         Age      
#>  Min.   :14.0   Min.   :155   Min.   :16.8  
#>  1st Qu.:18.5   1st Qu.:173   1st Qu.:17.9  
#>  Median :19.5   Median :180   Median :18.9  
#>  Mean   :19.7   Mean   :179   Mean   :20.3  
#>  3rd Qu.:21.0   3rd Qu.:185   3rd Qu.:20.3  
#>  Max.   :23.2   Max.   :200   Max.   :70.4  
#>  NA's   :1      NA's   :12
```


### Táblázatok


#### Abszolút gyakoriság

Az eddig látott mutatók a numerikus változók leíró statisztikai leírására szolgáltak. A gyakorisági táblázatokat többnyire a faktor típusú változók jellemzésére használjuk. Az *Alap R* korábban megismert függvényei, a `table()`, `xtabs()` és `ftable()` már biztosítják számunkra a nyers, ún. abszolút gyakorisági táblázatok kiírását.

Egydimenziós táblázatot, az ún. gyakorisági táblázatot a `summary()` függvénnyel is létrehozhatunk. Ha a hívásban faktor argumentumot adunk meg, akkor gyakorisági táblázatot kapunk, amely az egyes faktorszintek mintabeli előfordulási számát adja:



```r
summary(survey$W.Hnd)
#>  Left Right  NA's 
#>    18   218     1
```

Láthatjuk, hogy a 237 megkérdezett hallgatóból 18 balkezes, 218 jobbkazes, egy diáknak pedig nem jegyezték fel a kezességét. Hasonló eredményt kapunk, ha a táblázatok létrehozásra szánt `table()` függvényt használjuk, de itt a hiányzó értékek megjelenítéséről már külön gondoskodnunk kell:


```r
table(survey$W.Hnd, useNA = "ifany")  # kezesség gyakorisági táblázata (1D)
#> 
#>  Left Right  <NA> 
#>    18   218     1
xtabs(~W.Hnd, data = survey, addNA = T)
#> W.Hnd
#>  Left Right  <NA> 
#>    18   218     1
```

A már korábban megismert `apply()` vagy `sapply()` segítségével több faktor gyakorisági táblázatát is kiírhatjuk:


```r
sapply(survey[,c("Sex","W.Hnd","Exer","Smoke")], FUN = table, useNA="ifany")
#> $Sex
#> 
#> Female   Male   <NA> 
#>    118    118      1 
#> 
#> $W.Hnd
#> 
#>  Left Right  <NA> 
#>    18   218     1 
#> 
#> $Exer
#> 
#> Freq None Some 
#>  115   24   98 
#> 
#> $Smoke
#> 
#> Heavy Never Occas Regul  <NA> 
#>    11   189    19    17     1
```

A fenti outputból kiemeljük a `Smoke` változót, amely a hallgatók dohányzási szokását tartalmazza. A változó 4 szintű faktor, melynek értékei: `Never`-nem dohányzik, `Occas`-ritkán dohányzik, `Regul`-rendszeresen dohányzik, `Heavy`-sokat dohányzik. Láthatjuk, hogy a 237 megkérdezett hallgatóból 189 diák nem dohányzik és csak 11 erős dohányos.


A `table()` függvényt numerikus argumentum esetén is használhatjuk, ekkor a különböző számok előfordulási gyakoriságát kapjuk. A folytonos kvantitatív változóink, jellemzően, minden mérésnél más és más értéket adnak, így a legtöbbször a `table()` hívásnak nincs értelme folytonos numerikus vektor esetén. Azonban diszkrét numerikus változók esetén hasznos lehet a gyakorisági táblázat megjelenítése, mert ezek értékei sokszor ismétlődnek, de ez természetesen a változó jellegétől is nagy mértékben függ. Most a diákok pulzusára (`Pulse`) hívjuk meg a `table()` függvényt:


```r
table(survey$Pulse, useNA = "ifany")
#> 
#>   35   40   48   50   54   55   56   59   60   61   62   63   64   65   66   67 
#>    1    1    2    2    1    1    1    1   12    1    4    1    9    6    6    1 
#>   68   69   70   71   72   73   74   75   76   78   79   80   81   83   84   85 
#>   16    1   13    2   14    1    5    5   13    4    3   18    1    4    5    4 
#>   86   87   88   89   90   92   96   97   98  100  104 <NA> 
#>    3    2    4    1    8    6    3    1    1    2    2   45
xtabs(~Pulse, data = survey, addNA = T)
#> Pulse
#>   35   40   48   50   54   55   56   59   60   61   62   63   64   65   66   67 
#>    1    1    2    2    1    1    1    1   12    1    4    1    9    6    6    1 
#>   68   69   70   71   72   73   74   75   76   78   79   80   81   83   84   85 
#>   16    1   13    2   14    1    5    5   13    4    3   18    1    4    5    4 
#>   86   87   88   89   90   92   96   97   98  100  104 <NA> 
#>    3    2    4    1    8    6    3    1    1    2    2   45
```

Leolvashatjuk, hogy leggyakoribb pulzus a 80, hiszen az 18-szor fordul elő, valamint 45 személynek nem ismerjük a pulzusát. A fenti táblázatot áttekinthetőbbé tehetjük, ha az előfordulási értékek szerint rendezzük a cellákat. A rendezésre használjuk a `sort(decreasing=T)` függvényt:


```r
sort(table(survey$Pulse, useNA = "ifany"), decreasing = T)
#> 
#> <NA>   80   68   72   70   76   60   64   90   65   66   92   74   75   84   62 
#>   45   18   16   14   13   13   12    9    8    6    6    6    5    5    5    4 
#>   78   83   85   88   79   86   96   48   50   71   87  100  104   35   40   54 
#>    4    4    4    4    3    3    3    2    2    2    2    2    2    1    1    1 
#>   55   56   59   61   63   67   69   73   81   89   97   98 
#>    1    1    1    1    1    1    1    1    1    1    1    1
```

Láthatjuk, hogy a fenti outputból már könnyen kiolvashatók a legnagyobb és legkisebb gyakoriságú értékek.

Többdimenziós táblázatokat a szokásos módon, több faktor felsorolásával adhatunk meg:


```r
table(survey$Sex, survey$W.Hnd, useNA = "ifany")  # kezesség gyakorisági táblázata (2D)
#>         
#>          Left Right <NA>
#>   Female    7   110    1
#>   Male     10   108    0
#>   <NA>      1     0    0
ftable(table(survey$Sex, survey$W.Hnd, survey$Exer, useNA = "ifany"))  # kezesség gyakorisági táblázata (3D)
#>               Freq None Some
#>                             
#> Female Left      3    1    3
#>        Right    45   10   55
#>        NA        1    0    0
#> Male   Left      3    2    5
#>        Right    62   11   35
#>        NA        0    0    0
#> NA     Left      1    0    0
#>        Right     0    0    0
#>        NA        0    0    0
```

#### Táblázat összesített adatokból

Egydimenziós táblázatokat összesített gyakorisági adatok alapján is létrehozhatunk a `c()` függvény és az `as.table()` segítségével. Tegyük fel, hogy rendelkezésre áll az az információ is a fenti 237 hallgatóról, hogy közülük 137 fővárosi és 100 vidéki.



```r
lakhely <- as.table(c(főváros=137, vidék=100))
lakhely
#> főváros   vidék 
#>     137     100
as.data.frame(lakhely)
#>      Var1 Freq
#> 1 főváros  137
#> 2   vidék  100
```

A következő táblázat 3888 szülés előtt lévő hölgy koffein fogyasztásáról és családi állapotáról tartalmaz gyakorisági adatokat. Készítsünk egy mátrixot majd táblázatot a fenti adatokból. 


| Családi állapot                | 0   | 1-150 | 151-300 | >300 |
|--------------------------------|-----|-------|---------|------|
| Házas                          | 652 | 1537  | 598     | 242  |
| Elvált, különváltan él, özvegy | 36  | 46    | 38      | 21   |
| Egyedül él                     | 218 | 327   | 106     | 67   |


A `matrix()` függvényt használjuk, az adatokat pedig sor folytonosan adjuk meg az első argumentumban. A könnyebb áttekinthetőség kedvéért, adjunk nevet a soroknak és az oszlopoknak.


```r
m <- matrix(c(652,1537,598,242,36,46,38,21,218, 327,106,67), nrow=3,byrow=T)
rownames(m) <- c("Házas","Házas.volt","Egyedül.él")
colnames(m) <- c("0","1-150","151-300",">300")
m
#>              0 1-150 151-300 >300
#> Házas      652  1537     598  242
#> Házas.volt  36    46      38   21
#> Egyedül.él 218   327     106   67
```


A példában szereplő gyakorisági adatokat sikeresen rögzítettük egy numerikus mátrixba. Azonban akkor lesz belőle R-beli táblázat, ha az `as.table()` függvénnyel átalakítjuk a mátrixunkat.


```r
koff.csalad <- as.table(m)
koff.csalad
#>               0 1-150 151-300 >300
#> Házas       652  1537     598  242
#> Házas.volt   36    46      38   21
#> Egyedül.él  218   327     106   67
as.data.frame((koff.csalad))
#>          Var1    Var2 Freq
#> 1       Házas       0  652
#> 2  Házas.volt       0   36
#> 3  Egyedül.él       0  218
#> 4       Házas   1-150 1537
#> 5  Házas.volt   1-150   46
#> 6  Egyedül.él   1-150  327
#> 7       Házas 151-300  598
#> 8  Házas.volt 151-300   38
#> 9  Egyedül.él 151-300  106
#> 10      Házas    >300  242
#> 11 Házas.volt    >300   21
#> 12 Egyedül.él    >300   67
```


#### Relatív gyakoriság

Az (abszolút) gyakorisági táblázatok mellett relatív gyakorisági, illetve százalékos relatív gyakorisági táblázatra is szükségünk lehet. Ezek létrehozásához a `prob.table()` függvényt használhatjuk. 


```r
kezesseg <- table(survey$W.Hnd)
prop.table(kezesseg)
#> 
#>    Left   Right 
#> 0.07627 0.92373
100*prop.table(kezesseg)
#> 
#>   Left  Right 
#>  7.627 92.373
```

A könnyebb értelmezhetőség kedvéért használjuk a `round(digits=1)` függvényt:


```r
round(100*prop.table(kezesseg), digits = 1)
#> 
#>  Left Right 
#>   7.6  92.4
```

Kereszttáblák (2D táblázatok) esetén a teljes, a soronkénti és az oszloponkénti eloszlás számítására is lehetőséget ad a `prob.table()` függvény.


A soronkénti relatív gyakorisághoz a `margin=1`, az oszloponkéntihez a `margin=2` argumentumot használjuk. A példában százalékos relatív gyakorisági táblázatot használunk.


```r
tab <- table(survey$Sex, survey$W.Hnd, useNA = "ifany")
round(100*prop.table(tab), digits=1)              # teljes
#>         
#>          Left Right <NA>
#>   Female  3.0  46.4  0.4
#>   Male    4.2  45.6  0.0
#>   <NA>    0.4   0.0  0.0
round(100*prop.table(tab, margin = 1), digits=1)  # soronkénti
#>         
#>           Left Right  <NA>
#>   Female   5.9  93.2   0.8
#>   Male     8.5  91.5   0.0
#>   <NA>   100.0   0.0   0.0
round(100*prop.table(tab, margin = 2), digits=1)  # oszloponkénti
#>         
#>           Left Right  <NA>
#>   Female  38.9  50.5 100.0
#>   Male    55.6  49.5   0.0
#>   <NA>     5.6   0.0   0.0
```


Kétdimenziós táblázatok esetén, a marginális eloszlások számítására is van lehetőségünk. Használhatjuk az `apply(FUN=sum)` függvényt, de a direkt erre a célra létrehozott `margin.table()` függvényt is.


```r
apply(koff.csalad, MARGIN=1, FUN=sum)
#>      Házas Házas.volt Egyedül.él 
#>       3029        141        718
apply(koff.csalad, MARGIN=2, FUN=sum)
#>       0   1-150 151-300    >300 
#>     906    1910     742     330
margin.table(koff.csalad, margin=1)
#>      Házas Házas.volt Egyedül.él 
#>       3029        141        718
margin.table(koff.csalad, margin=2)
#>       0   1-150 151-300    >300 
#>     906    1910     742     330
```



#### Kumulált gyakorisági táblázatok


A relatív gyakorisági táblázatok mellett a kumulált relatív gyakorisági táblázatokat megjelenítését is kérhetjük egydimenziós esetben. Természetesen, ekkor a változónk legalább ordinális skálán mért. A kumulált értékek meghatározására a `cumsum()` függvényt használjuk:


```r
survey$Smoke <- ordered(survey$Smoke, levels=c("Never", "Occas", "Regul", "Heavy"))
dohanyzas <- table(survey$Smoke)
cumsum(round(100*prop.table(dohanyzas), digits=0))
#> Never Occas Regul Heavy 
#>    80    88    95   100
```




## Tidyverse R lehetőségei


\BeginKnitrBlock{rmdlevel2}<div class="rmdlevel2">
Ebben a fejezetben áttekintjük

* a *Tidyverse R* mutatószámoló és
* táblázat készítő lehetőségeit
* 
  </div>\EndKnitrBlock{rmdlevel2}


Az R-ben létezik egy `|>` operátor, amely jelentősen megkönnyíti a kód olvasását.


```r
10 |> sqrt()  # sqrt(10)
#> [1] 3.162

survey %>%
  group_by(Sex) %>%
  summarise(mean_height = mean(Height, na.rm = TRUE))
#> # A tibble: 3 × 2
#>   Sex    mean_height
#>   <fct>        <dbl>
#> 1 Female        166.
#> 2 Male          179.
#> 3 <NA>          172
```




## Haladó lehetőségek


\BeginKnitrBlock{rmdlevel3}<div class="rmdlevel3">
Ebben a fejezetben áttekintjük

* a mutatók és táblázatok kiírásának kényelmes lehetőségeit
 
  </div>\EndKnitrBlock{rmdlevel3}


Ebben a fejezetben a **psych**, **DescTools** és a **summarytools** lehetőségeit tekintjük át. Mindhárom csomag rendkívül kényelmessé teszi a mutatók és a gyakorisági táblázatok kiírását. Mindhárom csomag képes több változót kezelni, több faktorra csoportosítva több statisztikai mutatót megjeleníteni, tehát a legnagyobb szabadságot adják a kutató kezébe.



### Mutatók

#### A teljes adattábla leírása


```r
library(tidyverse)
survey %>% psych::describe(fast = T)
#>        vars   n   mean    sd    min   max range   se
#> Sex       1 236    NaN    NA    Inf  -Inf  -Inf   NA
#> Wr.Hnd    2 236  18.67  1.88  13.00  23.2 10.20 0.12
#> NW.Hnd    3 236  18.58  1.97  12.50  23.5 11.00 0.13
#> W.Hnd     4 236    NaN    NA    Inf  -Inf  -Inf   NA
#> Fold      5 237    NaN    NA    Inf  -Inf  -Inf   NA
#> Pulse     6 192  74.15 11.69  35.00 104.0 69.00 0.84
#> Clap      7 236    NaN    NA    Inf  -Inf  -Inf   NA
#> Exer      8 237    NaN    NA    Inf  -Inf  -Inf   NA
#> Smoke     9 236    NaN    NA    Inf  -Inf  -Inf   NA
#> Height   10 209 172.38  9.85 150.00 200.0 50.00 0.68
#> M.I      11 209    NaN    NA    Inf  -Inf  -Inf   NA
#> Age      12 237  20.37  6.47  16.75  73.0 56.25 0.42
DescTools::DescToolsOptions(digits=2)
survey %>% DescTools::Desc(plotit = F)
#> ------------------------------------------------------------------------------ 
#> Describe . (data.frame):
#> 
#> data frame:	237 obs. of  12 variables
#> 		168 complete cases (70.9%)
#> 
#>   Nr  ColName  Class            NAs         Levels                       
#>   1   Sex      factor            1 (0.4%)   (2): 1-Female, 2-Male        
#>   2   Wr.Hnd   numeric           1 (0.4%)                                
#>   3   NW.Hnd   numeric           1 (0.4%)                                
#>   4   W.Hnd    factor            1 (0.4%)   (2): 1-Left, 2-Right         
#>   5   Fold     factor            .          (3): 1-L on R, 2-Neither, 3-R
#>                                             on L                         
#>   6   Pulse    integer          45 (19.0%)                               
#>   7   Clap     factor            1 (0.4%)   (3): 1-Left, 2-Neither,      
#>                                             3-Right                      
#>   8   Exer     factor            .          (3): 1-Freq, 2-None, 3-Some  
#>   9   Smoke    ordered, factor   1 (0.4%)   (4): 1-Never, 2-Occas,       
#>                                             3-Regul, 4-Heavy             
#>   10  Height   numeric          28 (11.8%)                               
#>   11  M.I      factor           28 (11.8%)  (2): 1-Imperial, 2-Metric    
#>   12  Age      numeric           .                                       
#> 
#> 
#> ------------------------------------------------------------------------------ 
#> 1 - Sex (factor - dichotomous)
#> 
#>   length      n    NAs unique
#>      237    236      1      2
#>           99.6%   0.4%       
#> 
#>         freq   perc  lci.95  uci.95'
#> Female   118  50.0%   43.7%   56.3%
#> Male     118  50.0%   43.7%   56.3%
#> 
#> ' 95%-CI (Wilson)
#> 
#> ------------------------------------------------------------------------------ 
#> 2 - Wr.Hnd (numeric)
#> 
#>   length      n    NAs  unique     0s   mean  meanCI'
#>      237    236      1      60      0  18.67   18.43
#>           99.6%   0.4%           0.0%          18.91
#>                                                     
#>      .05    .10    .25  median    .75    .90     .95
#>    16.00  16.50  17.50   18.50  19.80  21.15   22.05
#>                                                     
#>    range     sd  vcoef     mad    IQR   skew    kurt
#>    10.20   1.88   0.10    1.48   2.30   0.18    0.30
#>                                                     
#> lowest : 13.0 (2), 14.0 (2), 15.0, 15.4, 15.5 (2)
#> highest: 22.5 (4), 22.8, 23.0 (2), 23.1, 23.2 (3)
#> 
#> heap(?): remarkable frequency (9.7%) for the mode(s) (= 17.5)
#> 
#> ' 95%-CI (classic)
#> 
#> ------------------------------------------------------------------------------ 
#> 3 - NW.Hnd (numeric)
#> 
#>   length      n    NAs  unique     0s   mean  meanCI'
#>      237    236      1      68      0  18.58   18.33
#>           99.6%   0.4%           0.0%          18.83
#>                                                     
#>      .05    .10    .25  median    .75    .90     .95
#>    15.50  16.30  17.50   18.50  19.72  21.00   22.22
#>                                                     
#>    range     sd  vcoef     mad    IQR   skew    kurt
#>    11.00   1.97   0.11    1.63   2.22   0.02    0.44
#>                                                     
#> lowest : 12.5, 13.0 (2), 13.3, 13.5, 15.0
#> highest: 22.7, 23.0, 23.2 (2), 23.3, 23.5
#> 
#> heap(?): remarkable frequency (8.9%) for the mode(s) (= 18)
#> 
#> ' 95%-CI (classic)
#> 
#> ------------------------------------------------------------------------------ 
#> 4 - W.Hnd (factor - dichotomous)
#> 
#>   length      n    NAs unique
#>      237    236      1      2
#>           99.6%   0.4%       
#> 
#>        freq   perc  lci.95  uci.95'
#> Left     18   7.6%    4.9%   11.7%
#> Right   218  92.4%   88.3%   95.1%
#> 
#> ' 95%-CI (Wilson)
#> 
#> ------------------------------------------------------------------------------ 
#> 5 - Fold (factor)
#> 
#>   length      n    NAs unique levels  dupes
#>      237    237      0      3      3      y
#>          100.0%   0.0%                     
#> 
#>      level  freq   perc  cumfreq  cumperc
#> 1   R on L   120  50.6%      120    50.6%
#> 2   L on R    99  41.8%      219    92.4%
#> 3  Neither    18   7.6%      237   100.0%
#> 
#> ------------------------------------------------------------------------------ 
#> 6 - Pulse (integer)
#> 
#>   length      n    NAs  unique     0s   mean  meanCI'
#>      237    192     45      43      0  74.15   72.49
#>           81.0%  19.0%           0.0%          75.81
#>                                                     
#>      .05    .10    .25  median    .75    .90     .95
#>    59.55  60.00  66.00   72.50  80.00  90.00   92.00
#>                                                     
#>    range     sd  vcoef     mad    IQR   skew    kurt
#>    69.00  11.69   0.16   11.12  14.00  -0.02    0.33
#>                                                     
#> lowest : 35, 40, 48 (2), 50 (2), 54
#> highest: 96 (3), 97, 98, 100 (2), 104 (2)
#> 
#> heap(?): remarkable frequency (9.4%) for the mode(s) (= 80)
#> 
#> ' 95%-CI (classic)
#> 
#> ------------------------------------------------------------------------------ 
#> 7 - Clap (factor)
#> 
#>   length      n    NAs unique levels  dupes
#>      237    236      1      3      3      y
#>           99.6%   0.4%                     
#> 
#>      level  freq   perc  cumfreq  cumperc
#> 1    Right   147  62.3%      147    62.3%
#> 2  Neither    50  21.2%      197    83.5%
#> 3     Left    39  16.5%      236   100.0%
#> 
#> ------------------------------------------------------------------------------ 
#> 8 - Exer (factor)
#> 
#>   length      n    NAs unique levels  dupes
#>      237    237      0      3      3      y
#>          100.0%   0.0%                     
#> 
#>    level  freq   perc  cumfreq  cumperc
#> 1   Freq   115  48.5%      115    48.5%
#> 2   Some    98  41.4%      213    89.9%
#> 3   None    24  10.1%      237   100.0%
#> 
#> ------------------------------------------------------------------------------ 
#> 9 - Smoke (ordered, factor)
#> 
#>   length      n    NAs unique levels  dupes
#>      237    236      1      4      4      y
#>           99.6%   0.4%                     
#> 
#>    level  freq   perc  cumfreq  cumperc
#> 1  Never   189  80.1%      189    80.1%
#> 2  Occas    19   8.1%      208    88.1%
#> 3  Regul    17   7.2%      225    95.3%
#> 4  Heavy    11   4.7%      236   100.0%
#> 
#> ------------------------------------------------------------------------------ 
#> 10 - Height (numeric)
#> 
#>   length       n     NAs  unique      0s    mean  meanCI'
#>      237     209      28      67       0  172.38  171.04
#>            88.2%   11.8%            0.0%          173.72
#>                                                         
#>      .05     .10     .25  median     .75     .90     .95
#>   157.00  160.00  165.00  171.00  180.00  185.42  189.60
#>                                                         
#>    range      sd   vcoef     mad     IQR    skew    kurt
#>    50.00    9.85    0.06   10.08   15.00    0.22   -0.44
#>                                                         
#> lowest : 150.0, 152.0, 152.4, 153.5, 154.94 (2)
#> highest: 191.8, 193.04, 195.0, 196.0, 200.0
#> 
#> ' 95%-CI (classic)
#> 
#> ------------------------------------------------------------------------------ 
#> 11 - M.I (factor - dichotomous)
#> 
#>   length      n    NAs unique
#>      237    209     28      2
#>           88.2%  11.8%       
#> 
#>           freq   perc  lci.95  uci.95'
#> Imperial    68  32.5%   26.5%   39.2%
#> Metric     141  67.5%   60.8%   73.5%
#> 
#> ' 95%-CI (Wilson)
#> 
#> ------------------------------------------------------------------------------ 
#> 12 - Age (numeric)
#> 
#>   length       n    NAs  unique     0s   mean  meanCI'
#>      237     237      0      88      0  20.37   19.55
#>           100.0%   0.0%           0.0%          21.20
#>                                                      
#>      .05     .10    .25  median    .75    .90     .95
#>    17.08   17.22  17.67   18.58  20.17  23.58   30.68
#>                                                      
#>    range      sd  vcoef     mad    IQR   skew    kurt
#>    56.25    6.47   0.32    1.61   2.50   5.16   33.47
#>                                                      
#> lowest : 16.75, 16.92 (3), 17.0 (2), 17.08 (7), 17.17 (11)
#> highest: 41.58, 43.83, 44.25, 70.42, 73.0
#> 
#> ' 95%-CI (classic)
survey %>% summarytools::dfSummary()
#> Data Frame Summary  
#> survey  
#> Dimensions: 237 x 12  
#> Duplicates: 0  
#> 
#> ------------------------------------------------------------------------------------------------------------------
#> No   Variable            Stats / Values            Freqs (% of Valid)   Graph                 Valid      Missing  
#> ---- ------------------- ------------------------- -------------------- --------------------- ---------- ---------
#> 1    Sex                 1. Female                 118 (50.0%)          IIIIIIIIII            236        1        
#>      [factor]            2. Male                   118 (50.0%)          IIIIIIIIII            (99.6%)    (0.4%)   
#> 
#> 2    Wr.Hnd              Mean (sd) : 18.7 (1.9)    60 distinct values           : .           236        1        
#>      [numeric]           min < med < max:                                       : : .         (99.6%)    (0.4%)   
#>                          13 < 18.5 < 23.2                                     . : : :                             
#>                          IQR (CV) : 2.3 (0.1)                                 : : : : :                           
#>                                                                         .   : : : : : : : :                       
#> 
#> 3    NW.Hnd              Mean (sd) : 18.6 (2)      68 distinct values           :             236        1        
#>      [numeric]           min < med < max:                                       : .           (99.6%)    (0.4%)   
#>                          12.5 < 18.5 < 23.5                                     : : :                             
#>                          IQR (CV) : 2.2 (0.1)                                 . : : : .                           
#>                                                                         .   . : : : : : : :                       
#> 
#> 4    W.Hnd               1. Left                    18 ( 7.6%)          I                     236        1        
#>      [factor]            2. Right                  218 (92.4%)          IIIIIIIIIIIIIIIIII    (99.6%)    (0.4%)   
#> 
#> 5    Fold                1. L on R                  99 (41.8%)          IIIIIIII              237        0        
#>      [factor]            2. Neither                 18 ( 7.6%)          I                     (100.0%)   (0.0%)   
#>                          3. R on L                 120 (50.6%)          IIIIIIIIII                                
#> 
#> 6    Pulse               Mean (sd) : 74.2 (11.7)   43 distinct values         . :             192        45       
#>      [integer]           min < med < max:                                     : :             (81.0%)    (19.0%)  
#>                          35 < 72.5 < 104                                      : : .                               
#>                          IQR (CV) : 14 (0.2)                                  : : :                               
#>                                                                           . : : : : :                             
#> 
#> 7    Clap                1. Left                    39 (16.5%)          III                   236        1        
#>      [factor]            2. Neither                 50 (21.2%)          IIII                  (99.6%)    (0.4%)   
#>                          3. Right                  147 (62.3%)          IIIIIIIIIIII                              
#> 
#> 8    Exer                1. Freq                   115 (48.5%)          IIIIIIIII             237        0        
#>      [factor]            2. None                    24 (10.1%)          II                    (100.0%)   (0.0%)   
#>                          3. Some                    98 (41.4%)          IIIIIIII                                  
#> 
#> 9    Smoke               1. Never                  189 (80.1%)          IIIIIIIIIIIIIIII      236        1        
#>      [ordered, factor]   2. Occas                   19 ( 8.1%)          I                     (99.6%)    (0.4%)   
#>                          3. Regul                   17 ( 7.2%)          I                                         
#>                          4. Heavy                   11 ( 4.7%)                                                    
#> 
#> 10   Height              Mean (sd) : 172.4 (9.8)   67 distinct values         :               209        28       
#>      [numeric]           min < med < max:                                     : . .           (88.2%)    (11.8%)  
#>                          150 < 171 < 200                                    : : : : :                             
#>                          IQR (CV) : 15 (0.1)                              : : : : : : .                           
#>                                                                         : : : : : : : : .                         
#> 
#> 11   M.I                 1. Imperial                68 (32.5%)          IIIIII                209        28       
#>      [factor]            2. Metric                 141 (67.5%)          IIIIIIIIIIIII         (88.2%)    (11.8%)  
#> 
#> 12   Age                 Mean (sd) : 20.4 (6.5)    88 distinct values   :                     237        0        
#>      [numeric]           min < med < max:                               :                     (100.0%)   (0.0%)   
#>                          16.8 < 18.6 < 73                               :                                         
#>                          IQR (CV) : 2.5 (0.3)                           :                                         
#>                                                                         : .                                       
#> ------------------------------------------------------------------------------------------------------------------
```

#### Több numerikus változó


```r
num.valtozok <- survey[, c("Wr.Hnd", "NW.Hnd", "Height")]
num.valtozok %>% psych::describe()
#>        vars   n   mean   sd median trimmed   mad   min   max range skew
#> Wr.Hnd    1 236  18.67 1.88   18.5   18.61  1.48  13.0  23.2  10.2 0.18
#> NW.Hnd    2 236  18.58 1.97   18.5   18.55  1.63  12.5  23.5  11.0 0.02
#> Height    3 209 172.38 9.85  171.0  172.19 10.08 150.0 200.0  50.0 0.22
#>        kurtosis   se
#> Wr.Hnd     0.30 0.12
#> NW.Hnd     0.44 0.13
#> Height    -0.44 0.68
num.valtozok %>% DescTools::Desc(plotit = F)
#> ------------------------------------------------------------------------------ 
#> Describe . (data.frame):
#> 
#> data frame:	237 obs. of  3 variables
#> 		208 complete cases (87.8%)
#> 
#>   Nr  ColName  Class    NAs         Levels
#>   1   Wr.Hnd   numeric   1 (0.4%)         
#>   2   NW.Hnd   numeric   1 (0.4%)         
#>   3   Height   numeric  28 (11.8%)        
#> 
#> 
#> ------------------------------------------------------------------------------ 
#> 1 - Wr.Hnd (numeric)
#> 
#>   length      n    NAs  unique     0s   mean  meanCI'
#>      237    236      1      60      0  18.67   18.43
#>           99.6%   0.4%           0.0%          18.91
#>                                                     
#>      .05    .10    .25  median    .75    .90     .95
#>    16.00  16.50  17.50   18.50  19.80  21.15   22.05
#>                                                     
#>    range     sd  vcoef     mad    IQR   skew    kurt
#>    10.20   1.88   0.10    1.48   2.30   0.18    0.30
#>                                                     
#> lowest : 13.0 (2), 14.0 (2), 15.0, 15.4, 15.5 (2)
#> highest: 22.5 (4), 22.8, 23.0 (2), 23.1, 23.2 (3)
#> 
#> heap(?): remarkable frequency (9.7%) for the mode(s) (= 17.5)
#> 
#> ' 95%-CI (classic)
#> 
#> ------------------------------------------------------------------------------ 
#> 2 - NW.Hnd (numeric)
#> 
#>   length      n    NAs  unique     0s   mean  meanCI'
#>      237    236      1      68      0  18.58   18.33
#>           99.6%   0.4%           0.0%          18.83
#>                                                     
#>      .05    .10    .25  median    .75    .90     .95
#>    15.50  16.30  17.50   18.50  19.72  21.00   22.22
#>                                                     
#>    range     sd  vcoef     mad    IQR   skew    kurt
#>    11.00   1.97   0.11    1.63   2.22   0.02    0.44
#>                                                     
#> lowest : 12.5, 13.0 (2), 13.3, 13.5, 15.0
#> highest: 22.7, 23.0, 23.2 (2), 23.3, 23.5
#> 
#> heap(?): remarkable frequency (8.9%) for the mode(s) (= 18)
#> 
#> ' 95%-CI (classic)
#> 
#> ------------------------------------------------------------------------------ 
#> 3 - Height (numeric)
#> 
#>   length       n     NAs  unique      0s    mean  meanCI'
#>      237     209      28      67       0  172.38  171.04
#>            88.2%   11.8%            0.0%          173.72
#>                                                         
#>      .05     .10     .25  median     .75     .90     .95
#>   157.00  160.00  165.00  171.00  180.00  185.42  189.60
#>                                                         
#>    range      sd   vcoef     mad     IQR    skew    kurt
#>    50.00    9.85    0.06   10.08   15.00    0.22   -0.44
#>                                                         
#> lowest : 150.0, 152.0, 152.4, 153.5, 154.94 (2)
#> highest: 191.8, 193.04, 195.0, 196.0, 200.0
#> 
#> ' 95%-CI (classic)
num.valtozok %>% summarytools::descr()
#> Descriptive Statistics  
#> num.valtozok  
#> N: 237  
#> 
#>                     Height   NW.Hnd   Wr.Hnd
#> ----------------- -------- -------- --------
#>              Mean   172.38    18.58    18.67
#>           Std.Dev     9.85     1.97     1.88
#>               Min   150.00    12.50    13.00
#>                Q1   165.00    17.50    17.50
#>            Median   171.00    18.50    18.50
#>                Q3   180.00    19.75    19.80
#>               Max   200.00    23.50    23.20
#>               MAD    10.08     1.63     1.48
#>               IQR    15.00     2.22     2.30
#>                CV     0.06     0.11     0.10
#>          Skewness     0.22     0.02     0.18
#>       SE.Skewness     0.17     0.16     0.16
#>          Kurtosis    -0.44     0.44     0.30
#>           N.Valid   209.00   236.00   236.00
#>         Pct.Valid    88.19    99.58    99.58
```


### Táblázatok

Egydimenziós táblázatok


```r
# faktor
survey$W.Hnd %>%  DescTools::Desc(plotit = F)
#> ------------------------------------------------------------------------------ 
#> . (factor - dichotomous)
#> 
#>   length      n    NAs unique
#>      237    236      1      2
#>           99.6%   0.4%       
#> 
#>        freq   perc  lci.95  uci.95'
#> Left     18   7.6%    4.9%   11.7%
#> Right   218  92.4%   88.3%   95.1%
#> 
#> ' 95%-CI (Wilson)
survey$W.Hnd %>%  summarytools::freq()
#> Frequencies  
#> survey$W.Hnd  
#> Type: Factor  
#> 
#>               Freq   % Valid   % Valid Cum.   % Total   % Total Cum.
#> ----------- ------ --------- -------------- --------- --------------
#>        Left     18      7.63           7.63      7.59           7.59
#>       Right    218     92.37         100.00     91.98          99.58
#>        <NA>      1                               0.42         100.00
#>       Total    237    100.00         100.00    100.00         100.00
# rendezett faktor
survey$Smoke %>%  DescTools::Desc(plotit = F)
#> ------------------------------------------------------------------------------ 
#> . (ordered, factor)
#> 
#>   length      n    NAs unique levels  dupes
#>      237    236      1      4      4      y
#>           99.6%   0.4%                     
#> 
#>    level  freq   perc  cumfreq  cumperc
#> 1  Never   189  80.1%      189    80.1%
#> 2  Occas    19   8.1%      208    88.1%
#> 3  Regul    17   7.2%      225    95.3%
#> 4  Heavy    11   4.7%      236   100.0%
survey$Smoke %>%  summarytools::freq()
#> Frequencies  
#> survey$Smoke  
#> Type: Ordered Factor  
#> 
#>               Freq   % Valid   % Valid Cum.   % Total   % Total Cum.
#> ----------- ------ --------- -------------- --------- --------------
#>       Never    189     80.08          80.08     79.75          79.75
#>       Occas     19      8.05          88.14      8.02          87.76
#>       Regul     17      7.20          95.34      7.17          94.94
#>       Heavy     11      4.66         100.00      4.64          99.58
#>        <NA>      1                               0.42         100.00
#>       Total    237    100.00         100.00    100.00         100.00
```


Kétdimenziós táblázatok



```r
# faktor
library(magrittr)
survey %>%  DescTools::Desc(Sex~W.Hnd, data=., plotit = F)
#> ------------------------------------------------------------------------------ 
#> Sex ~ W.Hnd (.)
#> 
#> Summary: 
#> n: 235, rows: 2, columns: 2
#> 
#> Pearson's Chi-squared test (cont. adj):
#>   X-squared = 0.24, df = 1, p-value = 0.6
#> Fisher's exact test p-value = 0.6
#> McNemar's chi-squared = 82, df = 1, p-value <2e-16
#> 
#>                     estimate lwr.ci upr.ci'
#>                                           
#> odds ratio             0.687  0.252  1.871
#> rel. risk (col1)       0.706  0.278  1.792
#> rel. risk (col2)       1.027  0.956  1.103
#> 
#> 
#> Contingency Coeff.     0.048
#> Cramer's V             0.048
#> Kendall Tau-b          -0.048
#> 
#>                                     
#>          W.Hnd   Left   Right    Sum
#> Sex                                 
#>                                     
#> Female   freq       7     110    117
#>          perc    3.0%   46.8%  49.8%
#>          p.row   6.0%   94.0%      .
#>          p.col  41.2%   50.5%      .
#>                                     
#> Male     freq      10     108    118
#>          perc    4.3%   46.0%  50.2%
#>          p.row   8.5%   91.5%      .
#>          p.col  58.8%   49.5%      .
#>                                     
#> Sum      freq      17     218    235
#>          perc    7.2%   92.8% 100.0%
#>          p.row      .       .      .
#>          p.col      .       .      .
#>                                     
#> 
#> ----------
#> ' 95% conf. level
survey %$%  summarytools::ctable(x = Sex, y = W.Hnd)
#> Cross-Tabulation, Row Proportions  
#> Sex * W.Hnd  
#> Data Frame: survey  
#> 
#> -------- ------- ------------- ------------- ---------- --------------
#>            W.Hnd          Left         Right       <NA>          Total
#>      Sex                                                              
#>   Female            7 (  5.9%)   110 (93.2%)   1 (0.8%)   118 (100.0%)
#>     Male           10 (  8.5%)   108 (91.5%)   0 (0.0%)   118 (100.0%)
#>     <NA>            1 (100.0%)     0 ( 0.0%)   0 (0.0%)     1 (100.0%)
#>    Total           18 (  7.6%)   218 (92.0%)   1 (0.4%)   237 (100.0%)
#> -------- ------- ------------- ------------- ---------- --------------
```


#### Mutatók csoportokra


```r
survey$Height %>% psych::describeBy(x = ., g = survey[,c("Sex", "W.Hnd")], mat=T)
#>     item group1 group2 vars  n  mean     sd median trimmed   mad   min max
#> X11    1 Female   Left    1  6 167.7  4.920  170.0   167.7 2.224 160.0 172
#> X12    2   Male   Left    1  9 180.5 11.070  180.0   180.5 7.028 165.0 200
#> X13    3 Female  Right    1 95 165.4  6.063  166.4   165.7 5.337 150.0 178
#> X14    4   Male  Right    1 97 178.7  8.142  180.0   179.0 7.413 154.9 196
#>     range    skew kurtosis     se
#> X11 11.98 -0.5684  -1.7387 2.0085
#> X12 35.00  0.2830  -1.1371 3.6899
#> X13 28.00 -0.3992  -0.4297 0.6221
#> X14 41.06 -0.3472  -0.1779 0.8267
num.valtozok %>% psych::describeBy(x = ., g = survey[,c("Sex", "W.Hnd")], mat=T)
#>         item group1 group2 vars   n   mean      sd median trimmed    mad   min
#> Wr.Hnd1    1 Female   Left    1   7  18.16  1.4478  18.50   18.16 0.7413  15.4
#> Wr.Hnd2    2   Male   Left    1  10  19.99  1.6455  19.65   19.93 1.3343  17.5
#> Wr.Hnd3    3 Female  Right    1 110  17.60  1.2353  17.50   17.63 1.1119  13.0
#> Wr.Hnd4    4   Male  Right    1 107  19.72  1.7658  19.50   19.71 1.4826  14.0
#> NW.Hnd1    5 Female   Left    2   7  17.94  0.9467  18.00   17.94 0.7413  16.4
#> NW.Hnd2    6   Male   Left    2  10  19.84  1.5138  19.75   19.93 1.4826  17.0
#> NW.Hnd3    7 Female  Right    2 110  17.47  1.3714  17.55   17.51 1.0378  12.5
#> NW.Hnd4    8   Male  Right    2 107  19.70  1.8351  19.50   19.72 1.4826  13.3
#> Height1    9 Female   Left    3   6 167.67  4.9199 170.00  167.67 2.2239 160.0
#> Height2   10   Male   Left    3   9 180.54 11.0697 180.00  180.54 7.0275 165.0
#> Height3   11 Female  Right    3  95 165.41  6.0631 166.40  165.65 5.3374 150.0
#> Height4   12   Male  Right    3  97 178.67  8.1425 180.00  178.96 7.4130 154.9
#>           max range     skew kurtosis     se
#> Wr.Hnd1  20.0  4.60 -0.66791 -0.72047 0.5472
#> Wr.Hnd2  23.0  5.50  0.29434 -0.95330 0.5204
#> Wr.Hnd3  20.8  7.80 -0.43157  1.34878 0.1178
#> Wr.Hnd4  23.2  9.20 -0.06857  0.01661 0.1707
#> NW.Hnd1  19.5  3.10  0.02948 -0.92181 0.3578
#> NW.Hnd2  22.0  5.00 -0.32153 -1.02247 0.4787
#> NW.Hnd3  20.7  8.20 -0.64755  1.83733 0.1308
#> NW.Hnd4  23.5 10.20 -0.27990  0.67647 0.1774
#> Height1 172.0 11.98 -0.56840 -1.73871 2.0085
#> Height2 200.0 35.00  0.28304 -1.13707 3.6899
#> Height3 178.0 28.00 -0.39916 -0.42966 0.6221
#> Height4 196.0 41.06 -0.34723 -0.17790 0.8267
survey %>%  DescTools::Desc(Height ~ Sex * W.Hnd, data=., plotit = F)
#> ------------------------------------------------------------------------------ 
#> Height ~ Sex (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 208 (87.8%), missings: 29 (12.2%), groups: 2
#> 
#>                       
#>         Female    Male
#> mean    165.69  178.83
#> median  166.75  180.00
#> sd        6.15    8.38
#> IQR       7.44   12.21
#> n          102     106
#> np      49.04%  50.96%
#> NAs         16      12
#> 0s           0       0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 97, df = 1, p-value <2e-16
#> 
#> 
#> Warning:
#>   Grouping variable contains 1 NAs (0.422%).
#> 
#> ------------------------------------------------------------------------------ 
#> Height ~ W.Hnd (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 208 (87.8%), missings: 29 (12.2%), groups: 2
#> 
#>                       
#>           Left   Right
#> mean    175.18  172.11
#> median  172.00  170.59
#> sd       10.67    9.78
#> IQR      11.22   15.00
#> n           16     192
#> np       7.69%  92.31%
#> NAs          2      26
#> 0s           0       0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 0.89, df = 1, p-value = 0.3
#> 
#> 
#> Warning:
#>   Grouping variable contains 1 NAs (0.422%).
#> 
#> ------------------------------------------------------------------------------ 
#> Height ~ Sex:W.Hnd (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 207 (87.3%), missings: 30 (12.7%), groups: 4
#> 
#>                                                               
#>          Female:Left     Male:Left  Female:Right    Male:Right
#> mean          167.67        180.54        165.41        178.67
#> median        170.00        180.00        166.40        180.00
#> sd              4.92         11.07          6.06          8.14
#> IQR             6.00          7.62          7.47         12.28
#> n                  6             9            95            97
#> np             2.90%         4.35%        45.89%        46.86%
#> NAs                1             1            15            11
#> 0s                 0             0             0             0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 99, df = 3, p-value <2e-16
#> 
#> 
#> Warning:
#>   Grouping variable contains 2 NAs (0.844%).
survey %>%  DescTools::Desc(Height + Age ~ Sex * W.Hnd, data=., plotit = F)
#> ------------------------------------------------------------------------------ 
#> Height ~ Sex (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 208 (87.8%), missings: 29 (12.2%), groups: 2
#> 
#>                       
#>         Female    Male
#> mean    165.69  178.83
#> median  166.75  180.00
#> sd        6.15    8.38
#> IQR       7.44   12.21
#> n          102     106
#> np      49.04%  50.96%
#> NAs         16      12
#> 0s           0       0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 97, df = 1, p-value <2e-16
#> 
#> 
#> Warning:
#>   Grouping variable contains 1 NAs (0.422%).
#> 
#> ------------------------------------------------------------------------------ 
#> Height ~ W.Hnd (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 208 (87.8%), missings: 29 (12.2%), groups: 2
#> 
#>                       
#>           Left   Right
#> mean    175.18  172.11
#> median  172.00  170.59
#> sd       10.67    9.78
#> IQR      11.22   15.00
#> n           16     192
#> np       7.69%  92.31%
#> NAs          2      26
#> 0s           0       0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 0.89, df = 1, p-value = 0.3
#> 
#> 
#> Warning:
#>   Grouping variable contains 1 NAs (0.422%).
#> 
#> ------------------------------------------------------------------------------ 
#> Height ~ Sex:W.Hnd (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 207 (87.3%), missings: 30 (12.7%), groups: 4
#> 
#>                                                               
#>          Female:Left     Male:Left  Female:Right    Male:Right
#> mean          167.67        180.54        165.41        178.67
#> median        170.00        180.00        166.40        180.00
#> sd              4.92         11.07          6.06          8.14
#> IQR             6.00          7.62          7.47         12.28
#> n                  6             9            95            97
#> np             2.90%         4.35%        45.89%        46.86%
#> NAs                1             1            15            11
#> 0s                 0             0             0             0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 99, df = 3, p-value <2e-16
#> 
#> 
#> Warning:
#>   Grouping variable contains 2 NAs (0.844%).
#> 
#> ------------------------------------------------------------------------------ 
#> Age ~ Sex (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 236 (99.6%), missings: 1 (0.4%), groups: 2
#> 
#>                       
#>         Female    Male
#> mean     20.41   20.33
#> median   18.42   18.88
#> sd        6.91    6.07
#> IQR       2.48    2.37
#> n          118     118
#> np      50.00%  50.00%
#> NAs          0       0
#> 0s           0       0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 4.3, df = 1, p-value = 0.04
#> 
#> 
#> Warning:
#>   Grouping variable contains 1 NAs (0.422%).
#> 
#> ------------------------------------------------------------------------------ 
#> Age ~ W.Hnd (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 236 (99.6%), missings: 1 (0.4%), groups: 2
#> 
#>                       
#>           Left   Right
#> mean     18.63   20.53
#> median   18.50   18.58
#> sd        1.29    6.72
#> IQR       1.52    2.62
#> n           18     218
#> np       7.63%  92.37%
#> NAs          0       0
#> 0s           0       0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 0.72, df = 1, p-value = 0.4
#> 
#> 
#> Warning:
#>   Grouping variable contains 1 NAs (0.422%).
#> 
#> ------------------------------------------------------------------------------ 
#> Age ~ Sex:W.Hnd (.)
#> 
#> Summary: 
#> n pairs: 237, valid: 235 (99.2%), missings: 2 (0.8%), groups: 4
#> 
#>                                                               
#>          Female:Left     Male:Left  Female:Right    Male:Right
#> mean           18.36         18.53         20.57         20.50
#> median         18.50         18.46         18.42         18.92
#> sd              1.02          1.22          7.12          6.31
#> IQR             1.63          1.08          2.67          2.42
#> n                  7            10           110           108
#> np             2.98%         4.26%        46.81%        45.96%
#> NAs                0             0             0             0
#> 0s                 0             0             0             0
#> 
#> Kruskal-Wallis rank sum test:
#>   Kruskal-Wallis chi-squared = 5.7, df = 3, p-value = 0.1
#> 
#> 
#> Warning:
#>   Grouping variable contains 2 NAs (0.844%).
num.valtozok %>% summarytools::stby(
  data = .,
  INDICES = survey[, c("W.Hnd", "Sex")], 
  FUN = summarytools::descr, 
  stats = "common" 
)
#> Descriptive Statistics  
#> num.valtozok  
#> N: 7  
#> 
#>                   Height   NW.Hnd   Wr.Hnd
#> --------------- -------- -------- --------
#>            Mean   167.67    17.94    18.16
#>         Std.Dev     4.92     0.95     1.45
#>             Min   160.02    16.40    15.40
#>          Median   170.00    18.00    18.50
#>             Max   172.00    19.50    20.00
#>         N.Valid     6.00     7.00     7.00
#>       Pct.Valid    85.71   100.00   100.00
#> 
#> N: 110  
#> 
#>                   Height   NW.Hnd   Wr.Hnd
#> --------------- -------- -------- --------
#>            Mean   165.41    17.47    17.60
#>         Std.Dev     6.06     1.37     1.24
#>             Min   150.00    12.50    13.00
#>          Median   166.40    17.55    17.50
#>             Max   178.00    20.70    20.80
#>         N.Valid    95.00   110.00   110.00
#>       Pct.Valid    86.36   100.00   100.00
#> 
#> N: 10  
#> 
#>                   Height   NW.Hnd   Wr.Hnd
#> --------------- -------- -------- --------
#>            Mean   180.54    19.84    19.99
#>         Std.Dev    11.07     1.51     1.65
#>             Min   165.00    17.00    17.50
#>          Median   180.00    19.75    19.65
#>             Max   200.00    22.00    23.00
#>         N.Valid     9.00    10.00    10.00
#>       Pct.Valid    90.00   100.00   100.00
#> 
#> N: 108  
#> 
#>                   Height   NW.Hnd   Wr.Hnd
#> --------------- -------- -------- --------
#>            Mean   178.67    19.70    19.72
#>         Std.Dev     8.14     1.84     1.77
#>             Min   154.94    13.30    14.00
#>          Median   180.00    19.50    19.50
#>             Max   196.00    23.50    23.20
#>         N.Valid    97.00   107.00   107.00
#>       Pct.Valid    89.81    99.07    99.07
```



Feladatok

RcmdrMisc - numSummary
jmv - descriptives



