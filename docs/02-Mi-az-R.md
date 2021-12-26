# Mi az R? {#mi-az-r} 

<img src="images/ch_02_small.png" width="90%" style="display: block; margin: auto;" />


## Az R bemutatása


<div class="rmdlevel1">
<p>Ebben a fejezetben:</p>
<ul>
<li>megismerjük az R jellemzőit,</li>
<li>megtudjuk, hogy melyek a parancssoros interfész előnyei,</li>
<li>megismerjük az <em>Alap R</em> fogalmát,</li>
<li>körülhatároljuk az R nyelv, az <em>Alap R</em> és a csomag fogalmát.</li>
</ul>
</div>


### Az R jellemzői

Az R egy magas szintű programozási nyelv és környezet, amelynek legfontosabb felhasználása az adatelemzés és az ahhoz kapcsolódó grafikus megjelenítés. Három alapvető jellemzője kiemeli a többi statisztikai programcsomag közül: (1) az R ingyenesen telepíthető és használható; (2) az R nyílt forrású, így bárki hozzájárulhat az R fejlesztéséhez, azaz létrehozhat új *csomag*okat, és ezzel kiegészítheti az R tudását; és (3) az R felhasználók rendkívül aktív és befogadó online közösséget alkotnak, szinte minden felmerülő kérdésünkre hamar választ kaphatunk. 

Álljon itt egy bővített lista azokról a jellemzőkről, amelyek vonzóvá tehetik számunkra az R statisztikai programcsomagot.

* Az R szabad szoftver, bárki ingyenesen letöltheti és használhatja. Ez egyfelől megkönnyíti az oktatási intézmények, tanszékek és oktatók munkáját, hiszen nincs szükség a kereskedelmi programok licenszeléséből adódó pénzügyi vagy más természetű nehézségek kezelésére. Másrészt a hallgatók a statisztika kurzusok során tanultakat otthon vagy később a munkájukban is felhasználhatják.
* Az R platform-független, azaz Windows, Linux és macOS környezetben is használható. Nem kell lemondanunk a kedvenc operációs rendszerünkről, ha az R-t szeretnénk használni.
* Az R egy teljes értékű programozási nyelv, nem csak egy statisztikai programcsomag önmagában.
* Az R statisztikai módszerek szinte végtelen választékát kínálja. A R-ben felhasználható statisztikai eljárásokat statisztikusok fejlesztik folyamatosan és csomagok formájában teszik elérhetővé. Valószínű, hogy egy új statisztikai módszer leghamarabb az R-ben válik elérhetővé.
* Az R rendkívül gazdag grafikus lehetőségekkel rendelkezik.
* A statisztikai szakirodalomban és az egyetemi oktatók körében egyre elterjedtebb az R, mint közös (statisztikai program)nyelv használata. Ha valamilyen statisztikai problémára keressük a megoldást, vagy csak konzultálunk egy statisztikussal, az R ismerete (akár csak olvasási szinten) rendkívüli előnyt jelenthet.
* Az R igen jól dokumentált, a beépített súgón kívül számos könyv és leírás érhető el.
* Az R parancssoros interfésszel rendelkezik, amely számos előnnyel jár. Egyrészt a szkript állományok létrehozása és végrehajtása a statisztikai elemzések megismételhetőségét biztosítják, másrészt ez az oktatók és a hallgatók könnyebb kommunikációját is lehetővé teszi. 
* Az R az adatelemzés eredményének sokszínű publikálását is biztosítja. Az [RMarkdown](https://rmarkdown.rstudio.com/) formanyelv segítségével HTML, PDF és Word dokumentumot, illetve prezentációs diákat vagy akár kész cikkeket hozhatunk létre. A [Shiny](http://shiny.rstudio.com/) csomag interaktív Webes alkalmazások építését teszi lehetővé.
* Mára az R használata szinte egyet jelent az ingyenesen elérhető [*RStudio*](https://www.rstudio.com/) használatával, amely egy kényelmes integrált fejlesztői környezetet biztosít a parancsállományok létrehozásához.

Érdemes bepillantani az R árnyékosabb oldalába is. Az R egyik gyengesége, hogy nagy adatbázisok kezeléséhez erős hardverre van szüksége, de a legtöbb felhasználás során ez semmilyen problémát nem okoz. A másik gyengeség, hogy az R elsajátításához nem kevés idő és kitartás szükséges. Jelen könyv éppen ezt a folyamatot kívánja megkönnyíteni és lerövidíteni. 


### A R parancssoros

Az R alapvető használata során parancsokat gépelünk be és hajtunk végre. Ez lényegesen eltér a ma megszokott felhasználói programok világától, ahol egy grafikus felhasználói felületen egérrel vagy az ujjunkkal mutogatjuk el a kívánt tevékenységet. Az R egészen más megközelítést vall, használata a kezdeti lépésektől nagyfokú figyelmet és pontosságot követel. A parancsokban kell gondolkodnunk, ám ezt végig áthatja a *tudom mit csinálok* elv, így némi idő elteltével érezni fogjuk, hogy az R megszelídül, már nem köt bele minden "szavunkba", egyre több dologra tudjuk rávenni, és végül egy rendkívül értékes társsá válik. Jelen könyv ezen az úton szeretné végigvezetni az Olvasót.

Már a tanulás elején szeretnénk tisztázni, hogy az R elsajátításához nem szükséges programozói alaptudás. Az R felhasználók többsége egyáltalán nem programozó, és a mindennapi adatelemző munka sem igényli az R nyelv programozói fokú ismeretét. Természetesen, ha rendelkezünk ilyen irányú előtanulmányokkal a tanulási folyamat néhány szakasza lerövidíthető, de könyvünk elsősorban azok számra íródott, akik programozási nyelvekkel korábban nem találkoztak, és nem is vágynak az R ilyen mélységű ismeretére. Az R nyelv elsajátítása során bevezetjük azokat az egyszerű fogalmakat, amelyeket nem nélkülözhetők az adatelemzés során, azonban az R programozásához más szakkönyveket javaslunk olvasásra.


### Mi valójában az R?

Az R nyelv fejlesztője az [R Core Team](https://www.r-project.org/contributors.html). Az R nyelv egy rendkívül népszerű szkriptnyelv, több millióan használják világszerte. Elsősorban adatelemzésre, adatmodellezésre és grafikus megjelenítésre, vagyis arra, amit ma adattudományok (data science) alatt értünk. Azonban az R nyelv önmagában nem szoftver, hanem egy rendkívül rugalmas szkriptnyelv, amely például előírja, hogy milyen szintaktikai szabályok mentén fogalmazhatjuk meg az utasításainkat. Ahhoz, hogy az R nyelvet használni tudjuk, vagyis, hogy a számítógép valóban végre is hajtsa a szintaktikailag helyes utasításinkat, szükség van egy szoftveres környezetre, egy olyan futtató rendszerre, amely a kódunkat értelmezi és végrehajtja.

Az R környezet három fő összetevőt tartalmaz: (1) egy *konzol*t, ahová a parancsainkat begépelhetjük; (2) a parancsok végrehajtásáért felelős *R interpreter*t; (3) a *csomagokok*at. A konzol és az interpreter biztosítja az R nyelven írt parancsok tényleges végrehajtását. Így tudunk adatokat beolvasni, átlagot számolni, varianciaelemzést futtatni, vagy publikációkész ábrákat létrehozni. A csomagok adatokat és függvényeket tartalmaznak, például a **MASS** csomag 88 adatobjektumot és 78 függvényt tartalmaz. A függvények valamilyen tevékenységet hajtanak végre, és valójában ezeket a csomag-függvényeket használjuk fel a konzolban, ha *bármilyen tevékenységet* szeretnénk végrehajtani (például adatokat beolvasni, átlagot számolni stb.). A könyv írásának időpontjában kb. 17000 csomag volt érhető el az R-hez. Csomagok 3 csoportját különböztetjük meg: *standard csomagok* (14 db), *ajánlott csomagok* (15 db) és *egyéb csomagok* (kb. 17000 db). A standard csomagok fejlesztője az R Core Team. A standard csomagok: **base**, **compiler**, **datasets**, **grDevices**, **graphics**, **grid**, **methods**, **parallel**, **splines**, **stats**, **stats4**, **tcltk**, **tools**, **utils**. Az ajánlott csomagok: **KernSmooth**, **MASS**, **Matrix**, **boot**, **class**, **cluster**, **codetools**, **foreign**, **lattice**, **mgcv**, **nlme**, **nnet**, **rpart**, **spatial**, **survival**. Az ajánlot csomagok közül a **foreign** és az **nlme** fejlesztője az R Core Team, a többit más felhasználók fejlesztették, például a már említett **MASS** csomag fejlesztője Brian Ripley. Csomagot bárki szabadon fejleszthet és terjeszthet, az *egyéb csomagok* csoportját akár mi is gyarapíthatjuk. 





A R környezet már igazi szoftver, terjesztésének koordinálását az [R Foundation](https://www.r-project.org/foundation/) végzi a [CRAN](https://cran.r-project.org/mirrors.html) infrastruktúráján keresztül. Ez biztosítja, hogy számítógépünkre telepíthessük az R környezetet. Ezt a CRAN-ról elérhető R futtatási környezetet *Alap R*-nek nevezzük. Fő komponensei a már említett konzol a parancsok begépelésére, az R értelmező a begépelt parancsok végrehajtására és a csomagok közül a standard és ajánlott csomagok. Az *Alap R* telepítése után már tudunk R parancsokat végrehajtani, és nagyon sok adatelemzési probléma megoldására nyílik módunk, sőt azt mondhatjuk, hogy tetszőleges problémát megoldhatunk kisebb-nagyobb erőfeszítéssel, mert az R egy teljes értékű nyelv. Azonban sokszor érdemesebb az *egyéb csomagok* közül választani, hiszen könnyen elképzelhető, hogy a számtalan csomag között találunk olyat, amely segítségünkre lehet speciális feladataink megoldása során. Valószínű, hogy létezik olyan csomago és benne olyan függvény, amely adatkezelési, adatelemzési, grafikai vagy publikálási feladatunkat jelentősen megkönnyíti. Az *egyéb csomagok* csoportjába tartozó csomagok forrása több tárhely is lehet, ezek közül legjelentősebb az R Foundation által karbantartott CRAN (kb. 15000 csomaggal), a Bioconductor (1741 csomaggal) és a GitHub. 

Az R tehát egyszerre több dolgot jelent. Az R egyrészt egy magas szintű programozási nyelv, hamarosan megtanuljuk, hogyan írjunk ezen a nyelven értelmes utasításokat. Másrészt a nyelv körüli környezetet is jelenti, amely magába foglalja a konzolt, a parancsaink értelmezésért felelős R interpretert, valamint azokat a csomagokat, amelyekkel az R tudása kiegészíthető.


<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>Minden statisztikai programcsomag, így az R is, alapvetően a számításigényes statisztikai eljárások kézi végrehajtásától kímél meg minket. Az R nagyon gazdag adatmanipulációs és grafikus funkciókban is, támogatja a reprodukálható adatelemzés végrehajtását. Az R ingyenes, többplatformos és egyik legfontosabb jellemzője, hogy parancsok útján bírhatjuk működésre. Az <em>Alap R</em> biztosítja a konzolt a parancsok begépelésére, az R interpretert a parancsok tényleges végrehajtására, és jónéhány csomagba szervezett eljárást az adatelemzési feladatok elvégzéséhez. Az <em>Alap R</em> mindössze néhány tucat csomagot tartalmaz, <em>standard csomagokokat</em> és az <em>ajánlott csomagokat</em>, de több tízezer további csomaggal bővíthetjük az R tudását. Az adatelemzési munka során egy R környezet vesz minket körül, amely az R nyelven megírt parancsok értelmezésére és végrehajtására képes <em>Alap R</em>-ből, és az ún. <em>egyéb csomagokból</em> áll.</p>
</div>




\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
**Feladatok**
  
1. Keressünk weboldalakat, amelyek az R előnyeit és hátrányait listázzák!
1. Keressük meg, hogy az R optimális futtatásához, milyen hardver követelmények szükségesek!
1. Nézzünk utána, hogy ma kb. hány csomag érhető el az R-hez? Keressünk ábrát, amely bemutatja, hogy az évek során hány csomag volt elérhető az R-hez?
1. Hol áll az R népszerűsége a többi programozási nyelvhez, illetve statisztikai programcsomaghoz képest?
1. Milyen ingyenesen elérhető, grafikus felhasználói felülettel rendelkező statisztikai programcsomagok építenek az R-re?
1. Említettük, hogy az adatelmezési munka nem igényli az R programozói fokú ismeretét, de soroljunk fel néhány könyvet, amelyből az R programozása is megtanulható! 
</div>\EndKnitrBlock{rmdexercise}



## A modern R


<div class="rmdlevel2">
<p>Ebben a fejezetben:</p>
<ul>
<li>megismerjük a <em>Tidyverse R</em> fogalmát,</li>
<li>megtudjuk mit értünk modern R alatt.</li>
</ul>
</div>


A 2014-es év az R nyelv életében meghatározó változást hozott. Egyrészt megjelent a **magrittr** csomagban a pipe operátor (`%>%`), amellyel olvashatóbb kódok írására nyílt lehetőség[^1], másrészt a pipe operátorra alapozva Hadley Wickham bemutatta a **dplyr** és **tidyr** csomagokat. Ezzel az R funkcionális[^3] oldalát úgy erősítették meg[^2], hogy a sokszoros egymásba ágyazás során kiküszöbölték a kerekzárójelek írásának problémáját. Az ebben a szellemben készült csomagok listája bővült az idők folyamán, és a *Tidyverse* nevet kapta ez a csomaggyűjtemény. Jelenleg a következő csomagok alkotják: **ggplot2**, **purrr**, **tibble**, **dplyr**, **tidyr**, **stringr**, **readr** és **forcats**. Ezek a csomagok nem egyszerűen új funkciókkal ruházzák fel az *Alap R* tudását, mint általában az *egyéb csomagok*. A *Tidyverse* csomagjai konzisztens módon együttműködnek, és egy új megközelítést hoznak az adatelemzési folyamatok végrehajtásában és a kódok írásában. Rövidebb idő alatt hozhatunk létre könnyebben karbantartható kódokat, és a műveleteink végrehajtása is rendszerint gyorsabb. Amikor ebben a megközelítésben hozzuk létre és hajtjuk végre utasításainkat, akkor azt mondjuk hogy a *Tidyverse R*-t használjuk. A *Tidyverse R* nem helyettesíti az *Alap R*-t, és csak bizonyos feladatokra használható. Lássunk tisztán, amit elvégezhetünk *Tidyverse R*-ben, azt az *Alap R*-ben is meg tudnánk tenni, de valószínűleg több gépeléssel, lassabb és rosszabbul karbantartható kóddal. 

Eddig láttuk, hogy az R használatához szükséges az *Alap R* telepítése, majd a speciális problémánknak megfelelően kiegészíthetjük az R tudását úgy, hogy telepítünk egyet vagy többet az *egyéb csomagok* kategóriájából. Választhatjuk akár a *Tidyverse* csomagjait is telepítésre, ugyanis így lehetőségünk nyílik a *Tidyverse R* használatára. Utasításaink megfogalmazásának ma ez a legmodernebb módja. 

A modern R alatt lényegében azokat a funkciókat értjük, amelyek a [*Tidyverse*](https://www.tidyverse.org/) gyűjteményben található csomagokhoz kötődnek. Ezekkel a csomagokkal, gyorsabb, olvashatóbb és könnyebben karbantartható kódokat hozhatunk létre. A *Tidyverse* használata tehát erősen javasolt, de ebben a könyvben a "hagyományos", *Tidyverse R* előtti lehetőségeket is bemutatjuk. 


<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>A <em>Tidyverse R</em> egy csomaggyűjtemény az <em>egyéb csomagok</em> csoportjából, amely újabb szemléletű R parancsok írására ad lehetőséget. Az így készült kódjaink rendszerint gyorsabban futnak és könnyebben karbantarthatók. A modern R a <em>Tidyverse R</em> csomagjaival kiegészített <em>Alap R</em>, de legfőképp egy új lehetőség parancsaink megfogalmazására.</p>
</div>


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
**Feladatok**
  
1. Ki Hadley Wickham?
1. Honnan származik a pipe operátor neve?
</div>\EndKnitrBlock{rmdexercise}




## Múlt és jelen

<div class="rmdlevel3">
<p>Ebben a fejezetben:</p>
<ul>
<li>megismerjük az R rövid történetét és annak szereplőit,</li>
<li>majd egy szubjektív listával segítjük az R tanulását,</li>
<li>illetve megismerjük az R alaptudás elemeit.</li>
</ul>
</div>


### Szereplők és fogalmak


Érdemes néhány szereplőt és fogalmat tisztázni az R világán belül. Az R nyelvet 1992-ben kezdte fejleszteni [Ross Ihaka](https://www.stat.auckland.ac.nz/~ihaka/) és [Robert Gentleman](https://www.linkedin.com/in/robert-gentleman-06845098/), 1997-től pedig egy nagyobb csapat, az [R Development Core Team](https://www.r-project.org/contributors.html) vezeti a fejlesztést (rövidebben *R Core Team*). Ettől az évtől az R hivatalosan a GNU projekt része. Az *R Core Team* tagjai 2002-ben létrehozták a [The R Foundation for Statistical Computing](https://www.r-project.org/foundation/) (rövidebben *The R Foundation*)  közhasznú, nonprofit szervezetet, amelynek célja (1) az R folyamatos fejlesztésének biztosítása, és ehhez kapcsolódóan a nyílt forráskódú számítógépes statisztikai innovációk támogatása, (2) az R fejlesztői közösség (*R Core Team*) hivatalos hangjaként a felhasználók, intézmények és üzleti vállalkozások számára a kommunikáció biztosítása, és (3) az R program és dokumentációk szerzői jogainak kezelése. A szervezet rendszeresen konferenciákat, találkozókat szervez, referált folyóiratot, kézikönyveket és technikai leírásokat ad ki, valamint fenntart egy számítógépes infrastruktúrát (ez a CRAN, amely levelező listákat, FTP- és Webszervereket üzemeltet). Az R Foundation hivatalos oldala -- egyben az R hivatalos oldala -- a [*https://www.r-project.org/*](https://www.r-project.org/). Az R Foundation (és más önkéntesek) által üzemeltetett számítógépes hálózat neve a CRAN (Comprehensive R Archive Network), amely szabad hozzáférést nyújt az R legfrissebb verziójához, az R kiterjesztéseihez (a csomagokhoz) és a részletes dokumentációkhoz. A CRAN fő számítógépe Ausztriában található [*https://CRAN.R-project.org/*](https://CRAN.R-project.org/), azonban nagyon sok naponta frissülő [tükörszerver](https://cran.r-project.org/mirrors.html) érhető el világszerte. 



### Alapelvek


Az R elsődleges célja, hasonlóan más statisztikai programcsomagokhoz, a statisztikai adatelemzés, amelyet négy lépésre bonthatunk:
  
1. adatok beolvasása,
2. adatok előkészítése elemzésre,
3. adatelemzés,
4. eredmények publikálása.

Az R mára a fenti 4 tevékenység elvégzését teljes körűen támogatja. A könyv célja ezek bemutatása. Mielőtt elkezdjük ezt az izgalmas utat -- az R tanulmányozását -- néhány alapelvet szeretnék megemlíteni, ami segíthet minket az utazásunk során:

* *Magabiztosság* - Az R nagyon nagy, így a teljes megismerése nem lehet célunk. Mindig lesz valaki, aki az R egyik vagy másik részét jobban, vagy kevésbé ismeri nálunk. Ez természetes, ezen soha ne csodálkozzunk. Az eltérő ismeretek azonban az R speciális területeire vonatkoznak, az *R alaptudás* (\@ref(Ralaptudas) fejezet) minden R-ben jártas felhasználó számára közös. E könyv célja ennek az alaptudásnak az átadása, melynek birtokában már kellő magabiztossággal vághatunk neki az R azon részeinek elsajátításába, amelyek az éppen elénk kerülő speciális feladat megoldásához szükségesek. Hisszük, hogy e könyv elolvasásával, mind az R alaptudás, mind a kellő magabiztosság elérhetővé válik számunkra.
* *Gyakorlás* - Az R alaptudásának megszerzése némi időbe telik, ez tagadhatatlan. A motiváció megtartásához viszonylag jól kell éreznünk magunkat a tanulás és a gyakorlás során. A könyvben ezért minden fejezet végén találunk megoldandó feladatokat, amelyek között szórakoztató, érdekes és kihívást jelentő gyakorlatok is szerepelnek.
* *Svájci bicska* - A R nagyon sokféle statisztikai és nem-statisztikai probléma megoldására képes, sőt ugyanarra a problémára nagyon sok különböző eszközt kínál. Ha elsőre nem a legszebb, legoptimálisabb megoldás jut az eszünkbe, ne csüggedjünk, ez a legtöbb esetben nem jelent gondot. Azon se csodálkozzunk, ha korábban megoldott problémánkra idővel újab és újabb megoldási lehetőségeket találunk.


### Az R alaptudás {#Ralaptudas}

Melyek az R-ben való munkavégzéshez nélkülözhetetlen alapismeretek? Meggyőződésünk, ha a lentebb felsorolt témakörökkel tisztában vagyunk, akkor már magabiztos R tudással rendelkezünk, és bármilyen további R témakör könnyen elsajátítható lesz. Ezekre az ismeretekre úgy gondolhatunk, mint egy ablakra, amelyen keresztül az R szinte végtelen lehetőségeinek tárháza nyílik meg előttünk. Később visszatérhetünk ehhez a listához, és ellenőrizhetjük, hány elemet tudunk már kipipálni.

**Az R alaptudás elemei:**

* Az R környezet alapszintű ismerete
    - [ ] az *Alap R*, az *RStudio* és a csomagok telepítése
    - [ ] projektek használata és R parancsok futtatása az *RStudio*-ban
* Az R nyelv alapszintű ismerete
    - [ ] konstansok írása
    - [ ] objektumok kezelése
    - [ ] egyszerű adattípusok
    - [ ] alapvető operátorok
    - [ ] kifejezés fogalma
    - [ ] a függvényhívás lehetőségei
    - [ ] összetett adattípusok,
    - [ ] a vektoraritmetika szabályai
* Az alapvető függvények ismerete
    - [ ] csomagkezelő függvények
    - [ ] a munkaterület függvényei
    - [ ] matematikai függvények
    - [ ] input/output függvények
    - [ ] indexelés, szűrés, rendezés
    - [ ] információ kérés az objektumokról
    - [ ] egyszerű típuskonverzió
    - [ ] transzformáció
    - [ ] ismétlő és összesítő függvények
    - [ ] a hagyományos grafika néhány eleme
    - [ ] a **ggplot2** alapszintű ismerete
* Egyéb ismeretek
    - [ ] szövegszerkesztési és állománykezelési ismeretek
    - [ ] a tagolt szöveges állomány fogalma
    - [ ] reprodukálható kutatás az RMarkdown segítségével


<div class="rmdsummary">
<p><strong>Összefoglalás</strong></p>
<p>Az R fejlesztését Ross Ihaka és Robert Gentleman kezdte, majd 1997-től egy nagyobb csapat, az <em>R Development Core Team</em> vezeti a fejlesztést. Az <em>R Core Team</em> tagjai 2002-ben létrehozták a <em>The R Foundation for Statistical Computing</em> közhasznú, nonprofit szervezetet, amelynek fő célja az R folyamatos fejlesztésének biztosítása. A szervezet fenntart egy CRAN nevű számítógépes hálózatot, amely szabad hozzáférést biztosít az R legfrissebb verziójához, a csomagokhoz és a részletes dokumentációkhoz.<br />
Az R alaptudás megszerzése elegendő magabiztosságot fog nyújtani az adatelemzési munka során, azonban vegyük figyelembe, hogy ezt csak kellő gyakorlással érhetjük el. Az R sokféle megoldást biztosít ugyanarra a problémára, legyen az statisztikai vagy bármilyen más jellegű probléma.</p>
</div>


\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
**Feladatok**
  
1. Keressünk olyan statisztikai jellegű témaköröket, amelyekben az R segítségünkre lehet?
1. Keressünk olyan nem-statisztikai jellegű témaköröket, amelyekben az R segítségünkre lehet?
1. Nézzük át néhány online elérhető R könyvet, és hasonlítsuk össze az R alaptudás egyes elemeivel! Melyek az átfedő részek, és hol vannak különbségek?
  
https://www.r-bloggers.com/the-history-of-r-updated-for-2020/
  
</div>\EndKnitrBlock{rmdexercise}





<!--
### Jelölési konvenciók

A könyv szövegében a csomagneveket (például **ggplot2**) félkövérrel szedjük, a forráskódok és az állománynevek írógépszerű szöveggel jelennek meg (például `library(ggplot2)` vagy `data/movies.csv`). Ha függvényekre hívatkozunk, mindig használjuk a kerekzárójeleket (például `Desc()`). A dupla kettőspont operátor az objektum elérését biztosítja az adott csomagból (`DescTools::Desc()`). A függvény nevesített argumentumaiban az egyenlőségjelet is szerepeltetjük, például `main=`.

A szöveges részek közötti forráskódok nem tartalmaznak promptot (`>` vagy `+` jeleket), az outputként megjelenő sorok pedig két kettőskereszttel (`##`) kezdődnek.

Példaképp, a `sessionInfo()` függvény hívását és outputját mutatjuk be, amely a könyv írása során használt R környezetről nyújt tájékoztatást.


```r
sessionInfo()
#> R version 4.1.2 (2021-11-01)
#> Platform: x86_64-w64-mingw32/x64 (64-bit)
#> Running under: Windows 10 x64 (build 19042)
#> 
#> Matrix products: default
#> 
#> locale:
#> [1] LC_COLLATE=Hungarian_Hungary.1250  LC_CTYPE=Hungarian_Hungary.1250   
#> [3] LC_MONETARY=Hungarian_Hungary.1250 LC_NUMERIC=C                      
#> [5] LC_TIME=Hungarian_Hungary.1250    
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#>  [1] scales_1.1.1    forcats_0.5.1   stringr_1.4.0   dplyr_1.0.7    
#>  [5] purrr_0.3.4     readr_2.1.1     tidyr_1.1.4     tibble_3.1.6   
#>  [9] ggplot2_3.3.5   tidyverse_1.3.1
#> 
#> loaded via a namespace (and not attached):
#>  [1] Rcpp_1.0.7       lubridate_1.8.0  assertthat_0.2.1 digest_0.6.29   
#>  [5] utf8_1.2.2       R6_2.5.1         cellranger_1.1.0 backports_1.3.0 
#>  [9] reprex_2.0.1     evaluate_0.14    httr_1.4.2       pillar_1.6.4    
#> [13] rlang_0.4.12     readxl_1.3.1     rstudioapi_0.13  jquerylib_0.1.4 
#> [17] rmarkdown_2.11   munsell_0.5.0    broom_0.7.10     compiler_4.1.2  
#> [21] modelr_0.1.8     xfun_0.25        pkgconfig_2.0.3  htmltools_0.5.2 
#> [25] downlit_0.4.0    tidyselect_1.1.1 bookdown_0.24    codetools_0.2-18
#> [29] fansi_0.5.0      crayon_1.4.2     tzdb_0.2.0       dbplyr_2.1.1    
#> [33] withr_2.4.2      grid_4.1.2       jsonlite_1.7.2   gtable_0.3.0    
#> [37] lifecycle_1.0.1  DBI_1.1.1        magrittr_2.0.1   cli_3.1.0       
#> [41] stringi_1.7.6    cachem_1.0.6     fs_1.5.1         xml2_1.3.2      
#> [45] bslib_0.3.1      ellipsis_0.3.2   generics_0.1.1   vctrs_0.3.8     
#> [49] tools_4.1.2      glue_1.5.1       hms_1.1.1        fastmap_1.1.0   
#> [53] yaml_2.2.1       colorspace_2.0-2 rvest_1.0.2      memoise_2.0.1   
#> [57] knitr_1.36       haven_2.4.3      sass_0.4.0
```

-->

[^1]: https://www.r-bloggers.com/magrittr-simplifying-r-code-with-pipes/
[^2]: https://www.r-bloggers.com/magrittr-the-best-thing-to-have-ever-happened-to-r/
[^3]: Az R egy nem túl fiatal, a funkcionális programnyelvekhez hasonlóan építkező programozási nyelv, vagyis egy probléma megoldása tipikusan sokszorosan egymásba ágyazott függvényhívások segítségével történik. Ez sok-sok nyitó és záró kerekzárójellel jár együtt, így a parancsaink áttekintése és karbantartása sokszor nehézségekbe ütközik. Ezt kiküszöbölendő az R-ben előszeretettel használnak procedurális eszközöket (például `for` ciklusokat), de a kód olvashatóságát és karbantartását igazán ez sem könnyíti meg.

