# (APPENDIX) Függelék {-} 

# Megoldások {#megoldasok}

## Megoldások az \@ref(itt-kezdodik-1-exercise) feladatokhoz {#itt-kezdodik-1-exercise-solution}

<div class="rmdexercise">
<ol style="list-style-type: decimal">
<li>Milyen online vagy nyomtat könyvek segítik az R elsajátítását?
Próbáljuk összegyűjteni a magyar nyelvű könyveket is!</li>
</ol>
</div>

Az R könyvekkel kapcsolatban könnyen az lehet az érzésünk, hogy *túl sok a könyv, és túl kevés az idő*. Valóban tengernyi R könyv vásárolható meg, melyek többsége angol nyelvű. Elegendő a Springer [Use R!](https://www.springer.com/series/6991) könyvsorozatára gondolni, amely önmagában több mint 80 címet tartalmaz. Az Amazon-ról elérhető, 2020. januárja után [megjelent](https://www.amazon.com/s?k=r+statistics&i=stripbooks&rh=n%3A5&s=relevanceexprank&Adv-Srch-Books-Submit.x=39&Adv-Srch-Books-Submit.y=5&field-datemod=1&field-dateop=After&field-dateyear=2020&unfiltered=1&ref=sr_adv_b) könyvek száma is túl van a kétszázon.

Különösen értékesek lehetnek az online elérhető könyvek. Az idegen nyelvű könyvek tematikus gyűjteménye a [Big Book of R](https://www.bigbookofr.com/), míg az R erőforrásokról [saját listát](https://abarik.github.io/roforrasok/) is karbantartok.

A magyar nyelvű könyvek közül külön is felsorolunk néhányat:

* Reiczigel Jenő, Harnos Andrea, Solymosi Norbert (2021). *Biostatisztika nem statisztikusoknak*. Pars Kft., Nagykovácsi.
* Dinya Elek, Solymosi Norbert (2016). *Biometria a klinikumban 2.  Feladatok megoldása R-környezetben.* Medicina Kiadó.
* Münnich Ákos, Nagy Ágnes, Abari Kálmán. *Többváltozós statisztika pszichológus hallgatók számára.* Bölcsész Konzorcium, Debrecen, 2006. (http://psycho.unideb.hu/statisztika)
ISBN 963 9704 04 0


<div class="rmdexercise">
<ol start="2" style="list-style-type: decimal">
<li>Térképezzük fel az online videókurzusokat is az R tanulásához!</li>
</ol>
</div>


A videókurzusok többsége is angol nyelvű, a [Youtube](https://www.youtube.com/results?search_query=r+statistics)-ról ingyenesen, de a [Udemy](https://www.udemy.com/) vagy a [datacamp](https://www.datacamp.com/) oldaláról előfizetés ellenében több száz kurzust is elérhetünk.

Az R-rel való ismerkedést kezdhetjük az [R a gyakorlatban](https://www.youtube.com/playlist?list=PLnmeQHnHYqv6ENGrdTXiE9YJrvHuxH2C9) videósorozatommal is.


<div class="rmdexercise">
<ol start="3" style="list-style-type: decimal">
<li>A bevezető példa (<em>Két tanítási módszer összehasonlítása</em>)
megoldásában a hipotézisvizsgálat alapján adjunk szöveges
értékelést!</li>
</ol>
</div>


A Mann-Whitney-próba alapján azt mondhatjuk, elegendő bizonyítékot találtunk arra, hogy a modern (Sprego) módszer eredményesebb (Med=65%), mint a hagyományos (Med=38%) tanítási módszer (W=24; p=0,001).


## Megoldások az \@ref(itt-kezdodik-2-exercise) feladatokhoz {#itt-kezdodik-2-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Az adatfeldolgozás 4 lépése a következő: (1) adatok beolvasása, (2) adatok előkészítése elemzésre, (3) adatok elemzése és (4) az eredmények publikálása. A könyv mely fejezetei tartoznak az adatfeldolgozás fenti lépéseihez?
</div>\EndKnitrBlock{rmdexercise}


1. Adatok beolvasása: \@ref(beolvasas) fejezet
1. Adatok előkészítése elemzésre: \@ref(adatmanipulacio) fejezet, 
1. Az adatok elemzése: \@ref(leiro-statisztika), \@ref(grafika-az-r-ben), \@ref(hipotezisvizsgalatok) fejezet 
1. Az eredmények publikálása: \@ref(publikacio) fejezet

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. Az R-rel való munka általunk javasolt módja: *RStudio*-ban, projektmódban, R vagy RMarkdown állományokat szerkesztünk és hajtunk végre. Mely fejezetekben találunk hasznos információkat az R ezen használatával kapcsolatban?
</div>\EndKnitrBlock{rmdexercise}

1. Az *Alap R* telepítése: \@ref(az-alap-r-tele = tese) fejezet
1. Az *RStudio* telepítése: \@ref(az-rstudio-telepitese) fejezet
1. Az *RStudio* felépítése: \@ref(az-rstudio-felepitese) fejezet
1. Parancsállományok használata *RStudio*-ban: \@ref(parancsallomanyok), \@ref(munka-az-rstudio-ban) fejezet
1. RMarkdown állományok használata *RStudio*-ban: \@ref(rmarkdown-allomanyok) fejezet
1. Projektek használata *RStudio*-ban: \@ref(projektek-hasznalata) fejezet


## Megoldások az \@ref(itt-kezdodik-3-exercise) feladatokhoz {#itt-kezdodik-3-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Minden statisztikai próba esetében négy dolgot érdemes tudni: (1) a statisztikai próba neve, (2) null- és ellenhipotézise, (3) alkalmazási feltételei, és (4) a próba végrehajtásának módja valamely statisztikai programcsomagban. A 10. fejezetben a statisztikai próbák végrehajtását természetesen R-beli eszközökkel mutatjuk be. Ismerjük a fenti táblázatokban megnevezett próbák null- és ellenhipotézisét, valamint az alkalmazási feltételeit? Próbáljuk ezeket felidézni! Hol találunk ezekről információt?
</div>\EndKnitrBlock{rmdexercise}


Számos kiváló statisztika könyv érhető el, akár magyar nyelven is. A teljesség igénye nélkül:

* Freedman, D., Pisani, R., és Roger, P. (2005). *Statisztika - Statisztikai módszerek a társadalomkutatásban.* TYPOTEX, Budapest.
* Hajtman B. (1968a). *Bevezetés a matematikai statisztikába pszichológusok számára.* Akadémiai Kiadó, Budapest.
* Hajtman B. (1968b). *Matematikai statisztika pszichológus szakos hallgatók részére.* Akadémiai Kiadó, Budapest.
* Reiczigel J., Harnos A. és Solymosi N. (2018). *Biostatisztika nem statisztikusoknak.* Pars Kft., Budapest.
* Vargha A. (1978). *Pszichológiai statisztikai gyakorlat I.* Tankönyvkiadó, Budapest.
* Vargha A. (1985). *Valószínűségszámítás pszichológus hallgatók számára.* Tankönyvkiadó, Budapest.
* Vargha A. (1989). *Pszichológiai statisztikai gyakorlat II.* Tankönyvkiadó, Budapest.
* Vargha A. (2015). *Matematikai statisztika pszichológiai, nyelvészeti és biológiai alkalmazásokkal.* Pólya Kiadó, Budapest.


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Mely próbák maradtak ki ebből a könyvből? Hol találunk ezek R-beli végrehajtására példát? 
  </div>\EndKnitrBlock{rmdexercise}

A statisztikai próbák számtalan elv alaján csoportosíthatók. Az egyik szerint megkülönböztetünk egyváltozós és többváltozós elemzéseket. Ez a könyv az egyváltozós elemzésekről ad, egy többé-kevésbé teljes képet. A többváltozós elemzések R-beli végrehajtásához a következő könyvet ajánljuk:

* Münnich Ákos, Nagy Ágnes, Abari Kálmán. *Többváltozós statisztika pszichológus hallgatók számára.* Bölcsész Konzorcium, Debrecen, 2006. (http://psycho.unideb.hu/statisztika)
ISBN 963 9704 04 0


## Megoldások az \@ref(mi-az-r-1-exercise) feladatokhoz {#mi-az-r-1-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Keressünk weboldalakat, amelyek az R előnyeit és hátrányait listázzák!
</div>\EndKnitrBlock{rmdexercise}


Például:

* [Should you start learning R? Weigh the Pros and Cons of R programming](https://techvidvan.com/tutorials/pros-and-cons-of-r/)
* [Pros and Cons of R Programming Language – Unveil the Essential Aspects!](https://data-flair.training/blogs/pros-and-cons-of-r-programming-language/)
* [What’s the Best Statistical Software? A Comparison of R, Python, SAS, SPSS and STATA](https://www.r-bloggers.com/2019/07/whats-the-best-statistical-software-a-comparison-of-r-python-sas-spss-and-stata/)


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Keressük meg, hogy az R optimális futtatásához, milyen hardver követelmények szükségesek!
</div>\EndKnitrBlock{rmdexercise}


A néhány száz elemű minta feldolgozásához egyszerű, irodai követelményeknek megfelelő teljesítményű számítógép elegendő lehet. 

Könyvünkben az R környezetet *RStudio*-n keresztül érjük el, de mind az R, mind az RStudio rendszerkövetelményeiről kevés információ áll rendelkezésre: [What are your system recommendations for the RStudio IDE?](https://support.rstudio.com/hc/en-us/articles/201853926-RStudio-IDE-System-Recommendations)


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
3. Nézzünk utána, hogy ma kb. hány csomag érhető el az R-hez? Keressünk ábrát, amely bemutatja, hogy az évek során hány csomag volt elérhető az R-hez?
</div>\EndKnitrBlock{rmdexercise}


A két legnagyobb szolgáltató a CRAN és a Bioconductor, a következő linkeken elérhető csomagszámokat érdemes összeadni:

* [CRAN](https://cran.r-project.org/web/packages/)
* [Bioconductor](https://www.bioconductor.org/)

Természetesen a GitHub-on bárki publikálhat saját csomagot, ezek száma is több százra tehető.

Az aktuálisan elérhető CRAN csomagok számát R függvénnyel is meghatározhatjuk:


```r
Sys.Date() # aktuális dátum
#> [1] "2022-07-14"
nrow(available.packages(repos = "https://cran.rstudio.com/"))
#> [1] 18334
```

A **BiocManager** `available()` függvénye a CRAN és Bioconductor összes elérhető csomagját is listázza.


```r
length(BiocManager::available())
#> [1] 21805
```

A csomagok számának hihetetlen növekedését mutatja ez az ábra:

* [CRAN now has 10,000 R packages. Here's how to find the ones you need](https://blog.revolutionanalytics.com/2017/01/cran-10000.html)



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
4. Hol áll az R népszerűsége a többi programozási nyelvhez, illetve statisztikai programcsomaghoz képest?
</div>\EndKnitrBlock{rmdexercise}


Például:

* [TIOBE Index for December 2021](https://www.tiobe.com/tiobe-index/)
* [Statistical Software Popularity in 40,582 Research Papers](https://quantifyinghealth.com/statistical-software-popularity-in-research/)



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
5. Milyen ingyenesen elérhető, grafikus felhasználói felülettel rendelkező statisztikai programcsomagok építenek az R-re?
</div>\EndKnitrBlock{rmdexercise}


Ilyenek például:

* [R Commander](https://socialsciences.mcmaster.ca/jfox/Misc/Rcmdr/)
* [jamovi](https://www.jamovi.org/)
* [JASP](https://jasp-stats.org/)

További források:

* [R Graphical User Interface Comparison](https://r4stats.com/articles/software-reviews/r-gui-comparison/)
* [The Popularity of Point-and-Click GUIs for R](https://r4stats.com/articles/guipop/)



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
6. Említettük, hogy az adatelmezési munka nem igényli az R programozói fokú ismeretét, de soroljunk fel néhány könyvet, amelyből az R programozása is megtanulható! 
</div>\EndKnitrBlock{rmdexercise}


Például:

* [Solymosi Norbert: R <- ...erre, ...erre! Bevezetés az R-nyelv és környezet használatába](https://cran.r-project.org/doc/contrib/Solymosi-Rjegyzet.pdf)
* [Oscar Baruffa: Big Book of R. 22 R programming](https://www.bigbookofr.com/r-programming.html)

## Megoldások az \@ref(mi-az-r-2-exercise) feladatokhoz {#mi-az-r-2-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Ki Hadley Wickham?
</div>\EndKnitrBlock{rmdexercise}


Hadley Wickham több R könyv és csomag szerzője, a Tidyverse R egyik megalkotója. Több információt itt találunk: [https://hadley.nz/](http://hadley.nz/)


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Mikor történt az egyik legjobb dolog az R-rel? 
</div>\EndKnitrBlock{rmdexercise}


2014-ben: [magrittr: The best thing to have ever happened to R?](https://www.r-bloggers.com/2015/11/magrittr-the-best-thing-to-have-ever-happened-to-r/)


## Megoldások az \@ref(mi-az-r-3-exercise) feladatokhoz {#mi-az-r-3-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Keressünk olyan statisztikai jellegű témaköröket, amelyekben az R segítségünkre lehet?
</div>\EndKnitrBlock{rmdexercise}


Érdemes körülnézni a [CRAN Task Views](https://cran.r-project.org/web/views/) oldalon, a csomagok tematikus gyűjteményében.


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Keressünk olyan nem-statisztikai jellegű témaköröket, amelyekben az R segítségünkre lehet?
</div>\EndKnitrBlock{rmdexercise}


Érdemes körülnézni a [CRAN Task Views](https://cran.r-project.org/web/views/) oldalon, a csomagok tematikus gyűjteményében.

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
3. Nézzünk át néhány online elérhető R könyvet, és hasonlítsuk össze az R alaptudás egyes elemeivel! Melyek az átfedő részek, és hol vannak különbségek?
  </div>\EndKnitrBlock{rmdexercise}



Példa online elérhető könyvekre:

* [Sakir, Benjamin (2011). Introduction to Statistical Thinking (With R, Without Calculus)](https://pluto.huji.ac.il/~msby/StatThink/)
* [Crawley, Michael J. (2012). The R Book.](https://www.cs.upc.edu/~robert/teaching/estadistica/TheRBook.pdf)
* [Navarro, Danielle (2020). Learning Statistics with R.](https://learningstatisticswithr.com/)
* [Verzani, John (2002). simpleR Using R for Introductory Statistics.](https://www.math.csi.cuny.edu/Statistics/R/simpleR/)

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
4. Melyek a fontosabb lépcsőfokok az R fejlődősében?
  </div>\EndKnitrBlock{rmdexercise}


* [The History of R (updated for 2020)](https://www.r-bloggers.com/the-history-of-r-updated-for-2020/)


## Megoldások az \@ref(az-r-telepitese-1-exercise) feladatokhoz {#az-r-telepitese-1-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Melyik az R legfrissebb változata, és milyen újdonságokat tartalmaz az előző változathoz képest?
</div>\EndKnitrBlock{rmdexercise}


A jelenleg aktuális R verziószáma és az újdonságok itt elérhetők: [https://cran.r-project.org/doc/manuals/r-release/NEWS.html](https://cran.r-project.org/doc/manuals/r-release/NEWS.html)


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Melyik az *RStudio* legfrissebb változata, és milyen újdonságokat tartalmaz az előző változathoz képest?
</div>\EndKnitrBlock{rmdexercise}


Az *RStudio* aktuális verziójáról itt olvashatunk: [https://www.rstudio.com/products/rstudio/](https://www.rstudio.com/products/rstudio/)


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
3. Hogyan deríthető ki, hogy egy csomagban (például a **MASS**) csomagban, hány adatobjektum, és hány függvény található?
</div>\EndKnitrBlock{rmdexercise}

Használhatjuk a beépített súgót:


```r
help(package = "MASS")
```

Vagy használhatunk más R függvényeket:


```r
library(MASS)
# a MASS csomag tartalmának feltárása
table(sapply(ls(pos = "package:MASS"), function(x) class(get(x))[1]))
#> 
#> data.frame   function       list    numeric         ts 
#>         75         78          2          7          3
```


## Megoldások az \@ref(az-r-telepitese-2-exercise) feladatokhoz {#az-r-telepitese-2-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Keressünk rá a *Tidyverse R* csomagjaira, és próbáljuk kideríteni az egyes csomagok fő célját, alkalmazási területeit!
</div>\EndKnitrBlock{rmdexercise}


Egy lehetséges oldal a válaszhoz:

* [Tidyverse R](https://www.tidyverse.org/)


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Derítsük ki, hogy az R Core Team vagy Hadley Wickham több R csomag szerzője!
</div>\EndKnitrBlock{rmdexercise}


Az R Core Team a következő csomagok szerzője a standard csomagok közül: **base**, **compiler**, **datasets**, **grDevices**, **graphics**, **grid**, **methods**, **parallel**, **splines**, **stats**, **stats4**, **tcltk**, **tools**, **utils**, míg az ajánlott csomagok közül **foreign** és az **nlme**. Ez összesen 16 csomag. Hadley Wickham csomagjairól a [saját weboldalán](http://hadley.nz/#code), vagy a [github](https://github.com/hadley?tab=repositories) oldalán tájékozódhatunk. A csomagok száma jóval meghaladja a 16-ot.

Egy adott csomag szerzőjéről a `packageDescription()` függvény ad információt:


```r
packageDescription("base")$Author     # R Core Team csomag
#> [1] "R Core Team and contributors worldwide"
packageDescription("ggplot2")$Author  # Hadley Wickham csomag
#> [1] "Hadley Wickham [aut] (<https://orcid.org/0000-0003-4757-117X>),\n  Winston Chang [aut] (<https://orcid.org/0000-0002-1576-2126>),\n  Lionel Henry [aut],\n  Thomas Lin Pedersen [aut, cre]\n    (<https://orcid.org/0000-0002-5147-4711>),\n  Kohske Takahashi [aut],\n  Claus Wilke [aut] (<https://orcid.org/0000-0002-7470-9261>),\n  Kara Woo [aut] (<https://orcid.org/0000-0002-5125-4188>),\n  Hiroaki Yutani [aut] (<https://orcid.org/0000-0002-3385-7233>),\n  Dewey Dunnington [aut] (<https://orcid.org/0000-0002-9415-4582>),\n  RStudio [cph, fnd]"
```

## Megoldások az \@ref(az-r-telepitese-3-exercise) feladatokhoz {#az-r-telepitese-3-exercise-solution}



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Az *RStudio* `Tools/Check for Package Updates` menüpontjával tájékozódjunk a telepített csomagjaink állapotáról. Végezzük el a szükséges frissítéseket! Mit tegyünk, ha nem sikerül valamelyik csomag telepítése?
  </div>\EndKnitrBlock{rmdexercise}


A frissítések elvégzését a fenti menüpont kiválasztásával kezdjük. Válasszuk ki a frissítendő csomagokat, akár az összeset, majd indítsuk el a frissítés folyamatát. Hibaüzenet esetén érdemes a következő lehetőségeket megfontolni:

* a hibaüzenetből kiolvasható lehet annak a csomagnak neve, amelynek előzetes telepítése szükséges
* *RStudio* helyett végezzük el az *Alap R*-ben az adott csomag telepítését
* végezzük adminisztrátori jogosultsággal a telepítést
* Windows operációs rendszer alatt ne legyen ékezetes vagy szóközt tartalmazó a felhasználói nevünk
* a forrásszövegben megjelenő csomagokhoz a megfelelő [RTools](https://cran.r-project.org/bin/windows/Rtools) verzióra lehet szükség Windows operációs rendszer alatt
* frissítsük meg az *Alap R* és *RStudio* komponenseket


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Ismerjük meg a telepített csomagjaink számát és forrását (CRAN vagy Bioconductor vagy GitHub)!
  </div>\EndKnitrBlock{rmdexercise}


A következő parancsok segítenek:


```r
library(tidyverse)
inst.pckgs <- installed.packages()
pckgs.info <- devtools::package_info(rownames(inst.pckgs))
# A csomagok száma forrásonként
pckgs.info %>% 
  group_by(source) %>% 
  summarise(n=n())
#> # A tibble: 7 × 2
#>   source                                                                       n
#>   <chr>                                                                    <int>
#> 1 Bioconductor                                                                25
#> 2 CRAN (R 4.2.0)                                                             272
#> 3 CRAN (R 4.2.1)                                                              97
#> 4 Github (achetverikov/apastats@448bb214274ee3837c58fd1238b336076552d918)      1
#> 5 Github (matherion/userfriendlyscience@46acf718d692a42aeebdbe9a6e559a7a5…     1
#> 6 Github (rempsyc/rempsyc@cab4ae0c79de9ddc6534065e937fa7f7255c895b)            1
#> 7 local                                                                        1
# Az egyes forrásokhoz tartozó csomagok neve
pckgs.info %>%
  filter(grepl("CRAN", source))
#>  ! package         * version    date (UTC) lib source
#>    abind             1.4-5      2016-07-21 [1] CRAN (R 4.2.0)
#>    afex              1.1-1      2022-04-29 [1] CRAN (R 4.2.0)
#>    anytime           0.3.9      2020-08-27 [1] CRAN (R 4.2.1)
#>    apa               0.3.3      2020-04-21 [1] CRAN (R 4.2.1)
#>    apaTables         2.0.8      2021-01-04 [1] CRAN (R 4.2.0)
#>    arm               1.12-2     2021-10-15 [1] CRAN (R 4.2.0)
#>    arrow             8.0.0      2022-05-09 [1] CRAN (R 4.2.1)
#>    askpass           1.1        2019-01-13 [1] CRAN (R 4.2.0)
#>    assertthat        0.2.1      2019-03-21 [1] CRAN (R 4.2.0)
#>    backports         1.4.1      2021-12-13 [1] CRAN (R 4.2.0)
#>    base64enc         0.1-3      2015-07-28 [1] CRAN (R 4.2.0)
#>    BayesFactor       0.9.12-4.4 2022-07-05 [1] CRAN (R 4.2.1)
#>    bayestestR        0.12.1     2022-05-02 [1] CRAN (R 4.2.0)
#>    BH                1.78.0-0   2021-12-15 [1] CRAN (R 4.2.0)
#>    BiasedUrn         1.07       2015-12-28 [1] CRAN (R 4.2.0)
#>    BiocManager       1.30.18    2022-05-18 [1] CRAN (R 4.2.1)
#>    bit               4.0.4      2020-08-04 [1] CRAN (R 4.2.0)
#>    bit64             4.0.5      2020-08-30 [1] CRAN (R 4.2.0)
#>    bitops            1.0-7      2021-04-24 [1] CRAN (R 4.2.0)
#>    blob              1.2.3      2022-04-10 [1] CRAN (R 4.2.0)
#>    blogdown          1.10       2022-05-10 [1] CRAN (R 4.2.0)
#>    bookdown          0.27       2022-06-14 [1] CRAN (R 4.2.1)
#>    boot              1.3-28     2021-05-03 [2] CRAN (R 4.2.1)
#>    brew              1.0-7      2022-02-04 [1] CRAN (R 4.2.0)
#>    brio              1.1.3      2021-11-30 [1] CRAN (R 4.2.0)
#>    broom             1.0.0      2022-07-01 [1] CRAN (R 4.2.1)
#>    broom.mixed       0.2.9.4    2022-04-17 [1] CRAN (R 4.2.0)
#>    broomExtra        4.3.2      2022-04-02 [1] CRAN (R 4.2.0)
#>    BSDA              1.2.1      2021-09-05 [1] CRAN (R 4.2.1)
#>    bslib             0.3.1      2021-10-06 [1] CRAN (R 4.2.0)
#>    ca                0.71.1     2020-01-24 [1] CRAN (R 4.2.0)
#>    cachem            1.0.6      2021-08-19 [1] CRAN (R 4.2.0)
#>    callr             3.7.1      2022-07-13 [1] CRAN (R 4.2.1)
#>    car               3.1-0      2022-06-15 [1] CRAN (R 4.2.0)
#>    carData           3.0-5      2022-01-06 [1] CRAN (R 4.2.0)
#>    caTools           1.18.2     2021-03-28 [1] CRAN (R 4.2.0)
#>    cellranger        1.1.0      2016-07-27 [1] CRAN (R 4.2.0)
#>    checkmate         2.1.0      2022-04-21 [1] CRAN (R 4.2.0)
#>    class             7.3-20     2022-01-16 [2] CRAN (R 4.2.1)
#>    cli               3.3.0      2022-04-25 [1] CRAN (R 4.2.0)
#>    clipr             0.8.0      2022-02-22 [1] CRAN (R 4.2.0)
#>    cluster           2.1.3      2022-03-28 [2] CRAN (R 4.2.1)
#>    coda              0.19-4     2020-09-30 [1] CRAN (R 4.2.0)
#>    codetools         0.2-18     2020-11-04 [2] CRAN (R 4.2.1)
#>    colorspace        2.0-3      2022-02-21 [1] CRAN (R 4.2.0)
#>    commonmark        1.8.0      2022-03-09 [1] CRAN (R 4.2.0)
#>    contfrac          1.1-12     2018-05-17 [1] CRAN (R 4.2.0)
#>    corrplot          0.92       2021-11-18 [1] CRAN (R 4.2.0)
#>    cowplot           1.1.1      2020-12-30 [1] CRAN (R 4.2.0)
#>    cpp11             0.4.2      2021-11-30 [1] CRAN (R 4.2.0)
#>    crayon            1.5.1      2022-03-26 [1] CRAN (R 4.2.0)
#>    credentials       1.3.2      2021-11-29 [1] CRAN (R 4.2.0)
#>    curl              4.3.2      2021-06-23 [1] CRAN (R 4.2.0)
#>    data.table        1.14.2     2021-09-27 [1] CRAN (R 4.2.0)
#>    data.tree         1.0.0      2020-08-03 [1] CRAN (R 4.2.0)
#>    datawizard        0.4.1      2022-05-16 [1] CRAN (R 4.2.0)
#>    DBI               1.1.3      2022-06-18 [1] CRAN (R 4.2.0)
#>    dbplyr            2.2.1      2022-06-27 [1] CRAN (R 4.2.1)
#>    deldir            1.0-6      2021-10-23 [1] CRAN (R 4.2.0)
#>    DEoptimR          1.0-11     2022-04-03 [1] CRAN (R 4.2.0)
#>    desc              1.4.1      2022-03-06 [1] CRAN (R 4.2.0)
#>    descriptr         0.5.2      2020-12-09 [1] CRAN (R 4.2.1)
#>    DescTools         0.99.45    2022-05-09 [1] CRAN (R 4.2.1)
#>    deSolve           1.32       2022-04-14 [1] CRAN (R 4.2.0)
#>    devtools          2.4.3      2021-11-30 [1] CRAN (R 4.2.1)
#>    DiagrammeR        1.0.9      2022-03-05 [1] CRAN (R 4.2.0)
#>    dichromat         2.0-0.1    2022-05-02 [1] CRAN (R 4.2.0)
#>    diffobj           0.3.5      2021-10-05 [1] CRAN (R 4.2.0)
#>    digest            0.6.29     2021-12-01 [1] CRAN (R 4.2.0)
#>    diptest           0.76-0     2021-05-04 [1] CRAN (R 4.2.0)
#>    downlit           0.4.2      2022-07-05 [1] CRAN (R 4.2.1)
#>    downloader        0.4        2015-07-09 [1] CRAN (R 4.2.0)
#>    dplyr           * 1.0.9      2022-04-28 [1] CRAN (R 4.2.1)
#>    dtplyr            1.2.1      2022-01-19 [1] CRAN (R 4.2.0)
#>    e1071             1.7-11     2022-06-07 [1] CRAN (R 4.2.0)
#>    effects           4.2-2      2022-07-13 [1] CRAN (R 4.2.1)
#>    effectsize        0.7.0      2022-05-26 [1] CRAN (R 4.2.0)
#>    ellipsis          0.3.2      2021-04-29 [1] CRAN (R 4.2.0)
#>    elliptic          1.4-0      2019-03-14 [1] CRAN (R 4.2.0)
#>    emmeans           1.7.5      2022-06-22 [1] CRAN (R 4.2.0)
#>    EnvStats          2.7.0      2022-03-07 [1] CRAN (R 4.2.1)
#>    estimability      1.4        2022-07-03 [1] CRAN (R 4.2.1)
#>    evaluate          0.15       2022-02-18 [1] CRAN (R 4.2.0)
#>    Exact             3.1        2021-11-26 [1] CRAN (R 4.2.0)
#>    expm              0.999-6    2021-01-13 [1] CRAN (R 4.2.0)
#>    extrafont         0.18       2022-04-12 [1] CRAN (R 4.2.0)
#>    extrafontdb       1.0        2012-06-11 [1] CRAN (R 4.2.0)
#>    fansi             1.0.3      2022-03-24 [1] CRAN (R 4.2.0)
#>    farver            2.1.1      2022-07-06 [1] CRAN (R 4.2.1)
#>    fastmap           1.1.0      2021-01-25 [1] CRAN (R 4.2.0)
#>    feather           0.3.5      2019-09-15 [1] CRAN (R 4.2.1)
#>    filelock          1.0.2      2018-10-05 [1] CRAN (R 4.2.1)
#>    fivethirtyeight   0.6.2      2021-10-07 [1] CRAN (R 4.2.1)
#>    flextable         0.7.2      2022-06-12 [1] CRAN (R 4.2.1)
#>    fontawesome       0.2.2      2021-07-02 [1] CRAN (R 4.2.1)
#>    forcats         * 0.5.1      2021-01-27 [1] CRAN (R 4.2.0)
#>    foreign           0.8-82     2022-01-16 [2] CRAN (R 4.2.1)
#>    formatR           1.12       2022-03-31 [1] CRAN (R 4.2.1)
#>    Formula           1.2-4      2020-10-16 [1] CRAN (R 4.2.0)
#>    fs                1.5.2      2021-12-08 [1] CRAN (R 4.2.0)
#>    fst               0.9.8      2022-02-08 [1] CRAN (R 4.2.1)
#>    fstcore           0.9.12     2022-03-23 [1] CRAN (R 4.2.1)
#>    fun               0.3        2020-10-23 [1] CRAN (R 4.2.0)
#>    furrr             0.3.0      2022-05-04 [1] CRAN (R 4.2.0)
#>    futile.logger     1.4.3      2016-07-10 [1] CRAN (R 4.2.1)
#>    futile.options    1.0.1      2018-04-20 [1] CRAN (R 4.2.0)
#>    future            1.26.1     2022-05-27 [1] CRAN (R 4.2.0)
#>    gargle            1.2.0      2021-07-02 [1] CRAN (R 4.2.0)
#>    gcookbook         2.0        2018-11-07 [1] CRAN (R 4.2.0)
#>    gdata             2.18.0.1   2022-05-10 [1] CRAN (R 4.2.0)
#>    gdtools           0.2.4      2022-02-14 [1] CRAN (R 4.2.1)
#>    generics          0.1.3      2022-07-05 [1] CRAN (R 4.2.1)
#>    gert              1.6.0      2022-03-29 [1] CRAN (R 4.2.0)
#>    GGally            2.1.2      2021-06-21 [1] CRAN (R 4.2.0)
#>    ggcorrplot        0.1.3      2019-05-19 [1] CRAN (R 4.2.0)
#>    ggplot2         * 3.3.6      2022-05-03 [1] CRAN (R 4.2.0)
#>    ggpubr            0.4.0      2020-06-27 [1] CRAN (R 4.2.0)
#>    ggrepel           0.9.1      2021-01-15 [1] CRAN (R 4.2.0)
#>    ggridges          0.5.3      2021-01-08 [1] CRAN (R 4.2.0)
#>    ggsci             2.9        2018-05-14 [1] CRAN (R 4.2.0)
#>    ggsignif          0.6.3      2021-09-09 [1] CRAN (R 4.2.0)
#>    ggthemes          4.2.4      2021-01-20 [1] CRAN (R 4.2.1)
#>    gh                1.3.0      2021-04-30 [1] CRAN (R 4.2.0)
#>    gitcreds          0.1.1      2020-12-04 [1] CRAN (R 4.2.0)
#>    gld               2.6.5      2022-06-29 [1] CRAN (R 4.2.1)
#>    globals           0.15.1     2022-06-24 [1] CRAN (R 4.2.1)
#>    glue              1.6.2      2022-02-24 [1] CRAN (R 4.2.0)
#>    gmodels           2.18.1.1   2022-05-17 [1] CRAN (R 4.2.0)
#>    gnm               1.1-2      2022-04-29 [1] CRAN (R 4.2.0)
#>    googledrive       2.0.0      2021-07-08 [1] CRAN (R 4.2.0)
#>    googlesheets4     1.0.0      2021-07-21 [1] CRAN (R 4.2.0)
#>    GPArotation       2022.4-1   2022-04-16 [1] CRAN (R 4.2.0)
#>    gplots            3.1.3      2022-04-25 [1] CRAN (R 4.2.0)
#>    gridExtra         2.3        2017-09-09 [1] CRAN (R 4.2.0)
#>    gtable            0.3.0      2019-03-25 [1] CRAN (R 4.2.0)
#>    gtools            3.9.3      2022-07-11 [1] CRAN (R 4.2.1)
#>    haven             2.5.0      2022-04-15 [1] CRAN (R 4.2.0)
#>    hexView           0.3-4      2019-03-13 [1] CRAN (R 4.2.0)
#>    highr             0.9        2021-04-16 [1] CRAN (R 4.2.0)
#>    Hmisc             4.7-0      2022-04-19 [1] CRAN (R 4.2.1)
#>    hms               1.1.1      2021-09-26 [1] CRAN (R 4.2.0)
#>    HSAUR3            1.0-13     2022-04-26 [1] CRAN (R 4.2.1)
#>    htmlTable         2.4.1      2022-07-07 [1] CRAN (R 4.2.1)
#>    htmltools         0.5.2      2021-08-25 [1] CRAN (R 4.2.0)
#>    htmlwidgets       1.5.4      2021-09-08 [1] CRAN (R 4.2.0)
#>    httpuv            1.6.5      2022-01-05 [1] CRAN (R 4.2.0)
#>    httr              1.4.3      2022-05-04 [1] CRAN (R 4.2.0)
#>    hypergeo          1.2-13     2016-04-07 [1] CRAN (R 4.2.0)
#>    ids               1.0.1      2017-05-31 [1] CRAN (R 4.2.0)
#>    igraph            1.3.2      2022-06-13 [1] CRAN (R 4.2.0)
#>    influenceR        0.1.0.1    2021-09-25 [1] CRAN (R 4.2.0)
#>    ini               0.3.1      2018-05-20 [1] CRAN (R 4.2.0)
#>    insight           0.18.0     2022-07-05 [1] CRAN (R 4.2.1)
#>    installr          0.23.2     2021-05-08 [1] CRAN (R 4.2.1)
#>    interp            1.1-2      2022-05-10 [1] CRAN (R 4.2.1)
#>    isoband           0.2.5      2021-07-13 [1] CRAN (R 4.2.0)
#>    jcolors           0.0.4      2019-05-22 [1] CRAN (R 4.2.0)
#>    jmv               2.3.4      2022-03-29 [1] CRAN (R 4.2.0)
#>    jmvcore           2.3.12     2022-05-31 [1] CRAN (R 4.2.0)
#>    jmvReadWrite      0.3.2      2022-05-21 [1] CRAN (R 4.2.0)
#>    jpeg              0.1-9      2021-07-24 [1] CRAN (R 4.2.0)
#>    jquerylib         0.1.4      2021-04-26 [1] CRAN (R 4.2.0)
#>    jsonlite          1.8.0      2022-02-22 [1] CRAN (R 4.2.0)
#>    kableExtra        1.3.4      2021-02-20 [1] CRAN (R 4.2.0)
#>    KernSmooth        2.23-20    2021-05-03 [2] CRAN (R 4.2.1)
#>    knitr             1.39       2022-04-26 [1] CRAN (R 4.2.1)
#>    labeling          0.4.2      2020-10-20 [1] CRAN (R 4.2.0)
#>    lambda.r          1.2.4      2019-09-18 [1] CRAN (R 4.2.1)
#>    later             1.3.0      2021-08-18 [1] CRAN (R 4.2.0)
#>    lattice           0.20-45    2021-09-22 [2] CRAN (R 4.2.1)
#>    latticeExtra      0.6-30     2022-07-04 [1] CRAN (R 4.2.1)
#>    lavaan            0.6-12     2022-07-04 [1] CRAN (R 4.2.1)
#>    lavaanPlot        0.6.2      2021-08-13 [1] CRAN (R 4.2.0)
#>    lifecycle         1.0.1      2021-09-24 [1] CRAN (R 4.2.0)
#>    listenv           0.8.0      2019-12-05 [1] CRAN (R 4.2.0)
#>    lme4              1.1-30     2022-07-08 [1] CRAN (R 4.2.1)
#>    lmerTest          3.1-3      2020-10-23 [1] CRAN (R 4.2.0)
#>    lmom              2.9        2022-05-29 [1] CRAN (R 4.2.0)
#>    lmtest            0.9-40     2022-03-21 [1] CRAN (R 4.2.0)
#>    lobstr            1.1.2      2022-06-22 [1] CRAN (R 4.2.0)
#>    lsr               0.5.2      2021-12-01 [1] CRAN (R 4.2.0)
#>    lubridate         1.8.0      2021-10-07 [1] CRAN (R 4.2.0)
#>    magick            2.7.3      2021-08-18 [1] CRAN (R 4.2.0)
#>    magrittr          2.0.3      2022-03-30 [1] CRAN (R 4.2.0)
#>    maptools          1.1-4      2022-04-17 [1] CRAN (R 4.2.0)
#>    markdown          1.1        2019-08-07 [1] CRAN (R 4.2.0)
#>    MASS            * 7.3-57     2022-04-22 [2] CRAN (R 4.2.1)
#>    Matrix            1.4-1      2022-03-23 [2] CRAN (R 4.2.1)
#>    MatrixModels      0.5-0      2021-03-02 [1] CRAN (R 4.2.0)
#>    matrixStats       0.62.0     2022-04-19 [1] CRAN (R 4.2.0)
#>    MBESS             4.9.1      2022-07-11 [1] CRAN (R 4.2.1)
#>    memoise           2.0.1      2021-11-26 [1] CRAN (R 4.2.0)
#>    mgcv              1.8-40     2022-03-29 [2] CRAN (R 4.2.1)
#>    mi                1.1        2022-06-06 [1] CRAN (R 4.2.0)
#>    mime              0.12       2021-09-28 [1] CRAN (R 4.2.0)
#>    miniUI            0.1.1.1    2018-05-18 [1] CRAN (R 4.2.0)
#>    minpack.lm        1.2-2      2022-04-13 [1] CRAN (R 4.2.0)
#>    minqa             1.2.4      2014-10-09 [1] CRAN (R 4.2.0)
#>    mitools           2.4        2019-04-26 [1] CRAN (R 4.2.1)
#>    mnormt            2.1.0      2022-06-07 [1] CRAN (R 4.2.0)
#>    modelr            0.1.8      2020-05-19 [1] CRAN (R 4.2.0)
#>    moments           0.14.1     2022-05-02 [1] CRAN (R 4.2.0)
#>    multcomp          1.4-19     2022-04-26 [1] CRAN (R 4.2.0)
#>    multcompView      0.1-8      2019-12-19 [1] CRAN (R 4.2.0)
#>    munsell           0.5.0      2018-06-12 [1] CRAN (R 4.2.0)
#>    mvnormtest        0.1-9      2012-04-12 [1] CRAN (R 4.2.0)
#>    mvtnorm           1.1-3      2021-10-08 [1] CRAN (R 4.2.0)
#>    nlme              3.1-158    2022-06-15 [1] CRAN (R 4.2.1)
#>    nloptr            2.0.3      2022-05-26 [1] CRAN (R 4.2.0)
#>    nnet              7.3-17     2022-01-16 [2] CRAN (R 4.2.1)
#>    nonpar            1.0.2      2020-04-29 [1] CRAN (R 4.2.0)
#>    nortest           1.0-4      2015-07-30 [1] CRAN (R 4.2.0)
#>    numDeriv          2016.8-1.1 2019-06-06 [1] CRAN (R 4.2.0)
#>    officer           0.4.3      2022-06-12 [1] CRAN (R 4.2.1)
#>    OpenMx            2.20.6     2022-03-09 [1] CRAN (R 4.2.0)
#>    openssl           2.0.2      2022-05-24 [1] CRAN (R 4.2.0)
#>    openxlsx          4.2.5      2021-12-14 [1] CRAN (R 4.2.0)
#>    pacman            0.5.1      2019-03-11 [1] CRAN (R 4.2.0)
#>    pander            0.6.5      2022-03-18 [1] CRAN (R 4.2.0)
#>    papaja            0.1.1      2022-07-05 [1] CRAN (R 4.2.1)
#>    parallelly        1.32.0     2022-06-07 [1] CRAN (R 4.2.0)
#>    parameters        0.18.1     2022-05-29 [1] CRAN (R 4.2.0)
#>    pbapply           1.5-0      2021-09-16 [1] CRAN (R 4.2.0)
#>    pbivnorm          0.6.0      2015-01-23 [1] CRAN (R 4.2.0)
#>    pbkrtest          0.5.1      2021-03-09 [1] CRAN (R 4.2.0)
#>    performance       0.9.1      2022-06-20 [1] CRAN (R 4.2.0)
#>    pillar            1.7.0      2022-02-01 [1] CRAN (R 4.2.0)
#>    pkgbuild          1.3.1      2021-12-20 [1] CRAN (R 4.2.0)
#>    pkgconfig         2.0.3      2019-09-22 [1] CRAN (R 4.2.0)
#>    pkgload           1.3.0      2022-06-27 [1] CRAN (R 4.2.1)
#>    plogr             0.2.0      2018-03-25 [1] CRAN (R 4.2.1)
#>    plyr              1.8.7      2022-03-24 [1] CRAN (R 4.2.0)
#>    PMCMR             4.4        2021-10-02 [1] CRAN (R 4.2.0)
#>    png               0.1-7      2013-12-03 [1] CRAN (R 4.2.0)
#>    polynom           1.4-1      2022-04-11 [1] CRAN (R 4.2.0)
#>    praise            1.0.0      2015-08-11 [1] CRAN (R 4.2.0)
#>    prettyunits       1.1.1      2020-01-24 [1] CRAN (R 4.2.0)
#>    processx          3.7.0      2022-07-07 [1] CRAN (R 4.2.1)
#>    progress          1.2.2      2019-05-16 [1] CRAN (R 4.2.0)
#>    promises          1.2.0.1    2021-02-11 [1] CRAN (R 4.2.0)
#>    proxy             0.4-27     2022-06-09 [1] CRAN (R 4.2.0)
#>    pryr              0.1.5      2021-07-26 [1] CRAN (R 4.2.0)
#>    ps                1.7.1      2022-06-18 [1] CRAN (R 4.2.0)
#>    psych             2.2.5      2022-05-10 [1] CRAN (R 4.2.1)
#>    purrr           * 0.3.4      2020-04-17 [1] CRAN (R 4.2.0)
#>    pwr               1.3-0      2020-03-17 [1] CRAN (R 4.2.0)
#>    pzfx              0.3.0      2020-07-04 [1] CRAN (R 4.2.1)
#>    qqplotr           0.0.5      2021-04-23 [1] CRAN (R 4.2.1)
#>    quantreg          5.93       2022-05-02 [1] CRAN (R 4.2.0)
#>    qvcalc            1.0.2      2020-02-15 [1] CRAN (R 4.2.0)
#>    R.cache           0.15.0     2021-04-30 [1] CRAN (R 4.2.1)
#>    R.methodsS3       1.8.2      2022-06-13 [1] CRAN (R 4.2.0)
#>    R.oo              1.25.0     2022-06-12 [1] CRAN (R 4.2.0)
#>    R.utils           2.12.0     2022-06-28 [1] CRAN (R 4.2.1)
#>    R6                2.5.1      2021-08-19 [1] CRAN (R 4.2.0)
#>    rappdirs          0.3.3      2021-01-31 [1] CRAN (R 4.2.0)
#>    rapportools       1.1        2022-03-22 [1] CRAN (R 4.2.0)
#>    rcmdcheck         1.4.0      2021-09-27 [1] CRAN (R 4.2.0)
#>    Rcmdr             2.7-2      2022-01-06 [1] CRAN (R 4.2.1)
#>    RcmdrMisc         2.7-2      2022-01-05 [1] CRAN (R 4.2.1)
#>    RColorBrewer      1.1-3      2022-04-03 [1] CRAN (R 4.2.0)
#>    Rcpp              1.0.9      2022-07-08 [1] CRAN (R 4.2.1)
#>    RcppEigen         0.3.3.9.2  2022-04-08 [1] CRAN (R 4.2.0)
#>  D RcppParallel      5.1.5      2022-01-05 [1] CRAN (R 4.2.0)
#>    RCurl             1.98-1.7   2022-06-09 [1] CRAN (R 4.2.0)
#>    readODS           1.7.0      2020-07-10 [1] CRAN (R 4.2.1)
#>    readr           * 2.1.2      2022-01-30 [1] CRAN (R 4.2.0)
#>    readstata13       0.10.0     2021-05-25 [1] CRAN (R 4.2.1)
#>    readxl            1.4.0      2022-03-28 [1] CRAN (R 4.2.0)
#>    relimp            1.0-5      2016-03-30 [1] CRAN (R 4.2.0)
#>    rematch           1.0.1      2016-04-21 [1] CRAN (R 4.2.0)
#>    rematch2          2.1.2      2020-05-01 [1] CRAN (R 4.2.0)
#>    remotes           2.4.2      2021-11-30 [1] CRAN (R 4.2.0)
#>    reprex            2.0.1      2021-08-05 [1] CRAN (R 4.2.0)
#>    reshape           0.8.9      2022-04-12 [1] CRAN (R 4.2.0)
#>    reshape2          1.4.4      2020-04-09 [1] CRAN (R 4.2.0)
#>    restfulr          0.0.15     2022-06-16 [1] CRAN (R 4.2.1)
#>    rio               0.5.29     2021-11-22 [1] CRAN (R 4.2.1)
#>    rjson             0.2.21     2022-01-09 [1] CRAN (R 4.2.0)
#>    RJSONIO           1.3-1.6    2021-09-16 [1] CRAN (R 4.2.0)
#>    rlang             1.0.3      2022-06-27 [1] CRAN (R 4.2.1)
#>    rmarkdown         2.14       2022-04-25 [1] CRAN (R 4.2.0)
#>    rmatio            0.16.0     2021-10-27 [1] CRAN (R 4.2.1)
#>    rmdfiltr          0.1.3      2020-11-25 [1] CRAN (R 4.2.1)
#>    rmdpartials       0.5.8      2020-06-04 [1] CRAN (R 4.2.0)
#>    Rmisc             1.5.1      2022-05-02 [1] CRAN (R 4.2.1)
#>    robustbase        0.95-0     2022-04-02 [1] CRAN (R 4.2.1)
#>    ROCR              1.0-11     2020-05-02 [1] CRAN (R 4.2.0)
#>    rootSolve         1.8.2.3    2021-09-29 [1] CRAN (R 4.2.0)
#>    roxygen2          7.2.0      2022-05-13 [1] CRAN (R 4.2.0)
#>    rpart             4.1.16     2022-01-24 [2] CRAN (R 4.2.1)
#>    rpf               1.0.11     2021-10-20 [1] CRAN (R 4.2.0)
#>    rprojroot         2.0.3      2022-04-02 [1] CRAN (R 4.2.0)
#>    RSQLite           2.2.14     2022-05-07 [1] CRAN (R 4.2.1)
#>    rstatix           0.7.0      2021-02-13 [1] CRAN (R 4.2.0)
#>    rstudioapi        0.13       2020-11-12 [1] CRAN (R 4.2.0)
#>    Rttf2pt1          1.3.10     2022-02-07 [1] CRAN (R 4.2.0)
#>    rversions         2.1.1      2021-05-31 [1] CRAN (R 4.2.0)
#>    rvest             1.0.2      2021-10-16 [1] CRAN (R 4.2.0)
#>    RXKCD             1.9.2      2020-02-24 [1] CRAN (R 4.2.1)
#>    sandwich          3.0-2      2022-06-15 [1] CRAN (R 4.2.0)
#>    sass              0.4.1      2022-03-23 [1] CRAN (R 4.2.0)
#>    scales          * 1.2.0      2022-04-13 [1] CRAN (R 4.2.0)
#>    SCRT              1.3.1      2020-01-09 [1] CRAN (R 4.2.0)
#>    selectr           0.4-2      2019-11-20 [1] CRAN (R 4.2.0)
#>    sem               3.1-15     2022-04-10 [1] CRAN (R 4.2.0)
#>    semTools          0.5-6      2022-05-10 [1] CRAN (R 4.2.0)
#>    servr             0.24       2021-11-16 [1] CRAN (R 4.2.0)
#>    sessioninfo       1.2.2      2021-12-06 [1] CRAN (R 4.2.0)
#>    shiny             1.7.1      2021-10-02 [1] CRAN (R 4.2.0)
#>    shinyBS           0.61.1     2022-04-17 [1] CRAN (R 4.2.1)
#>    shinycssloaders   1.0.0      2020-07-28 [1] CRAN (R 4.2.1)
#>    shinythemes       1.2.0      2021-01-25 [1] CRAN (R 4.2.1)
#>    sjlabelled        1.2.0      2022-04-10 [1] CRAN (R 4.2.0)
#>    sjmisc            2.8.9      2021-12-03 [1] CRAN (R 4.2.0)
#>    sjstats           0.18.1     2021-01-09 [1] CRAN (R 4.2.0)
#>    snow              0.4-4      2021-10-27 [1] CRAN (R 4.2.0)
#>    sourcetools       0.1.7      2018-04-25 [1] CRAN (R 4.2.0)
#>    sp                1.5-0      2022-06-05 [1] CRAN (R 4.2.0)
#>    SparseM           1.81       2021-02-18 [1] CRAN (R 4.2.0)
#>    spatial           7.3-15     2022-01-16 [2] CRAN (R 4.2.1)
#>    StanHeaders       2.21.0-7   2020-12-17 [1] CRAN (R 4.2.0)
#>    stringi           1.7.8      2022-07-11 [1] CRAN (R 4.2.1)
#>    stringr         * 1.4.0      2019-02-10 [1] CRAN (R 4.2.0)
#>    styler            1.7.0      2022-03-13 [1] CRAN (R 4.2.1)
#>    summarytools      1.0.1      2022-05-20 [1] CRAN (R 4.2.1)
#>    SuppDists         1.1-9.7    2022-01-03 [1] CRAN (R 4.2.0)
#>    survey            4.1-1      2021-07-19 [1] CRAN (R 4.2.1)
#>    survival          3.3-1      2022-03-03 [2] CRAN (R 4.2.1)
#>    svglite           2.1.0      2022-02-03 [1] CRAN (R 4.2.0)
#>    sys               3.4        2020-07-23 [1] CRAN (R 4.2.0)
#>    systemfonts       1.0.4      2022-02-11 [1] CRAN (R 4.2.0)
#>    tcltk2            1.2-11     2014-12-20 [1] CRAN (R 4.2.0)
#>    TeachingDemos     2.12       2020-04-07 [1] CRAN (R 4.2.1)
#>    testthat          3.1.4      2022-04-26 [1] CRAN (R 4.2.0)
#>    TH.data           1.1-1      2022-04-26 [1] CRAN (R 4.2.0)
#>    tibble          * 3.1.7      2022-05-03 [1] CRAN (R 4.2.0)
#>    tidyr           * 1.2.0      2022-02-01 [1] CRAN (R 4.2.0)
#>    tidyselect        1.1.2      2022-02-21 [1] CRAN (R 4.2.0)
#>    tidyverse       * 1.3.1      2021-04-15 [1] CRAN (R 4.2.1)
#>    timeDate          3043.102   2018-02-21 [1] CRAN (R 4.2.0)
#>    tinylabels        0.2.3      2022-02-06 [1] CRAN (R 4.2.1)
#>    tinytex           0.40       2022-06-15 [1] CRAN (R 4.2.0)
#>    tmvnsim           1.0-2      2016-12-15 [1] CRAN (R 4.2.0)
#>    tzdb              0.3.0      2022-03-28 [1] CRAN (R 4.2.0)
#>    ufs               0.5.2      2021-11-13 [1] CRAN (R 4.2.0)
#>    usethis           2.1.6      2022-05-25 [1] CRAN (R 4.2.0)
#>    utf8              1.2.2      2021-07-24 [1] CRAN (R 4.2.0)
#>    uuid              1.1-0      2022-04-19 [1] CRAN (R 4.2.0)
#>    vcd               1.4-10     2022-06-09 [1] CRAN (R 4.2.0)
#>    vcdExtra          0.8-0      2022-04-21 [1] CRAN (R 4.2.0)
#>    vctrs             0.4.1      2022-04-13 [1] CRAN (R 4.2.0)
#>    viridis           0.6.2      2021-10-13 [1] CRAN (R 4.2.0)
#>    viridisLite       0.4.0      2021-04-13 [1] CRAN (R 4.2.0)
#>    visNetwork        2.1.0      2021-09-29 [1] CRAN (R 4.2.0)
#>    vroom             1.5.7      2021-11-30 [1] CRAN (R 4.2.0)
#>    waldo             0.4.0      2022-03-16 [1] CRAN (R 4.2.0)
#>    webshot           0.5.3      2022-04-14 [1] CRAN (R 4.2.0)
#>    whisker           0.4        2019-08-28 [1] CRAN (R 4.2.0)
#>    withr             2.5.0      2022-03-03 [1] CRAN (R 4.2.0)
#>    xfun              0.31       2022-05-10 [1] CRAN (R 4.2.0)
#>    XML               3.99-0.10  2022-06-09 [1] CRAN (R 4.2.0)
#>    xml2              1.3.3      2021-11-30 [1] CRAN (R 4.2.0)
#>    xopen             1.0.0      2018-09-17 [1] CRAN (R 4.2.0)
#>    xplorerr          0.1.2      2021-05-21 [1] CRAN (R 4.2.1)
#>    xtable            1.8-4      2019-04-21 [1] CRAN (R 4.2.0)
#>    yaml              2.3.5      2022-02-21 [1] CRAN (R 4.2.0)
#>    zip               2.2.0      2021-05-31 [1] CRAN (R 4.2.0)
#>    zoo               1.8-10     2022-04-15 [1] CRAN (R 4.2.0)
#> 
#>  [1] C:/Users/RStudio/AppData/Local/R/win-library/4.2
#>  [2] C:/Program Files/R/R-4.2.1/library
#> 
#>  D ── DLL MD5 mismatch, broken installation.
pckgs.info %>%
  filter(source == "Bioconductor")
#>  package              * version date (UTC) lib source
#>  AnnotationDbi          1.58.0  2022-04-26 [1] Bioconductor
#>  Biobase                2.56.0  2022-04-26 [1] Bioconductor
#>  BiocFileCache          2.4.0   2022-04-26 [1] Bioconductor
#>  BiocGenerics           0.42.0  2022-04-26 [1] Bioconductor
#>  BiocIO                 1.6.0   2022-04-26 [1] Bioconductor
#>  BiocParallel           1.30.3  2022-06-07 [1] Bioconductor
#>  BiocVersion            3.15.2  2022-03-29 [1] Bioconductor
#>  biomaRt                2.52.0  2022-04-26 [1] Bioconductor
#>  Biostrings             2.64.0  2022-04-26 [1] Bioconductor
#>  DelayedArray           0.22.0  2022-04-26 [1] Bioconductor
#>  GenomeInfoDb           1.32.2  2022-05-15 [1] Bioconductor
#>  GenomeInfoDbData       1.2.8   2022-07-06 [1] Bioconductor
#>  GenomicAlignments      1.32.0  2022-04-26 [1] Bioconductor
#>  GenomicFeatures        1.48.3  2022-05-31 [1] Bioconductor
#>  GenomicRanges          1.48.0  2022-04-26 [1] Bioconductor
#>  IRanges                2.30.0  2022-04-26 [1] Bioconductor
#>  KEGGREST               1.36.2  2022-06-09 [1] Bioconductor
#>  MatrixGenerics         1.8.1   2022-06-30 [1] Bioconductor
#>  Rhtslib                1.28.0  2022-04-26 [1] Bioconductor
#>  Rsamtools              2.12.0  2022-04-26 [1] Bioconductor
#>  rtracklayer            1.56.1  2022-06-23 [1] Bioconductor
#>  S4Vectors              0.34.0  2022-04-26 [1] Bioconductor
#>  SummarizedExperiment   1.26.1  2022-04-29 [1] Bioconductor
#>  XVector                0.36.0  2022-04-26 [1] Bioconductor
#>  zlibbioc               1.42.0  2022-04-26 [1] Bioconductor
#> 
#>  [1] C:/Users/RStudio/AppData/Local/R/win-library/4.2
#>  [2] C:/Program Files/R/R-4.2.1/library
pckgs.info %>%
  filter(grepl("Github", source))
#>  package             * version date (UTC) lib source
#>  apastats              0.3     2022-07-04 [1] Github (achetverikov/apastats@448bb21)
#>  rempsyc               0.0.4.5 2022-07-04 [1] Github (rempsyc/rempsyc@cab4ae0)
#>  userfriendlyscience   0.7.2   2022-06-30 [1] Github (matherion/userfriendlyscience@46acf71)
#> 
#>  [1] C:/Users/RStudio/AppData/Local/R/win-library/4.2
#>  [2] C:/Program Files/R/R-4.2.1/library
```



## Megoldások az \@ref(munka-az-r-ben-1-exercise) feladatokhoz {#munka-az-r-ben-1-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Bizonyosudjunk meg róla, hogy az alapvető szövegszerkesztési ismeretek birtokában vagyunk. Ismerjük az `Insert` billentyű funkcióját? Találjunk legalább 8 módszert, amely kizárólag a billentyű segítségével mozgatja a szövegkurzort! A szövegkijelölésnek milyen billentyűparancsait ismerjük? Milyen karaktertörlési lehetőségeket ismerünk? Ismerjük mindhárom vágóasztal-művelet billentyűparancsát?
</div>\EndKnitrBlock{rmdexercise}


A szövegkurzor mozgatása billentyűvel:

* `FEL/LE/JOBBRA/BALRA` nyilak
* `Ctrl+FEL/LE/JOBBRA/BALRA` nyilak
* `Page Up`, `Page Down`
* `Ctrl+Page Up`, `Ctrl+Page Down`
* `Home`, `End`
* `Ctrl+Home`, `Ctrl+End`
* `TAB`
* `Shift+TAB`

Karaktertörlései lehetőségek:

* `Backspace`
* `Delete`

Vágóasztal műveletek:

* Másolás (`Ctrl+C`)
* Kivágás (`Ctrl+X`)
* Beillesztés (`Ctrl+V`)

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Az *RStudio* mellett milyen más intergrált fejlesztőeszközök léteznek az R-hez? 
</div>\EndKnitrBlock{rmdexercise}

Például: 

* [RKWard](https://rkward.kde.org/)
* [BlueSky Statistics](https://www.blueskystatistics.com/)


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
3. Az `Appearance` menüpont `Editor theme` beállításával változtassunk az *RStudio* színösszeállításán. Keressük meg a legjobban hozzánk illőt! Vegyük figyelembe, hogy hosszútávon a minél sötétebb háttér a jó választás. 
</div>\EndKnitrBlock{rmdexercise}

Én a `Tomorrow Night Bright` témát használom.


## Megoldások az \@ref(munka-az-r-ben-2-exercise) feladatokhoz {#munka-az-r-ben-2-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Keressünk magyar nyelvű leírásokat az R-hez! 
</div>\EndKnitrBlock{rmdexercise}

Például:

* Reiczigel Jenő, Harnos Andrea, Solymosi Norbert (2021). *Biostatisztika nem statisztikusoknak*. Pars Kft., Nagykovácsi.
* Dinya Elek, Solymosi Norbert (2016). *Biometria a klinikumban 2.  Feladatok megoldása R-környezetben.* Medicina Kiadó.
* Münnich Ákos, Nagy Ágnes, Abari Kálmán. *Többváltozós statisztika pszichológus hallgatók számára.* Bölcsész Konzorcium, Debrecen, 2006. (http://psycho.unideb.hu/statisztika)
ISBN 963 9704 04 0



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. A közösségi médiában melyek az R legfontosabb fórumai?
</div>\EndKnitrBlock{rmdexercise}

Pélául:

* [R-bloggers](https://www.r-bloggers.com/)
* https://twitter.com/hashtag/rstat



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
3. Hogyan indíthatjuk el egy csomag beépített súgóját? Ismerjük meg így a **fun** csomagot!
</div>\EndKnitrBlock{rmdexercise}


```r
# install.packages("fun")
help(package="fun")
library(fun)
alzheimer_test()
```



## Megoldások az \@ref(munka-az-r-ben-3-exercise) feladatokhoz {#munka-az-r-ben-3-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Foglaljuk össze az R használati módjait! Soroljuk fel mind a négy lehetőséget!
</div>\EndKnitrBlock{rmdexercise}



* Konzolos használat
* Parancsállományos használat (*RGui*, *RStudio*)
* Point-and-click használat (*R Commander*, *jamovi*, *JASP* stb.)
* Kötegelt használat



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Hasonlítsuk össze a parancsállományok használatát *RGui*-ban és *RStudio*-ban!
</div>\EndKnitrBlock{rmdexercise}


Az *RGui* és a az *RStudio* is támogatja a parancsállományos használati módot. Valójában az *RGui* a `Ctrl+R` billentyűkombináción, és az `*.R` kiterjesztésű állományok mentésén/nyitásán kívül más segítséget nem ad a a parancsállományos használathoz, míg az *RStudio* a ma elérhető legkényelmesebb felület nyújtja a parancsállományok szerkesztéséhez.



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
3. Hasonlítsuk össze a parancsállományok és az RMarkdown használatát *R Commander*-ben és *RStudio*-ban!
</div>\EndKnitrBlock{rmdexercise}


Az *R Commander* a menüből kiválasztott műveletek R parancsait parancsállományban és RMarkdown állományban is rögzíti, így, utóbbi esetben HTML formátumú állományt generálhatunk az elemzésünk végén. Az *R Commander*-ben tehát akár parancsok gépelése nélkül hosszabb távon is eltárolhatjuk elemző parancsainkat, amelyet `*.R` vagy `*.Rmd` állományban is rögzíthetünk. Az *RStudio*-ban minden parancsot magunknak kell begépelnünk, de a gépelés során számos segítség áll rendelkezésre. Az RMarkdown összes lehetőségét valójában csak az *RStudio*-ban használhatjuk ki.


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
4. Töltsük le és telepítsük az ingyenesen elérhető *jamovi* és a *JASP* statisztikai programokat, majd nyissuk meg a beépített adatbázisait, és végezzünk néhány egyszerűbb elemzést! Ha elakadunk, keressünk videó tutoriált az eszközök használatáról. Melyik eszköz tetszik jobban? Miben hasonlítanak és miben térnek el?
</div>\EndKnitrBlock{rmdexercise}

A két eszköz honlapján a letöltés is elvégezhető és a szoftverek részletes dokumentációját is elérhetjük:

* [jamovi](https://www.jamovi.org/)
* [JASP](https://jasp-stats.org/)



## Megoldások az \@ref(az-r-nyelv-1-exercise) feladatokhoz {#az-r-nyelv-1-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Gondoljuk át, mi lehet a következő algebrai kifejezés eredménye, majd ellenőrizzük R-ben is: $8/2(2+2)$.
</div>\EndKnitrBlock{rmdexercise}



```r
8/2*(2+2)
#> [1] 16
```

Alternatív [válasz](https://hvg.hu/tudomany/20190808_Mero_Laszlo_megvalaszolta_az_egesz_internetet_lazban_tarto_matematikai_feladvanyt).

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. Gondoljuk át, hogy a `.342e1` név miért nem lehet érvényes objektumnév? Próbáljuk ki a `make.names(".342e1")` parancsot, majd tanulmányozzuk a `?make.names` leírást!
</div>\EndKnitrBlock{rmdexercise}


A `make.names()` függvény egy tetszőleges karaktersorozatból szabályos objektumnevet hoz létre. Önmagában a `.342e1` nem szabályos objektumnév, hiszen egy exponenciális alakú számról van szó.


```r
.342e1
#> [1] 3.42
make.names(".342e1")
#> [1] "X.342e1"
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
3. Magyarázzuk meg a `make.names(c("", "", ""))` és a `make.names(c("", "", ""), unique = T)` parancsok közötti különbséget!
</div>\EndKnitrBlock{rmdexercise}



```r
make.names(c("", "", ""))
#> [1] "X" "X" "X"
make.names(c("", "", ""), unique = T)
#> [1] "X"   "X.1" "X.2"
```

A `make.names()` függvényben szereplő `unique=T` a létrehozandó objektumnevek egyediségéről is gondoskodik.


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
4. Gondoljuk át, hogy egy parancsállomány mely pontjain érdemes feltétlenül megjegyzéseket használni!
</div>\EndKnitrBlock{rmdexercise}


A lehető legtöbb ponton használjunk megjegyzést, de mindenképp alakítsuk ki megjegyzésekkel a négyes tagolást:

1. Beolvasás
1. Előkészítés
1. Elemzés
1. Publikálás


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
5. Jelentősen segíthetjük a navigációt az *RStudio* parancsállományaiban, ha bizonyos megjegyzések végére ezt írjuk: ` ----` (szóköz és négy mínusz jel). Hogyan használhatjuk ezt a lehetőséget az *RStudio*-ban, és milyen előnyei vannak?
</div>\EndKnitrBlock{rmdexercise}

A címsorok végén, szóköz után, ha szerepeltetjük a `----` (négy mínusz jel) karaktersorozatot, akkor a `Code / Show document outline` menüpontból elérhető válik a megjelölt címsorok tartalomjegyzéke. Így hozunk létre szakaszokat az `.R` parancsállományokban.


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
6. Az *RStudio*-ban parancsállomány (`.R`) szerkesztése közben próbáljuk ki a `Ctrl+Alt+R` billentyűparancsot, és a hozzá kapcsolódó `Shift+Alt+J` billentyűparancsot is. Mi a jelentése az `Alt+L`, `Shift+Alt+L`, `Alt+O` és `Shift+Alt+O` billentyűparancsoknak? A most megismert funkciók hogyan válthatók ki RMarkdown (`.Rmd`) állomány szerkesztése közben?
  </div>\EndKnitrBlock{rmdexercise}


A parancsállományok (`.R`) szerkesztése közben:

* `Ctrl+Alt+R` - az összes sor futtatása
* `Shift+Alt+J` - választás a `----` (négy mínusz jel) karakterekkel megjelölt címekből, vagyis ugrás a megjelölt a szakaszra.
* `Alt+L` - az aktuális szakasz bezárása
* `Shift+Alt+L` - az aktuális szakasz kinyitása
* `Alt+O` - minden szakasz bezárása
* `Shift+Alt+O` - minden szakasz kinyitása

Az RMarkdown (`.Rmd`) szerkesztése közben szintén használhatók a fenti billentyűkombinációk. Az egyetlen eltérés, hogy a `----` (négy mínusz jel) karakterekre nincs szükség, a Markdown címsorok és az R csonkok automatikusan szakasszá válnak.

## Megoldások az \@ref(az-r-nyelv-2-exercise) feladatokhoz {#az-r-nyelv-2-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Tekintsük át az \@ref(tab:matfuggvenyek). táblázat utolsó oszlopában szereplő R függvényeket. Próbáljuk megjósolni a függvények visszatérési értékét. Végezzünk ellenőrzést: gépeljük be, és hajtsuk végre a matematikai függvényeket! Egészítsük ki a begépelt matematikai függvényeket az argumentumok nevével, mindegyik argumentumnak adjunk nevet az \@ref(tab:matfuggvenyek). táblázat első oszlopa alapján! 
</div>\EndKnitrBlock{rmdexercise}



```r
abs(x = -1)
#> [1] 1
sign(x = pi)
#> [1] 1
sqrt(x = 9+16)
#> [1] 5
exp(x = 1)
#> [1] 2.718
log(x = exp(3))
#> [1] 3
log(x = 8,base = 10)
#> [1] 0.9031
log10(x = 1000)
#> [1] 3
log2(x = 256)
#> [1] 8
cos(x = pi)
#> [1] -1
sin(x = 0)
#> [1] 0
tan(x = 0)
#> [1] 0
round(x = c(1.5,-1.5))
#> [1]  2 -2
floor(x = c(1.5,-1.5))
#> [1]  1 -2
ceiling(x = c(1.5,-1.5))
#> [1]  2 -1
trunc(x = c(1.5,-1.5))
#> [1]  1 -1
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. Az előző feladatban a matematikai függvények gépelése során milyen *RStudio* kényelmi funkciókat fedeztünk fel. Soroljunk fel legalább hármat!
</div>\EndKnitrBlock{rmdexercise}


* függvény nevének kiegészítése
* kerek zárójelek elhelyezése a függvénynév után
* argumentumnevek felajánlása

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
3. Az aranymetszés arányait tartalmazó épületek, képzőművészeti alkotások máig nagy esztétikai értékkel bírnak. Határozzuk meg ezt az arányt a $\phi=\frac{1+\sqrt{5}}{2}$
 képlet segítségével! Egy A/4-es oldalra kb. 47 sort írhatunk 12-es betűmérettel, és kb. 35 sort 16-os betűmérettel. Egy üres lap hanyadik sorába írnánk címet 12-es és 16-os betűméret esetén? Próbáljuk ki mindezt egy szövegszerkesztőben is! 
</div>\EndKnitrBlock{rmdexercise}



```r
fi <- (1+sqrt(5))/2
fi
#> [1] 1.618
c(47, 35)/(1+fi)
#> [1] 17.95 13.37
```

A 47 soros A/4-es oldal 18. sorába, illetve a 35 soros A/4-es oldal 13. sorába kerülhetne a cím.

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
4. A trigonometrikus függvények argumentumában radiánban kell megadni a szög értékét, és nem fokban. Ezt figyelembe véve határozzuk meg a 0, 30, 45, 60, 90 és 180 fok szinuszát, koszinuszát és tangensét!
  </div>\EndKnitrBlock{rmdexercise}



```r
fokok <- c(0, 30, 45, 60, 90, 180)
sin(pi*fokok/180)
#> [1] 0.000e+00 5.000e-01 7.071e-01 8.660e-01 1.000e+00 1.225e-16
cos(pi*fokok/180)
#> [1]  1.000e+00  8.660e-01  7.071e-01  5.000e-01  6.123e-17 -1.000e+00
tan(pi*fokok/180)
#> [1]  0.000e+00  5.774e-01  1.000e+00  1.732e+00  1.633e+16 -1.225e-16
```


## Megoldások az \@ref(az-r-nyelv-3-1-exercise) feladatokhoz {#az-r-nyelv-3-1-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Mi a hasonlóság a következő három numerikus konstans között: `0xabc`, `2748`, `.2748e4`. 

</div>\EndKnitrBlock{rmdexercise}


Mindhárom szám értéke azonos, 2748.


```r
0xabc
#> [1] 2748
2748
#> [1] 2748
.2748e4
#> [1] 2748
```



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">

2. Az R öt előre definiált konstassal rendelkezik (`?Constants`). Írassuk ki ezek értékeit, állapítsuk meg típusukat!

</div>\EndKnitrBlock{rmdexercise}



```r
LETTERS
#>  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S"
#> [20] "T" "U" "V" "W" "X" "Y" "Z"
letters
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"
#> [20] "t" "u" "v" "w" "x" "y" "z"
month.abb
#>  [1] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"
month.name
#>  [1] "January"   "February"  "March"     "April"     "May"       "June"     
#>  [7] "July"      "August"    "September" "October"   "November"  "December"
pi
#> [1] 3.142
```

A `pi` double, a többi karakteres típusú.

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
3. Az aranymetszés arányszámát ($\phi=\frac{1+\sqrt{5}}{2}$) írassuk a konzolba legalább 8 tizedes pontossággal!

</div>\EndKnitrBlock{rmdexercise}




```r
fi <- (1+sqrt(5))/2
# 1. megoldás
options(digits=10) # megnöveljük az értékes jegyek kiírását
fi                 # fi kiírása
#> [1] 1.618033989
options(digits=7)  # alapértelmezés visszaállítása
# 2. megoldás
print(fi, digits=10) 
#> [1] 1.618033989
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
4. Az `r"(tetszőleges karakterek)"` formájú karakteres konstans megadásnak több válozata is létezik, soroljunk fel még legalább öt lehetőséget (`?Quotes`)! Milyen előnyökkel rendelkezik ez a megadási forma az idézőjelek és a fordított perjel tekintetében? 

</div>\EndKnitrBlock{rmdexercise}



```r
r"(Alapértelmezett alak)"
#> [1] "Alapértelmezett alak"
r'(Így is jó)'
#> [1] "Így is jó"
r"{Használhatunk kapcsos zárójeleket is}"
#> [1] "Használhatunk kapcsos zárójeleket is"
r"[Vagy szögletest]"
#> [1] "Vagy szögletest"
r"---(Vagy körbevehetjük azonos számú gondolatjellel is)---"
#> [1] "Vagy körbevehetjük azonos számú gondolatjellel is"
r"-(Akár eggyel is)-"
#> [1] "Akár eggyel is"
r"(Ne feledjük, két előnye van ennek a formának:)"
#> [1] "Ne feledjük, két előnye van ennek a formának:"
r"((1) könnyebb egyszerre használni a szimpla (') és dupla (") idéző jeleket)"
#> [1] "(1) könnyebb egyszerre használni a szimpla (') és dupla (\") idéző jeleket"
r"((2) a Windows-os elérési utak könyebben másolhatók az op. renszerből:)"
#> [1] "(2) a Windows-os elérési utak könyebben másolhatók az op. renszerből:"
r"(C:\Program Files\Android)"
#> [1] "C:\\Program Files\\Android"
```




\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
5. Helyezzünk el idézőjeleket karakteres konstansokban, mindhárom megadási forma mellett!

</div>\EndKnitrBlock{rmdexercise}



```r
"szimpla (') és dupla (\")"
#> [1] "szimpla (') és dupla (\")"
'szimpla (\') és dupla (")'
#> [1] "szimpla (') és dupla (\")"
r"(szimpla (') és dupla ("))"
#> [1] "szimpla (') és dupla (\")"
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
6. Próbáljuk ki az \@ref(tab:karfuggvenyek). táblázat karakterkezelő függvényeit! Gépeljük be az utolsó oszlopban lévő példákat, és vizsgáljuk meg a függvények visszatérési értékét.

</div>\EndKnitrBlock{rmdexercise}



```r
paste("a","b",sep="=")
#> [1] "a=b"
nchar("alma")
#> [1] 4
substr("alma", 3, 5)
#> [1] "ma"
tolower("Kiss Géza")
#> [1] "kiss géza"
toupper("Kiss Géza")
#> [1] "KISS GÉZA"
chartr("it","ál","titik")
#> [1] "lálák"
cat("alma","fa", sep="")
#> almafa
grepl(pattern="lm",x="alma")
#> [1] TRUE
gsub("lm",repl="nyj",x="alma")
#> [1] "anyja"
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
7. Próbáljuk ki az \@ref(tab:reloperatorok). táblázat relációs operátorait! Gépeljük be a példákat és ellenőrizzük az eredményeket.

</div>\EndKnitrBlock{rmdexercise}




```r
1<2
#> [1] TRUE
"alma"<"körte"
#> [1] TRUE
3>(1+2)
#> [1] FALSE
"abc">"ab"
#> [1] TRUE
1<=-.3
#> [1] FALSE
"él"<="elő"
#> [1] TRUE
3/4>=7/9
#> [1] FALSE
"aki">="Ági"
#> [1] TRUE
20==2e1
#> [1] TRUE
"Len"=="len"
#> [1] FALSE
exp(1)!=pi
#> [1] TRUE
"Len"!="len"
#> [1] TRUE
c(8, 12) %in% 1:10
#> [1]  TRUE FALSE
```



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
8. A logikai operátorok működéséről teljes képet kaphatunk az \@ref(tab:logoperatorok). táblázatból. Próbáljuk ki ezeket a parancsokat is!

</div>\EndKnitrBlock{rmdexercise}



```r
# logikai NEM
!(1<2)
#> [1] FALSE
!T
#> [1] FALSE
!F
#> [1] TRUE
# logikai ÉS (csak egy esetben igaz)
T & T
#> [1] TRUE
T & F
#> [1] FALSE
F & T
#> [1] FALSE
F & F
#> [1] FALSE
# logikai VAGY (csak egy esetben hamis)
T | T
#> [1] TRUE
T | F
#> [1] TRUE
F | T
#> [1] TRUE
F | F
#> [1] FALSE
```


## Megoldások az \@ref(az-r-nyelv-4-exercise) feladatokhoz {#az-r-nyelv-4-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Próbáljuk ki az \@ref(tab:adatszerkezetek). táblázatban szereplő példákat. Hozzuk létre a különböző típusú objektumokat és vizsgáljuk meg a `typeof()` és `class()` függvényekkel az objektumok típusát.

</div>\EndKnitrBlock{rmdexercise}



```r
x <- c(12L, 14L)
typeof(x)
#> [1] "integer"
class(x)
#> [1] "integer"

x <- c(12, 14)
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"

x <- c("a", "az", "egy")
typeof(x)
#> [1] "character"
class(x)
#> [1] "character"

x <- c(T, TRUE, FALSE, F)
typeof(x)
#> [1] "logical"
class(x)
#> [1] "logical"


x <- matrix(1L, nrow=2, ncol = 3)
typeof(x)
#> [1] "integer"
class(x)
#> [1] "matrix" "array"

x <- matrix(1.3, nrow=2, ncol = 3)
typeof(x)
#> [1] "double"
class(x)
#> [1] "matrix" "array"

x <- matrix("az", nrow=2,ncol=3)
typeof(x)
#> [1] "character"
class(x)
#> [1] "matrix" "array"

x <- factor(c("D", "D", "ND"), level=c("ND", "D", "ED"))
typeof(x)
#> [1] "integer"
class(x)
#> [1] "factor"

x <- list(A='Pék', B=1:2)
typeof(x)
#> [1] "list"
class(x)
#> [1] "list"

x <- data.frame(nev=c("a", "b"), pont=c(11, 9))
typeof(x)
#> [1] "list"
class(x)
#> [1] "data.frame"
```


## Megoldások az \@ref(az-r-nyelv-5-exercise) feladatokhoz {#az-r-nyelv-5-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Hozzuk létre a következő numerikus vektort: 12, 14, 17.
</div>\EndKnitrBlock{rmdexercise}



```r
x <- c(12, 14, 17)
x
#> [1] 12 14 17
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 3
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. Hozzuk létre a következő karakteres vektort: "Vác", "Eger", "Pécs".
</div>\EndKnitrBlock{rmdexercise}




```r
x <- c("Vác", "Eger", "Pécs")
x
#> [1] "Vác"  "Eger" "Pécs"
typeof(x)
#> [1] "character"
class(x)
#> [1] "character"
length(x)
#> [1] 3
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
3. Hozzuk létre a következő logikai vektort: TRUE, FALSE, FALSE.
</div>\EndKnitrBlock{rmdexercise}



```r
x <- c(T, F, F)
x
#> [1]  TRUE FALSE FALSE
typeof(x)
#> [1] "logical"
class(x)
#> [1] "logical"
length(x)
#> [1] 3
```



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
4. Hozzuk létre egy számtani sorozat egymást követő elemeit, ahol az első elem 8, az utolsó 102 és a különbség 1.
</div>\EndKnitrBlock{rmdexercise}



```r
x <- 8:102
x
#>  [1]   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26
#> [20]  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45
#> [39]  46  47  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63  64
#> [58]  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83
#> [77]  84  85  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100 101 102
typeof(x)
#> [1] "integer"
class(x)
#> [1] "integer"
length(x)
#> [1] 95
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
5. Hozzuk létre egy számtani sorozat egymást követő elemeit, ahol az első elem 102, az utolsó 8 és a különbség -1.
</div>\EndKnitrBlock{rmdexercise}



```r
x <- 102:8
x
#>  [1] 102 101 100  99  98  97  96  95  94  93  92  91  90  89  88  87  86  85  84
#> [20]  83  82  81  80  79  78  77  76  75  74  73  72  71  70  69  68  67  66  65
#> [39]  64  63  62  61  60  59  58  57  56  55  54  53  52  51  50  49  48  47  46
#> [58]  45  44  43  42  41  40  39  38  37  36  35  34  33  32  31  30  29  28  27
#> [77]  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10   9   8
typeof(x)
#> [1] "integer"
class(x)
#> [1] "integer"
length(x)
#> [1] 95
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
6. Hozzuk létre egy számtani sorozat egymást követő elemeit, ahol az első elem 8, az utolsó 102 és a különbség 2.
</div>\EndKnitrBlock{rmdexercise}


```r
x <- seq(from=8, to=102, by=2)
x
#>  [1]   8  10  12  14  16  18  20  22  24  26  28  30  32  34  36  38  40  42  44
#> [20]  46  48  50  52  54  56  58  60  62  64  66  68  70  72  74  76  78  80  82
#> [39]  84  86  88  90  92  94  96  98 100 102
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 48
```



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
7. Hozzuk létre egy számtani sorozat egymást követő elemeit, ahol az első elem 8, a különbség 3 és a vektor 25 elemű.
</div>\EndKnitrBlock{rmdexercise}



```r
x <- seq(from=8, by=3, length.out=25)
x
#>  [1]  8 11 14 17 20 23 26 29 32 35 38 41 44 47 50 53 56 59 62 65 68 71 74 77 80
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 25
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
8. Hozzuk létre azt a numerikus vektort, amely 12 elemű, és minden elemének -2 az értéke!
</div>\EndKnitrBlock{rmdexercise}



```r
x <- rep(-2, times=12)
x
#>  [1] -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 12
```
  
  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
9. Hozzuk létre azt a karakteres vektort, amely 7 elemű, és minden elemének "Péntek" az értéke!
  </div>\EndKnitrBlock{rmdexercise}



```r
x <- rep("Péntek", times=7)
x
#> [1] "Péntek" "Péntek" "Péntek" "Péntek" "Péntek" "Péntek" "Péntek"
typeof(x)
#> [1] "character"
class(x)
#> [1] "character"
length(x)
#> [1] 7
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
  
10. Hozzuk létre azt a logikai vektort, amely 7 elemű, és minden elemének TRUE az értéke!
  </div>\EndKnitrBlock{rmdexercise}



```r
x <- rep(T, times=7)
x
#> [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE
typeof(x)
#> [1] "logical"
class(x)
#> [1] "logical"
length(x)
#> [1] 7
```

  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
11. Hozzuk létre azt a numerikus vektort, amely a 2, 3, 5 elemeket háromszor egymás után megismétli! Hány elemű az így létrejött vektor?
  </div>\EndKnitrBlock{rmdexercise}


```r
x <- rep(c(2, 3, 5), times=3)
x
#> [1] 2 3 5 2 3 5 2 3 5
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 9
```
  
  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
12. Hozzuk létre azt a numerikus vektort, amely a 2, 3, 5 elemeket háromszor helyben megismétli! Hány elemű az így létrejött vektor?
  </div>\EndKnitrBlock{rmdexercise}



```r
x <- rep(c(2, 3, 5), each=3)
x
#> [1] 2 2 2 3 3 3 5 5 5
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 9
```
  
  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
13. Hozzuk létre azt a numerikus vektort, amely a 2, 3, 5 elemeket helyben megismétli úgy, hogy a 2-őt 4-szer, a 3-at 5-ször és az 5-öt 7-szer ismétli meg! Hány elemű az így létrejött vektor?
</div>\EndKnitrBlock{rmdexercise}



```r
x <- rep(c(2, 3, 5), times=c(4, 5, 7))
x
#>  [1] 2 2 2 2 3 3 3 3 3 5 5 5 5 5 5 5
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 16
```



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
14. Szabályos vektorok létrehozásának van egy korábban még nem említett módja: a `sequence()` függvény. Ismerjük meg a súgóból ezt a függvényt, és értelmezzük a `sequence(4)` és `sequence(c(4,5))` függvényhívásokat!
</div>\EndKnitrBlock{rmdexercise}
  


```r
x <- sequence(4)       # 1:4 vektor
x
#> [1] 1 2 3 4
typeof(x)
#> [1] "integer"
class(x)
#> [1] "integer"
length(x)
#> [1] 4
x <- sequence(c(4,5)) # c(1:4, 1:5) vektor
x
#> [1] 1 2 3 4 1 2 3 4 5
typeof(x)
#> [1] "integer"
class(x)
#> [1] "integer"
length(x)
#> [1] 9
```

  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
15. Vektorok létrehozásának számos módját megismertük ebben a fejezetben, de elemek megadása nélkül, vagy akár nulla hosszúsággal is létrehozhatunk vektort. A `double()`, `integer()`, `character()` és `logical()` függvények közvetlenül az adott típusnak megfelelő vektort hozzák létre. A súgó tanulmányozásával állítsunk elő 0 és 10 elemű vektor objektumokat mind a négy típus esetén.
</div>\EndKnitrBlock{rmdexercise}



```r
x <- double()
x
#> numeric(0)
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 0
x <- double(10)
x
#>  [1] 0 0 0 0 0 0 0 0 0 0
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 10
x <- integer()
x
#> integer(0)
typeof(x)
#> [1] "integer"
class(x)
#> [1] "integer"
length(x)
#> [1] 0
x <- integer(10)
x
#>  [1] 0 0 0 0 0 0 0 0 0 0
typeof(x)
#> [1] "integer"
class(x)
#> [1] "integer"
length(x)
#> [1] 10
x <- character()
x
#> character(0)
typeof(x)
#> [1] "character"
class(x)
#> [1] "character"
length(x)
#> [1] 0
x <- character(10)
x
#>  [1] "" "" "" "" "" "" "" "" "" ""
typeof(x)
#> [1] "character"
class(x)
#> [1] "character"
length(x)
#> [1] 10
x <- logical()
x
#> logical(0)
typeof(x)
#> [1] "logical"
class(x)
#> [1] "logical"
length(x)
#> [1] 0
x <- logical(10)
x
#>  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
typeof(x)
#> [1] "logical"
class(x)
#> [1] "logical"
length(x)
#> [1] 10
```



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
16. Próbáljuk ki az \@ref(tab:statfuggvenyek). táblázatban szereplő példákat.
</div>\EndKnitrBlock{rmdexercise}



```r
max(1:10)
#> [1] 10
min(11:20)
#> [1] 11
sum(1:5)
#> [1] 15
prod(1:5)
#> [1] 120
mean(1:10)
#> [1] 5.5
median(1:10)
#> [1] 5.5
range(1:10)
#> [1]  1 10
sd(1:10)
#> [1] 3.02765
var(1:10)
#> [1] 9.166667
cor(1:10,11:20)
#> [1] 1
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
17. Hozzuk létre a `'Peti'=5, 'Bori'=NA, 'Éva'=3, 'Pál'=NA, 'Gergő'=5, 'Ili'=4` adatokat tartalmazó vektort, majd rendezzük, indexeljük az első és az utolsó elemét, válogassuk le az 5-ös értékeket, csökkentsük mindegyik értéket 1-gyel, csak az 5-öket csökkentsük 1-gyel.
</div>\EndKnitrBlock{rmdexercise}



```r
x <- c('Peti'=5, 'Bori'=NA, 'Éva'=3, 'Pál'=NA, 'Gergő'=5, 'Ili'=4)
x
#>  Peti  Bori   Éva   Pál Gergő   Ili 
#>     5    NA     3    NA     5     4
sort(x)                 # rendezések
#>   Éva   Ili  Peti Gergő 
#>     3     4     5     5
sort(x, decreasing = T)
#>  Peti Gergő   Ili   Éva 
#>     5     5     4     3
x[order(x)]
#>   Éva   Ili  Peti Gergő  Bori   Pál 
#>     3     4     5     5    NA    NA
x[order(x, decreasing = T)]
#>  Peti Gergő   Ili   Éva  Bori   Pál 
#>     5     5     4     3    NA    NA
x[c(1, length(x))]      # az első és utolsó elem
#> Peti  Ili 
#>    5    4
x[x == 5]               # szűrés
#>  Peti  <NA>  <NA> Gergő 
#>     5    NA    NA     5
x[x %in% 5]             # szűrés (használjuk == helyett a %in% operátort)
#>  Peti Gergő 
#>     5     5
y <- x - 1              # mindegyik értéket csökkentjük 1-gyel, új vektorban
y
#>  Peti  Bori   Éva   Pál Gergő   Ili 
#>     4    NA     2    NA     4     3
z <- x                  # 5-öket csökkentjük 1-gyel, új vektorban
z[z %in% 5 & !is.na(z)] <- z[z %in% 5 & !is.na(z)] - 1                         
z
#>  Peti  Bori   Éva   Pál Gergő   Ili 
#>     4    NA     3    NA     4     4
```


## Megoldások az \@ref(az-r-nyelv-6-exercise) feladatokhoz {#az-r-nyelv-6-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Hozzunk létre egy csupa 1-ből álló mátrixot, amelynek 3 sora és 2 oszlopa van!
  </div>\EndKnitrBlock{rmdexercise}
  


```r
x <- matrix(1, nrow=3, ncol=2)
x
#>      [,1] [,2]
#> [1,]    1    1
#> [2,]    1    1
#> [3,]    1    1
typeof(x)
#> [1] "double"
class(x)
#> [1] "matrix" "array"
length(x)
#> [1] 6
```
  

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. Hozzunk létre egy 3 $\times$ 4-es karakteres mátrixot, amely 12 különbüző keresztnevet tartalmaz!
</div>\EndKnitrBlock{rmdexercise}



```r
nevek <- c("Ibrahim", "Ibrány", "Idrisz", "Ignác",
           "Igor", "Iláj", "Ilán", "Ilárion",
           "Ildár", "Ildefonz", "Ilián", "Iliász")
x <- matrix(nevek, nrow=3, ncol=4, byrow=T)
x
#>      [,1]      [,2]       [,3]     [,4]     
#> [1,] "Ibrahim" "Ibrány"   "Idrisz" "Ignác"  
#> [2,] "Igor"    "Iláj"     "Ilán"   "Ilárion"
#> [3,] "Ildár"   "Ildefonz" "Ilián"  "Iliász"
typeof(x)
#> [1] "character"
class(x)
#> [1] "matrix" "array"
length(x)
#> [1] 12
```

  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
3. Hozzunk létre egy 3 $\times$ 4-es logikai mátrixot, amelynek 1. és 3. sora `TURE` a 2. sora pedig `FALSE` értékeket tartalmaz!
</div>\EndKnitrBlock{rmdexercise}


```r
x <- matrix(c(T, F, T), nrow=3, ncol=4, byrow=F)
x
#>       [,1]  [,2]  [,3]  [,4]
#> [1,]  TRUE  TRUE  TRUE  TRUE
#> [2,] FALSE FALSE FALSE FALSE
#> [3,]  TRUE  TRUE  TRUE  TRUE
typeof(x)
#> [1] "logical"
class(x)
#> [1] "matrix" "array"
length(x)
#> [1] 12
```

    
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
4. Mátrixok indexelésére olyan speciális indexmátrix is használható, amelynek két oszlopa van, és az elérendő elemek sor- és oszlopkoordinátáit tartalmazza. Mutassunk példát erre a `mátrix[indexmátrix]` alakú mátrixindexelésre!
</div>\EndKnitrBlock{rmdexercise}


```r
x <- matrix(1:12, nrow=3, ncol=4, byrow=F)
x
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    4    7   10
#> [2,]    2    5    8   11
#> [3,]    3    6    9   12
typeof(x)
#> [1] "integer"
class(x)
#> [1] "matrix" "array"
length(x)
#> [1] 12

im <- rbind(c(2,1), c(2,2)) # indexmátrix
im
#>      [,1] [,2]
#> [1,]    2    1
#> [2,]    2    2
typeof(im)
#> [1] "double"
class(im)
#> [1] "matrix" "array"
length(im)
#> [1] 4
x[im]         # mátrix indexelése indexmátrix-szal
#> [1] 2 5
x[2, c(1,2)]  # mátrix hagyományos indexelése
#> [1] 2 5
```


## Megoldások az \@ref(az-r-nyelv-7-exercise) feladatokhoz {#az-r-nyelv-7-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Hozzuk létre azt a karakteres vektort, amely a férfi, nő karakteres konstansokat, úgy helyezi el egymás mellett, hogy a 7 darab férfi érték után 13 db nő címke következik! Hány elemű az így létrejött vektor?
  </div>\EndKnitrBlock{rmdexercise}


```r
x <- rep(c("férfi", "nő"), times=c(7, 13))
x
#>  [1] "férfi" "férfi" "férfi" "férfi" "férfi" "férfi" "férfi" "nő"    "nő"   
#> [10] "nő"    "nő"    "nő"    "nő"    "nő"    "nő"    "nő"    "nő"    "nő"   
#> [19] "nő"    "nő"
typeof(x)
#> [1] "character"
class(x)
#> [1] "character"
length(x)
#> [1] 20

x.f <- factor(x, levels=c("férfi", "nő"))
x.f
#>  [1] férfi férfi férfi férfi férfi férfi férfi nő    nő    nő    nő    nő   
#> [13] nő    nő    nő    nő    nő    nő    nő    nő   
#> Levels: férfi nő
typeof(x.f)
#> [1] "integer"
class(x.f)
#> [1] "factor"
length(x.f)
#> [1] 20
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. Egy vizsgálatban az első 10 személy neme férfi, a többi 8 neme nő volt. Hozzuk létre azt a faktort, amely leírja a neme változót!
  </div>\EndKnitrBlock{rmdexercise}



```r
x <- rep(c("férfi", "nő"), times=c(10, 8))
x
#>  [1] "férfi" "férfi" "férfi" "férfi" "férfi" "férfi" "férfi" "férfi" "férfi"
#> [10] "férfi" "nő"    "nő"    "nő"    "nő"    "nő"    "nő"    "nő"    "nő"
typeof(x)
#> [1] "character"
class(x)
#> [1] "character"
length(x)
#> [1] 18

x.f <- factor(x, levels=c("férfi", "nő"))
x.f
#>  [1] férfi férfi férfi férfi férfi férfi férfi férfi férfi férfi nő    nő   
#> [13] nő    nő    nő    nő    nő    nő   
#> Levels: férfi nő
typeof(x.f)
#> [1] "integer"
class(x.f)
#> [1] "factor"
length(x.f)
#> [1] 18
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
3. Egy vizsgálatban városi ("V") és falusi ("F") fiatalok vettek részt! A megkérdezettek településtípusa rendre a következő volt: F, F, V, F, V, V, V, F. Hozzuk létre azt a faktort, amely leírja a településtípus változót!
</div>\EndKnitrBlock{rmdexercise}



```r
x <- c("F", "F", "V", "F", "V", "V", "V", "F")
x
#> [1] "F" "F" "V" "F" "V" "V" "V" "F"
typeof(x)
#> [1] "character"
class(x)
#> [1] "character"
length(x)
#> [1] 8

x.f <- factor(x, levels=c("F", "V"))
x.f
#> [1] F F V F V V V F
#> Levels: F V
typeof(x.f)
#> [1] "integer"
class(x.f)
#> [1] "factor"
length(x.f)
#> [1] 8
```


  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
4. Egy vizsgálatban a dohányzási szokást egy kétértékű skálán mérték: 0-nem dohányzik; 1-dohányzik. A megkérdezettek dohányzási szokása a következő volt: 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0. Hozzuk létre azt a faktort, amely leírja a dohányzási szokás változót!

</div>\EndKnitrBlock{rmdexercise}



```r
x <- c(0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
x
#>  [1] 0 0 1 0 1 0 1 0 1 0 1 0
typeof(x)
#> [1] "double"
class(x)
#> [1] "numeric"
length(x)
#> [1] 12

x.f <- factor(x, levels=c("0", "1"), 
                 labels = c("nem dohányzik", "dohányzik"))
x.f
#>  [1] nem dohányzik nem dohányzik dohányzik     nem dohányzik dohányzik    
#>  [6] nem dohányzik dohányzik     nem dohányzik dohányzik     nem dohányzik
#> [11] dohányzik     nem dohányzik
#> Levels: nem dohányzik dohányzik
typeof(x.f)
#> [1] "integer"
class(x.f)
#> [1] "factor"
length(x.f)
#> [1] 12
```


## Megoldások az \@ref(az-r-nyelv-8-exercise) feladatokhoz {#az-r-nyelv-8-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Hozzunk létre egy háromelemű listát a TRUE, 12, és "Verseny" konstansokból!
  </div>\EndKnitrBlock{rmdexercise}



```r
lista <- list(T, 12, "Verseny")
lista
#> [[1]]
#> [1] TRUE
#> 
#> [[2]]
#> [1] 12
#> 
#> [[3]]
#> [1] "Verseny"
typeof(lista)
#> [1] "list"
class(lista)
#> [1] "list"
length(lista)
#> [1] 3
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. Hozzunk létre egy háromelemű listát a TRUE, 12, és "Verseny" konstansokból, de gondoskodjunk az egyes elemek elnevezéséről, amelyek legyenek rendre: "befejezve", "indulok" és "leiras"!
  </div>\EndKnitrBlock{rmdexercise}



```r
lista <- list("befejezve"=T, "indulok"=12, "leiras"="Verseny")
lista
#> $befejezve
#> [1] TRUE
#> 
#> $indulok
#> [1] 12
#> 
#> $leiras
#> [1] "Verseny"
typeof(lista)
#> [1] "list"
class(lista)
#> [1] "list"
length(lista)
#> [1] 3
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
3. Hozzunk létre egy háromelemű listát a TRUE, 12 és "Verseny" konstansokból, valamint az induló versenyzők végső pontszámaiból, amelyek rendre: 89, 78, 23, 67, 99, 69, 85, 77, 58, 72, 48, 81. Gondoskodjunk az egyes elemek elnevezéséről, amelyek legyenek rendre: "befejezve", "indulok", "leiras" és "pontszam"!
</div>\EndKnitrBlock{rmdexercise}



```r
lista <- list("befejezve"=T, "indulok"=12, "leiras"="Verseny",
              pontszam=c(89, 78, 23, 67, 99, 69, 85, 77, 58, 72, 48, 81))
lista
#> $befejezve
#> [1] TRUE
#> 
#> $indulok
#> [1] 12
#> 
#> $leiras
#> [1] "Verseny"
#> 
#> $pontszam
#>  [1] 89 78 23 67 99 69 85 77 58 72 48 81
typeof(lista)
#> [1] "list"
class(lista)
#> [1] "list"
length(lista)
#> [1] 4
```


## Megoldások az \@ref(az-r-nyelv-9-exercise) feladatokhoz {#az-r-nyelv-9-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Hozzunk létre egy 30 $\times$ 3-as adattáblát, `csoport`, `matematika` és `magyar` oszlopnevekkel. A `csoport` változó legyen egy `5.a`, `5.b` és `5.c` címkéket tetszőleges sorrendben tartalmazó faktor, a `matematika` és a `magyar` pedig 1-5 osztályzatokat tartalmazó numerikus vektor.
</div>\EndKnitrBlock{rmdexercise}



```r
df <- data.frame(
  csoport=factor(rep(c("5.a", "5.b", "5.c"), times=10)),
  matematika=sample(x = 1:5, size = 30, replace = T),
  magyar=sample(x = 1:5, size = 30, replace = T)
)
df
#>    csoport matematika magyar
#> 1      5.a          3      2
#> 2      5.b          1      1
#> 3      5.c          5      4
#> 4      5.a          1      5
#> 5      5.b          2      4
#> 6      5.c          1      2
#> 7      5.a          4      3
#> 8      5.b          5      1
#> 9      5.c          1      4
#> 10     5.a          2      3
#> 11     5.b          2      2
#> 12     5.c          1      1
#> 13     5.a          4      5
#> 14     5.b          1      4
#> 15     5.c          4      1
#> 16     5.a          4      2
#> 17     5.b          4      4
#> 18     5.c          5      1
#> 19     5.a          3      4
#> 20     5.b          5      4
#> 21     5.c          2      5
#> 22     5.a          1      2
#> 23     5.b          2      3
#> 24     5.c          3      1
#> 25     5.a          4      1
#> 26     5.b          3      4
#> 27     5.c          3      1
#> 28     5.a          3      2
#> 29     5.b          1      4
#> 30     5.c          1      4
str(df)
#> 'data.frame':	30 obs. of  3 variables:
#>  $ csoport   : Factor w/ 3 levels "5.a","5.b","5.c": 1 2 3 1 2 3 1 2 3 1 ...
#>  $ matematika: int  3 1 5 1 2 1 4 5 1 2 ...
#>  $ magyar    : int  2 1 4 5 4 2 3 1 4 3 ...
typeof(df)
#> [1] "list"
class(df)
#> [1] "data.frame"
length(df)
#> [1] 3
```



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. Írassuk ki a **MASS** csomag `survey` adattáblájának 3. sorában az 5. oszlopban lévő értéket!
</div>\EndKnitrBlock{rmdexercise}



```r
library(MASS)
survey[3, 5]
#> [1] L on R
#> Levels: L on R Neither R on L
```
  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
3. Írassuk ki a **MASS** csomag `survey` adattáblájának 3. és 6. sorában sorában az 5. oszlopban lévő értékeket! Az adattábla típus maradjon meg!
</div>\EndKnitrBlock{rmdexercise}
  


```r
library(MASS)
survey[c(3, 6), 5, drop=F]
#>     Fold
#> 3 L on R
#> 6 L on R
```
  

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
4. Írassuk ki a **MASS** csomag `survey` adattáblájának 3. és 6. sorából az összes adatértéket!
</div>\EndKnitrBlock{rmdexercise}



```r
library(MASS)
survey[c(3, 6), ]
#>      Sex Wr.Hnd NW.Hnd W.Hnd   Fold Pulse    Clap Exer Smoke Height      M.I
#> 3   Male     18   13.3 Right L on R    87 Neither None Occas     NA     <NA>
#> 6 Female     18   17.7 Right L on R    64   Right Some Never 172.72 Imperial
#>      Age
#> 3 16.917
#> 6 21.000
```

  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
5. Írassuk ki a **MASS** csomag `survey` adattábla `Pulse` oszlopát háromféle módszerrel! 
</div>\EndKnitrBlock{rmdexercise}



```r
data(survey, package = "MASS") # a `survey` beolvasása
str(survey)
#> 'data.frame':	237 obs. of  12 variables:
#>  $ Sex   : Factor w/ 2 levels "Female","Male": 1 2 2 2 2 1 2 1 2 2 ...
#>  $ Wr.Hnd: num  18.5 19.5 18 18.8 20 18 17.7 17 20 18.5 ...
#>  $ NW.Hnd: num  18 20.5 13.3 18.9 20 17.7 17.7 17.3 19.5 18.5 ...
#>  $ W.Hnd : Factor w/ 2 levels "Left","Right": 2 1 2 2 2 2 2 2 2 2 ...
#>  $ Fold  : Factor w/ 3 levels "L on R","Neither",..: 3 3 1 3 2 1 1 3 3 3 ...
#>  $ Pulse : int  92 104 87 NA 35 64 83 74 72 90 ...
#>  $ Clap  : Factor w/ 3 levels "Left","Neither",..: 1 1 2 2 3 3 3 3 3 3 ...
#>  $ Exer  : Factor w/ 3 levels "Freq","None",..: 3 2 2 2 3 3 1 1 3 3 ...
#>  $ Smoke : Factor w/ 4 levels "Heavy","Never",..: 2 4 3 2 2 2 2 2 2 2 ...
#>  $ Height: num  173 178 NA 160 165 ...
#>  $ M.I   : Factor w/ 2 levels "Imperial","Metric": 2 1 NA 2 2 1 1 2 2 2 ...
#>  $ Age   : num  18.2 17.6 16.9 20.3 23.7 ...
survey[, 6]       # 1. módszer
#>   [1]  92 104  87  NA  35  64  83  74  72  90  80  68  NA  66  60  NA  89  74
#>  [19]  NA  78  72  72  64  62  64  90  90  62  76  79  76  78  72  70  54  66
#>  [37]  NA  72  80  NA  NA  72  60  80  70  NA  84  96  60  50  55  68  78  56
#>  [55]  65  NA  70  72  62  NA  66  72  70  NA  64  NA  NA  64  NA  80  64  NA
#>  [73]  68  40  88  68  76  NA  68  NA  66  76  98  NA  90  76  70  75  60  92
#>  [91]  75  NA  70  NA  65  NA  68  60  NA  68  NA  60  NA  72  80  80  NA  85
#> [109]  64  67  76  80  75  60  60  70  70  83 100 100  80  76  92  59  66  NA
#> [127]  68  66  74  90  86  60  86  80  85  90  73  72  NA  68  84  NA  65  96
#> [145]  68  75  64  60  92  64  76  80  92  69  68  76  NA  74  NA  84  80  NA
#> [163]  72  60  NA  81  70  65  NA  72  NA  80  50  48  68 104  76  84  NA  70
#> [181]  68  87  79  70  90  72  79  65  62  63  92  60  68  72  NA  76  80  71
#> [199]  80  80  61  48  76  86  80  83  76  84  97  NA  74  83  78  65  68  NA
#> [217]  NA  88  NA  75  NA  70  88  NA  NA  96  80  68  70  71  80  NA  85  88
#> [235]  NA  90  85
survey[, "Pulse"] # 2. módszer
#>   [1]  92 104  87  NA  35  64  83  74  72  90  80  68  NA  66  60  NA  89  74
#>  [19]  NA  78  72  72  64  62  64  90  90  62  76  79  76  78  72  70  54  66
#>  [37]  NA  72  80  NA  NA  72  60  80  70  NA  84  96  60  50  55  68  78  56
#>  [55]  65  NA  70  72  62  NA  66  72  70  NA  64  NA  NA  64  NA  80  64  NA
#>  [73]  68  40  88  68  76  NA  68  NA  66  76  98  NA  90  76  70  75  60  92
#>  [91]  75  NA  70  NA  65  NA  68  60  NA  68  NA  60  NA  72  80  80  NA  85
#> [109]  64  67  76  80  75  60  60  70  70  83 100 100  80  76  92  59  66  NA
#> [127]  68  66  74  90  86  60  86  80  85  90  73  72  NA  68  84  NA  65  96
#> [145]  68  75  64  60  92  64  76  80  92  69  68  76  NA  74  NA  84  80  NA
#> [163]  72  60  NA  81  70  65  NA  72  NA  80  50  48  68 104  76  84  NA  70
#> [181]  68  87  79  70  90  72  79  65  62  63  92  60  68  72  NA  76  80  71
#> [199]  80  80  61  48  76  86  80  83  76  84  97  NA  74  83  78  65  68  NA
#> [217]  NA  88  NA  75  NA  70  88  NA  NA  96  80  68  70  71  80  NA  85  88
#> [235]  NA  90  85
survey$Pulse      # 3. módszer
#>   [1]  92 104  87  NA  35  64  83  74  72  90  80  68  NA  66  60  NA  89  74
#>  [19]  NA  78  72  72  64  62  64  90  90  62  76  79  76  78  72  70  54  66
#>  [37]  NA  72  80  NA  NA  72  60  80  70  NA  84  96  60  50  55  68  78  56
#>  [55]  65  NA  70  72  62  NA  66  72  70  NA  64  NA  NA  64  NA  80  64  NA
#>  [73]  68  40  88  68  76  NA  68  NA  66  76  98  NA  90  76  70  75  60  92
#>  [91]  75  NA  70  NA  65  NA  68  60  NA  68  NA  60  NA  72  80  80  NA  85
#> [109]  64  67  76  80  75  60  60  70  70  83 100 100  80  76  92  59  66  NA
#> [127]  68  66  74  90  86  60  86  80  85  90  73  72  NA  68  84  NA  65  96
#> [145]  68  75  64  60  92  64  76  80  92  69  68  76  NA  74  NA  84  80  NA
#> [163]  72  60  NA  81  70  65  NA  72  NA  80  50  48  68 104  76  84  NA  70
#> [181]  68  87  79  70  90  72  79  65  62  63  92  60  68  72  NA  76  80  71
#> [199]  80  80  61  48  76  86  80  83  76  84  97  NA  74  83  78  65  68  NA
#> [217]  NA  88  NA  75  NA  70  88  NA  NA  96  80  68  70  71  80  NA  85  88
#> [235]  NA  90  85
```

  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
6. Írassuk ki a **MASS** csomag `survey` adattábla `Pulse` változójának első 3 elemét háromféle módszerrel!
  </div>\EndKnitrBlock{rmdexercise}


```r
data(survey, package = "MASS") # a `survey` beolvasása
str(survey)
#> 'data.frame':	237 obs. of  12 variables:
#>  $ Sex   : Factor w/ 2 levels "Female","Male": 1 2 2 2 2 1 2 1 2 2 ...
#>  $ Wr.Hnd: num  18.5 19.5 18 18.8 20 18 17.7 17 20 18.5 ...
#>  $ NW.Hnd: num  18 20.5 13.3 18.9 20 17.7 17.7 17.3 19.5 18.5 ...
#>  $ W.Hnd : Factor w/ 2 levels "Left","Right": 2 1 2 2 2 2 2 2 2 2 ...
#>  $ Fold  : Factor w/ 3 levels "L on R","Neither",..: 3 3 1 3 2 1 1 3 3 3 ...
#>  $ Pulse : int  92 104 87 NA 35 64 83 74 72 90 ...
#>  $ Clap  : Factor w/ 3 levels "Left","Neither",..: 1 1 2 2 3 3 3 3 3 3 ...
#>  $ Exer  : Factor w/ 3 levels "Freq","None",..: 3 2 2 2 3 3 1 1 3 3 ...
#>  $ Smoke : Factor w/ 4 levels "Heavy","Never",..: 2 4 3 2 2 2 2 2 2 2 ...
#>  $ Height: num  173 178 NA 160 165 ...
#>  $ M.I   : Factor w/ 2 levels "Imperial","Metric": 2 1 NA 2 2 1 1 2 2 2 ...
#>  $ Age   : num  18.2 17.6 16.9 20.3 23.7 ...
survey[1:3, 6]       # 1. módszer
#> [1]  92 104  87
survey[1:3, "Pulse"] # 2. módszer
#> [1]  92 104  87
survey$Pulse[1:3]    # 3. módszer
#> [1]  92 104  87
```


  
\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
7. A **HSAUR3** csomag `Forbes2000` adattáblája 2000 vállalat adatát tartalmazza! Határozzuk meg a magyar cégek nevét és helyezését (`country` oszlop alapján)! Írassuk ki a képernyőre a 10 legnagyobb piaci értékkel (`marketvalue` oszlop) rendelkező cég nevét és piaci értékét! Határozzuk meg a legkisebb profittal (`profits` oszlop) rendelkező 5 cég minden adatát! Határozzuk meg a legnagyobb profittal (`profits` oszlop) rendelkező 10 amerikai vagy japán cég nevét, országát és profitját!  
  
  </div>\EndKnitrBlock{rmdexercise}


```r
# install.packages("HSAUR3")
library(HSAUR3)
str(Forbes2000)
#> 'data.frame':	2000 obs. of  8 variables:
#>  $ rank       : int  1 2 3 4 5 6 7 8 9 10 ...
#>  $ name       : chr  "Citigroup" "General Electric" "American Intl Group" "ExxonMobil" ...
#>  $ country    : Factor w/ 61 levels "Africa","Australia",..: 60 60 60 60 56 60 56 28 60 60 ...
#>  $ category   : Factor w/ 27 levels "Aerospace & defense",..: 2 6 16 19 19 2 2 8 9 20 ...
#>  $ sales      : num  94.7 134.2 76.7 222.9 232.6 ...
#>  $ profits    : num  17.85 15.59 6.46 20.96 10.27 ...
#>  $ assets     : num  1264 627 648 167 178 ...
#>  $ marketvalue: num  255 329 195 277 174 ...
# a magyar cégek neve és helyezése
Forbes2000[Forbes2000$country=="Hungary",c("rank","name")]
#>      rank     name
#> 994   994 OTP Bank
#> 1002 1002      MOL
# a 10 legnagyobb piaci értékkel rendelkező cég neve és piaci értéke
Forbes2000[order(Forbes2000$marketvalue, decreasing=T)[1:10],
           c("name", "marketvalue")]
#>                    name marketvalue
#> 2      General Electric      328.54
#> 31            Microsoft      287.02
#> 24               Pfizer      285.27
#> 4            ExxonMobil      277.02
#> 1             Citigroup      255.30
#> 10      Wal-Mart Stores      243.74
#> 58                Intel      196.87
#> 3   American Intl Group      194.87
#> 7            HSBC Group      177.96
#> 354            Vodafone      174.61
# a legkisebb profittal rendelkező 5 cég minden adata
Forbes2000[order(Forbes2000$profits)[1:5],]
#>     rank             name        country                    category sales
#> 364  364 Deutsche Telekom        Germany Telecommunications services 56.40
#> 374  374   France Telecom         France Telecommunications services 57.99
#> 403  403 Mizuho Financial          Japan                     Banking 24.40
#> 687  687             mmO2 United Kingdom Telecommunications services  7.70
#> 354  354         Vodafone United Kingdom Telecommunications services 47.99
#>     profits  assets marketvalue
#> 364  -25.83  132.01       84.18
#> 374  -21.78  107.86       64.36
#> 403  -20.11 1115.90       30.87
#> 687  -16.03   21.12       14.69
#> 354  -15.51  256.28      174.61
# a legnagyobb profittal rendelkező 10 amerikai vagy japán cég neve, országa és profitja
Forbes2000.USA.Japan <- Forbes2000[Forbes2000$country == "United States" |
                                     Forbes2000$country == "Japan",]
Forbes2000.USA.Japan[order(Forbes2000.USA.Japan$profits,decreasing=T)[1:10],
                     c("name","country","profits")]
#>                name       country profits
#> 4        ExxonMobil United States   20.96
#> 1         Citigroup United States   17.85
#> 2  General Electric United States   15.59
#> 6   Bank of America United States   10.81
#> 20      Freddie Mac United States   10.09
#> 22     Altria Group United States    9.20
#> 10  Wal-Mart Stores United States    9.05
#> 31        Microsoft United States    8.88
#> 8      Toyota Motor         Japan    7.99
#> 16              IBM United States    7.58
```


## Megoldások az \@ref(az-r-nyelv-12-exercise) feladatokhoz {#az-r-nyelv-12-exercise-solution}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Konvertáljuk dátummá a következő két sztringet: `"6November2020"`, `"2013-02-29"`! Utóbbi esetben mi lehet a hiba oka?
  </div>\EndKnitrBlock{rmdexercise}



```r
as.Date("6November2020","%d%B%Y")  # ez rendben van
#> [1] "2020-11-06"
# as.Date("2013-02-29")            # nem létező dátum !!!
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. A `seq()` függvény `from=` és `to=` argumentuma a dátum típusú objektumokkal is működik. A `by=` argumentum értéke ilyenkor lehet numerikus (ekkor napokat jelent), de lehet `x weeks`, `x months` vagy `x years`, ahol `x` nullánál nagyobb egész lehet. Hozzunk létre egy dátum-vektort 2020 összes hétfőjének dátumával! 
</div>\EndKnitrBlock{rmdexercise}



```r
d1 <- as.Date("2020-01-06")
d2 <- as.Date("2020-12-28")
x <- seq(from=d1, to=d2, by="weeks")
x
#>  [1] "2020-01-06" "2020-01-13" "2020-01-20" "2020-01-27" "2020-02-03"
#>  [6] "2020-02-10" "2020-02-17" "2020-02-24" "2020-03-02" "2020-03-09"
#> [11] "2020-03-16" "2020-03-23" "2020-03-30" "2020-04-06" "2020-04-13"
#> [16] "2020-04-20" "2020-04-27" "2020-05-04" "2020-05-11" "2020-05-18"
#> [21] "2020-05-25" "2020-06-01" "2020-06-08" "2020-06-15" "2020-06-22"
#> [26] "2020-06-29" "2020-07-06" "2020-07-13" "2020-07-20" "2020-07-27"
#> [31] "2020-08-03" "2020-08-10" "2020-08-17" "2020-08-24" "2020-08-31"
#> [36] "2020-09-07" "2020-09-14" "2020-09-21" "2020-09-28" "2020-10-05"
#> [41] "2020-10-12" "2020-10-19" "2020-10-26" "2020-11-02" "2020-11-09"
#> [46] "2020-11-16" "2020-11-23" "2020-11-30" "2020-12-07" "2020-12-14"
#> [51] "2020-12-21" "2020-12-28"
typeof(x)
#> [1] "double"
class(x)
#> [1] "Date"
length(x)
#> [1] 52
```




\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
3. A Halley-üstökös utoljára 1986-ban járt a Naprendszerünkben, így az előrejelzések szerint legközelebb 2061. július 26-ban tér vissza. Rögzítsük ezt dátumként, és számoljuk ki, hány napotot kell még várni az üstökös érkezésére.
</div>\EndKnitrBlock{rmdexercise}



```r
as.Date("2061-07-26")-Sys.Date()
#> Time difference of 14257 days
# vagy
as.Date("2061. július 26.", format="%Y. %B %d.")-Sys.Date()
#> Time difference of 14257 days
```


## Megoldások az \@ref(beolvasas-1-exercise) feladatokhoz {#beolvasas-1-exercise-solution}


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Olvassuk be a `https://onlinestatbook.com/2/case_studies/data/leniency.xls` Excel állományt, állapítsuk meg hány sora és oszlopa van.
</div>\EndKnitrBlock{rmdexercise}



```r
library(rio)
df <- import(file = "https://onlinestatbook.com/2/case_studies/data/leniency.xls")
str(df)
#> 'data.frame':	136 obs. of  2 variables:
#>  $ smile   : num  1 1 1 1 1 1 1 1 1 1 ...
#>  $ leniency: num  2.5 5.5 6.5 3.5 3 3.5 6 5 4 4.5 ...
```

Az adatbázisnak 136 sora és 2 oszlopa van.

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
2. Olvassuk be a `https://vincentarelbundock.github.io/Rdatasets/csv/DAAG/socsupport.csv` tagolt szöveges állományt, állapítsuk meg hány sora és oszlopa van.
</div>\EndKnitrBlock{rmdexercise}



```r
library(rio)
df <- read.table(file = "https://vincentarelbundock.github.io/Rdatasets/csv/DAAG/socsupport.csv",
                 header=T, sep=",", dec=".")
str(df)
#> 'data.frame':	95 obs. of  21 variables:
#>  $ X           : int  1 2 3 4 5 6 7 8 9 10 ...
#>  $ gender      : chr  "male" "female" "male" "male" ...
#>  $ age         : chr  "21-24" "21-24" "21-24" "18-20" ...
#>  $ country     : chr  "australia" "australia" "australia" "australia" ...
#>  $ marital     : chr  "other" "single" "single" "single" ...
#>  $ livewith    : chr  "partner" "partner" "residences" "parents" ...
#>  $ employment  : chr  "employed part-time" "parental support" "employed part-time" "employed part-time" ...
#>  $ firstyr     : chr  "other" "other" "other" "first year" ...
#>  $ enrolment   : chr  "full-time" "full-time" "full-time" "full-time" ...
#>  $ emotional   : int  22 21 21 19 16 20 20 20 24 13 ...
#>  $ emotionalsat: int  23 20 18 19 19 17 23 20 25 18 ...
#>  $ tangible    : int  17 12 16 20 11 16 20 16 20 6 ...
#>  $ tangiblesat : int  18 10 16 17 15 15 20 16 20 14 ...
#>  $ affect      : int  15 10 15 11 6 12 14 12 15 6 ...
#>  $ affectsat   : int  15 6 15 11 10 14 15 12 15 12 ...
#>  $ psi         : int  12 9 13 13 11 12 15 12 12 6 ...
#>  $ psisat      : int  13 6 12 12 12 11 15 12 15 11 ...
#>  $ esupport    : int  13 12 14 15 9 13 15 13 16 10 ...
#>  $ psupport    : int  11 7 13 15 7 12 10 11 NA 8 ...
#>  $ supsources  : int  13 10 14 15 9 13 13 11 NA 9 ...
#>  $ BDI         : int  5 8 16 0 9 0 1 14 12 20 ...
```


Az adatbázisnak 95 sora és 21 oszlopa van.


## Megoldások az \@ref(beolvasas-3-exercise) feladatokhoz {#beolvasas-3-exercise-solution}



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1 A `cat()` függvénnyel a `dput()`-hoz hasonlóan szöveges állományba írhatjuk egy karakteres, numerikus vagy logikai vektor értékét. Mindkét függvénnyel végezzük el a kiírást, és vessük össze a kapott szöveges állományok tartalmát!
</div>\EndKnitrBlock{rmdexercise}



```r
# karakteres, numerikus és logikai vektor előkészítése
vekt.1 <- "Helló világ!"
vekt.2 <- c("Péter", "Károly")
vekt.3 <- 1:20
vekt.4 <- c(T, F, T)
# kiírás cat()-tel
cat(vekt.1, vekt.2, vekt.3, vekt.4, 
    file = "output/adat/cat_out.txt", sep="\n")
# kiírás dput()-tal
dput(x = vekt.1, file = "output/adat/dput_1_out.txt")
dput(x = vekt.2, file = "output/adat/dput_2_out.txt")
dput(x = vekt.3, file = "output/adat/dput_3_out.txt")
dput(x = vekt.4, file = "output/adat/dput_4_out.txt")
```

A `cat()` függvénynek igazán nincs jelentősége objektumok értékének megőrzésében (kiírásában és később visszaolvasásában), inkább csak az érdekesség miatt említettük. Láthatjuk, hogy a `cat()` függvénnyel egyetlen szöveges állományban több vektor értékét elhelyezhetjük, és a kutató könnyen áttekinthető ezeket az értékeket. Azonban ezek visszaolvasása már nehézségbe ütközik. A `dput()`-tal kiírt objektumok viszont könnyen visszaolvashatók a `dget()` segítségével. A `cat()` függvénnyel tipikusan a konzolba írunk.



```r
# visszaolvasás dget()-tel
uj.vekt.1 <- dget(file = "output/adat/dput_1_out.txt")
uj.vekt.2 <- dget(file = "output/adat/dput_2_out.txt")
uj.vekt.3 <- dget(file = "output/adat/dput_3_out.txt")
uj.vekt.4 <- dget(file = "output/adat/dput_4_out.txt")
```


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
2. A [Kaggle egyik adatbázisában](https://www.kaggle.com/skateddu/metacritic-games-stats-20112019) 4000 videójáték értékelése található. Töltsük le a CSV adatállományt, és nyissuk meg. Keressük meg az [R-bloggers](https://www.r-bloggers.com) oldalon az adatállományhoz kapcsolódó cikket, és próbáljunk ki néhány elemző parancsot. A blogger melyik csomag, melyik függvényével végezte a beolvasást?
</div>\EndKnitrBlock{rmdexercise}


A blogger a **datatable** `fread()` függvényével olvasta be az adatokat. Mi az *Alap R* `read.table()` függvényét választjuk.


```r
df.meta <- read.table(file = "adat/metacritic_games.csv", header=T, sep=",", dec=".", 
                      quote = "\"", comment.char = "", fileEncoding = "UTF-8")
str(df.meta)
#> 'data.frame':	5699 obs. of  15 variables:
#>  $ game            : chr  "Portal 2" "The Elder Scrolls V: Skyrim" "The Legend of Zelda: Ocarina of Time 3D" "Batman: Arkham City" ...
#>  $ platform        : chr  "PC" "PC" "3DS" "PC" ...
#>  $ developer       : chr  "Valve Software" "Bethesda Game Studios" "GREZZO" "Rocksteady Studios" ...
#>  $ genre           : chr  "Action" "Role-Playing" "Miscellaneous" "Action Adventure" ...
#>  $ number_players  : chr  "" "No Online Multiplayer" "No Online Multiplayer" "" ...
#>  $ rating          : chr  "E10+" "M" "E10+" "T" ...
#>  $ release_date    : chr  "Apr 18, 2011" "Nov 10, 2011" "Jun 19, 2011" "Nov 21, 2011" ...
#>  $ positive_critics: int  51 32 84 27 81 52 31 62 14 60 ...
#>  $ neutral_critics : int  1 0 1 0 1 0 0 0 0 1 ...
#>  $ negative_critics: int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ positive_users  : int  1700 1616 283 240 251 520 34 187 33 1061 ...
#>  $ neutral_users   : int  107 322 20 34 39 112 4 44 8 191 ...
#>  $ negative_users  : int  19 451 5 27 11 78 2 29 10 271 ...
#>  $ metascore       : int  95 94 94 91 90 90 90 90 89 89 ...
#>  $ user_score      : int  90 82 90 87 84 85 83 84 71 76 ...
```



\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
3. Keressük fel és tanulmányozzuk a [Great R packages for data import, wrangling and visualization](https://www.computerworld.com/article/2921176/great-r-packages-for-data-import-wrangling-visualization.html) oldalt! A bevezetésben lefektetett alapelvek közül melyiket erősíti meg ez az oldal? 
</div>\EndKnitrBlock{rmdexercise}

Az oldalon számos lehetőséget találunk adatok beolvasására és kezelésére. Ugyanarra a problémára számos eltérő megoldás van, például egy tagolt szöveges állományt beolvashatjuk a **base**, **tidyr**, **rio** vagy **datatable** csomag megfelelő függvényével is (*Svájci bicska*). Ha átböngésszük az oldalt felfedezhetünk olyan megoldásokat, amelyek kiegészítik az alaptudásunkat (*Magabiztosság*), de egy bizonyos idő után ezek az újdonságok is beépülhetnek a saját eszköztárunkba (*Gyakorlás*).


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
4. Töltsünk le 10 érdekesnek tűnő adatállományt a [19 Places to Find Free Data Sets for Data Science Projects](https://www.dataquest.io/blog/free-datasets-for-projects/) oldalról, és nyissuk meg őket!
  </div>\EndKnitrBlock{rmdexercise}





