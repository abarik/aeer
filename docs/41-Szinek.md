# Színek {#szinek}

Az R grafikus elemeinek a színét magunk is megválaszthatjuk. Ehhez nyújt segítséget ez a függelék.

Megismerjük 

* az előre definiált paletta színeit (\@ref(az-elore-definialt) fejezet),
* színek választását az **RColorBrewer** csomag segítségével (\@ref(szinek-valasztasa-rcolorbrewer) fejezet),
* színek választása a **dichromat** csomag segítségével (\@ref(szinek-valasztasa-dichromat) fejezet),
* színek választását egyéb paletták segítségével (\@ref(szinek-valasztasa-egyeb) fejezet),
* és végül az előre definiált 657 színnevet (\@ref(a-657-szinnev) fejezet).

## Az előre definiált paletta színei {#az-elore-definialt}

Az előre definiált paletta 8 színt tartalmaz. A \@ref(fig:default-palette) ábra az alapértelmezett színeket tartalmazza. Az előre definiált paletta egyes színeit sorszámokkal (1, 2 stb.) tudjuk elérni, amelyeket rendszerint a rajzfüggvények `col=` argumentumában kell elhelyezni. Az 1. szín a palettán a fekete, a második a piros, és így tovább.



```r
set.seed(0)
x <- rpois(n = 50, lambda = 100)
par(las = 1, mgp = c(0, 0.2, 0), tcl = -0.2, mar = c(3, 2, 1, 1))
bar <- barplot(x[1:8], col = 1:8, names.arg = 1:8)
mtext(side = 1, at = bar, text = palette(), line = 1)
```

<div class="figure" style="text-align: center">
<img src="41-Szinek_files/figure-html/default-palette-1.png" alt="Az alapértelmezett paletta 8 színének sorszáma és neve" width="90%" />
<p class="caption">(\#fig:default-palette)Az alapértelmezett paletta 8 színének sorszáma és neve</p>
</div>

Más színeket is alapértelmezetté tehetünk, sőt a színek számát is megnövelhetjük a palettán. Ennek a legegyszerűbb módja, ha a `palette()` függvény argumentumában színkódokat tartalmazó karakteres vektort adunk meg.


```r
szinek <- c("#E84F2C", "#E31307", "#E84F2C", "#E4BA51", "#E3B786", "#825846", 
    "#59392A", "#564C30", "#897D6E", "#627C82", "#93AF8A", "#A0BA5E", "#63BA5E", 
    "#5EBAB2", "#6596B7")
palette(value = szinek)
```

A rajzfüggvények ezután a paletta új színeit használják.


```r
barplot(x[1:15], col = 1:15)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-2-1.png" width="90%" style="display: block; margin: auto;" />

Ha megváltoztattuk a paletta színeit, akkor az alapértelmezett színekhez a `palette("default")` paranccsal térhetünk vissza.


```r
palette(value = "default")  # alapértelmezett paletta visszaállítása
```

## Színek választása az RColorBrewer csomag segítségével {#szinek-valasztasa-rcolorbrewer}

Az **RColorBrewer** csomag `brewer.pal()` függvénye szolgál az előre definiált színpaletták alapján színkódokat tartalmazó vektor létrehozására. A függvény általános alakja:


```r
library(RColorBrewer)
brewer.pal(n, name)
```

Az `n=` a kívánt színek számát határozza meg, amely háromnál nem lehet kevesebb. A `name=` a színpaletta nevét tartalmazza. A választható neveket a `brewer.pal.info` adattábla tartalmazza, amely a palettából elérhető összes szín számát és a paletta típusát is tartalmazza. Ez utóbbi a `category` oszlopban olvasható, amelynek lehetséges értékei: `seq`, `div` és `qual`. A szekvenciális palettákat (`seq`) rendezett adatok ábrázolására használhatjuk: a világosabb színek a kisebb értékeket, a sötétebbek a nagyobbakat szemléltethetik. A divergens (`div`) paletták a középső részt világosabb színekkel, a szélső értékeket sötétebb színekkel jelenítik meg. A kvalitatív (`qual`) paletta kategorikus változók megjelenítésére használható.


```r
library(RColorBrewer)
brewer.pal.info
#>          maxcolors category colorblind
#> BrBG            11      div       TRUE
#> PiYG            11      div       TRUE
#> PRGn            11      div       TRUE
#> PuOr            11      div       TRUE
#> RdBu            11      div       TRUE
#> RdGy            11      div      FALSE
#> RdYlBu          11      div       TRUE
#> RdYlGn          11      div      FALSE
#> Spectral        11      div      FALSE
#> Accent           8     qual      FALSE
#> Dark2            8     qual       TRUE
#> Paired          12     qual       TRUE
#> Pastel1          9     qual      FALSE
#> Pastel2          8     qual      FALSE
#> Set1             9     qual      FALSE
#> Set2             8     qual       TRUE
#> Set3            12     qual      FALSE
#> Blues            9      seq       TRUE
#> BuGn             9      seq       TRUE
#> BuPu             9      seq       TRUE
#> GnBu             9      seq       TRUE
#> Greens           9      seq       TRUE
#> Greys            9      seq       TRUE
#> Oranges          9      seq       TRUE
#> OrRd             9      seq       TRUE
#> PuBu             9      seq       TRUE
#> PuBuGn           9      seq       TRUE
#> PuRd             9      seq       TRUE
#> Purples          9      seq       TRUE
#> RdPu             9      seq       TRUE
#> Reds             9      seq       TRUE
#> YlGn             9      seq       TRUE
#> YlGnBu           9      seq       TRUE
#> YlOrBr           9      seq       TRUE
#> YlOrRd           9      seq       TRUE
```

A továbbiakban a `brewer.pal()` függvény használatára mutatunk példát:


```r
# az x adatvektor beállítása
set.seed(0)
x <- rpois(n = 50, lambda = 100)
# grafikus paraméterek beállítása
par(las = 1, mgp = c(0, 0.2, 0), tcl = -0.2, mar = c(3, 2, 1, 1))
library(RColorBrewer)
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "BrBG"), names.arg = 1:11, 
    main = "BrBG, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "BrBG"), names.arg = 1:11, 
    main = "BrBG, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-6-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "PiYG"), names.arg = 1:11, 
    main = "PiYG, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "PiYG"), names.arg = 1:11, 
    main = "PiYG, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-7-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "PRGn"), names.arg = 1:11, 
    main = "PRGn, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "PRGn"), names.arg = 1:11, 
    main = "PRGn, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-8-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "PuOr"), names.arg = 1:11, 
    main = "PuOr, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "PuOr"), names.arg = 1:11, 
    main = "PuOr, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-9-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "RdBu"), names.arg = 1:11, 
    main = "RdBu, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "RdBu"), names.arg = 1:11, 
    main = "RdBu, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-10-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "RdGy"), names.arg = 1:11, 
    main = "RdGy, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "RdGy"), names.arg = 1:11, 
    main = "RdGy, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-11-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "RdYlBu"), names.arg = 1:11, 
    main = "RdYlBu, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "RdYlBu"), names.arg = 1:11, 
    main = "RdYlBu, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-12-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "RdYlGn"), names.arg = 1:11, 
    main = "RdYlGn, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "RdYlGn"), names.arg = 1:11, 
    main = "RdYlGn, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-13-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:11], col = brewer.pal(n = 11, name = "Spectral"), names.arg = 1:11, 
    main = "Spectral, div")
barplot(x[1:11], col = brewer.pal(n = 11, name = "Spectral"), names.arg = 1:11, 
    main = "Spectral, div", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-14-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:8], col = brewer.pal(n = 8, name = "Accent"), names.arg = 1:8, main = "Accent, qual")
barplot(x[1:8], col = brewer.pal(n = 8, name = "Accent"), names.arg = 1:8, main = "Accent, qual", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-15-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:8], col = brewer.pal(n = 8, name = "Dark2"), names.arg = 1:8, main = "Dark2, qual")
barplot(x[1:8], col = brewer.pal(n = 8, name = "Dark2"), names.arg = 1:8, main = "Dark2, qual", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-16-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:12], col = brewer.pal(n = 12, name = "Paired"), names.arg = 1:12, 
    main = "Paired, qual")
barplot(x[1:12], col = brewer.pal(n = 12, name = "Paired"), names.arg = 1:12, 
    main = "Paired, qual", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-17-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "Pastel1"), names.arg = 1:9, 
    main = "Pastel1, qual")
barplot(x[1:9], col = brewer.pal(n = 9, name = "Pastel1"), names.arg = 1:9, 
    main = "Pastel1, qual", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-18-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:8], col = brewer.pal(n = 8, name = "Pastel2"), names.arg = 1:8, 
    main = "Pastel2, qual")
barplot(x[1:8], col = brewer.pal(n = 8, name = "Pastel2"), names.arg = 1:8, 
    main = "Pastel2, qual", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-19-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "Set1"), names.arg = 1:9, main = "Set1, qual")
barplot(x[1:9], col = brewer.pal(n = 9, name = "Set1"), names.arg = 1:9, main = "Set1, qual", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-20-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:8], col = brewer.pal(n = 8, name = "Set2"), names.arg = 1:8, main = "Set2, qual")
barplot(x[1:8], col = brewer.pal(n = 8, name = "Set2"), names.arg = 1:8, main = "Set2, qual", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-21-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:12], col = brewer.pal(n = 12, name = "Set3"), names.arg = 1:12, 
    main = "Set3, qual")
barplot(x[1:12], col = brewer.pal(n = 12, name = "Set3"), names.arg = 1:12, 
    main = "Set3, qual", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-22-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "Blues"), names.arg = 1:9, main = "Blues, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "Blues"), names.arg = 1:9, main = "Blues, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-23-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "BuGn"), names.arg = 1:9, main = "BuGn, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "BuGn"), names.arg = 1:9, main = "BuGn, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-24-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "BuPu"), names.arg = 1:9, main = "BuPu, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "BuPu"), names.arg = 1:9, main = "BuPu, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-25-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "GnBu"), names.arg = 1:9, main = "GnBu, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "GnBu"), names.arg = 1:9, main = "GnBu, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-26-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "Greens"), names.arg = 1:9, main = "Greens, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "Greens"), names.arg = 1:9, main = "Greens, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-27-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "Greys"), names.arg = 1:9, main = "Greys, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "Greys"), names.arg = 1:9, main = "Greys, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-28-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "Oranges"), names.arg = 1:9, 
    main = "Oranges, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "Oranges"), names.arg = 1:9, 
    main = "Oranges, seq", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-29-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "OrRd"), names.arg = 1:9, main = "OrRd, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "OrRd"), names.arg = 1:9, main = "OrRd, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-30-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "PuBu"), names.arg = 1:9, main = "PuBu, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "PuBu"), names.arg = 1:9, main = "PuBu, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-31-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "PuBuGn"), names.arg = 1:9, main = "PuBuGn, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "PuBuGn"), names.arg = 1:9, main = "PuBuGn, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-32-1.png" width="90%" style="display: block; margin: auto;" />




```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "PuRd"), names.arg = 1:9, main = "PuRd, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "PuRd"), names.arg = 1:9, main = "PuRd, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-33-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "Purples"), names.arg = 1:9, 
    main = "Purples, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "Purples"), names.arg = 1:9, 
    main = "Purples, seq", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-34-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "RdPu"), names.arg = 1:9, main = "RdPu, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "RdPu"), names.arg = 1:9, main = "RdPu, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-35-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "Reds"), names.arg = 1:9, main = "Reds, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "Reds"), names.arg = 1:9, main = "Reds, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-36-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "YlGn"), names.arg = 1:9, main = "YlGn, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "YlGn"), names.arg = 1:9, main = "YlGn, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-37-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "YlGnBu"), names.arg = 1:9, main = "YlGnBu, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "YlGnBu"), names.arg = 1:9, main = "YlGnBu, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-38-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "YlOrBr"), names.arg = 1:9, main = "YlOrBr, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "YlOrBr"), names.arg = 1:9, main = "YlOrBr, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-39-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow = c(1, 2))
barplot(x[1:9], col = brewer.pal(n = 9, name = "YlOrRd"), names.arg = 1:9, main = "YlOrRd, seq")
barplot(x[1:9], col = brewer.pal(n = 9, name = "YlOrRd"), names.arg = 1:9, main = "YlOrRd, seq", 
    border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-40-1.png" width="90%" style="display: block; margin: auto;" />



## Színek választása a dichromat csomag segítségével {#szinek-valasztasa-dichromat}

A `dichromat` csomag színsémai közül is választhatunk. A színsémákat a `colorschemes` lista tartalmazza. A lisatelemek neve:


```r
library(dichromat)
names(colorschemes)
#>  [1] "BrowntoBlue.10"         "BrowntoBlue.12"         "BluetoDarkOrange.12"   
#>  [4] "BluetoDarkOrange.18"    "DarkRedtoBlue.12"       "DarkRedtoBlue.18"      
#>  [7] "BluetoGreen.14"         "BluetoGray.8"           "BluetoOrangeRed.14"    
#> [10] "BluetoOrange.10"        "BluetoOrange.12"        "BluetoOrange.8"        
#> [13] "LightBluetoDarkBlue.10" "LightBluetoDarkBlue.7"  "Categorical.12"        
#> [16] "GreentoMagenta.16"      "SteppedSequential.5"
```

Példák színek választására:


```r
# az x adatvektor beállítása
set.seed(0)
x <- rpois(n = 50, lambda = 100)
# grafikus paraméterek beállítása
par(las = 1, mgp = c(0, 0.2, 0), tcl = -0.2, mar = c(3, 2, 1, 1))
library(dichromat)
par(mfrow=c(1,2))
barplot(x[1:10], col = colorschemes$BrowntoBlue.10, names.arg = 1:10, main = "BrowntoBlue.10")
barplot(x[1:10], col = colorschemes$BrowntoBlue.10, names.arg = 1:10, main = "BrowntoBlue.10", border=NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-42-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow=c(1,2))
barplot(x[1:12], col = colorschemes$BrowntoBlue.12, names.arg = 1:12, main = "BrowntoBlue.12")
barplot(x[1:12], col = colorschemes$BrowntoBlue.12, names.arg = 1:12, main = "BrowntoBlue.12", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-43-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:12], col = colorschemes$BluetoDarkOrange.12, names.arg = 1:12, main = "BluetoDarkOrange.12")
barplot(x[1:12], col = colorschemes$BluetoDarkOrange.12, names.arg = 1:12, main = "BluetoDarkOrange.12", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-44-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:18], col = colorschemes$BluetoDarkOrange.18, names.arg = 1:18, main = "BluetoDarkOrange.18")
barplot(x[1:18], col = colorschemes$BluetoDarkOrange.18, names.arg = 1:18, main = "BluetoDarkOrange.18", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-45-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:12], col = colorschemes$DarkRedtoBlue.12, names.arg = 1:12, main = "DarkRedtoBlue.12")
barplot(x[1:12], col = colorschemes$DarkRedtoBlue.12, names.arg = 1:12, main = "DarkRedtoBlue.12", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-46-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:18], col = colorschemes$DarkRedtoBlue.18, names.arg = 1:18, main = "DarkRedtoBlue.18")
barplot(x[1:18], col = colorschemes$DarkRedtoBlue.18, names.arg = 1:18, main = "DarkRedtoBlue.18", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-47-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:14], col = colorschemes$BluetoGreen.14, names.arg = 1:14, main = "BluetoGreen.14")
barplot(x[1:14], col = colorschemes$BluetoGreen.14, names.arg = 1:14, main = "BluetoGreen.14", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-48-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:8], col = colorschemes$BluetoGray.8, names.arg = 1:8, main = "BluetoGray.8")
barplot(x[1:8], col = colorschemes$BluetoGray.8, names.arg = 1:8, main = "BluetoGray.8", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-49-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:14], col = colorschemes$BluetoOrangeRed.14, names.arg = 1:14, main = "BluetoOrangeRed.14")
barplot(x[1:14], col = colorschemes$BluetoOrangeRed.14, names.arg = 1:14, main = "BluetoOrangeRed.14", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-50-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:10], col = colorschemes$BluetoOrange.10, names.arg = 1:10, main = "BluetoOrange.10")
barplot(x[1:10], col = colorschemes$BluetoOrange.10, names.arg = 1:10, main = "BluetoOrange.10", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-51-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:12], col = colorschemes$BluetoOrange.12, names.arg = 1:12, main = "BluetoOrange.12")
barplot(x[1:12], col = colorschemes$BluetoOrange.12, names.arg = 1:12, main = "BluetoOrange.12", border = T)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-52-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:8], col = colorschemes$BluetoOrange.8, names.arg = 1:8, main = "BluetoOrange.8")
barplot(x[1:8], col = colorschemes$BluetoOrange.8, names.arg = 1:8, main = "BluetoOrange.8", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-53-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:10], col = colorschemes$LightBluetoDarkBlue.10, names.arg = 1:10, 
    main = "LightBluetoDarkBlue.10")
barplot(x[1:10], col = colorschemes$LightBluetoDarkBlue.10, names.arg = 1:10, 
    main = "LightBluetoDarkBlue.10", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-54-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:7], col = colorschemes$LightBluetoDarkBlue.7, names.arg = 1:7, main = "LightBluetoDarkBlue.7")
barplot(x[1:7], col = colorschemes$LightBluetoDarkBlue.7, names.arg = 1:7, main = "LightBluetoDarkBlue.7", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-55-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:12], col = colorschemes$Categorical.12, names.arg = 1:12, main = "Categorical.12")
barplot(x[1:12], col = colorschemes$Categorical.12, names.arg = 1:12, main = "Categorical.12", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-56-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:16], col = colorschemes$GreentoMagenta.16, names.arg = 1:16, main = "GreentoMagenta.16")
barplot(x[1:16], col = colorschemes$GreentoMagenta.16, names.arg = 1:16, main = "GreentoMagenta.16", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-57-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:25], col = colorschemes$SteppedSequential.5, names.arg = 1:25, main = "SteppedSequential.5")
barplot(x[1:25], col = colorschemes$SteppedSequential.5, names.arg = 1:25, main = "SteppedSequential.5", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-58-1.png" width="90%" style="display: block; margin: auto;" />


## Színek választása egyéb paletta segítségével {#szinek-valasztasa-egyeb}

Színpaletta létrehozásához több beépített lehetőségek közül is választhatunk.


```r
rainbow(n, start=0, end, alpha = 1)
heat.colors(n, alpha = 1)
terrain.colors(n, alpha = 1)
topo.colors(n, alpha = 1)
cm.colors(n, alpha = 1)
```

Az `n=` argumentum a létrehozandó színek számát jelenti.

Példák színpaletta létrehozására:


```r
# az x adatvektor beállítása
set.seed(0)
x <- rpois(n = 50, lambda = 100)
# grafikus paraméterek beállítása
par(las = 1, mgp = c(0, 0.2, 0), tcl = -0.2, mar = c(3, 2, 1, 1))
par(mfrow=c(1,2))
barplot(x[1:16], col = rainbow(16), names.arg = 1:16, main = "rainbow(n=16)")
barplot(x[1:16], col = rainbow(16), names.arg = 1:16, main = "rainbow(n=16)", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-60-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:16], col = rainbow(16, start = 0, end = 0.2), names.arg = 1:16, 
    main = "rainbow(n=16, start=0, end=0.2)")
barplot(x[1:16], col = rainbow(16, start = 0, end = 0.2), names.arg = 1:16, 
    main = "rainbow(n=16, start=0, end=0.2)", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-61-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:16], col = rainbow(16, start = 0, end = 0.5), names.arg = 1:16, 
    main = "rainbow(n=16, start=0, end=0.5)")
barplot(x[1:16], col = rainbow(16, start = 0, end = 0.5), names.arg = 1:16, 
    main = "rainbow(n=16, start=0, end=0.5)", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-62-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:16], col = rainbow(16, start = 0, end = 0.8), names.arg = 1:16, 
    main = "rainbow(n=16, start=0, end=0.8)")
barplot(x[1:16], col = rainbow(16, start = 0, end = 0.8), names.arg = 1:16, 
    main = "rainbow(n=16, start=0, end=0.8)", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-63-1.png" width="90%" style="display: block; margin: auto;" />


```r
par(mfrow=c(1,2))
barplot(x[1:16], col = heat.colors(16), names.arg = 1:16, main = "heat.colors(n=16)")
barplot(x[1:16], col = heat.colors(16), names.arg = 1:16, main = "heat.colors(n=16)", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-64-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow=c(1,2))
barplot(x[1:16], col = terrain.colors(16), names.arg = 1:16, main = "terrain.colors(n=16)")
barplot(x[1:16], col = terrain.colors(16), names.arg = 1:16, main = "terrain.colors(n=16)", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-65-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow=c(1,2))
barplot(x[1:16], col = topo.colors(16), names.arg = 1:16, main = "topo.colors(n=16)")
barplot(x[1:16], col = topo.colors(16), names.arg = 1:16, main = "topo.colors(n=16)", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-66-1.png" width="90%" style="display: block; margin: auto;" />



```r
par(mfrow=c(1,2))
barplot(x[1:16], col = cm.colors(16), names.arg = 1:16, main = "cm.colors(n=16)")
barplot(x[1:16], col = cm.colors(16), names.arg = 1:16, main = "cm.colors(n=16)", border = NA)
```

<img src="41-Szinek_files/figure-html/unnamed-chunk-67-1.png" width="90%" style="display: block; margin: auto;" />

## A 657 színnév {#a-657-szinnev}


```r
colors()
#>   [1] "white"                "aliceblue"            "antiquewhite"        
#>   [4] "antiquewhite1"        "antiquewhite2"        "antiquewhite3"       
#>   [7] "antiquewhite4"        "aquamarine"           "aquamarine1"         
#>  [10] "aquamarine2"          "aquamarine3"          "aquamarine4"         
#>  [13] "azure"                "azure1"               "azure2"              
#>  [16] "azure3"               "azure4"               "beige"               
#>  [19] "bisque"               "bisque1"              "bisque2"             
#>  [22] "bisque3"              "bisque4"              "black"               
#>  [25] "blanchedalmond"       "blue"                 "blue1"               
#>  [28] "blue2"                "blue3"                "blue4"               
#>  [31] "blueviolet"           "brown"                "brown1"              
#>  [34] "brown2"               "brown3"               "brown4"              
#>  [37] "burlywood"            "burlywood1"           "burlywood2"          
#>  [40] "burlywood3"           "burlywood4"           "cadetblue"           
#>  [43] "cadetblue1"           "cadetblue2"           "cadetblue3"          
#>  [46] "cadetblue4"           "chartreuse"           "chartreuse1"         
#>  [49] "chartreuse2"          "chartreuse3"          "chartreuse4"         
#>  [52] "chocolate"            "chocolate1"           "chocolate2"          
#>  [55] "chocolate3"           "chocolate4"           "coral"               
#>  [58] "coral1"               "coral2"               "coral3"              
#>  [61] "coral4"               "cornflowerblue"       "cornsilk"            
#>  [64] "cornsilk1"            "cornsilk2"            "cornsilk3"           
#>  [67] "cornsilk4"            "cyan"                 "cyan1"               
#>  [70] "cyan2"                "cyan3"                "cyan4"               
#>  [73] "darkblue"             "darkcyan"             "darkgoldenrod"       
#>  [76] "darkgoldenrod1"       "darkgoldenrod2"       "darkgoldenrod3"      
#>  [79] "darkgoldenrod4"       "darkgray"             "darkgreen"           
#>  [82] "darkgrey"             "darkkhaki"            "darkmagenta"         
#>  [85] "darkolivegreen"       "darkolivegreen1"      "darkolivegreen2"     
#>  [88] "darkolivegreen3"      "darkolivegreen4"      "darkorange"          
#>  [91] "darkorange1"          "darkorange2"          "darkorange3"         
#>  [94] "darkorange4"          "darkorchid"           "darkorchid1"         
#>  [97] "darkorchid2"          "darkorchid3"          "darkorchid4"         
#> [100] "darkred"              "darksalmon"           "darkseagreen"        
#> [103] "darkseagreen1"        "darkseagreen2"        "darkseagreen3"       
#> [106] "darkseagreen4"        "darkslateblue"        "darkslategray"       
#> [109] "darkslategray1"       "darkslategray2"       "darkslategray3"      
#> [112] "darkslategray4"       "darkslategrey"        "darkturquoise"       
#> [115] "darkviolet"           "deeppink"             "deeppink1"           
#> [118] "deeppink2"            "deeppink3"            "deeppink4"           
#> [121] "deepskyblue"          "deepskyblue1"         "deepskyblue2"        
#> [124] "deepskyblue3"         "deepskyblue4"         "dimgray"             
#> [127] "dimgrey"              "dodgerblue"           "dodgerblue1"         
#> [130] "dodgerblue2"          "dodgerblue3"          "dodgerblue4"         
#> [133] "firebrick"            "firebrick1"           "firebrick2"          
#> [136] "firebrick3"           "firebrick4"           "floralwhite"         
#> [139] "forestgreen"          "gainsboro"            "ghostwhite"          
#> [142] "gold"                 "gold1"                "gold2"               
#> [145] "gold3"                "gold4"                "goldenrod"           
#> [148] "goldenrod1"           "goldenrod2"           "goldenrod3"          
#> [151] "goldenrod4"           "gray"                 "gray0"               
#> [154] "gray1"                "gray2"                "gray3"               
#> [157] "gray4"                "gray5"                "gray6"               
#> [160] "gray7"                "gray8"                "gray9"               
#> [163] "gray10"               "gray11"               "gray12"              
#> [166] "gray13"               "gray14"               "gray15"              
#> [169] "gray16"               "gray17"               "gray18"              
#> [172] "gray19"               "gray20"               "gray21"              
#> [175] "gray22"               "gray23"               "gray24"              
#> [178] "gray25"               "gray26"               "gray27"              
#> [181] "gray28"               "gray29"               "gray30"              
#> [184] "gray31"               "gray32"               "gray33"              
#> [187] "gray34"               "gray35"               "gray36"              
#> [190] "gray37"               "gray38"               "gray39"              
#> [193] "gray40"               "gray41"               "gray42"              
#> [196] "gray43"               "gray44"               "gray45"              
#> [199] "gray46"               "gray47"               "gray48"              
#> [202] "gray49"               "gray50"               "gray51"              
#> [205] "gray52"               "gray53"               "gray54"              
#> [208] "gray55"               "gray56"               "gray57"              
#> [211] "gray58"               "gray59"               "gray60"              
#> [214] "gray61"               "gray62"               "gray63"              
#> [217] "gray64"               "gray65"               "gray66"              
#> [220] "gray67"               "gray68"               "gray69"              
#> [223] "gray70"               "gray71"               "gray72"              
#> [226] "gray73"               "gray74"               "gray75"              
#> [229] "gray76"               "gray77"               "gray78"              
#> [232] "gray79"               "gray80"               "gray81"              
#> [235] "gray82"               "gray83"               "gray84"              
#> [238] "gray85"               "gray86"               "gray87"              
#> [241] "gray88"               "gray89"               "gray90"              
#> [244] "gray91"               "gray92"               "gray93"              
#> [247] "gray94"               "gray95"               "gray96"              
#> [250] "gray97"               "gray98"               "gray99"              
#> [253] "gray100"              "green"                "green1"              
#> [256] "green2"               "green3"               "green4"              
#> [259] "greenyellow"          "grey"                 "grey0"               
#> [262] "grey1"                "grey2"                "grey3"               
#> [265] "grey4"                "grey5"                "grey6"               
#> [268] "grey7"                "grey8"                "grey9"               
#> [271] "grey10"               "grey11"               "grey12"              
#> [274] "grey13"               "grey14"               "grey15"              
#> [277] "grey16"               "grey17"               "grey18"              
#> [280] "grey19"               "grey20"               "grey21"              
#> [283] "grey22"               "grey23"               "grey24"              
#> [286] "grey25"               "grey26"               "grey27"              
#> [289] "grey28"               "grey29"               "grey30"              
#> [292] "grey31"               "grey32"               "grey33"              
#> [295] "grey34"               "grey35"               "grey36"              
#> [298] "grey37"               "grey38"               "grey39"              
#> [301] "grey40"               "grey41"               "grey42"              
#> [304] "grey43"               "grey44"               "grey45"              
#> [307] "grey46"               "grey47"               "grey48"              
#> [310] "grey49"               "grey50"               "grey51"              
#> [313] "grey52"               "grey53"               "grey54"              
#> [316] "grey55"               "grey56"               "grey57"              
#> [319] "grey58"               "grey59"               "grey60"              
#> [322] "grey61"               "grey62"               "grey63"              
#> [325] "grey64"               "grey65"               "grey66"              
#> [328] "grey67"               "grey68"               "grey69"              
#> [331] "grey70"               "grey71"               "grey72"              
#> [334] "grey73"               "grey74"               "grey75"              
#> [337] "grey76"               "grey77"               "grey78"              
#> [340] "grey79"               "grey80"               "grey81"              
#> [343] "grey82"               "grey83"               "grey84"              
#> [346] "grey85"               "grey86"               "grey87"              
#> [349] "grey88"               "grey89"               "grey90"              
#> [352] "grey91"               "grey92"               "grey93"              
#> [355] "grey94"               "grey95"               "grey96"              
#> [358] "grey97"               "grey98"               "grey99"              
#> [361] "grey100"              "honeydew"             "honeydew1"           
#> [364] "honeydew2"            "honeydew3"            "honeydew4"           
#> [367] "hotpink"              "hotpink1"             "hotpink2"            
#> [370] "hotpink3"             "hotpink4"             "indianred"           
#> [373] "indianred1"           "indianred2"           "indianred3"          
#> [376] "indianred4"           "ivory"                "ivory1"              
#> [379] "ivory2"               "ivory3"               "ivory4"              
#> [382] "khaki"                "khaki1"               "khaki2"              
#> [385] "khaki3"               "khaki4"               "lavender"            
#> [388] "lavenderblush"        "lavenderblush1"       "lavenderblush2"      
#> [391] "lavenderblush3"       "lavenderblush4"       "lawngreen"           
#> [394] "lemonchiffon"         "lemonchiffon1"        "lemonchiffon2"       
#> [397] "lemonchiffon3"        "lemonchiffon4"        "lightblue"           
#> [400] "lightblue1"           "lightblue2"           "lightblue3"          
#> [403] "lightblue4"           "lightcoral"           "lightcyan"           
#> [406] "lightcyan1"           "lightcyan2"           "lightcyan3"          
#> [409] "lightcyan4"           "lightgoldenrod"       "lightgoldenrod1"     
#> [412] "lightgoldenrod2"      "lightgoldenrod3"      "lightgoldenrod4"     
#> [415] "lightgoldenrodyellow" "lightgray"            "lightgreen"          
#> [418] "lightgrey"            "lightpink"            "lightpink1"          
#> [421] "lightpink2"           "lightpink3"           "lightpink4"          
#> [424] "lightsalmon"          "lightsalmon1"         "lightsalmon2"        
#> [427] "lightsalmon3"         "lightsalmon4"         "lightseagreen"       
#> [430] "lightskyblue"         "lightskyblue1"        "lightskyblue2"       
#> [433] "lightskyblue3"        "lightskyblue4"        "lightslateblue"      
#> [436] "lightslategray"       "lightslategrey"       "lightsteelblue"      
#> [439] "lightsteelblue1"      "lightsteelblue2"      "lightsteelblue3"     
#> [442] "lightsteelblue4"      "lightyellow"          "lightyellow1"        
#> [445] "lightyellow2"         "lightyellow3"         "lightyellow4"        
#> [448] "limegreen"            "linen"                "magenta"             
#> [451] "magenta1"             "magenta2"             "magenta3"            
#> [454] "magenta4"             "maroon"               "maroon1"             
#> [457] "maroon2"              "maroon3"              "maroon4"             
#> [460] "mediumaquamarine"     "mediumblue"           "mediumorchid"        
#> [463] "mediumorchid1"        "mediumorchid2"        "mediumorchid3"       
#> [466] "mediumorchid4"        "mediumpurple"         "mediumpurple1"       
#> [469] "mediumpurple2"        "mediumpurple3"        "mediumpurple4"       
#> [472] "mediumseagreen"       "mediumslateblue"      "mediumspringgreen"   
#> [475] "mediumturquoise"      "mediumvioletred"      "midnightblue"        
#> [478] "mintcream"            "mistyrose"            "mistyrose1"          
#> [481] "mistyrose2"           "mistyrose3"           "mistyrose4"          
#> [484] "moccasin"             "navajowhite"          "navajowhite1"        
#> [487] "navajowhite2"         "navajowhite3"         "navajowhite4"        
#> [490] "navy"                 "navyblue"             "oldlace"             
#> [493] "olivedrab"            "olivedrab1"           "olivedrab2"          
#> [496] "olivedrab3"           "olivedrab4"           "orange"              
#> [499] "orange1"              "orange2"              "orange3"             
#> [502] "orange4"              "orangered"            "orangered1"          
#> [505] "orangered2"           "orangered3"           "orangered4"          
#> [508] "orchid"               "orchid1"              "orchid2"             
#> [511] "orchid3"              "orchid4"              "palegoldenrod"       
#> [514] "palegreen"            "palegreen1"           "palegreen2"          
#> [517] "palegreen3"           "palegreen4"           "paleturquoise"       
#> [520] "paleturquoise1"       "paleturquoise2"       "paleturquoise3"      
#> [523] "paleturquoise4"       "palevioletred"        "palevioletred1"      
#> [526] "palevioletred2"       "palevioletred3"       "palevioletred4"      
#> [529] "papayawhip"           "peachpuff"            "peachpuff1"          
#> [532] "peachpuff2"           "peachpuff3"           "peachpuff4"          
#> [535] "peru"                 "pink"                 "pink1"               
#> [538] "pink2"                "pink3"                "pink4"               
#> [541] "plum"                 "plum1"                "plum2"               
#> [544] "plum3"                "plum4"                "powderblue"          
#> [547] "purple"               "purple1"              "purple2"             
#> [550] "purple3"              "purple4"              "red"                 
#> [553] "red1"                 "red2"                 "red3"                
#> [556] "red4"                 "rosybrown"            "rosybrown1"          
#> [559] "rosybrown2"           "rosybrown3"           "rosybrown4"          
#> [562] "royalblue"            "royalblue1"           "royalblue2"          
#> [565] "royalblue3"           "royalblue4"           "saddlebrown"         
#> [568] "salmon"               "salmon1"              "salmon2"             
#> [571] "salmon3"              "salmon4"              "sandybrown"          
#> [574] "seagreen"             "seagreen1"            "seagreen2"           
#> [577] "seagreen3"            "seagreen4"            "seashell"            
#> [580] "seashell1"            "seashell2"            "seashell3"           
#> [583] "seashell4"            "sienna"               "sienna1"             
#> [586] "sienna2"              "sienna3"              "sienna4"             
#> [589] "skyblue"              "skyblue1"             "skyblue2"            
#> [592] "skyblue3"             "skyblue4"             "slateblue"           
#> [595] "slateblue1"           "slateblue2"           "slateblue3"          
#> [598] "slateblue4"           "slategray"            "slategray1"          
#> [601] "slategray2"           "slategray3"           "slategray4"          
#> [604] "slategrey"            "snow"                 "snow1"               
#> [607] "snow2"                "snow3"                "snow4"               
#> [610] "springgreen"          "springgreen1"         "springgreen2"        
#> [613] "springgreen3"         "springgreen4"         "steelblue"           
#> [616] "steelblue1"           "steelblue2"           "steelblue3"          
#> [619] "steelblue4"           "tan"                  "tan1"                
#> [622] "tan2"                 "tan3"                 "tan4"                
#> [625] "thistle"              "thistle1"             "thistle2"            
#> [628] "thistle3"             "thistle4"             "tomato"              
#> [631] "tomato1"              "tomato2"              "tomato3"             
#> [634] "tomato4"              "turquoise"            "turquoise1"          
#> [637] "turquoise2"           "turquoise3"           "turquoise4"          
#> [640] "violet"               "violetred"            "violetred1"          
#> [643] "violetred2"           "violetred3"           "violetred4"          
#> [646] "wheat"                "wheat1"               "wheat2"              
#> [649] "wheat3"               "wheat4"               "whitesmoke"          
#> [652] "yellow"               "yellow1"              "yellow2"             
#> [655] "yellow3"              "yellow4"              "yellowgreen"
```

