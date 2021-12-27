# Az R telepítése {#az-r-telepitese}


<img src="images/ch_03_small.png" width="90%" style="display: block; margin: auto;" />

## A fő komponensek telepítése


<div class="rmdlevel1">
<p>Ebben a fejezetben:</p>
<ul>
<li>megismerjük az <em>Alap R</em>, az <em>RStudio</em> és a csomagok telepítését.</li>
</ul>
</div>




A korábbi fejezetekben megismertük az R világának néhány fogalmát és szereplőjét. Tudjuk, hogy az R nyelv használatához megfelelő szoftveres környezetre van szükség, amely magába foglalja az *Alap R*-t és az *egyéb csomagok* kategóriájából esetlegesen telepített csomagokat is. Az R már ezen eszközök birtokában is teljes körűen használható, azonban egy újabb ingyenes eszköz, az *RStudio*, kényelmessé és hatékonnyá teszi az adatelemzési munkát.

Könyvünk legfontosabb gondolata: **ma akkor tudjuk a legjobban kihasználni az R lehetőségeit, és ezzel egyidőben a legkényelmesebb módon elvégezni az adatelemzési feladatunkat, ha (1) az *Rstudio*-t használjuk, (2) projekt üzemmódban dolgozunk, és (3) RMarkdown állományokban rögzítjük az R parancsainkat.** Ezt a szemléletet következetesen képviseljük az egyes fejezetekben, és a későbbiekben részletesebben bemutatjuk, hogyan tudjuk mindezt megvalósítani.

A R kényelmes használatához a legelső lépés a szoftveres környezet egyes elemeinek telepítése. Három fő komponens telepítésére lesz szükségünk:  
  
1. *Alap R*, amely tartalmazza a konzolt, az R interpretert, illetve a *standard csomagokokat* és az *ajánlott csomagokat*,
1. *RStudio*, amely egy új konzollal "eltakarja" az *Alap R*-t, és kényelmesebb hozzáférést biztosít az *Alap R* interpreteréhez és a csomagjaihoz.
1. Csomagok, amelyek az *egyéb csomagok* nagy halmazából származnak, és telepítésükkel újabb és újabb képességekkel ruházzuk fel az *Alap R*-t.


### Az Alap R telepítése

Az *Alap R* telepítéséhez látogassunk el az R hivatalos letöltő oldalára: *https://cran.r-project.org/*. Az operációs rendszerünknek megfelelő link kiválasztásával folytassuk a navigálást.

* A Windows felhasználók a `Download R for Windows` linken, majd a `base` linken kattintva jutnak el a telepítőprogram linkjéhez: `Download R X.X.X for Windows`. A sikeres letöltés után indítsuk el a telepítőt, és az alapértelmezetten felajánlott opciók nyugtázásával végezzük el a telepítést. A telepítést lehetőleg olyan Windows felhasználó alatt végezzük el, amelynek a neve sem ékezetes karaktert, sem szóközt, sem egyéb írásjelet nem tartalmaz.
* A macOS felhasználók a `Download R for (Mac) OS X` linken kattintva jutnak a telepítőhöz: `R-X.X.X.pkg`. A letöltés után indítsuk el a telepítőt, és a `Next` gombok segítségével végezzük el a telepítést.
* A Linux felhasználók az aktuális R verzió telepítéséhez a `Download R for Linux` linken keresztül jutnak el, ahol a megfelelő disztribúció (Debian, Redhat, Suse, Ubuntu) kiválasztása után konkrét információkat kapnak a telepítésről.

### Az RStudio telepítése

Az *RStudio* telepítéséhez az operációs rendszerünknek megfelelő telepítőt kell letöltenünk a *https://www.rstudio.com/products/rstudio/download/* oldalról. Az RStudio Desktop (Open Source License) változatára lesz szükségünk, töltsük le és telepítsük ezt a számítógépünkre. A telepítés során fogadjuk el az alapértelmezett opciókat. Az *RStudio* automatikusan megtalálja és használja a korábban telepített *Alap R* példányunkat, így a későbbiekben elegendő lesz az *RStudio*-t használni, azon keresztül elérhetjük az *Alap R* minden funkcióját.

### Csomagok telepítése {#Csomagoktelepitese}

A csomagok telepítésére az *Alap R* vagy az *RStudio* elindítása után van módunk. Érdemes a telepítéseket az *RStudio*-ból végezni. A csomag fellelési helye alapján, három különböző tárhelyről mutatjuk be a csomagok telepítését. Látni fogjuk, hogy a csomagok telepítéséhez R parancsokat fogunk használni. Ha még nem vagyunk jártasak R parancsok futtatásban, akkor a \@ref(AzRStudiohasznalata) fejezet fellapozásával segítséget kaphatunk a lenti parancsok kipróbálásához, de úgy is eljárhatunk, hogy most kihagyjuk ennek a résznek az áttekintését, és később térünk vissza, amikor valóban felmerül az igény csomagok telepítésére.     

Az R csomagok hivatalos helye a [CRAN (The Comprehensive R Archive Network)](https://cran.r-project.org/web/packages/). A CRAN számítógépei tárolják a nyílt forráskódú R nyelv és környezet különböző verzióinak kódjait és dokumentációit, így az összes R csomag forráskódját is. Egy bírálási folyamat után bármely felhasználó csomagja a CRAN-ból is elérhető lehet.

Az *Alap R* vagy az *RStudio* elindítása után az `install.packages()` függvénnyel tölthetünk le és telepíthetünk csomagot a CRAN-ról. Tetszőleges csomag telepítéséhez írjuk a csomag nevét idézőjelekben a függvény argumentumába:  

```markdown
install.packages("csomag_neve")
```

A **psych** csomagot, amely a pszichológia kutatások adatainak elemzéséhez nyújt segítséget, például így telepíthetjük:


```r
install.packages("psych")        # psych csomag telepítése
```


A csomagok másik fontos forrása a [Bioconductor](https://www.bioconductor.org/), ahol alaposan tesztelt és igen jól dokumentált bioinformatikai témájú csomagokat találunk. Az innen elérhető csomagokat -- például most a **DESeq2** csomagot az RNS-szekvenálási elemzésekhez -- a következő parancsokkal telepíthetjük:


```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("DESeq2")
```

A csomagok harmadik fő forrása a GitHub. A felhasználók a saját fejlesztésű csomagjaikat rendszerint először a GitHub-on keresztül teszik elérhetővé. Ha ezeket a csomagokat szeretnénk kipróbálni, akkor a felhasználó és a csomag nevének birtokában a következő parancsot kell kiadnunk:

```
devtools::install_github("felhasznalo_neve/csomag_neve")
```

Például a GitHub-ról telepíthető **emo** csomag segítségvel hangulatjeleket szúrhatunk be az RMarkdown állományainkba. Ezzel a sorral telepíthetjük a csomagot: 


```r
devtools::install_github("hadley/emo")
```


Fontos tudnunk, hogy a csomagok telepítésére egy számítógépen egy adott R verzión belül csak egyszer van szükség. A telepítő parancsainkat azonban érdemes megőrizni, hogy ha szükséges, akkor egy új R verzióban könnyen tudjuk telepíteni a korábban használt csomagjainkat. Nagyon fontos, hogy a telepítő parancsok futtatása után, tegyük azokat megjegyzésbe, vagyis írjunk előjük kettőskereszt (`#`) karaktert (részletesebb információkat a megjegyzésekről a \@ref(MegjegyzesazRben) fejezetben olvashatunk). Ezzel tudjuk megvédeni ezeket a telepítő parancsokat az újbóli, véletlen, felesleges végrehajtástól. Ennek megfelelően a telepítő parancsainkat ilyen formában kell őriznünk:



```r
# install.packages("psych")        # psych csomag telepítése
# if (!requireNamespace("BiocManager", quietly = TRUE))
#     install.packages("BiocManager")
# BiocManager::install("DESeq2")
# devtools::install_github("hadley/emo")
```


Vegyük figyelmbe, hogy egy csomag telepítése során más, egyéb csomagok telepítése automatikusan is megtörténhet, tehát egy helyett valójában több csomag is felkerülhet a gépünkre. Az is előfordulhat, hogy egy csomag telepítése csak akkor lesz sikeres, ha más csomagok frissítését engedélyezzük az adott csomag telepítése során. Végül előfordulhat olyan eset is, amikor egy csomag telepítése valamilyen oknál fogva meghiúsul. Erról minden esetben hibaüzenet tájékoztat minket, és ez szinte minden esetben jó kiindulásul szolgál a hibát okozó körülmény elhárításában. A legtöbbször egy másik csomag hiánya okozza a sikertelen telepítést, ezért olvassuk ki a hibaüzenetből a hiányolt csomag nevét, és először ennek a telepítését végezzük el.    

<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>Az R kényelmes használatához először telepítsük az operációs rendszerünknek megfelelő <em>Alap R</em>, majd az <em>RStudio</em> legújabb verzióját. Az R képességeit csomagok segítségével bővíthetjük, ehhez legtöbbször az <code>install.packages()</code> parancsot használjuk.</p>
</div>



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
**Feladatok**
  
1. Melyik az R legfrissebb változata, és milyen újdonságokat tartalmaz az előző változathoz képest?
1. Melyik az *RStudio* legfrissebb változata, és milyen újdonságokat tartalmaz az előző változathoz képest?
1. Hogyan deríthető ki, hogy egy csomagban (például a **MASS**) csomagban, hány adatobjektum, és hány függvény található?
</div>\EndKnitrBlock{rmdexercise}

## A Tidyverse R telepítése


<div class="rmdlevel2">
<p>Ebben a fejezetben:</p>
<ul>
<li>megismerjük a <em>Tidyverse R</em> telepítését.</li>
</ul>
</div>

A *Tidyverse R* az R meglévő funkcióinak új szemléletű használatát jelenti. A modern R jelenleg egyet jelent a *Tidyverse R*-rel, az ebben a szemléleteben készült parancsaink gyorsak, jól olvashatók és könnyen módosíthatók. A *Tidyverse R* funkciói összesen 8 csomagba (**ggplot2**, **purrr**, **tibble**, **dplyr**, **tidyr**, **stringr**, **readr** és **forcats**) vannak szétosztva, mindegyik csomag egy-egy témakört fed le. A fenti csomagok telepítése egyetlen gyűjtőcsomag a **tidyverse** nevű csomag telepítésével is elvégezhető:


```r
install.packages("tidyverse") # a Tidyverse R telepítése
```

A *Tidyverse R* telepítését követően a csomagokban lévő függvények használatához a *Tidyverse R* betöltésére is szükség van. Hívjuk meg a `library()` függvényt, amely ebben az esetben igen részletes tájékoztatást ad az újonnan elérhető csomagokról.


```r
library(tidyverse)
#> -- Attaching packages ----------------------------- tidyverse 1.3.0 --
#> <U+221A> ggplot2 3.3.0     <U+221A> purrr   0.3.3
#> <U+221A> tibble  3.0.0     <U+221A> dplyr   0.8.5
#> <U+221A> tidyr   1.0.2     <U+221A> stringr 1.4.0
#> <U+221A> readr   1.3.1     <U+221A> forcats 0.5.0
#> -- Conflicts -------------------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
```

A *Tidyverse R* csomagjait jelenleg is intenzíven fejlesztik, így gyakran jelenik meg újabb és újabb verzió. Érdemes ellenőrizni, hogy a *Tidyverse R* csomagjai közül a legfrissebbeket használjuk-e. Ehhez a **tidyverse** csomag `tidyverse_update()` függvényét használjuk.


```r
tidyverse::tidyverse_update()
#> The following packages are out of date:
#> 
#> * lubridate (1.7.4 -> 1.7.8)
#> * purrr     (0.3.3 -> 0.3.4)
#> * xml2      (1.2.5 -> 1.3.1)
#> 
#> Start a clean R session then run:
#> install.packages(c("lubridate", "purrr", "xml2"))
```

Például a fenti esetben 3 csomag frissítését javasolja a `tidyverse_update()` függvény, és segítséget is ad a telepítőparancs listázásával. 


<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>A <em>Tidyverse R</em> használatához elegendő telepítenünk a <strong>tidyverse</strong> csomagot, amely a többi 8 csomag telepítését automatikusan elvégzi. A telepítést a <code>install.packages("tidyverse")</code> paranccsal végezzük. Időnként ellenőrizzük a <code>tidyverse::tidyverse_update()</code> segítségével, hogy a legfrissebb változatát használjuk-e a <em>Tidyverse R</em>-t alkotó csomagoknak.</p>
</div>



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
**Feladatok**
  
1. Keressünk rá a *Tidyverse R* csomagjaira, és próbáljuk kideríteni az egyes csomagok fő célját, alkalmazási területeit!
1. Derítsük ki, hogy az R Core Team vagy Hadley Wickham több R csomag szerzője!
</div>\EndKnitrBlock{rmdexercise}



## Az R frissítése

<div class="rmdlevel3">
<p>Ebben a fejezetben:</p>
<ul>
<li>bemutatjuk az <em>Alap R</em>, az <em>RStudio</em> és a csomagok frissítését.</li>
</ul>
</div>


A R ideális használata során az *RStudio*-ban dolgozunk, és így érjük el az *Alap R* és az egyes csomagok szolgáltatásait. A mai napig mindhárom komponenst intenzíven fejlesztik, újabb és újabb funkciókat építenek be, és az esetleges hibákat rendre javítják a frissebb változatokban. Az *Alap R* évente kb. négyszer frissül, az *RStudio* háromszor, és érdemes időnként azt is ellenőrizni, hogy a gyakran használt csomagjainkból nincs-e frissebb példány. 

### Az Alap R frissítése

A telepített *Alap R* verzióját az `R.version.string` végrehajtásával ellenőrizhetjük. Amennyiben az R hivatalos [oldalán](https://cran.r-project.org/) találunk frissebb példányt, akkor legalább két módszer segítségével frissíthetjük az *Alap R*-t. Megjegyezzük, hogy az *Alap R* sikeres frissítése után az *RStudio* automatikusan az új példányt fogja használni.

**1. módszer: csak Windows alatt.** Windows operációs rendszer alatt rendelkezésre áll az **installr** csomag, amelynek pontosan az a feladata, hogy kényelmesen telepíthessük számítógépünkre az R legfrissebb verzióját. Az **installr** a régebbi verzióban lévő csomagokat az új változatba is átmozgatja, és ott azok frissítését is elvégzi. A következő parancsok futtatására van szükség.


```r
# install.packages("installr") # az installr csomag telepítése
library(installr)              # az installr csomag betöltése
updateR()                      # az Alap R és a csomagok frissítése
```

**2. módszer: általános út.** Az *Alap R* frissítésének másik módja, hogy telepítünk egy új példányt a régi R mellé. Azaz a korábban látott módon letöltjük és telepítjük az *Alap R* legújabb változatát, pontosan úgy, mintha még nem lenne a gépünkön működő R. Ez az új verzió azonban félkarú óriás mindaddig, amíg a régi R verzióban használt összes csomagot nem telepítjük újra az új verzióban is. Ezt magunk egyesével is megtehetjük, ha korábban összegyűjtöttük a csomagtelepítő parancsainkat, legyen szó akár akár a CRAN, a Bioconductor vagy a GitHub oldaláról származó csomagokról. Ha ezek nem állnak rendelkezésre, akkor az *Alap R* frissítésének általános útját három lépésben foglalhatjuk össze.

1. Indítsuk el az *RStudio*-t még az új R verzió telepítése előtt, és futtassuk le a következő sorokat. A futtatás eredménye egy bináris állomány (`csomagok.rds`), amely a régi R összes telepített csomagjának nevét és más információkat tartalmaz. Lépjünk ki az *RStudio*-ból.



```r
telepitett.csomagok <- installed.packages(priority="NA")
saveRDS(object = telepitett.csomagok, file = "csomagok.rds")
```

2. Telepítsük az *Alap R* új verzióját.

3. Indítsuk el az *RStudio*-t és futtassuk le a lenti sorokat. A folyamat több percig is eltarthat. Az *RStudio* már az új R verziót használja, így a csomagok az új R tudását egészítik ki.


```r
telepitett.csomagok <- readRDS(file = "csomagok.rds")
install.packages(pkgs=telepitett.csomagok[,1])
```


<!--


ss <- installed.packages()
aa <- devtools::package_info(rownames(ss))
class(aa)
head(aa)
aggregate(aa$source,list(aa$source), length)

unique(aa$source)

installed.packages() %>% 
rownames() %>% 
devtools::package_info() %>% 
filter(source == "Bioconductor")

-->

Megjegyezzük, hogy a fenti 2. módszer segítségével csak a CRAN csomagjait tudjuk telepíteni, a Bioconductor és a GitHub oldalakról származó csomagok telepítését magunknak kell megismételni.

### Az RStudio frissítése

A telepített *RStudio* példányunk verziószámát a `Help / About RStudio` menüpont segítségével, vagy az `rstudioapi::versionInfo()` parancs futtatásával ellenőrizhetjük. Frissebb verzió létezéséről a `Help / Check for Updates` menüpont ad tájékoztatást. Amennyiben találunk újabb verziót az *RStudio* hivatalos [honlapján](https://rstudio.com/), töltsük le az operációs rendszerünknek megfelelő változatot és indítsuk el a telepítőt. Szerencsére a régi *RStudio* beállításait örökli az új példány.


### Csomagok frissítése

A korábban telepített csomagokat az *RStudio* `Tools/Check for Package Updates` menüpontjával frissíthetjük. A frissíthető csomagok megjelennek egy dialógus dobozban, jelöljük ki az összes csomagot és indítsuk el a telepítési folyamatot. A következő R parancs végrehajtásával is frissíthetjük a csomagjainkat.


```r
update.packages(ask=FALSE) 
```




<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>Az <em>Alap R</em>, az <em>RStudio</em> és az egyes csomagok időről-időre megújulnak, érdemes évente legalább egy-két alkalommal elvégezni ezek frissítését. Az <em>Alap R</em> frissítése lényegében egy új verzió telepítését jelenti, a régi R továbbra is elérhető marad. Az <em>RStudio</em> frissítése után csak az új verziót használhatjuk. Az <em>Alap R</em> és az <em>RStudio</em> friss verziója a hivatalos honlapokról szerezhető be. A csomagok frissítéséhez használjuk a <code>update.packages(ask=FALSE)</code> parancsot.</p>
</div>




\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
**Feladatok**
  
1. Az *RStudio* `Tools/Check for Package Updates` menüpontjával tájékozódjunk a telepített csomagjaink állapotáról. Végezzük el a szükséges frissítéseket!  
  </div>\EndKnitrBlock{rmdexercise}

