# Az R nyelv {#az-r-nyelv}

<img src="images/ch_05_small.png" width="70%" style="display: block; margin: auto;" />

Az előző fejezetekben megismertük az R környezetet, az *Alap R*, az *RStudio* és a csomagok telepítését, megtanultuk a projektek, parancsállományok és RMarkdown állományok létrehozását. Tudjuk, a különböző környezetekben eltérő módszerekkel hajthatjuk végre az R parancsokat: a konzolban az `ENTER`, a Windows-os *RGui*-ban a `Ctrl+R`, míg az *RStudio*-ban a `Ctrl+Enter` billentyűkombinációt kell használnunk. A parancsok végrehajtása közben érdemes észben tartani, ha a folytatás prompt (`+`) feltűnik, akkor kattintsunk bele a konzolba, és nyomjuk meg az `Esc` billentyűt, így tudunk kilépni a befejezetlen sor szerkesztéséből

A fejezet példáinak kipróbáláshoz hozzunk létre egy `gyakorlas` nevű új projektet az *RStudio*-ban (`File / New Project`), majd készítsünk egy `gyakorlas.Rmd` RMarkdown állományt (`File / New File / R Markdown`) és egy `gyakorlas.R` parancsállományt (`File / New File / R Script`). A fejezet példáit felváltva gépeljük az RMarkdown állomány R csonkjaiba, illetve a parancsállomány tetszőleges soraiba. A fejezet további részében az R nyelvre koncentrálunk, arra, hogy mit írunk, és nem arra, hogy hová írjuk a parancsokat.

## Adatobjektumok

\BeginKnitrBlock{rmdlevel1}<div class="rmdlevel1">
Ebben a fejezetben:
  
* áttekintjük az egyszerű számolási lehetőségek R-ben,
* bevezetjük az aritmetikai operátor és a kifejezés fogalmát,
* megismerjük az objektum létrehozását és elnevezését,
* több parancs elhelyezését egy sorban,
* és a megjegyzések használatát.
</div>\EndKnitrBlock{rmdlevel1}


Az R nyelv megismerését számadatok írásával kezdjük. Az adatelemzés során a számszerű adatok kezelése a leggyakoribb, hiszen méréssel és számlálással is ilyen jellegű adatokhoz jutunk. Számszerű adat a testmagasságunk cm-ben kifejezve, az IQ-teszten elért pontszámunk, vagy a testvéreink és a Facebook ismerőseink száma is.   

### Számolás az R-ben

Kezdjük a számszerű adatok megismerését egy egyszerű sor begépelésével. 


```r
2+2 
#> [1] 4
```

Végrehajtás után a konzolban láthatjuk az összeadás eredményét, a 4-et. Az eredmény előtt egy szögletes zárójelben lévő sorszámot is láthatunk (`[1]`), amely bonyolultabb outputokban segít eligazodni. Később az \@ref(szabalyosvektorokalfejezet) fejezetben visszatérünk a `[1]` értelmezésére.

Látjuk, ebben az esetben az R úgy viselkedik, mint egy számológép. A parancssorba gépelt algebrai kifejezés értékét kiszámolja és a képernyőn megjeleníti. Természetesen az összeadáson túl más műveletet is használhatunk.


```r
4+6*2
#> [1] 16
```

A fenti példából látható, hogy az R követi a műveletek elvégzésének matematikában megszokott sorrendjét. Azaz a szorzás műveletre (`*`) hamarabb sor kerül, ennek eredménye 12. Ezt követi az összeadás (`+`), most már a 4 és a 12 között. Ennek az összeadás műveletnek az eredménye 16, ami egyben a kifejezés értéke is, tehát ez jelenik meg a konzolban.

Természetesen a matematikában megszokott módon változtathatunk a műveletek végrehajtásának alapértelmezett sorrendjén, azaz használhatunk kerek zárójeleket. Ezeket az R a megszokott módon értelmezi: a zárójelben szereplő műveletek végrehajtását előreveszi.


```r
(4+6)*2
#> [1] 20
```

A fenti példában az összeadás művelet lesz az első, amelynek az eredménye 10. Ezt követi a szorzás, így kapjuk a kifejezés értékeként a 20-at.

Ezeket a matematikában megszokott algebrai kifejezéseket, az R-ben egyszerűen kifejezésnek vagy -- utalva arra, hogy a kifejezés értéke szám -- *aritmetikai kifejezésnek*\index{aritmetikai kifejezés} nevezünk. Az eddigiek alapján az aritmetikai kifejezések tehát a következő nyelvi elemeket tartalmazhatják:

* számok, amelyeket *numerikus konstans*oknak\index{numerikus konstans} nevezünk,
* műveleti jelek, amelyeket *aritmetikai operátor*oknak\index{aritmetikai operátor} nevezünk,
* és kerekzárójelek.

A fentiek alapján összetettebb aritmetikai kifejezéseket is megformálhatunk. Az R minden esetben kiszámolja a kifejezések értékét -- azaz *kiértékeli* a kifejezést --, és a kapott értéket megjeleníti a konzolban.



```r
4^2-3*2+1
#> [1] 11
(104-20)/6-4*7*10/(5**2-5)
#> [1] 0
```



\begin{table}

\caption{(\#tab:matoperatorok)Matematikai operátorok precedenciájuk csökkenő sorrendjében}
\centering
\begin{tabular}[t]{lll}
\toprule
Operátor formája & Művelet & Példa\\
\midrule
\cellcolor{gray!6}{\ttfamily{\textasciicircum{} **}} & \cellcolor{gray!6}{hatványozás} & \cellcolor{gray!6}{\ttfamily{2\textasciicircum{}3;2**3}}\\
\ttfamily{+ - } & előjelek & \ttfamily{+3.3;-.5}\\
\cellcolor{gray!6}{\ttfamily{\%\% \%/\%}} & \cellcolor{gray!6}{maradékos osztás és egész osztás} & \cellcolor{gray!6}{\ttfamily{13\%\%4;15\%/\%4}}\\
\ttfamily{* /} & szorzás és osztás & \ttfamily{2*3;4/2}\\
\cellcolor{gray!6}{\ttfamily{+ - }} & \cellcolor{gray!6}{összeadás és kivonás} & \cellcolor{gray!6}{\ttfamily{2+3;2-3}}\\
\bottomrule
\end{tabular}
\end{table}

Az aritmetikai kifejezések használata során ne felejtkezzünk el a műveletek alapértelmezett végrehajtási sorrendjéről. A műveletek megjelenítését most az operátorok végzik, melyeknek fontos tulajdonsága, hogy mennyire szorosan kötik magukhoz az adatokat (vagy más néven az operandusokat). Az operátorok ezen fonos tulajdonságát *precedenciának* nevezzük. Az R-ben használható aritmetikai operátorokat a precedenciájuk csökkenő sorrendjében az \@ref(tab:matoperatorok) táblázat tartalmazza.

Például a hatványozás és az előjel operátor precedenciája eltér egymástól, a hatványozás nagyobb precedenciájú, azaz szorosabban köti magához az adatokat, így végrehajtása megelőzi az előjel operátort. Ha nem vagyunk elég óvatosak, és plusz zárójelek segítségével nem biztosítjuk a kívánt végrehajtási sorrendet, akkor nem kívánt eredményhez juthatunk. A lenti példában láthatjuk, hogy zárójelek nélkül a nagyobb precedenciájú hatványozás az elsőként végrehajtott művelet.


```r
-2^2    # először hatványozás, majd előjel
#> [1] -4
(-2)^2  # először előjel, majd hatványozás
#> [1] 4
```

Eddig láthattuk, hogy kifejezéseinket operátorok, numerikus konstansok és zárójelek segítségével építettük fel. Ezek a kifejezések két alkotójukban is általánosíthatók: 

* általánosítható a kifejezés adat része, amelyet eddig a numerikus konstansok képviseltek (ezekből lesznek az *objektum*ok), 
* általánosíthatő a kifejezés művelet része, amelyet eddig az operátorok jelenítettek meg (ezek lesznek a *függvény*ek). 

Az adatrész általánosítása tehát az adatobjektum (vagy röviden objektum), a műveleteké pedig a függvényobjektum (vagy röviden függvény). Ezeket tekintjük át a következőkben.

### Objektumok

Ha egy kifejezés értéket nem egyszerűen a képernyőn szeretnénk megjeleníteni, hanem azt később is fel szeretnénk használni, akkor objektumot[^1] kell létrehoznunk. Az objektumok révén a memóriába rögzíthetünk tetszőleges értékeket, később pedig elővehetjük és felhasználhatjuk ezeket az értékeket. 
Tudjuk, ha a lenti aritmetikai kifejezést a parancssorba írjuk, az R miután kiértékelte a kifejezést, a kifejezés értékét megjeleníti a konzolban. Ez az érték azonban a megjelenítés után rögtön el is vész, többször nem használhatjuk fel.


```r
1157/13+2^3 
#> [1] 97
```

Ha létrehozunk egy `x` nevű objektumot, akkor ezt az értéket további kifejezésekben is szerepeltethetjük. Minden olyan helyen, ahol eddig számok jelentek meg a kifejezésekben, oda ez az `x` objektumnév is beírható.


```r
x <- 1157/13+2^3 
```

A fenti sor végrehajtása után írhatjuk a következőket, hiszen a kifejezések kiértékelése során az `x` objektum memóriában tárolt értékével fog számolni az R.


```r
x+2       # mintha 97+2 lenne
#> [1] 99
2*x^3+5   # 2*97^3+5
#> [1] 1825351
```

Minden objektumnak van neve és tartozik hozzá a memóriában egy terület, ahol a kérdéses érték tárolásra kerül. Esetünkben az objektum neve `x`, a hozzá tartozó memóriaterületen pedig a 97 értéket tárolja az R. Az objektum leegyszerűsítve tehát egy név-érték pár, ahol a nevet és a memóriában eltárolandó értéket is mi magunk választjuk meg.

Az objektumok kezeléséhez 3 művelet kapcsolódik:

* objektum létrehozása, 
* objektum értékének lekérdezése, 
* és az objektum értékének megváltoztatása. 


#### Objektumok létrehozása

Objektumot értékadással hozhatunk létre. Az értékadás tartalmaz egy értékadás operátort, melynek alakja `<-` (balra nyíl), vagyis egy kisebb jel és egy mínusz előjel egymás után írva szóköz nélkül[^2].

Az értékadás általános alakja: 

```markdown
objektumnév <- kifejezés    # értékadó utasítás
```

Ahol lehet a továbbiakban ezt a balra nyíl alakú értékadó operátort használjuk az értékadás során, és nem a szintén legális egyenlőségjelet (`=`). A balra nyíl írását az *RStudio* az `Alt+-` segítségével támogatja, így a bevitele nem okozhat nehézséget. Az egyenlőségjelet megtartjuk a függvényargumentumok elnevezésére. Az egyszerűség kedvéért a balra nyíl előtt lévő objektumnevet az értékadás bal oldalának, az utána lévő kifejezést az értékadás jobb oldalának nevezzük.

Ha olyan objektumnevet szerepeltetünk az értékadásban, amely még nem létezik, akkor az R létrehoz egy ilyen nevű új objektumot, és a hozzá tartozó memóriaterületen pedig az értékadás jobb oldalán lévő kifejezés kiértékelése után kapott értéket tárolja el.


```r
a <- 1+2    # objektum létrehozása
```

A fenti sor végrehajtása után a konzolban nem jelenik meg eredmény, mégis egy nagyon fontos dolog történik, létrejön az `a` nevű objektum, amelynek értéke 3 lesz mindaddig, amig ezen nem változtatunk. A munkánk során létrehozott objektumok a memória egy speciális területére, a *munkaterület*re (*workspace*) kerülnek.

Ha az értékadásban használt objektum már létezik, akkor a jobb oldali kifejezés kiértékelése után a kapott értékkel felülírja a bal oldali objektumhoz tartozó memóriaterületet. Ezzel a módszerrel tehát a korábban létrehozott objektum értékét módosíthatjuk. 

A már létező `a` objektum értékét könnyen megváltoztathatjuk.


```r
a <- 10/3   # objektum értékének megváltoztatása
```


#### Objektumok értékének lekérdezése

Az objektum memóriában tárolt értékét le is kérdezhetjük. A legegyszerűbb mód erre, ha az objektum nevét a parancssorba írjuk és végrehajtjuk a sort, máris megkapjuk az objektum memóriában tárolt értékét.


```r
a     # vajon mi az objektum értéke?
#> [1] 3.333333
```

Objektumok tetszőleges kifejezésben megjelenhetnek, akár egy értékadás jobb oldalán lévő kifejezésben is. A kifejezések kiértékelésében az objektum a memóriában tárolt értékével vesz részt.


```r
a*3              # a kifejezés értéke konzolba kerül
#> [1] 10
a <- 4 + a * 3   # megváltozik az objektum értéke, nincs output
a                # megtudjuk az objektum értékét
#> [1] 14
```

A fenti sorokból kiolvasható, hogy immár az `a` objektum értéke 14.

#### Objektumok elnevezése {#objektumelnevezes}

Az objektumok elnevezésére eddig egyetlen betűt (karaktert) használtunk, de ez elég ritka eset a munka során. Helyes gyakorlat, ha az objektum neve utal az objektum tartalmára, céljára. Ha például testmagasságot tárolunk el egy objektumban, akkor írhatjuk a következőt:


```r
magassag <- 179
```

A fenti sor létrehozza a munkaterületen a `magassag` nevű objektumot 179 értékkel.

Az objektumok elnevezésére 

* betűket, 
* számjegyeket, 
* a pont (`.`) és az aláhúzás (`_`) szimbólumokat használhatjuk. 

Az objektum neve csak betűvel vagy ponttal kezdődhet, számjeggyel vagy aláhúzással nem. Továbbá a név nem lehet az R-ben már lefoglalt kulcsszó, mint például `if`, `function` vagy `TRUE` (a kulcsszavak listáját a `?Reserved` paranccsal ismerhetjük meg). Hagyományosan a pont karaktert használjuk az objektumnevekben a tagolásra (például `magassag.peter` Péter magasságának tárolására). Az R a magyar ékezetes karakterek használatát is megengedi az objektumnevekben, de csakúgy mint az állományok és könyvtárak elnevezésében, érdemes ezek használatát mellőzni.

Az objektumoknak érdemes "beszédes" nevet választani, még ha ennek az ára némi extra gépelés is. Tudjuk, a `Tab` billentyű segíti a gépelést az *RStudio*-ban.

Az R kis- és nagybetű érzékeny, vagyis az `x` és a `X` különböző objektumoknak számítanak. Például a következő 


```r
pulzus.atlag <- 72
```

parancs után a 


```r
Pulzus.atlag
#> Error: object 'Pulzus.atlag' not found
```

sor hibát jelez (`Error: object 'Pulzus.atlag' not found`), azaz a `Pulzus.atlag` objektumot nem találja az R. Minden olyan esetben, ha nem létező objektumra hivatkozunk, a fenti hibaüzenet jelenik meg a konzolban.

Amennyiben gondoskodunk nagy `P`-vel kezdődő objektumról is, akkor lehetőségünk van hibaüzenet nélkül mindkét objektum értékének kiíratására. 


```r
Pulzus.atlag <- 69           # új objektumot hozunk létre
Pulzus.atlag; pulzus.atlag   # két parancs egy sorban
#> [1] 69
#> [1] 72
```

A gyakorlatban kerüljük el az olyan helyzeteket, amikor két objektumnév csak kis- nagybetűk használatában tér el. 

A fenti példában egy további apró újdonság is szerepelt. Ha egy parancssorban több utasítást szeretnénk elhelyezni, akkor ezeket pontosvesszővel (`;`) kell elválasztanunk. A pontosvesszővel elválasztott utasításokat az R értelmező egymás után, balról jobbra haladva hajtja végre, mintha külön sorba írtuk volna őket. A lenti sor 3 kifejezést (parancsot) tartalmaz pontosvesszővel elválasztva, mindegyik eredménye külön-külön jelenik meg a konzolban, mintha 3 különböző sorba írtuk volna őket.



```r
1+2; 3+4; 5+6     # három kifejezés egy sorban
#> [1] 3
#> [1] 7
#> [1] 11
```


### Megjegyzések az R-ben {#MegjegyzesazRben}

Nagyon sok példában láttunk már magyar nyelvű, magyarázó, értelmező szövegrészeket az R parancsok körül. Ezek az R *megjegyzések*. Megjegyzést az R-ben a kettőskereszt (`#`) karakter használatával vezetünk be. Az R értelmező a kettőskereszttől a sor végéig tartó részt figyelmen kívül hagyja. Itt helyezhetjük el a paranccsal kapcsolatos magyarázatainkat magunk vagy a kódot később olvasók számára. Teljes sorokat, vagy a sorok végét tudjuk így kivonni a végrehajtás alól. 


```r
# Érdekes tény, ha a 153 számjegyeit köbre emeljük, 
#   majd összeadjuk őket, pontosan 153-at kapunk
1^3+5^3+3^3       # hatványozás a ^ operátorral
#> [1] 153
1**3+5**3+3**3    # hatványozás a ** operátorral
#> [1] 153
```

Nem kizárólag magyarázó szövegek kerülhetnek megjegyzésbe, sokszor R parancsok végrehajtását akadályozzuk meg ezzel a módszerrel. Úgy kerülhetjük el egy parancs végrehajtását, hogy nem kell kitörölnünk a parancsállományból vagy az RMarkdown állományból, egyszerűen csak megjegyzésbe kell tennünk őket. Emlékezzünk vissza, hogy az \@ref(Csomagoktelepitese) fejezetben a csomagok telepítésért felelős parancsok esetében kifezetten javasoltuk a megjegyzések használatát:


```r
# xkcd: Randall Munroe webképregényei
# install.packages("RXKCD")
library(RXKCD)             # csomag betöltése       
searchXKCD("Star Wars")    # keresés címben vagy leírásban
getXKCD(1769)              # webképregény megjelenítése
```


Végül megemlítjük, hogy az *RStuio*-ban egyszerre több kijelölt sort tudunk megjegyzésbe tenni, vagy onnan kivenni a `Ctrl+Shift+c` segítségével.

### Összefoglalás {#az-r-nyelv-1-summary}

<div class="rmdsummary">
<p>Egyszerű kifejezéseket építhetünk numerikus konstansok (számok), operátorok és kerekzárójelek segítségével. A legfontosabb matematikai operátorok a négy alapművelet és a hatványozás. A kifejezés kiértékelése balról jobbra sorrendben történik, de ezt felülírja a kerekzárójelek használata és az operátorok precedenciája. Egy kifejezés értékét eltárolhatjuk a memória speciális területén, a munkamemóriában. Ehhez az értékeadó operátorral létre kell hoznunk egy új objektumot. Az objektum egy név-érték páros. Az objektum létrehozása után az objektum neve tetszőleges kifejezés adat részében szerepelhet. Több parancsot a pontosvesszővel (<code>;</code>) írhatunk egy sorba. Megjegyzéseket a kettőskereszt (<code>#</code>) segítségével helyezthetünk el.</p>
</div>


### Feladatok {#az-r-nyelv-1-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Gondoljuk át, mi lehet a következő algebrai kifejezés eredménye, majd ellenőrizzük R-ben is: $8/2(2+2)$.
1. Gondoljuk át, hogy a `.342e1` név miért nem lehet érvényes objektumnév? Próbáljuk ki a `make.names(".342e1")` parancsot, majd tanulmányozzuk a `?make.names` leírást!
1. Magyarázzuk meg a `make.names(c("", "", ""))` és a `make.names(c("", "", ""), unique = T)` parancsok közötti különbséget!
1. Gondoljuk át, hogy egy parancsállomány mely pontjain érdemes feltétlenül megjegyzéseket használni!
1. Jelentősen segíthetjük a navigációt az RStudio parancsállományaiban, ha bizonyos megjegyzések végére ezt írjuk: `----` (négy mínusz jel). Hogyan használhatjuk ezt a lehetőséget az *RStudio*-ban, és milyen előnyei vannak?
1. Az *RStudio*-ban parancsállomány (`.R`) szerkesztése közben próbáljuk ki a `Ctrl+Shift+R` billentyűparancsot, és a hozzá kapcsolódó `Shift+Alt+J` billentyűparancsot is. Mi a jelentése az `Alt+L`, `Shift+Alt+L`, `Alt+O` és `Shift+Alt+O` billentyűparancsoknak? A most megismert funkciók hogyan válthatók ki RMarkdown (`.Rmd`) állomány szerkesztése közben?
  
  </div>\EndKnitrBlock{rmdexercise}

## Függvények

\BeginKnitrBlock{rmdlevel1}<div class="rmdlevel1">
Ebben a fejezetben:
  
* áttekintjük a függvényhívás lehetőségeit a nevesített argumentumokkal, az alapértelmezésekkel és az argumentumok sorrendjének megváltoztatásával,
* megismerjük a legfontosabb matematikai függvényeket,
* és pontosítjuk a kifejezés fogalmát.
</div>\EndKnitrBlock{rmdlevel1}


Az aritmetikai kifejezéseinkben használható operátorok nem teszik lehetővé minden matematikai művelet elvégzését. Mit tegyünk ha a 2 négyzetgyökét szeretnénk kiszámolni? A négyzetgyökvonás operátor nem létezik az R-ben, de ebben a speciális esetben a hatványozás operátor segítségével is elérhetjük a célunkat.


```r
2^0.5
#> [1] 1.414214
```

Az R azonban más lehetőséget is biztosít a négyzetgyök kiszámítására és ez az `sqrt()` függvény.


```r
sqrt(2)
#> [1] 1.414214
```

A függvények valamilyen utasítássorozatot hajtanak végre és a számítás eredményét szolgáltatják. Esetünkben az `sqrt()` függvény egy szám (pozitív) négyzetgyökét számolja ki, annak a számnak a négyzetgyökét, amely a kerek zárójelek között szerepel. Tehát az R a paraméterben megadott 2 értékre meghívja az `sqrt()` függvényt, ami visszatér a 2 négyzetgyökével.

### A függvényhívás szabályai

A függvényhívás általános alakja:

```markdown
függvénynév(argNév1=arg1, argNév2=arg2, ..., argNévN=argN)
```

A függvény neve ugyanazoknak a szabályoknak engedelmeskedik, amelyeket az objektumok nevénél megtárgyaltunk (lévén a függvény is egy objektum). A függvény neve után kerek zárójelben következnek a függvény argumentumai, amelyek a függvény utasításainak a bemenő paraméterei. A függvény a bemenő paraméterek alapján az utasításainak megfelelően egy visszatérési értéket fog szolgáltatni.

Egy függvény különböző hívásainál az előforduló argumentumok száma és azok sorrendje igen változatos képet mutathat. Elöljáróban elmondhatjuk, hogy a függvények argumentumai alapértelmezett értékkel is rendelkezhetnek, így ezek az argumentumok elhagyhatók. Továbbá, a függvények argumentumai névvel is rendelkeznek, amelyeket ha a függvény hívásánál felhasználjuk, az argumentumok sorrendje tetszőleges lehet.


Először tekintsük át az R alapvető matematikai függvényeit (\@ref(tab:matfuggvenyek) táblázat). Nézzük meg részletesebben a `log()` függvényt. Ha kikérjük a súgóját `?log` parancs begépelésével, akkor megtudhatjuk, hogy ez a legáltalánosabb logaritmus függvény, tetszőleges alap esetén hívható. Számunkra most a legfontosabb a súgónak az a sora, amely a logaritmus függvény használatát mutatja: `log(x, base=exp(1))`. 



\begin{table}

\caption{(\#tab:matfuggvenyek)Az R alapvető matematikai függvényei}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{lll}
\toprule
Függvény & Leírás & Példa\\
\midrule
\cellcolor{gray!6}{\ttfamily{abs(x)}} & \cellcolor{gray!6}{abszolútérték függvény} & \cellcolor{gray!6}{\ttfamily{abs(-1)}}\\
\ttfamily{sign(x)} & előjel függvény & \ttfamily{sign(pi)}\\
\cellcolor{gray!6}{\ttfamily{sqrt(x)}} & \cellcolor{gray!6}{négyzetgyök függvény} & \cellcolor{gray!6}{\ttfamily{sqrt(9+16)}}\\
\ttfamily{exp(x)} & exponenciális függvény & \ttfamily{exp(1)}\\
\cellcolor{gray!6}{\ttfamily{log(x,base=exp(1))}} & \cellcolor{gray!6}{logaritmus függvény} & \cellcolor{gray!6}{\ttfamily{log(exp(3));log(8,10)}}\\
\addlinespace
\ttfamily{log10(x);log2(x)} & 10-es és 2-es alapú logaritmus & \ttfamily{log10(1000);log2(256)}\\
\cellcolor{gray!6}{\ttfamily{cos(x);sin(x);tan(x)}} & \cellcolor{gray!6}{trigonometrikus függvények} & \cellcolor{gray!6}{\ttfamily{cos(pi);sin(0);tan(0)}}\\
\ttfamily{round(x,digits=0)} & kerekítés adott tizedesre & \ttfamily{round(c(1.5,-1.5))}\\
\cellcolor{gray!6}{\ttfamily{floor(x)}} & \cellcolor{gray!6}{x-nél kisebb, legnagyobb egész} & \cellcolor{gray!6}{\ttfamily{floor(c(1.5,-1.5))}}\\
\ttfamily{ceiling(x)} & x-nél nagyobb, legkisebb egész & \ttfamily{ceiling(c(1.5,-1.5))}\\
\addlinespace
\cellcolor{gray!6}{\ttfamily{trunc(x)}} & \cellcolor{gray!6}{x-hez közelebbi egész x és 0 között} & \cellcolor{gray!6}{\ttfamily{trunc(c(1.5,-1.5))}}\\
\bottomrule
\end{tabular}}
\end{table}


Ebből kiolvasható, hogy a `log()` függvénynek 2 argumentuma (más néven paramétere) van. Az elsőt `x`-nek, a másodikat `base`-nek nevezik. A második paraméter alapértelmezett értékkel is rendelkezik, tehát ez a paraméter a hívásnál elhagyható, míg az `x=` argumentum megadása kötelező. A `base=` paraméter értéke könnyen kideríthető az 


```r
exp(1)    #  Euler-féle szám, a természetes logaritmus alapja 
#> [1] 2.718282
```

parancsból. Ezt az irracionális számot a matematikában *e*-vel jelöljük, és Euler-féle számnak nevezzük. Ha nem határozzuk meg a második paramétert, akkor a `log()` függvény természetes alappal (`base=exp(1)`) számítja ki az `x` logaritmusát.

Ezek alapján 2 természetes alapú logaritmusát a 


```r
log(2)    # 2 természetes alapú logaritmusa
#> [1] 0.6931472
```


függvényhívás adja meg. Azt is megtehetjük, hogy felhasználjuk hívásnál az argumentum nevét (`x`), és egy egyenlőségjel (`=`) felhasználásával ezt a 2 elé szúrjuk be.


```r
log(x=2)   # 2 természetes alapú logaritmusa
#> [1] 0.6931472
```

A fenti sor természetesen ugyanúgy a 2 természetes alapú logaritmusát szolgáltatja, csak most explicit módon közöltük, hogy az aktuális paraméterben szereplő 2-es értéket az `x=` nevű formális paraméternek feleltetjük meg. Ez most felesleges gépelést jelentett és általában is elmondhatjuk, hogy matematikai függvények esetében az oly gyakori `x=` argumentumnevet szokás szerint nem írjuk ki a függvényhívás során.

Hívjuk most két argumentummal a `log()` függvényt. A 100 10-es alapú logaritmusát a


```r
log(100, 10)        # 100 10-es alapú logaritmusa
#> [1] 2
```

paranccsal tudhatjuk meg. A függvényhívásnál az `x=` formális argumentum a 100, a `base=` pedig a 10 értéket kapja. Természetesen ezt a hívásnál mi is rögzíthetjük a világosabb értelmezés kedvéért saját magunk számára a


```r
log(100, base=10)    # 100 10-es alapú logaritmusa
#> [1] 2
```

vagy akár


```r
log(x=100, base=10)  # 100 10-es alapú logaritmusa
#> [1] 2
```


formában is.

Arra is lehetőség van, hogy megcseréljük az aktuális paraméterek sorrendjét. A legbiztonságosabb ekkor az összes paraméter nevesítése,



```r
log(base=10, x=100)  # 100 10-es alapú logaritmusa
#> [1] 2
```


de két argumentum esetén így is egyértelmű a hozzárendelés:



```r
log(base=10, 100); log(10, x=100)  # 100 10-es alapú logaritmusa 2x
#> [1] 2
#> [1] 2
```

Ha az argumentumok nevesítése nélkül cseréljük fel az aktuális paramétereket, akkor természetesen nem várt eredményt kapunk, mert a 10 100-as alapú logaritmusa lesz az eredmény.


```r
log(10, 100)  # 10 100-as alapú logaritmusa
#> [1] 0.5
```


Kényelmi lehetőség az aktuális paraméterek elnevezésénél, hogy rövidítéseket is használhatunk, addig csonkolhatjuk az argumentum nevét, amíg az argumentumok egyértelműen azonosíthatók maradnak. Így a példában akár a `b=`-vel is helyettesíthetjük a `base=` argumentumnevet:



```r
log(b=10, 100)   # 100 10-es alapú logaritmusa
#> [1] 2
```


Mint korábban említettük, az `x=` argumentum nem rendelkezik alapértelmezett értékkel, így paraméter nélkül nem hívható a `log()` függvény. 


```r
log()
#> Error: argument "x" is missing, with no default
```

A fenti hibaüzenethez hasonlót láthatunk, ha egy függvényt nem megfelelő számú paraméterrel hívunk. 

Eddig a függvények aktuális paramétereiként csak numerikus konstansokat használtunk, pedig valójában tetszőleges kifejezéseket is megadhatunk. A függvény hívása előtt ezek kiértékelődnek és a hívás során ezek az értékek rendelődnek a formális paraméterekhez.


```r
alap <- 10; log(exp(1)); log(exp(4), base=alap); log(2*exp(2), b=alap/2)
#> [1] 1
#> [1] 1.737178
#> [1] 1.673346
```

A fenti példa a következő numerikus konstansokkal történő hívásoknak felel meg:


```r
log(2.718282); log(54.59815, base=10); log(14.77811, base=5)
#> [1] 1
#> [1] 1.737178
#> [1] 1.673346
```

A függvények sokféle csoportja létezik az R-ben, a most látott matematikai függvények osztálya csak egy a sok közül. A következő fejezetekben függvények más csoportjait is megismerjük.

### A kifejezés fogalma

Elérkezett az idő, hogy a kifejezés fogalmát pontosíthassuk: egy konstans, egy objektum vagy egy függvényhívás önmagában kifejezés, de ezek operátorokkal és kerekzárójelekkel helyesen összefűzött sorozata is kifejezés.

Az R nyelv parancsai, vagy más néven utasításai lényegében kifejezések. Az R nyelvben egy parancs végrehajtása lényegében egy kifejezés kiértékelését jelenti, és a legtöbb esetben a kifejezés értékének megjelenítését a konzolban.

A munka során az R értelmező az utasítások egymás utáni kiértékelését végzi. Az utasításokat újsor karakter vagy pontosvessző választhatja el. A szintaktikailag helyes utasítások kiértékelése mindig egy értéket eredményez, ez lesz az utasítás értéke. Még akkor is rendelkezik értékkel az utasításunk, ha az nem jelenik meg a parancssorban, például az értékadó utasítás értéke a jobb oldali kifejezés értéke. Ezért írhatjuk a következő parancsot:


```r
y <- x <- 10
x; y
#> [1] 10
#> [1] 10
```

Amennyiben egy értékadás, mint kifejezés értékét szeretnénk megjeleníteni a konzolban, akkor tegyük kerekzárójelbe a teljes sort:


```r
(x <- 20)
#> [1] 20
```

A kifejezés fogalmának gyakorlásához nézzünk egy példát. A másodfokú egyenlet megoldóképlete segítségével oldjuk meg az $x^{2}–5x+4=0$ egyenletet. Gépeljük be a következő sorokat:


```r
egyutthato.a <- 1
egyutthato.b <- -5
egyutthato.c <- 4
D <- sqrt(egyutthato.b^2-4*egyutthato.a*egyutthato.c) # diszkrimináns
(-egyutthato.b+D)/(2*egyutthato.a)   # 1. gyök
#> [1] 4
(-egyutthato.b-D)/(2*egyutthato.a)   # 2. gyök
#> [1] 1
```

A fenti hat sor mindegyike egy-egy kifejezés. Az első három sorban lévő kifejezéseknek nincs outputja a konzolban, céljuk új objektumok létrehozása, és maguk a kifejezések csupán értékadó operátort, objektumnevet és konstanst tartalmaznak. A negyedik sor kifejezése szintén output nélkül hajtódik végre, és itt is új objektum jön létre, a kifejezés több összetevőt tartalmaz: objektumneveket, függvényhívást, matematikai operátorokat és konstansokat. Az ötödik és hatodik sorban lévő kifejezések értékei a kiértékelés után megjelennek az outputban, és objektumnevekből, matematikai operátorokból, kerekzárójelekből és konstansokból épülnek fel. 

### Összefoglalás {#az-r-nyelv-2-summary}

<div class="rmdsummary">
<p>A függvényobjektumok (vagy röviden függvények) előre definiált utasítások sorozatát hajtják végre, és egy visszatérési értéket szolgáltatnak. A visszatérési érték meghatározását a függvény bemenő paraméterei, az argumentumok is befolyásolják. Minden argumentumnak van neve, és opcionálisan rendelkezhetnek alapértelmezett értékkel is. Az R-rel való munka nem más, mint kifejezések létrehozása és végrehajtása, vagyis kiértékelése. A kifejezés fogalma: egy konstans, egy objektum vagy egy függvényhívás önmagában kifejezés, de ezek operátorokkal és kerekzárójelekkel helyesen összefűzött sorozata is kifejezés. A kifejezések kiértékelése során az eredmény megjelenhet a konzolban, de látható output nélkül is végbemehet a kifejezés végrehajtása.</p>
</div>

### Feladatok {#az-r-nyelv-2-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Tekintsük át az \@ref(tab:matfuggvenyek) táblázat utolsó oszlopában szereplő R függvényeket. Próbáljuk megjósolni a függvények visszatérési értékét. Végezzünk ellenőrzést: gépeljük be, és hajtsuk végre a matematikai függvényeket! Egészítsük ki a begépelt matematikai függvényeket az argumentumok nevével, mindegyik argumentumnak adjunk nevet az \@ref(tab:matfuggvenyek) táblázat első oszlopa alapján! 
1. Az előző feladatban a matematikai függvények gépelése során milyen *RStudio* kényelmi funkciókat fedeztünk fel. Soroljunk fel legalább hármat!
1. Az aranymetszés arányait tartalmazó épületek, képzőművészeti alkotások máig nagy esztétikai értékkel bírnak. Határozzuk meg ezt az arányt a $\phi=\frac{1+\sqrt{5}}{2}$
 képlet segítségével! Egy A/4-es oldalra kb. 47 sort írhatunk 12-es betűmérettel, és kb. 35 sort 16-os betűmérettel. Egy üres lap hanyadik sorába írnánk címet 12-es és 16-os betűméret esetén? Próbáljuk ki mindezt egy szövegszerkesztőben is! 
1. A trigonometrikus függvények argumentumában radinánban kell megadni a szög értékét, és nem fokban. Ezt figyelembe véve határozzuk meg a 0, 30, 45, 60, 90 és 180 fok szinuszát, koszinuszát és tangensét!
  
  </div>\EndKnitrBlock{rmdexercise}



## Adatszerkezetek

\BeginKnitrBlock{rmdlevel1}<div class="rmdlevel1">
Ebben a fejezetben:
  
* áttekintjük a numerikus, karakteres és logikai konstansok írását,
* a vektor, mátrix, faktor, lista, és adattábla adatszerkezeteket,
* ezek kezelését, indexelését, tesztelését és konvertálását.
</div>\EndKnitrBlock{rmdlevel1}


Kezdünk egyre mélyebre ásni az R nyelvben. Megismertük már az adatobjektum, függvény és kifejezés fogalmát. Ezek birtokában már bátran belevághatunk könyvünk kulcsfontosságú fejezetébe, az adatszerkezetek tanulmányozásába. Legyünk alaposak az itt szereplő témakörök áttekintésében, és lehetőleg oldjunk meg minden kitűzött feladatot. Később ez sokszorosan megtérül.

Minden statisztikai programcsomag adatokkal dolgozik. Az R-ben nevekkel ellátott objektumokban tároljuk ezeket az adatokat. Lényegében minden tevékenység ezen objektumok létrehozása, módosítása és lekérdezése köré csoportosítható. Ezeket a műveleteket az R-ben az operátorok és függvények képviselik. Láttuk, adatokból (objektumokból), operátorokból és függvényekből kifejezéseket építünk, és hajtunk végre -- így foglalható össze minden egyes tevékenység az R-ben. 

Ebben a fejezetben a kifejezések adat részére összpontosítunk, hiszen minden adatelemzési munka kiinduló pontja maga az adat. Eddig csak számszerű (numerikus) adatokkal találkoztunk, és azok közül is csak az egész számok leírására fókuszáltunk. Adatfeldolgozási folyamatainkban a mért adatok azonban a numerikus mellett karakteres formában is előfordulnak, valamint az R-ben egy harmadik adattípus, a logikai is fontos szerepet kap. Összefoglalva, három R alaptípus lesz fontos számunkra az adatfeldolgozás során:

* *numerikus* típus, amely lehet *double* vagy *integer*, attól függően, hogy tizedestörteket vagy egész számokat szeretnénk tárolni,
* *karakteres* típus, amelyek nem egyetlen karaktert, hanem egy karaktersorozatot vagy más néven sztringet jelentenek,
* *logikai* típus, amely az adatszerkezetek manipulációja során jut nagyon fontos szerephez.

A továbbiakban megismerjük, hogyan adhatjuk meg az R számára a fenti típusokba tartozó értékeket, illetve ezek felhasználásával, hogyan tudunk bonyolultabb adatszerkezeteket, összetett típusokat létrehozni.


### Konstansok

Mért adatokat közvetlenül az R-be konstansok segítségével írhatunk be. A konstansok olyan objektumoknak is tekinthetők, amelyeknek nincs nevük, csak értékük, és azt nem is tudjuk megváltoztatni. Ha Péter 18 éves, akkor azt a `18` leírásával közölhetjük az R-rel, és ez nem is jelenthet mást (nem lehet más az értéke), mint 18. A már említett három egyszerű típusnak megfelelően tekintsük át a numerikus, karakteres és logikai konstansokat.

#### Numerikus konstansok

A numerikus konstansok többféle alakban is megjelenhetnek az R-ben. Az *integer* szóval az egész számok tárolását végző konstansra hivatkozunk, a *double* konstansok pedig törtrészt is tartalmazhatnak, de ez nem kötelező. Ha nem érdekes, hogy a szám *integer* vagy *double*, akkor egyszerűen a numerikus (R-ben *numeric*) elnevezést használjuk.


\begin{table}

\caption{(\#tab:numkonstansok)Numerikus konstansok írása}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{ll}
\toprule
Numerikus konstans formája & Leírás\\
\midrule
\cellcolor{gray!6}{\ttfamily{1, -1, 2, 100, 3.5, .4}} & \cellcolor{gray!6}{pozitív és negatív double számok}\\
\ttfamily{1L, -1L, 2L, 100L} & pozitív és negatív integer számok az ’L’ utótaggal\\
\cellcolor{gray!6}{\ttfamily{1.2e3, 3e+4, .6e-2, 4e1L}} & \cellcolor{gray!6}{exponenciális alakú double és integer számok}\\
\ttfamily{0xef, 0XF01, -0xEf03, 0xd1L} & hexadecimális double és integer számok\\
\bottomrule
\end{tabular}}
\end{table}


Az \@ref(tab:numkonstansok) táblázatban látható, hogy *integer* értékek írásához szükséges az `L` utótag használata, egyébként *double*-ként kezeli az R a számot, még akkor is ha nem adtunk meg törtrészt. 

Fontos szabály, hogy a tizedesvessző alakja az R-ben a pont. A nulla egészrészű tizedestörtek esetében az értéktelen nullát elhagyhatjuk.



```r
0.04; .04; -.04 # utóbbi egy negatív szám, a nulla egészrész megadása nélkül
#> [1] 0.04
#> [1] 0.04
#> [1] -0.04
```

Használhatunk az R-ben exponenciális alakú és hexadecimális (16-os számrendszerű) számokat is.


```r
12e3; 12E+3; 12e-3; 0xa2e; 0Xa2e
#> [1] 12000
#> [1] 12000
#> [1] 0.012
#> [1] 2606
#> [1] 2606
```

Az exponenciális alakú számokat `e` vagy `E` karakter vágja ketté, egy bal oldali és egy jobb oldali részre. Az exponenciális alakú szám értéke: a bal oldali rész szorozva 10 annyiadik hatványával, mint amennyi a jobb oldali rész. Érdemes időt szentelni az exponenciális alakú számok értelmezésére, mert az R outputokban gyakran előfordulnak: a szám előjelét a bal oldali rész előjele dönti el, viszont a nagyságrendjét a jobb oldali szám nagyságrendje és előjele együtt határozza meg.

Az exponenciális alakú számok nagy előnye, hogy a nagyon kis, illetve nagyon nagy számok nagyságát jobban meg tudjuk ítélni, és persze az ilyen alakú számok leírásánál helyet is megtakarítunk.



```r
0.0000000000000000000000000016726         # proton tömege (kg)
#> [1] 1.6726e-27
0.00000000000000000000000000000091093822  # elektron tömege (kg)
#> [1] 9.109382e-31
100000000        # ennyi fele kell figyelni egy diáknak (százmillió)
#> [1] 1e+08
5970000000000000000000000                 # A Föld tömege (kg)
#> [1] 5.97e+24
```

Az R automatikusan exponenciális alakra vált túl kicsi vagy túl nagy számok konzolbeli megjelenítésénél. Ezt a viselkedést az R egyik globális opciójának beállításával tudjuk némileg szabályozni. A globális opciókat az `options()` függvénnyel tudjuk állítani az R-ben (`?options`), amelyben most a `scipen=` paramétert kell megadnunk. Minél nagyobb pozitív értéket adunk meg, annál jobban törekszik az R a számok fix alakú megjelenítésére, negatív érték megadásánál pedig ugyanez igaz az exponenciális alakra. 


```r
options(scipen= 0)       # az alapértelmezés
0.0000001                # túl kicsi: exponenciális lesz
#> [1] 1e-07
123                      # marad fix alakú 
#> [1] 123
100000000                # túl nagy: exponenciális lesz
#> [1] 1e+08
options(scipen=-8); 0.0000001; 123; 100000000 # exponenciális lesz mind
#> [1] 1e-07
#> [1] 1.23e+02
#> [1] 1e+08
options(scipen= 8); 0.0000001; 123; 100000000 # fix lesz mind
#> [1] 0.0000001
#> [1] 123
#> [1] 100000000
options(scipen= 0)       # az alapértelmezés visszaállítása
```

A 16-os számrendszerű számok írásához a `0-9` és a kis `a-f` vagy nagy `A-F` betűket használhatjuk fel. A hexadecimális számokat a `0x` vagy `0X` előtag vezeti be.

Aritmetikai műveleteinkben rendszerint double típusú számokat, 10-es számrendszerben és fix (nem exponenciális) alakban használunk. De ettől bármikor eltérhetünk: 


```r
12L + -3.04 + 3.4e2 + -0x1af  # számok 4 különböző formában
#> [1] -82.04
```

A számok megjelenését a konzolban még egy globális opció befolyásolja. A `digits` megszabja, hány értékes jegyre pontosan jelenjenek meg a számaink a konzolban. Lehetséges értékei az 1-22 tartományba esnek, alapértelmezés szerint 7 az értéke. A beállított érték csak egy ajánlás az R számára, és főképp tizedestörtek esetén okozhat meglepetést, ha túl kicsire állítjuk a `digits` értékét.


```r
options(digits = 1); 12.36
#> [1] 12
options(digits = 2); 12.36
#> [1] 12
options(digits = 3); 12.36
#> [1] 12.4
options(digits = 4); 12.36
#> [1] 12.36
options(digits = 7)        # alapértelmezés visszaállítása
```

Természetesen objektumokat is létrehozhatunk a numerikus értékek tárolására, ahogyan korábban már láttuk. Az objektum típusa a konstans típusával fog megegyezni:


```r
peter.magassaga <- 181                                  # double objektum
peter.sulya     <- 72L                                  # integer objektum
peter.bmi       <- peter.sulya /(peter.magassaga/100)^2 # double objektum
```


#### Karakteres konstansok

Az R-ben a karakteres konstans (vagy más néven sztring vagy karaktersorozat) speciális karakterekkel határolt, tetszőleges karaktereket tartalmazó sorozat. A karakteres konstans tehát nem egyetlen karaktert jelent tipikusan, hanem többet. Három módszerrel adhatunk meg karakteres konstanst:


```r
"Látni távol kis falucska tornyát."
#> [1] "Látni távol kis falucska tornyát."
'Látni távol kis falucska tornyát.'
#> [1] "Látni távol kis falucska tornyát."
r"(Látni távol kis falucska tornyát.)"
#> [1] "Látni távol kis falucska tornyát."
```

Karakteres konstansok készítésekor a tetszőleges karaktersorozatunkat dupla (`"`) vagy egyszeres (`'`) idézőjellel kell körbevennünk, de az R 4.0.0-ás verziójától az `r"(tetszőleges_karaktersorozat)"` forma is elérhetővé vált. Láthatjuk, hogy az R a dupla idézőjelet részesíti előnyben az output megjelenítése során.

Egy karakteres konstans tetszőleges karaktert (betűt, számjegyet, írásjeleket, szóközt stb.) tartalmazhat, egyedül azt a határolójelet kell elkerülnünk, amelyet az illető karakteres konstans létrehozásánál használtuk.  

A karakteres konstansok tartalmazhatnak ún. escape szekvenciákat, olyan backslash jellel (`\`, fordított perjel) kezdődő karaktersorozatokat, amelyeket speciálisan értelmez az R. A legfontosabb escape szekvenciákat és jelentésüket az \@ref(tab:escapes) táblázat tartalmazza.


\begin{table}

\caption{(\#tab:escapes)Néhány escape szekvencia}
\centering
\begin{tabular}[t]{ll}
\toprule
Escape szekvencia & Jelentése\\
\midrule
\cellcolor{gray!6}{\ttfamily{\textbackslash{}t}} & \cellcolor{gray!6}{tabulátor}\\
\ttfamily{\textbackslash{}r} & kocsi vissza karakter\\
\cellcolor{gray!6}{\ttfamily{\textbackslash{}n}} & \cellcolor{gray!6}{új sor karakter}\\
\ttfamily{\textbackslash{}"} & dupla idézőjel\\
\cellcolor{gray!6}{\ttfamily{\textbackslash{}'}} & \cellcolor{gray!6}{szimpla idézőjel}\\
\addlinespace
\ttfamily{\textbackslash{}\textbackslash{}} & backslash karakter\\
\bottomrule
\end{tabular}
\end{table}


Természetesen, karakteres objektumokat is létrehozhatunk.


```r
nev <- 'Zsolt'; foglalkozas <- "festő"; lakohely <- r"(Érd)"
nev; foglalkozas; lakohely
#> [1] "Zsolt"
#> [1] "festő"
#> [1] "Érd"
```

Karakteres operátor az R-ben nincs, de számos karakterkezelő függvény segíti a sztringek kezelését (\@ref(tab:karfuggvenyek) táblázat).


\begin{table}

\caption{(\#tab:karfuggvenyek)Néhány karakterkezelő függvény}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{lll}
\toprule
Függvény & Leírás & Példa\\
\midrule
\cellcolor{gray!6}{\ttfamily{paste();paste0(sep="")}} & \cellcolor{gray!6}{sztringek összefűzése} & \cellcolor{gray!6}{\ttfamily{paste("a","b",sep="=")}}\\
\ttfamily{nchar(x)} & karakterszrting hossza & \ttfamily{nchar("alma")}\\
\cellcolor{gray!6}{\ttfamily{substr(x,start,stop)}} & \cellcolor{gray!6}{sztring egy része} & \cellcolor{gray!6}{\ttfamily{substr("alma", 3, 5)}}\\
\ttfamily{tolower(x)} & kisbetűsre konvertál & \ttfamily{tolower("Kiss Géza")}\\
\cellcolor{gray!6}{\ttfamily{toupper(x)}} & \cellcolor{gray!6}{nagybetűsre konvertál} & \cellcolor{gray!6}{\ttfamily{toupper("Kiss Géza")}}\\
\addlinespace
\ttfamily{chartr(old,new,x)} & karakterek cseréje & \ttfamily{chartr("it","ál","titik")}\\
\cellcolor{gray!6}{\ttfamily{cat(sep=" ")}} & \cellcolor{gray!6}{kiíratás} & \cellcolor{gray!6}{\ttfamily{cat("alma","fa\textbackslash{}n",sep="")}}\\
\ttfamily{grep();grepl();regexpr()} & részsztringek keresése & \ttfamily{grepl(pattern="lm",x="alma")}\\
\cellcolor{gray!6}{\ttfamily{sub();gsub()}} & \cellcolor{gray!6}{részsztringek cseréje} & \cellcolor{gray!6}{\ttfamily{gsub("lm",repl="nyj",x="alma")}}\\
\bottomrule
\end{tabular}}
\end{table}

#### Logikai konstansok

Az eddigiekben megismert numerikus és karakteres konstansok nagyon sokfélék lehetnek, de ugyanígy a numerikus és karakteres objektumokhoz nagyon sok lehetséges numerikus és karakteres érték rendelhető. A logikai adattípus ezektől lényegesen egyszerűbb típus, mivel összesen két érték tárolására van módunk. Ez a logikai igaz és a logikai hamis érték, amelyek az R nyelvben a `TRUE` és a `FALSE` logikai értékeket jelentik. Az R a logikai értékek írását a `T` és `F` globális változók bevezetésével segíti, ezek induló értéke a `TRUE` és a `FALSE` logikai érték.

Ezeket a logikai konstansokat értékadásban is szerepeltethetjük, így logikai objektumokat hozhatunk létre.


```r
fiu <- TRUE; van.kocsija <- FALSE; hazas <- T
fiu; van.kocsija; hazas
#> [1] TRUE
#> [1] FALSE
#> [1] TRUE
```

Logikai értékeket vagy objektumokat relációs operátorok segítségével is létrehozhatunk (\@ref(tab:reloperatorok) táblázat).

\begin{table}

\caption{(\#tab:reloperatorok)Relációs operátorok}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{llll}
\toprule
Operátor formája & Művelet & Példa & Példa értéke\\
\midrule
\cellcolor{gray!6}{\ttfamily{<}} & \cellcolor{gray!6}{kisebb} & \cellcolor{gray!6}{\ttfamily{1<2;"alma"<"körte"}} & \cellcolor{gray!6}{\ttfamily{TRUE TRUE}}\\
\ttfamily{>} & nagyobb & \ttfamily{3>(1+2);"abc">"ab"} & \ttfamily{FALSE TRUE}\\
\cellcolor{gray!6}{\ttfamily{<=}} & \cellcolor{gray!6}{kisebb egyenlő} & \cellcolor{gray!6}{\ttfamily{1<=-.3;"él"<="elő"}} & \cellcolor{gray!6}{\ttfamily{FALSE TRUE}}\\
\ttfamily{>=} & nagyobb egyenlő & \ttfamily{3/4>=7/9;"aki">="Ági"} & \ttfamily{FALSE TRUE}\\
\cellcolor{gray!6}{\ttfamily{==}} & \cellcolor{gray!6}{egyenlő} & \cellcolor{gray!6}{\ttfamily{20==2e1;"Len"=="len"}} & \cellcolor{gray!6}{\ttfamily{TRUE FALSE}}\\
\addlinespace
\ttfamily{!=} & nem egyenlő & \ttfamily{exp(1)!=pi;"Len"!="len"} & \ttfamily{TRUE TRUE}\\
\cellcolor{gray!6}{\ttfamily{\%in\%}} & \cellcolor{gray!6}{tartalmazás} & \cellcolor{gray!6}{\ttfamily{c(8, 12) \%in\% 1:10}} & \cellcolor{gray!6}{\ttfamily{TRUE FALSE}}\\
\bottomrule
\end{tabular}}
\end{table}

Numerikus és karakteres adatok is lehetnek a relációs operátorok bemenő adatai. Numerikus adatok esetén a számok nagysága, karakteres adatok esetén az ábécében elfoglalt hely és a sztringek hossza (lexikografikus sorrend) alapján végzi az R az összehasonlítást. A sztringek lexikografikus összehasonlítása, magyar területi beállítások esetén, a magyar ékezetes karaktereket is helyesen kezeli.

A logikai értékkel visszatérő kifejezéseket (egyszerű) logikai kifejezéseknek nevezzük. Ezekből az egyszerű logikai kifejezésekből a logikai operátorok segítségével összetett logikai kifejezéseket hozhatunk létre (\@ref(tab:logoperatorok) táblázat).

\begin{table}

\caption{(\#tab:logoperatorok)Logikai operátorok}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{llll}
\toprule
Operátor & Művelet & Példa & Példa értéke\\
\midrule
\cellcolor{gray!6}{\ttfamily{!}} & \cellcolor{gray!6}{logikai NEM} & \cellcolor{gray!6}{\ttfamily{!(1<2); !T; !F}} & \cellcolor{gray!6}{\ttfamily{FALSE FALSE TRUE}}\\
\ttfamily{\&} & logikai ÉS & \ttfamily{T \& T; T \& F; F \& T; F \& F} & \ttfamily{TRUE FALSE FALSE FALSE}\\
\cellcolor{gray!6}{\ttfamily{|}} & \cellcolor{gray!6}{logikai VAGY} & \cellcolor{gray!6}{\ttfamily{T | T; T | F; F | T; F | F}} & \cellcolor{gray!6}{\ttfamily{TRUE TRUE TRUE FALSE}}\\
\bottomrule
\end{tabular}}
\end{table}


#### Részösszefoglalás {#az-r-nyelv-3-1-summary}

<div class="rmdsummary">
<p>Az adatfeldolgozás során többnyire számokkal és szövegekkel dolgozunk. Az R a numerikus és a karakteres adatok írásának szabályait pontosan rögzíti. Numerikus konstansok írása a matematikában megszokott módon történik (például <code>12</code>, <code>-24</code>, <code>12e+3</code>, <code>0xabc3</code>), azonban fontos megjegyeznünk, hogy a tizedestörtek esetében pontot kell használnunk az egész és a törtrész elválasztására (például <code>12.34</code>, <code>-0.04</code>, <code>3.12e+12</code>). Karakteres konstansok esetében a következő formákat használhatjuk: <code>"tetszőleges karakterek"</code>, <code>'tetszőleges karakterek'</code>, és <code>r"(tetszőleges karakterek)"</code>. A logikai konstansok az adatmanipuláció során nyújtanak segítséget, két leheséges értékük a logikai igaz és hamis: a <code>TRUE</code>, <code>FALSE</code> vagy rövidebben a <code>T</code>, <code>F</code>.</p>
</div>

#### Feladatok {#az-r-nyelv-3-1-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Mi a hasonlóság a következő három numerikus konstans között: `0xabc`, `2748`, `.2748e4`. 
1. Az R öt előre definiált konstassal rendelkezik (`?Constants`). Írassuk ki ezek értékeit, állapítsuk meg típusukat!
1. Az aranymetszés arányszámát ($\phi=\frac{1+\sqrt{5}}{2}$) írassuk a konzolba legalább 8 tizedes pontossággal!
1. Az `r"(tetszőleges karakterek)"` formájú karakteres konstans megadásnak több válozata is létezik, soroljunk fel még legalább öt lehetőséget (`?Quotes`)! Milyen előnyökkel rendelkezik ez a megadási forma az idézőjelek és a fordított perjel tekintetében? 
1. Helyezzünk el idézőjeleket karakteres konstansokban, mindhárom megadási forma mellett!
1. Próbáljuk ki az \@ref(tab:karfuggvenyek) táblázat karakterkezelő függvényeit! Gépeljük be az utolsó oszlopban lévő példákat, és vizsgáljuk meg a függvények visszatérési értékét.
1. Próbáljuk ki az \@ref(tab:reloperatorok) táblázat relációs operátorait! Gépeljük be a példákat és ellenőrizzük az eredményeket.
1. A logikai operátorok működéséről teljes képet kaphatunk az \@ref(tab:logoperatorok) táblázatból. Próbáljuk ki ezeket a parancsokat is!

</div>\EndKnitrBlock{rmdexercise}


### Adatszerkezetek áttekintése

Az előző fejezetben láttuk, hogy az R-ben leírható értékek alapvetően 4 típusba sorolhatók. Ezek a *double*, az *integer*,  a *karakteres* és a *logikai* alaptípusok. Ezen értékek felhasználásával nagyon egyszerűen tudunk objektumokat létrehozni. Ezek az objektumok, mindjárt látjuk, az R legalapvetőbb adatszerkezetének, a *vektor*nak az egyelemű változatai. 


```r
obj.double     <- 12.03
obj.integer    <- 12L
obj.karakteres <- "Péter"
obj.logikai    <- TRUE
```

A fenti objektumok típusa rendre *double*, *integer*, *karakteres* és *logikai*. Ezt könnyen ellenőrizhetjük a `typeof()` vagy `class()` függvényekkel. A `typeof()` az objektum alaptípusát adja meg, a `class()` pedig inkább az R objektum-orientált lehetőségeihez kapcsolódó függvény, de a fenti objektumok esetében nagyon hasonló eredményt szolgáltat, és a későbbiek során is sokat fogjuk használni. Egyedül a *double* objektumokok esetén tér el a visszatérési értéke, `class()` ugyanis ekkor a `numeric` outputot adja.


```r
typeof(obj.double);     class(obj.double)
#> [1] "double"
#> [1] "numeric"
typeof(obj.integer);    class(obj.integer)
#> [1] "integer"
#> [1] "integer"
typeof(obj.karakteres); class(obj.karakteres)
#> [1] "character"
#> [1] "character"
typeof(obj.logikai);    class(obj.logikai)
#> [1] "logical"
#> [1] "logical"
```

Az adatelemzési problémáink megoldásához egyszerre több adatérték feldolgozására van szükséges. Mivel az R nyelvet statisztikai adatfeldolgozásra tervezték, így nem csodálkozhatunk azon, ha több értéket is el tudunk tárolni egymás utáni memóriahelyeken a fenti 4 alaptípusból (*double*, *integer*, *karakteres* és *logikai*). Ezt többféleképp megtehetjük, például egy vagy több dimenzió mentén, illetve keverhetjük a típusokat vagy ragaszkodhatunk az azonos típusba tartozó értékek egymásutánjához. Ennek megfelelően több különböző R adatszerkezettel kell számolnunk. Ebben a fejezetben az R leggyakrabban használt adatszerkezetit tekintjük át. Most felsoroljuk és jellemezzük őket:

* *vektor* - Azonos alaptípusú értékeket egymás után sorolunk fel, egy dimenzó mentén.
* *mátrix* - Azonos alaptípusú értékekből egy kétdimenziós szerkezetet hozunk létre, amelynek vannak sorai és oszlopai.
* *faktor* - Integer értékeket egymás után teszünk, egy dimenzió mentén, de megadjuk, hogy melyik szám milyen címkét jelöl.
* *lista* -  Tetszőleges típusú objektumokat egymás után sorolunk fel, egy dimenzió mentén.
* *adattábla* - Tetszőleges típusú, de azonos elemszámú objektumokat egymás után sorolunk fel. Tipikusan azonos hosszúságú vektorokat vagy faktorokat teszünk egymás mellé, és így egy kétdimenziós szerkezetet kapunk, amelynek vannak sorai és oszlopai.

Az \@ref(fig:adatszerkezetek-1) ábra összefoglalja az adatszerkezetek fenti tulajdonságait. Beszélünk numerikus (double vagy integer), karakteres és logikai vektorokról, melyek egydimenziósak és homogének, azaz azonos típusú adatokat tartalmaznak. Ugyanez igaz a mátrixokra, csak két dimenzióban, sorokkal és oszlopokkal. A faktor egy integer vektor (azaz egydimenziós és homogén), azonban külön nyilvántartást vezet arról, hogy az egyes integer értékeknek milyen címke felel meg. Az adattábla lesz a legfontosabb adatszerkezet számunkra: kétdimenziós, de oszlopai homogének, hiszen ezek vektorok (numerikus, karakteres vagy logikai) vagy faktorok lehetnek. A lista a legszabadabb adatszerkezet, egydimenziós, de elemei bármilyen adtszerkezethez tartozhatnak. Például az \@ref(fig:adatszerkezetek-1) ábrán egy 8 elemű lista jelenik meg, amelynek első eleme egy numerikus vektor, utolsó eleme pedig egy adattábla. 

<div class="figure" style="text-align: center">
<a href="" target="_blank"><img src="images/adatszerkezetek_abra.png" alt="Az R legfontosabb adatszerkezetei" width="85%" /></a>
<p class="caption">(\#fig:adatszerkezetek-1)Az R legfontosabb adatszerkezetei</p>
</div>


Az \@ref(tab:adatszerkezetek) táblázatban más szempontból mutatjuk be az adatszerkezeteket: példát mutatunk adott típusú (adatszerkezetű) objektumok létrehozására, és közöljük, hogy a `typeof()` és a `class()` milyen outputot szolgáltat az így létrehozott objektumok esetében.

\begin{table}

\caption{(\#tab:adatszerkezetek)Adatszerkezetek}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{llll}
\toprule
Adatszerkezet & Létrehozó parancs & typeof(x) & class(x)\\
\midrule
\cellcolor{gray!6}{double vektor} & \cellcolor{gray!6}{\ttfamily{c(12, 14)}} & \cellcolor{gray!6}{\ttfamily{double}} & \cellcolor{gray!6}{\ttfamily{numeric}}\\
integer vektor & \ttfamily{c(12L, 14L)} & \ttfamily{integer} & \ttfamily{integer}\\
\cellcolor{gray!6}{karakteres vektor} & \cellcolor{gray!6}{\ttfamily{c('a','az','egy')}} & \cellcolor{gray!6}{\ttfamily{character}} & \cellcolor{gray!6}{\ttfamily{character}}\\
logikai vektor & \ttfamily{c(T, TRUE,FALSE,F)} & \ttfamily{logical} & \ttfamily{logical}\\
\cellcolor{gray!6}{double mátrix} & \cellcolor{gray!6}{\ttfamily{matrix(1.3,nrow=2,ncol=3)}} & \cellcolor{gray!6}{\ttfamily{double}} & \cellcolor{gray!6}{\ttfamily{matrix array}}\\
\addlinespace
integer mátrix & \ttfamily{matrix(1L,nrow=2,ncol=3)} & \ttfamily{integer} & \ttfamily{matrix array}\\
\cellcolor{gray!6}{karakteres mátrix} & \cellcolor{gray!6}{\ttfamily{matrix('az',nrow=2,ncol=3)}} & \cellcolor{gray!6}{\ttfamily{character}} & \cellcolor{gray!6}{\ttfamily{matrix array}}\\
logikai mátrix & \ttfamily{matrix(F,nrow=2,ncol=3)} & \ttfamily{logical} & \ttfamily{matrix array}\\
\cellcolor{gray!6}{faktor} & \cellcolor{gray!6}{\ttfamily{factor(c('D','D','ND'))}} & \cellcolor{gray!6}{\ttfamily{integer}} & \cellcolor{gray!6}{\ttfamily{factor}}\\
lista & \ttfamily{list(A='Pék',B=1:2)} & \ttfamily{list} & \ttfamily{list}\\
\addlinespace
\cellcolor{gray!6}{adattábla} & \cellcolor{gray!6}{\ttfamily{data.frame(id=c('a','b'),pont=c(4,9))}} & \cellcolor{gray!6}{\ttfamily{list}} & \cellcolor{gray!6}{\ttfamily{data.frame}}\\
\bottomrule
\end{tabular}}
\end{table}


<!-- 



-->

A következő alfejezetekben részletesen áttekintjük a *vektor*, a *mátrix*, a *faktor*, a *lista* és az *adattábla* adatszerkezeteket, ugyanis ezek töltik be a legfontosabb szerepet az adatelemzések során. Mindegyik esetben megvizsgáljuk:

* hogyan hozhatjuk létre az adott adatszerkezetű objektumot,
* hogyan tesztelhetjük, hogy az adott típusú objektumról van-e szó,
* hogyan konvertálhatunk más adatszerkezetekből ilyen típusú objektumot,
* milyen műveletekben vehet részt,
* hogya érhetjük el az objektum részeit, azaz hogyan indexelhetjük az objektumokat.

#### Részösszefoglalás {#az-r-nyelv-4-summary}

<div class="rmdsummary">
<p>A különböző típusú konstansokat objektumok létrehozására használhatjuk fel. A statisztikában egy objektumok értéke több konstas egymásutánja. A legegyszerűbb adatszerkezet az R-ben a <em>vektor</em>, amelyben tetszőlegesen sok, azonos típusú értéket helyezhetünk el egy dimenzió mentén. A <em>faktor</em> és a <em>lista</em> is egydimenziós, míg a <em>mátrix</em> és az <em>adattábla</em> kétdimenziós. A <em>faktor</em> integer vektor, amelyben a számoknak címkéket feleltetünk meg. A <em>lista</em> elemi tetszőleges típusúak lehetnek. A <em>mátrix</em> ugyanúgy homogén, minta a <em>vektor</em> és a <em>faktor</em>. Az <em>adattábla</em> felfogható azonos elemszámú vektorok/faktorok listájának.</p>
</div>

#### Feladatok {#az-r-nyelv-4-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Próbáljuk ki az \@ref(tab:adatszerkezetek) táblázatban szereplő példákat. Hozzuk létre a különböző típusú objektumokat és vizsgáljuk meg a `typeof()` és `class()` függvényekkel az objektumok típusát.

</div>\EndKnitrBlock{rmdexercise}

### Vektor

Az R legalapvetőbb adatszerkezete a *vektor*. A vektort egymás melletti (vagy alatti) cellákban tárolt értékek sorozataként képzelhetjük el (\@ref(fig:adatszerkezetek-1) ábra), mely értékek mindegyike azonos típusú. Így azt mondhatjuk, hogy a vektor azonos típusú (egynemű, homogén) adatok egydimenziós együttese. A vektor fontos jellemzője, hogy homogén, tehát a vektort alkotó értékek vagy kizárólag *integer*, vagy kizárólag *double*, vagy kizárólag *karakteres*, vagy kizárólag *logikai* típusúak lehetnek.

####  Vektor létrehozása

Vektort legegyszerűbben a `c()` függvénnyel hozhatunk létre, az argumentumlistában egymás felsoroljuk a vektort alkotó értékeket. *Double* vektort hozhatunk létre például, ha a paraméterben numerikus konstansokat sorolunk fel:


```r
v.d <- c(2, 4, 6, 8); v.d  # numerikus (double) vektor létrehozása
#> [1] 2 4 6 8
```

A `v.d` objektum egy 4 elemű *double* vektor. Az első eleme a 2, a második eleme a 4, a harmadik a 6 és a negyedik egyben utolsó eleme a 8. A vektor elemei szóközökkel elválasztva jelennek meg a konzolban.

Karakteres vektort hasonlóan hozhatunk létre, a `v.k` vektor 3 elemű lesz.


```r
v.k <- c("erős", 'közepes', "gyenge"); v.k # karakteres vektor létrehozása
#> [1] "erős"    "közepes" "gyenge"
```

Egy logikai vektor csak logikai konstansokat tartalmazhat (`TRUE` vagy `FALSE`, illetve a `T` és `F` rövidebb változatot is használhatjuk):


```r
v.l <- c(TRUE, FALSE, T); v.l  # logikai vektor létrehozása
#> [1]  TRUE FALSE  TRUE
```

A `v.d`, `v.k` és `v.l` objektum egy-egy példa az R különböző típusú vektoraira. Az objektumok fontos jellemzője az objektum hossza, ami vektorok esetén a vektort alkotó elemek számát jelenti. Ezt a `length()` függvénnyel kérdezhetjük le.


```r
length(v.d); length(v.k); length(v.l)  # vektor hossza
#> [1] 4
#> [1] 3
#> [1] 3
```

A vektor hosszát létrehozása után is módosíthatjuk, szintén a `length()` függvényt használjuk, de az értékadás bal oldalán.
 

```r
length(v.l) <- 5  # vektor hosszának módosítása
```

A `v.l` logikai vektor most már 5 elemű lesz:


```r
v.l
#> [1]  TRUE FALSE  TRUE    NA    NA
```

Mivel nem adtuk meg a 4. és 5. elemét, így az `NA` lesz, ami a *hiányzó érték* jele az R-ben. Az `NA` minden vektornak eleme lehet, a vektor típusától függetlenül.


```r
v.i <- c(12L, NA, 15L)  # 3 elemű integer vektor; a 2. eleme nem ismert
```

Térjünk vissza a vektorok létrehozásához. A `c()` függvény paraméterébe természetesen konstansok helyett tetszőleges kifejezéseket is írhatunk:


```r
szamok <- c(1, (2+3)*4, 1/4, .5^3);        szamok
#> [1]  1.000 20.000  0.250  0.125
nevek  <- c("Péter", paste0('Zso', "lt")); nevek
#> [1] "Péter" "Zsolt"
iteletek <- c(T, 1<2, 2==3);               iteletek
#> [1]  TRUE  TRUE FALSE
```

A vektorok esetében a homogenitás központi szerepet játszik. Az R abban az esetben sem fog különböző típusú elemekből vektort létrehozni, ha ezeket egyetlen `c()` függvényhívásban szerepeltetjük. Ekkor automatikus típuskonverzió történik. Nézzük ezeknek az eseteit:


```r
eset.1 <- c(2,4,"6",8);    eset.1
#> [1] "2" "4" "6" "8"
eset.2 <- c(T, FALSE,"6"); eset.2
#> [1] "TRUE"  "FALSE" "6"
eset.3 <- c(T, FALSE, 3);  eset.3
#> [1] 1 0 3
```

Amennyiben karakteres konstans szerepel az elemek között, a vektor karakteres típusú lesz. Ha numerikus és logikai értéket sorolunk fel, akkor a vektor numerikus lesz, azzal a kiegészítéssel, hogy a `TRUE` logikai érték 1-re, a `FALSE` pedig 0-ra konvertálódik.

További lehetőség a `c()` függvény használata során, hogy a paraméterben vektort is szerepeltethetünk. Ekkor ezek az elemek is szerepelni fognak az eredményvektorban:


```r
regi.v.1 <- c(1, 2, 3)
regi.v.2 <- c(7, 8, 9)
uj.v <- c(0, regi.v.1, 4, 5, 6, regi.v.2, 10, c(11, 12)); uj.v
#>  [1]  0  1  2  3  4  5  6  7  8  9 10 11 12
```

A fenti példában létrehozott `uj.v` 13 elemű numerikus vektor összerakásához felhasználtunk két 3 elemű vektort és egy kételemű vektort is.


Vektorok létrehozása során még egy érdekes lehetőségről érdemes szót ejteni. A `c()` függvényben a vektor egyes elemeit elnevezhetjük, és ezek a nevek az outputban is meg fognak jelenni. Az elemek elnevezéséhez írjünk egy nevet és egy egyenlőségjelet az argumentumként használt elem elé. Ha a név nem egyetlen szó (vagyis tartalmaz szóközt), akkor a karakterkonstansok megadásánál látott három módszer valamelyikét használhatjuk (tehát a dupla és szimpla idézőjeleket és az `r"()"` konstrukciót), vagy a backtick (`) szimbólumot. Ezzel a módszerrel például a naponta tanulással töltött időnket úgy rögzíthetjük, hogy az output "beszédesebb" lesz, több információt tartalmaz. 


```r
tan.ido <- c(Hétfő=35, Kedd=95); tan.ido
#> Hétfő  Kedd 
#>    35    95
tan.ido <- c(Hétfő=35, "Kedd délelőtt"=50, `Kedd délután`=45); tan.ido
#>         Hétfő Kedd délelőtt  Kedd délután 
#>            35            50            45
```

A vektorelemek nevei lekérdezhetők a `names()` függvénnyel. Amennyiben   értékeadás bal oldalán szerepeltetjük, a vektor elemneveit módosítani tudjuk. 


```r
names(tan.ido)                         # elemnevek lekérdezése
#> [1] "Hétfő"         "Kedd délelőtt" "Kedd délután"
names(tan.ido) <- c("H", "K.1", "K.2") # elemnevek módosítása
tan.ido
#>   H K.1 K.2 
#>  35  50  45
```


#### Szabályos vektorok létrehozása {#szabalyosvektorokalfejezet}

Ha egy vektor elemi szabályos rendben követik egymást, akkor szabályos vektorokról beszélünk. Ilyen lehet például a következő három numerikus vektor és két karakteres vektor.


```r
c(1, 2, 3, 4, 5); c(1, 3, 5, 7); c(1, 1, 1, 2, 2, 2)
c("férfi", "nő", "férfi", "nő"); c("f.1", "f.2", "f.3")
```

Szabályos numerikus vektorokat hozhatunk létre a kettőspont (`:`) operátorral vagy a `seq()` függvénnyel. Az így létrehozott vektorok ugyanis valamilyen számtani sorozat egymást követő elemei, vagyis az egymás mellett lévő elemek különbsége állandó.

A legegyszerűbb vektorlétrehozási mód a kettőspont (`:`) operátor, ahol az egymást követő elemek távolsága 1 vagy -1. Általános alakja: `start:stop`.


```r
1:10
#>  [1]  1  2  3  4  5  6  7  8  9 10
10:1
#>  [1] 10  9  8  7  6  5  4  3  2  1
-1.5:5
#> [1] -1.5 -0.5  0.5  1.5  2.5  3.5  4.5
10.5:3
#> [1] 10.5  9.5  8.5  7.5  6.5  5.5  4.5  3.5
```

Látható, hogy az így létrehozott vektorok lehetnek csökkenő vagy növekvő rendezettségűek, valamint tört értékeket is használhatunk operandusként. A sorozat nem feltétlenül a kettőspont utáni értékig tart, mindössze annyi igaz, hogy a sorozat vége a `stop` értéknél mindig kisebb egyenlő (vagy nagyobb egyenlő, csökkenő sorozat esetén).

Hosszabb numerikus vektorokat is könnyűszerrel létrehozhatunk. A `101:140` parancs hatására 40 elemet hozunk létre. Hosszabb vektorok outputjában könnyebben el tudunk igazodni a sorok elején lévő `[x]` konstrukció segítségével: minden sorban a sor első eleme a vektor `x.` eleme. A lenti otputban szereplő `[17]` például azt mutatja, hogy a sor elején lévő 117 a 40 elemű vektor 17. eleme.



```r
101:140
#>  [1] 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116
#> [17] 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132
#> [33] 133 134 135 136 137 138 139 140
```


A `seq()` függvény nagyobb szabadságot ad a numerikus sorozatok generálására. Legegyszerűbb használata esetén a kettőspont (`:`) operátort kapjuk vissza:


```r
seq(1, 10)
#>  [1]  1  2  3  4  5  6  7  8  9 10
```

A `seq()` függvény használatához négy argumentum nevét és jelentését kell megtanulnunk: a `from=` a sorozat első elemét határozza meg, a `to=` az utolsó elemet, a `by=` a lépésközt és a `length.out=` a létrehozandó vektor elemeinek a számát. A négy paraméterből három megadása már egyértelműen azonosítja a kívánt vektort:


```r
seq(from=1, to=10, by=2)
#> [1] 1 3 5 7 9
seq(from=1, to=10, length.out=5)
#> [1]  1.00  3.25  5.50  7.75 10.00
seq(to=10, by=1.3, length.out=5)
#> [1]  4.8  6.1  7.4  8.7 10.0
seq(from=1, by=1.3, length.out=5)
#> [1] 1.0 2.3 3.6 4.9 6.2
```

A `seq_along()` függvénnyel szintén tudunk 1-től induló, 1-es lépésközű sorozatot alkotni, amelynek utolsó értéke, a paraméterben megadott vektor elemszáma.


```r
x <- c("Hétfő", "Kedd", "Szerda"); y <- 11:20
seq_along(x)
#> [1] 1 2 3
seq_along(y)
#>  [1]  1  2  3  4  5  6  7  8  9 10
```

Tetszőleges típusú vektor létrehozására használhatjuk a `rep()` függvényt, amely egy létező vektor értékeit ismétli meg. A `rep()` első paramétere az ismétlendő vektor, a `times=` pedig az ismétlések számát adja meg.


```r
rep(2, times=3)
#> [1] 2 2 2
rep(c(2, 0, -2), times=3)
#> [1]  2  0 -2  2  0 -2  2  0 -2
rep("nap", times=3)
#> [1] "nap" "nap" "nap"
rep(c(F, T, T), times=3)
#> [1] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
```

A fenti példában mindenhol háromszor ismételtük meg az első paramétert, méghozzá úgy, hogy az R egymás után sorolta fel őket.

Egy vektor ismétlésének van egy másik esete is, amikor az elemeit sorban egyenként véve végezzük el az ismétlést. Ekkor nem a `times=` paramétert, hanem az `each=` argumentumot kell használnunk a függvény hívásánál.


```r
rep(2, each=3)
#> [1] 2 2 2
rep(c(2, 0, -2), each=3)
#> [1]  2  2  2  0  0  0 -2 -2 -2
rep("nap", each=3)
#> [1] "nap" "nap" "nap"
rep(c(F,T,T), each=3)
#> [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

Látjuk, hogy egyelemű vektorok ismétlése esetén nincs különbség a `times=` és az `each=` paraméterek használata között.

Utolsó esetként elemenként szeretnénk ismételni, de eltérő ismétlésszámmal. Ekkor a `times=` paraméterben a bemenő vektor elemszámával azonos hosszú vektort kell megadni. Ez a vektor tartalmazza az elemek ismétlés számát.


```r
rep(c(2, 3, 4), times=c(1, 2, 3))
#> [1] 2 3 3 4 4 4
rep(c("nap", "part"), times=c(2, 3))
#> [1] "nap"  "nap"  "part" "part" "part"
rep(c(T, F, T), times=c(2, 3, 4))
#> [1]  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
```

Végezetül bemutatjuk, hogy az `each=` és az egyelemű értékkel rendelkező `times=` egyszerre is alkalmazható. Ekkor előszőr a helyben ismétlés (`each=`), majd az így kapott vektor teljes ismétlése következik (`times=`). 


```r
rep(1:5, each=2, times=3)
#>  [1] 1 1 2 2 3 3 4 4 5 5 1 1 2 2 3 3 4 4 5 5 1 1 2 2 3 3 4 4 5 5
```

Szabályos karakteres vektor létrehozására használhatjuk a `paste0()` függvényt. Egy előtaghoz (például `f.`) hozzáfűzhetünk 10 különböző számot, amely így egy 10 elemű karakteres vektort eredményez. 


```r
paste0("f.", 1:10)
#>  [1] "f.1"  "f.2"  "f.3"  "f.4"  "f.5"  "f.6"  "f.7"  "f.8"  "f.9"  "f.10"
```

A `collapse=` argumentum használatával, akár egyetlen karakteres értékbe is összeolvaszthatjuk a fenti elemeket. Az argumentumban az összevonásnál használt elválasztó karaktert adjuk meg.


```r
paste0("f.", 1:10, collapse = "_")
#> [1] "f.1_f.2_f.3_f.4_f.5_f.6_f.7_f.8_f.9_f.10"
```

Az eddigiek összefoglalásaként nézzünk példát különbüző típusú és elemhosszú vektorok létrehozására.


```r
y <- 12L                        # y 1 elemű integer vektor
y <- 12                         # y 1 elemű double
y <- "Bízz magadban!"           # y 1 elemű karakteres
y <- TRUE                       # y 1 elemű logikai
y <- c(23.8, -5)                # y 2 elemű double
y <- c("H", "K")                # y 2 elemű karakteres
y <- c(T, FALSE)                # y 2 elemű logikai
y <- c(1, 2, 3, 4, 5)           # y 5 elemű double
y <- 1:5                        # y 5 elemű integer
y <- seq(from=9, to=100, by=2)  # y 46 elemű double
y <- rep(c("H", "K"), times=10) # y 20 elemű karakteres
z <- seq_along(y)               # z 20 elemű integer
y <- paste0("év.", 2001:2020)   # y 20 elemű karakteres
```


#### A vektoraritmetika szabályai

Amint az előzőekben láttuk, az R rendszer legalapvetőbb adattárolási szerkezete a vektor. Az R egyik legnagyszerűbb tulajdonsága pedig az, ahogyan a vektorokkal műveleteket végezhetünk. Korábban már láttuk, hogyan tudunk összeadni két számot az R-ben. Próbáljunk meg összeadni két 2 elemű vektort:


```r
c(1, 2) + c(3, 4)
#> [1] 4 6
```


A két fenti vektort a parancssorban hoztuk létre a `c()` függvénnyel. Az összeadás eredménye egy 2 elemű vektor. Az eredményvektor az 1+3 és a 2+4 műveletek alapján jött létre, vagyis az összeadás operandusaiban szereplő vektor azonos sorszámú elemeire hajtotta végre a kijelölt műveletet az R.

Két vektor összeadásánál természetesen használhatunk objektumneveket is:


```r
x <- c(1, 2, 3); y <- c(2, 3, 4)
x + y
#> [1] 3 5 7
```

Itt az eredményvektor 3 elemű, és a komponensenkénti műveletvégrehajtás szabályainak megfelelően az 1+2, 2+3 és a 3+4 összeadások eredménye lesz a 3 új elem.

Az összeadás műveletet tetszőleges operátorral felcserélhetjük, használhatjuk az összes aritmetikai, relációs és logikai operátort.



```r
c(1,2) - c(2,3)
#> [1] -1 -1
x <- c(1, 2, 3); y <- c(2, 3, 4)
x-y
#> [1] -1 -1 -1
x*y
#> [1]  2  6 12
x/y
#> [1] 0.5000000 0.6666667 0.7500000
x^y
#> [1]  1  8 81
x==y
#> [1] FALSE FALSE FALSE
x<y
#> [1] TRUE TRUE TRUE
```


A fenti műveletek közül a hatványozás végrehajtása tűnhet kicsit szokatlannak, itt ugyanis egy 3 elemű vektort, mint alapot egy 3 elemű másik vektorra, mint kitevőre emeljük. Ha azonban a komponensenkénti végrehajtás szabályát észben tartjuk, akkor világos, hogy az eredményvektor az 1^2, 2^3 és a 3^4 eredménye.  
A komponensenkénti végrehajtás szabálya a logikai operátorokra is érvényes.


```r
!c(T, T, F, F)
#> [1] FALSE FALSE  TRUE  TRUE
c(T, T, F, F) & c(T, F, T, F)
#> [1]  TRUE FALSE FALSE FALSE
c(T, T, F, F) | c(T, F, T, F)
#> [1]  TRUE  TRUE  TRUE FALSE
```

A vektorok közötti műveletek legegyszerűbb esetét tekintettük át eddig, azaz azonos elemszámú vektorokat adtunk össze vagy vontunk ki egymásból. Ha az operátor két oldalán lévő vektorok elemszáma eltér, akkor az általános szabály az, hogy a rövidebbik vektort az R megismétli mindaddig, míg a hosszabbik vektor elemszámát el nem éri. Ha a rövidebbik vektort nem egész számszor megismételve kapjuk a hosszabb vektor hosszát, akkor figyelmeztetést kapunk az R-től, melyben erre a tényre felhívja a figyelmünket, de a kijelölt műveletet az R ennek ellenére végrehajtja.


```r
c(1, 2)+5
#> [1] 6 7
```

A fenti példában egy 2 elemű és egy 1 elemű vektort adunk össze. A rövidebb vektort még egyszer megismételve már az `c(5, 5)` vektort kapjuk, így a kijelölt összeadás minden fennakadás nélkül végrehajtható. Az eredményvektor az 1+5 és a 2+5 összeadások eredménye lesz.

Most egy 2 elemű és egy 3 elemű vektort adunk össze.


```r
c(1, 2) + c(3, 4, 5)
#> Warning in c(1, 2) + c(3, 4, 5) :
#>   longer object length is not a multiple of shorter object length
#> [1] 4 6 6
```

A rövidebbik vektort még egyszer megismételve a `c(1, 2, 1, 2)` vektort kapjuk, de mivel nincs szükség minden elemére, ezért figyelmeztető üzenetet kapunk. Az eredményvektor az 1+3, 2+4 és a 1+5 összeadások eredménye lesz. A következő példában már nincs figyelmeztetés, hiszen a rövidebb vektort egész számszor, pontosan kétszer kellett megismételni a koordinátánkénti műveletvégrehajtáshoz.


```r
c(1, 2)+c(3, 4, 5, 6)
#> [1] 4 6 6 8
```

Foglaljuk össze a vektoraritmetka szabályait: azonos elemszámú vektorok között az azonos pozícióban lévő vektorelemek között hajtódik végre a kijelölt művelet (vagyis koordinátánkénti végrehajtás történik), különböző elemszámú vektorok esetében pedig először a rövidebbik vektor ismétléssel kiegészül a hosszabbik vektor hosszára, és ezt követi a koordintánkénti végrehajtás.

Az operátorokon túl az \@ref(tab:matfuggvenyek) táblázatban szereplő matematikai függvények is támogatják a vektor paramétert. Ekkor nem egyetlen értékkel térnek vissza, hanem a bemenő vektor minden elemére kiszámolt függvényértékek vektorával.


```r
sqrt(c(4, 9, 16))              # 3 szám négyzetgyöke
#> [1] 2 3 4
log(x=c(1, 10, 100), base=10)  # 3 szám 10-es alapú logaritmusa
#> [1] 0 1 2
x <- 1.3:10; round(x)          # 9 szám egészre kerekítve 
#> [1] 1 2 3 4 5 6 7 8 9
```

#### Függvények vektorokkal

Az előző fejezetben láttuk, hogy a matematikai függvények vektor argumentumot is elfogadnak, és a vektor minden elemére kiszámolják a függvényértéket. Míg a `log(x=16, base=2)` függvényhívás a matematikában megszokot módon egyetlen bemenő értékhez (16) egyetlen kimenő éréket szolgáltat (4), addig az R lehetőségeit jobban kihasználó `log(x = c(1, 2, 4, 8, 16), base=2)` függvényhívás négy bemenő értékből (`c(1, 2, 4, 8, 16)`) négy kimenő érték `c(0, 1, 2, 3, 4)` állít elő. A függvények és a vektorok kapcsolatának azonban van egy másik aspektusa, amely szorosan kötődik a statisztikai műveletek végrehajtásához.

Az R-ben számos függvény olyan vektort vár az argumentumában, amely nem egy elemet, hanem tipikusan több tizet vagy százat tartalmaz. Ezeket a függvényeket vektor alapú függvényeknek nevezzük, és az R statisztikai mutatókat számoló függvényei is ebbe a csoportba tartoznak. A vektor alapú függvényekre az jellemző, hogy a bemenő vektor elemeivel egy előre definiált műveletsorozatot hajtanak végre, például összadják a vektor elemeit, kiszámolják az elemek átlagát vagy szórását, és visszatérési értékként ezt az összeget, átlagot vagy szórást szolgáltatja. A legfontosabb vektor alapú függvényeket az \@ref(tab:statfuggvenyek) táblázat tartalmazza.


\begin{table}

\caption{(\#tab:statfuggvenyek)Függvények vektorokkal}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{llll}
\toprule
Függvény & Leírás & Példa & Példa értéke\\
\midrule
\cellcolor{gray!6}{\ttfamily{max(x)}} & \cellcolor{gray!6}{az x vektor legnagyobb eleme} & \cellcolor{gray!6}{\ttfamily{max(1:10)}} & \cellcolor{gray!6}{\ttfamily{10}}\\
\ttfamily{min(x)} & az x vektor legkisebb eleme & \ttfamily{min(11:20)} & \ttfamily{11}\\
\cellcolor{gray!6}{\ttfamily{sum(x)}} & \cellcolor{gray!6}{x elemeinek összege} & \cellcolor{gray!6}{\ttfamily{sum(1:5)}} & \cellcolor{gray!6}{\ttfamily{15}}\\
\ttfamily{prod(x)} & x elemeinek szorzata & \ttfamily{prod(1:5)} & \ttfamily{120}\\
\cellcolor{gray!6}{\ttfamily{mean(x)}} & \cellcolor{gray!6}{x számtani közepe (mintaátlag)} & \cellcolor{gray!6}{\ttfamily{mean(1:10)}} & \cellcolor{gray!6}{\ttfamily{5.5}}\\
\addlinespace
\ttfamily{median(x)} & x mediánja & \ttfamily{median(1:10)} & \ttfamily{5.5}\\
\cellcolor{gray!6}{\ttfamily{range(x)}} & \cellcolor{gray!6}{x legkisebb és legnagyobb eleme} & \cellcolor{gray!6}{\ttfamily{range(1:10)}} & \cellcolor{gray!6}{\ttfamily{1 10}}\\
\ttfamily{sd(x)} & az x minta szórása & \ttfamily{sd(1:10)} & \ttfamily{3.03}\\
\cellcolor{gray!6}{\ttfamily{var(x)}} & \cellcolor{gray!6}{az x minta varianciája} & \cellcolor{gray!6}{\ttfamily{var(1:10)}} & \cellcolor{gray!6}{\ttfamily{9.17}}\\
\ttfamily{cor(x,y)} & korreláció x és y között & \ttfamily{cor(1:10,11:20)} & \ttfamily{1}\\
\bottomrule
\end{tabular}}
\end{table}


#### Típusok kezelése

Minden R vektor típusa a négy alaptípus egyike lehet: *double*, *integer*, *karakteres* vagy *logikai*. Korábban láttuk, hogy a `class()` és a `typeof()` függvények pontos tájékoztatást adnak a vektorok típusáról. Létezik azonban egy függvénycsalád, amellyel megvizsgálhatjuk, hogy egy tetszőleges objektum az adott típushoz tartozik-e. Ez az `is.*()` függvénycsalád, amelynek eleme az `is.double()`, `is.integer()`, `is.logical()` és`is.character()` függvény. Nézzünk egy példát használatukra.


```r
x.d <- c(3.5, 4.1, 9.2)  # új objektum - double vektor
is.double(x.d)           # x.d vajon double?
#> [1] TRUE
is.integer(x.d)          # x.d vajon integer?
#> [1] FALSE
is.character(x.d)        # x.d vajon karakteres?  
#> [1] FALSE
is.logical(x.d)          # x.d vajon logikai?
#> [1] FALSE
```

Láttuk korábban, hogy a logikai értékek esetében, ha szükséges, automatikus típuskonverzió történik numerikus típusra (`TRUE` - 1, `FALSE` - 0). Sok esetben azonban explicit típuskonverzióra van szükség, amit az `as.*()` függvénycsaláddal hajthatunk végre. Vektorok esetében használhatjuk az `as.double()`, `as.integer()`, `as.logical()` vagy `as.character()` függvényeket. Nézzünk ezekre is néhány példát.


```r
as.double(c(T, F))              # logikai vektorból double 
#> [1] 1 0
as.integer(c("2.9", "a", "3"))  # karakteres vektorból integer
#> [1]  2 NA  3
as.character(1:5)               # integer vektorból karakteres           
#> [1] "1" "2" "3" "4" "5"
as.logical(0:3)                 # integer vektorból logikai
#> [1] FALSE  TRUE  TRUE  TRUE
```


#### Az `NA` hiányzó érték

Korábbi példáinkban már felbukkant a hiányzó érték, amelyet az R-ben az `NA` jelöl. Az adatelemzési munkánkat végigkísérik a hiányzó adatok. Első lépésként azt jegyezzük meg, hogy az `NA` hiányzó érték tetszőleges típusú vektorban lehet elem.  


```r
x <- c(2, NA, 4); x              # NA numerikus vektorban
#> [1]  2 NA  4
x <- c(NA, "erős", "gyenge"); x  # NA karakteres vektorban
#> [1] NA       "erős"   "gyenge"
x <- c(T, NA, NA); x             # NA logikai vektorban
#> [1] TRUE   NA   NA
```

Egy `NA` érték jelenlétét a vektorban az `is.na()` függvénnyel tudjuk kimutatni. Az `is.na()` argumentuma tetszőleges vektor lehet, visszatérési értéke pedig a bemenő vektor elemszámával megegyező logikai vektor. A visszatérő logikai vektor csak abban a pozícióban tartalmaz `TRUE` értéket, ahol bemenő vektorban hiányzó adatot találunk.


```r
x <- c(1, NA, 3, 4, NA)    # két NA numerikus vektorban
is.na(x)                   # két TRUE a logikai vektorban
#> [1] FALSE  TRUE FALSE FALSE  TRUE
```

Hiányzó értékeket is tartalmazó vektor esetén néhány vektor alapú függvény meglepő eredményt adhat. A statisztikai mutatókat számoló függvények rendre `NA`-val térnek vissza, ha a bemenő vektorban van hiányzó érték. 


```r
mean(c(1:10,NA))
#> [1] NA
```

Ha kíváncsiak vagyunk az `NA` értéken kívüli elemek átlagára, akkor egy második paramétert is szerepeltetnünk kell a `mean()` függvényben, és minden más statisztikai mutatót számoló függvényben. Az `na.rm=` argumentum `TRUE` értéke biztosítja, hogy az átlag számítása során a hiányzó értékeket figyelmen kívül hagyjuk.



```r
mean(c(1:10,NA), na.rm=T)
#> [1] 5.5
```


#### Az `Inf` és a `NaN`

Az R-ben a numerikus műveletek eredménye -- a matematikai értelmezéstől sokszor eltérően -- vezethet pozitív vagy negatív végtelen eredményre. Ezeket az `Inf` és a `-Inf` szimbólumok jelölik, amelyeket különböző kifejezésekben akár mi is felhasználhatunk.


```r
1/0               
#> [1] Inf
log(0)
#> [1] -Inf
exp(Inf)
#> [1] Inf
mean(c(1,2,Inf))
#> [1] Inf
```

Néhány esetben a numerikus kifejezések eredménye nem értelmezhető számként, ezt az R-ben a `NaN` ("Not a Number") jelöli. Ilyen kifejezések például:


```r
0/0
#> [1] NaN
Inf-Inf
#> [1] NaN
Inf/Inf
#> [1] NaN
```


Egy kifejezés véges vagy végtelen voltát az `is.finite()` vagy `is.infinite()` függvényekkel tesztelhetjük. A `NaN` értékre az `is.nan()` függvénnyel kérdezhetünk rá. Figyeljük meg, a `NaN` értékre, mind az `is.nan()`, mind az `is.na()` függvény `TRUE` értéket ad.


```r
x <- c(1, NA, NaN, Inf, -Inf)
is.na(x)
#> [1] FALSE  TRUE  TRUE FALSE FALSE
is.nan(x)
#> [1] FALSE FALSE  TRUE FALSE FALSE
is.infinite(x)
#> [1] FALSE FALSE FALSE  TRUE  TRUE
is.finite(x)
#> [1]  TRUE FALSE FALSE FALSE FALSE
```


#### Vektor indexelése

Fontos részhez érkeztünk, érdemes kicsit lassítanunk. Már nagyon sok mindent megtanultunk a vektorokról: egy vektorban egy dimenzió mentén azonos típusú értékeket sorolhatunk fel, amellyel a vektoraritmetika szabályai szerint műveleteket tudunk végezni. Például hozzunk létre egy 10 elemű vektort, növeljük meg minden egyes vektorelem értékét 1-gyel. 


```r
x <- 11:20         # x integer vektor létrehozása
x + 1              # kiíratjuk az 1-gyel megnövelt értékeket (x nem változik)
#>  [1] 12 13 14 15 16 17 18 19 20 21
x                  # x értékének kiírása
#>  [1] 11 12 13 14 15 16 17 18 19 20
```

A fenti sorok hatására a konzolban egy 10 elemű vektor elemei jelennek meg, minden elem 1-gyel nagyobb, mint az `x` adott eleme. Egyetlen összeadás (`+`) operátor segítségével valójában 10 összeadás végrehajtását írtuk elő. Vegyük észre, hogy maga az `x` vektor nem módosult, továbbra is az eredeti `11:20` elemeket tartalmazza. Egy objektum ugyanis addig őrzi az értékét, amíg értékadó operátor segítségével felül nem írjük. 

Tekintsük most a következő sorokat. 


```r
y <- 11:20         # y integer vektor létrehozása
y <- y + 1         # megnöveljük 1-gyel y értékeit (y megváltozik)
y                  # y értékének kiírása 
#>  [1] 12 13 14 15 16 17 18 19 20 21
```

Az `y` vektor 10 elemű, a `11:20` értékekkel hoztuk létre. A második sorban azonban megváltoztatjuk az `y` értékét, mert újra az értékadás bal oldalán szerepel az `y` objektum. Az `y` új értéke az értékadás jobb oldalán szereplő kifejezés értéke lesz, azaz a `y+1` összeadás eredménye, ami nem más mint a `12:21`. Az `y` értékének megjelenítésével ellenőrizhetjük, hogy valóban a `12:21` elemek kerülnek a konzolba.

A fenti példában `y` minden értékét megváltoztattuk. Az eredeti `11:20` helyett az új érték `12:21`. Az `y` vektor minden egyes eleme megváltozott, például ahol 11 volt, ott most 12 van, ahol 12 volt ott most 13. Ha szükség van az eredeti és az új `y` értékekre akkor kicsit módosítanunk kell az eddigi sorokon.


```r
z    <- 11:20         # z integer vektor létrehozása
z.uj <- z + 1         # z.uj double vektor létrehozása (z nem változik)
z                     # z értékének kiírása
#>  [1] 11 12 13 14 15 16 17 18 19 20
z.uj                  # z.uj értékének kiírása
#>  [1] 12 13 14 15 16 17 18 19 20 21
```

A `z` vektor is 10 elemű, a `11:20` a kezdőértéke, és jól látható, hogy a fenti sorok hatására ez nem is változik meg, hiszen a `z` újra már nem jelenik meg értékadás bal oldalán. Értékadás jobb oldalán viszont felbukkan, a második sorban a `z.uj` objektum létrehozásához használtuk fel `z` értékét. Az `z` és `z.uj` objektumok értékének kiírásával ellenőrizhetjük, hogy a `z` továbbra is biztonságosan tárolja a `11.20` értékeket, de a `z.uj`-ban a kívánt `12:21` módosított értékek is megtalálhatók. A további munkafázisokban így az eredeti és a módosított értékek is elérhetők lesznek, ami újdonság, mert az előző példákban ez a lehetőség nem volt elérhető. Az `x` objektumot használó példában csak az eredeti, az `y` vektoros példában csak a módosított értékeket tudnánk a későbbiekben használni.

Összefoglalva az eddigieket, két tanulságot vonhatunk le. Egyfelől, a vektorműveleteknek csak akkor lesz "maradandó" hatása, ha objektumban őrizzük a számítás eredményét, azaz értékadást használunk. Ez az objektum lehet a kindulásként használt erdeti objektum (`y <- y + 1`), de biztonságosabb ha új objektumot hozunk létre az új értékek számára  (`z.uj <- z + 1`), mert így az eredeti értékeket a jövőben is tudjuk használni. Másfelől, ezek a példák ráirányítják a figyelmet a vektoraritmetika egy nagyszerű jellemzőjére: a vektorműveletek megadása független a vektor hosszától, nem lesz bonyolultabb egy vektorművelet, például az `x+1` összeadás ha `x` nem 10 elemű, hanem mondjuk 100 hosszú. Az összeadás művelet parancsa 100 elemű vektor esetén is csupán `x+1`, azonban a háttérben nem 10, hanem 100 összeadás történik. Akár 10, akár 100 elemű az `x`, az összes elemre az `x` segítségével hivatkozhatunk, és az `x+1` összeadás az `x` összes eleméhez hozzáad 1-et. De mit tegyünk, ha nincs szükségem `x` összes elemére, vagy nem szeretném `x` összes elemét megnövelni 1-gyel, csak néhányat. Ekkor indexelést kell használnunk.

Az adatfeldolgozás során gyakori, hogy a vektor egyes elemeit külön-külön szeretnénk elérni, lekérdezni vagy módosítani. A vektor egy tetszőleges részét, egy vagy több elemét az *indexelés* művelettel érhetjük el, melynek eredménye szintén vektor lesz. Az index operátor jele a szögletes zárójel (`[]`) az R-ben, amit a vektor neve után kell írnunk. Vektorok indexelésének általános alakja:

```markdown
vektor[indexvektor]        # az eredmény egy vektor
```

Az indexvektor lehet numerikus, karakteres és logikai vektor is. Nézzük ezeket sorban.


##### Indexelés numerikus vektorokkal

Kezdjük egy 10 elemű `x` vektor létrehozásával.


```r
x <- 11:20; x
#>  [1] 11 12 13 14 15 16 17 18 19 20
```

Megfigyelhetjük, hogy az `x` vektor 1. eleme 11, a 2. a 12, az utolsó, a 10. pedig éppen 20. Ebben a felsorolásban az elemek sorszámai (1., 2., 10.) pontosan a vektor indexeit jelentik. A vektor indexelése tehát 1-gyel kezdődik, ez az 1. elem indexe, a 2. elem indexe 2, az utolsó elemé pedig 10. Ha az index operátorba egy ilyen egyszerű sorszámot írunk, akkor a vektor adott indexű elemét érhetjük el.


```r
x[1]     # x vektor 1. eleme
#> [1] 11
x[2]     # x vektor 2. eleme
#> [1] 12
x[10]    # x vektor 10. eleme
#> [1] 20
```

Nem csak lekérdezhetjük, hanem az értékadó operátor segítségével módosíthatjuk is valamelyik elemet.


```r
x[2] <- 100       # x 2. elemének módosítása
x[3] <- 2*x[2]    # x 3. elemének módosítása
x
#>  [1]  11 100 200  14  15  16  17  18  19  20
```

Itt először a második elemet 100-ra cseréljük, majd a harmadikat a második kétszeresére. A változást ellenőrizhetjük a konzolban. Ha az `x` vektort az elemszámánál nagyobb indexszel próbáljuk elérni, akkor `NA` értéket kapunk:



```r
x[11]     # x csak 10 elemű, a 11. nem létező elem
#> [1] NA
```

Vektorokat azonban nem csak egy elemű indexvektorokkal indexelhetünk, hanem két vagy több elemű numerikus vektorokat is használhatunk. Ebben az esetben az indexvektorban felsorolt sorszámoknak megfelelő indexű elemeket érhetjük el.


```r
x <- 11:20 
x[c(1, 3, 5)]               # x vektor 1., 3. és 5. eleme
#> [1] 11 13 15
x[c(3, 5, 3, 1)]            # x vektor 3., 5. 3. és 1. eleme
#> [1] 13 15 13 11
x[3:6]                      # x vektor 3., 4., 5., és 6. eleme
#> [1] 13 14 15 16
y <- c(3,7)
x[y]                        # x vektor 3. és 7. eleme
#> [1] 13 17
x[seq(from=2, to=10, by=2)] # x vektor páros indexű elemei  
#> [1] 12 14 16 18 20
```

A fenti példákban látható, hogy az indexelés során létrejött vektorok elemszáma az indexvektor elemszámával egyenlő. Egy indexet akár többször is felsorolhatunk, és tetszőleges sorrend megengedett. A szöglegetes zárójelben lévő indexvektort helyben is elkészíthetjük a `c()` és `seq()` függvénnyel (vagy bármilyen más vektorlétrehozó függvénnyel), vagy a kettőspont (`:`) operátorral, de korábban létrehozott objektumot is használhatunk indexelésre (`x[y]`).

Az indexelés során több vektorelemet egy lépésben is tudunk módosítani. Az indexelt elemek kaphatnak azonos vagy különböző értéket. Itt is a vektoraritmetikai szabályai kezdenek működni.


```r
x <- 11:20           
x[c(1, 2, 3)] <- c(110, 120, 130) # x 1., 2. és 3. elemét módosítjuk
x[c(4, 5, 6)] <- 0                # x 4., 5. és 6. elemét módosítjuk
x[c(7, 8, 9)] <- c(170, 180)      # x 7., 8. és 9. elemét módosítjuk
x
#>  [1] 110 120 130   0   0   0 170 180 170  20
```

A fenti példában az `x` vektor három-három elemét módosítjuk az egyes értékadások során. Az értékadó operátor (`<-`) engedelmeskedik a vektoraritmetika szabályainak, azaz az értékadás bal és jobb oldalán szereplő vektorokat tekinthetjük két olyan vektornak, amelyek között műveletet szeretnénk végrehajtani. Az első értékadásban azonos elemszámú a két vektor, a koordintánkénti értékadás azonnal megtörténik (`x[c(1, 2, 3)] <- c(110, 120, 130)`). A másik két értékadásban különbözik a két vektor elemszáma, így először ismétléssel kiegészül a jobb oldali, rövidebbik vektor, majd ezután következhet a koordinátánkénti végrehajtás.

Egy vektor indexe mindig egész szám, de az R megengedi, hogy tört értékeket tartalmazó indexvektort szerepeltessünk az index operátorban, ekkor az egész részét veszi az indexeknek, egyszerűen csonkolja őket.


```r
x <- 11:20
x[2.3]       # x 2. eleme
#> [1] 12
x[2.8]       # x 2. eleme
#> [1] 12
```

Negatív értékeket tartalmazó numerikus vektorral is indexelhetünk, ekkor a negatív előjellel megadott sorszámokon kívül az összes többi elemet tudjuk elérni vagy módosítani.


```r
x <- 11:15
x[-3]                         # minden x elem, kivéve a 3.
#> [1] 11 12 14 15
x[-c(1, 5)]                   # minden x elem, kivéve az 1. és az 5.
#> [1] 12 13 14
x[-(1:3)]                     # minden x elem, kivéve az első 3
#> [1] 14 15
x[-2] <- 0                    # minden x elem módosul, kivéve a 2.      
x
#> [1]  0 12  0  0  0
```


##### Indexelés karaketeres vektorokkal

Amennyiben egy vektor elemei rendelkeznek névvel, akkor karakteres indexvektorokat is használhatunk az indexeléshez. Ez meglehetősen nagy könnyebbséget jelent, ugyanis nem kell ismernünk a kívánt elem pozícióját, azaz indexét, elegendő fejben tartanunk az elem nevét. Vegyük példaként a tanulók matematika versenyen elért pontszámait tartalmazó vektort.


```r
x <- c('Peti'=35, 'Bori'=37, 'Éva'=33)
x["Bori"]                              # x "Bori" nevű eleme
#> Bori 
#>   37
x[c("Peti", "Éva")]                    # x "Peti" és "Éva" nevű eleme
#> Peti  Éva 
#>   35   33
x[c("Peti", "Éva")] <- c(36, 34)       # x fenti 2 elemének módosítása
x
#> Peti Bori  Éva 
#>   36   37   34
```

Látható, hogy a kívánt elem eléréséhez, például Bori matematika teljesítményéhez nem kell ismernünk Bori pontszámának pozícióját, elegendő a névre emlékeznünk.

##### Indexelés logikai vektorokkal

Vektorok indexeléséhez logikai vektorokat is használhatunk. Első pillanatban kényelmetlennek, sőt feleslegesnek tűnik majd ez a lehetőség, de a következő fejezetben, a vektorok szűrésénél, magunk is meggyőződhetünk e módszer káprázatos erejéről

A logikai indexvektor működése nagyon egyszerű. Hossza az indexelenedő vektor hosszával egyenlő, és a `TRUE` logikai értékkel jelezzük, hogy az adott pozíción lévő elemet el akarjuk érni, a `FALSE` értékkel pedig azt, hogy nincs szükség arra az elemre.


```r
x <- 11:15
x[c(T, F, T, T, F)]    # x vektor 1., 3., és 4. eleme    
#> [1] 11 13 14
```

A fenti példában `TRUE` szerepel az 1., 3. és 4. pozícióban, így az `x` vektor 1., 3. és 4. elemeit érhetjük el.

Az indexelésre használt logikai vektor elemszáma kisebb is lehet, mint az indexelt vektor hossza, ekkor az R az indexvektor ismétlésével kapja meg a kívánt hosszt.


```r
x <- 11:15
x[c(T, F)]      # x vektor 1., 3. és 5. eleme
#> [1] 11 13 15
x[T]            # x vektor összes eleme
#> [1] 11 12 13 14 15
x[F]            # x vektor egyik eleme sem
#> integer(0)
```

A `c(T, F)` vektor két elemű, az indexelendő `x` viszont 5 hosszú, így az R ismétléssel előállítja a `c(T, F, T, F, T)` öt elemű vektort, és ezt használja az `x` indexeléséhez. Ha a csupa `TRUE` értékű vektorral indexelünk, akkor az `x` vektor összes elemét megkapjuk, ha pedig a csupa `FALSE` értékkel, akkor az üres vektort kapjuk. Az `integer(0)` az üres integer vektort jelöli.

A logikai vektorral indexelt vektorelemeket ugyanúgy módosíthatjuk, mint korábban a numerikus és karakteres indexvektorok esetén.


```r
x <- 11:15
x[c(T, F)] <- 0                    # x vektor 1., 3. és 5. elemét módosítjuk
x[c(F, T, F, T, F)] <- c(120, 140) # x vektor 2. és 4. elemét módosítjuk
x
#> [1]   0 120   0 140   0
```


##### Indexelés speciális értékekkel {#indexelesspecna}

Az indexelésnek van néhány speciális esete, amelyet érdemes ismernünk. Vektorok indexelése során az indexoperátor üresen is maradhat, ekkor a vektor összes elemét elérhetjük, vagyis az  `x` és `x[]` kifejezések ugyanazt az outputot adják. 


```r
x <- 11:15
x[]           # x minden eleme
#> [1] 11 12 13 14 15
x[NaN]        # egyetlen NA
#> [1] NA
x[NA]         # x elemszámának megfelelő NA   
#> [1] NA NA NA NA NA
```

A fenti példákból kiolvasható, hogy a `NaN` és `NA` indexként való használata egyetlen `NA`-t, vagy az `x` hosszának megfelelő számú hiányzó értéket szolgáltat.

Legyünk óvatosak, ha az indexvektor tartalmaz `NA` értéket, akkor az eredménybe azon a pozíción szintén `NA` fog bekerülni.


```r
x <- 11:15
x[c(1, NA, 2)]          # x 1. eleme, NA, és x 2. eleme
#> [1] 11 NA 12
x[c(1, NA, 2)] <- 100   # x 1. és 2. elemének módosítása
x
#> [1] 100 100  13  14  15
```

Kerüljük az értékadást `NA`-t tartalmazó indexvektor használata esetén. A fenti példában az értékadás ugyan nem jelez hibát, és ellenőrizhetjük, hogy valóban megtörtént az első két vektorelem módosítása. Azonban az értékadás jobb oldalán a több elemű vektor már nem engedélyezett, például az `x[c(1, NA, 2)] <- c(100, 200)` értékadás hibaüzenethez vezet. Összefoglalva, minden esetben ellenőrizzük, hogy az indexvektortunk tartalmaz-e `NA` hiányzó értéket.   


#### Vektor szűrése

Eddig a vektorok elemeit pozíciójuk alapján értük el. Akár sorszámot, elemnevet vagy megfelelő pozícióban lévő logkai igaz/hamis értéket használtunk indexelésre, végső soron az számított, hogy az adott elem hol található a vektorelemek egydimenziós sorában. Ebben a fejezetben egy teljes más kiinduló pontot használni
unk a vektorelemek elérésére és ez a vektor tartalma lesz, vagyis a vektorelem konkrét értéke (és nem a pozíciója). 

Bővítsük ki a matematika pontszámokat tartalmazó vektorunkat, rögzítsük hat tanuló eredményét. 


```r
x <- c('Peti'=35, 'Bori'=37, 'Éva'=33, 'Pál'=21, 'Gergő'=34, 'Ili'=40)
x
#>  Peti  Bori   Éva   Pál Gergő   Ili 
#>    35    37    33    21    34    40
```

Ha arra vagyunk kíváncsiak, hogy kik értek el 36 pontnál többet a versenyen és milyen pontszámokkal, akkor rövid áttekintés után megadhatjuk a választ, sőt a pozíció alapján könnyen elvégezhetjük az alábbi indexeléseket is.


```r
x[c(2, 6)]               # indexelés numerikus vektorral
#> Bori  Ili 
#>   37   40
x[c("Bori", "Ili")]      # indexelés karakteres vektorral
#> Bori  Ili 
#>   37   40
x[c(F, T, F, F, F, T)]   # indexelés logikai vektorral
#> Bori  Ili 
#>   37   40
```

A fenti sorok az eddigiekhez képest semmilyen újdonságot nem tartalmaznak, lényegében összefoglalják a pozíció alapú indexelésről tanultakat. Felmerülhet bennünk a kérdés, ha `x` nem hat elemű, hanem 60 vagy esetleg 600, akkor mennyi esélyünk lenne az indexelt kifejezések előállítására. Nem sok.

Adódik azonban egy másik lehetőség, ami közvetlenül abból indul ki, hogy 36 pontnál nagyobb vektorelemeket keressük. Logikai művelettel ezt a következőképp fogalmazhatjuk meg.


```r
x > 36        # relációs művelet, logikai vektort eredményez
#>  Peti  Bori   Éva   Pál Gergő   Ili 
#> FALSE  TRUE FALSE FALSE FALSE  TRUE
```

Korábban láttuk, hogy ez a művelet a vektoraritmetikai szabályainak engedelmeskedve két lépésben értelmezhető: (1) mivel különböző elemhosszú a két vektor, `x` hat elemű, a 36 egy elemű, először a jobb oldal is hat elemű lesz (`c(36, 36, 36, 36, 36, 36)`), majd (2) koordinátánként a relációs művelet végrehajtásra kerül, azaz x minden eleméről döntés születik, hogy nagyobb-e mint 36. A relációs művelet eredménye egy hat elemű logikai vektor, amely pontosan ott `TRUE`, ahol az illető `x` elem nagyobb 36-nál, minden más helyen pedig `FALSE`. Esetünkben a Bori és Ili elemeknél jelenik meg a `TRUE`, vagyis a 2. és 6. pozícióban. Vegyük észre, hogy ez pontosan az a logikai vektor, mint amit mi hoztunk létre korábban a pozíció alapú indexelés egyik példájaként (`x[c(F, T, F, F, F, T)]`).

A relációs művelet eredményét, mint logikai vektort kiválóan fel tudjuk használni az indexelésben a 36 pontnál nagyobb vektorelemek eléréséhez. 


```r
x[x > 36]       # x vektor szűrése (36-nál nagyobb elemek leválogatása)
#> Bori  Ili 
#>   37   40
```

A fenti sor az első példa szűrésre. A szűrés lényegében logikai vektorral való indexelés, ahol a logikai indexvektort egy olyan logikai kifejezés állítja elő, amely hivatkozik a vektor tartalmára. A definíciót értelmezve a példára: a logikai vektor, amely alapján az indexelés történik a `c(F, T, F, F, F, T)`, a logikai kifejezés, amely ezt előállítja az `x>36`, a vektor tartalmára pedig természetesen az `x` objektumnévvel utalunk a logikai kifejezésen belül.   

A szűrés nagyszerűen kezeli a vektorhosszal kapcsolatban korábban felvetett problémánkat. Ha az `x` nem hat, hanem 60 vagy 600 elemű, akkor is az `x[x>36]` végzi a 36-nál nagyobb elemek leválogatását.

Próbáljuk ki a szűrést nagyobb elemszám esetén is. Generáljunk 60 véletlen értékeket a 0-40 értéktartományból, úgy mintha 60 tanuló matematika pontszáma állna rendelkezésre. A `sample()` függvény az `x=` argumentumában megadott értékekből, a `size=`-ban megadott darabszámnyit állít elő. A `replace=T` argumentummal gondoskodunk arról, hogy egy érték többször is szerpelhessen az eredményvektorban.


```r
pontszamok <- sample(x = 0:40, size = 60, replace = T) # véletlen értékek
pontszamok[1:10]               # ponszamok vektor első 10 eleme
#>  [1] 33 15 27 12  5 35  8  5  3 40
pontszamok[pontszamok > 36]    # pontszamok vektor szűrése
#> [1] 40 40 37 37 40
```

A `pontszamok` vektor 60 elemű, az első 10 értékét a képenyőn láthatjuk. A 36-nál nagyobb elemek megjelenítését szűréssel végeztük. Látható, hogy a szűrés nem lett bonyolultabb a vektor hosszának növekedésével.

Más relációs operátorokat (\@ref(tab:reloperatorok) táblázat) is használhatunk a szűrésben, sőt logikai operátorok (\@ref(tab:logoperatorok) táblázat) segítségével tetszőleges természetes nyelven megfogalmazott feltételt át tudunk fordítani R logikai kifejezésbe. A logikai operátorokat tartalmazó logikai kifejezésket *összetett logikai kifejezés*eknek nevezzük. Írassuk ki a pontszámokat 36 és 39 között, majd 3 és 6 között, és végül mindezeket együtt.


```r
pontszamok[pontszamok>=36 & pontszamok<=39]
#> [1] 37 37
pontszamok[pontszamok>=3 & pontszamok<=6]
#> [1] 5 5 3 3 5 4 5
pontszamok[(pontszamok>=36 & pontszamok<=39) | (pontszamok>=3 & pontszamok<=6)]
#> [1]  5  5  3 37  3  5 37  4  5
```

Időnként szükségünk lehet arra az információra, hogy a vektorban melyik pozícióban vannak a feltételnek eleget tevő vektorelemek. Erre a feladatra a `which()` függvényt használhatjuk. A `which()` függvény bemenő paraméterként egy logikai vektort vár, visszatérési értéke pedig a `TRUE` logikai értékek indexe lesz.

Térjünk vissza a matematika pontszámokhoz. 


```r
x <- c('Peti'=35, 'Bori'=37, 'Éva'=33, 'Pál'=21, 'Gergő'=34, 'Ili'=40)
which(x > 36)         
#> Bori  Ili 
#>    2    6
which(36 <= x & x <= 39)
#> Bori 
#>    2
which(x == 21)
#> Pál 
#>   4
which(x != 21)
#>  Peti  Bori   Éva Gergő   Ili 
#>     1     2     3     5     6
```

Az outputokban nem látjuk a tanulók pontszámát, tehát nem a szűrés a `which()` célja, azoknak a vektorelemeknek az indexét látjuk, amelyek az egyszerű vagy összetett logikai kifejezéseknek eleget tesznek.

Végezetül tekintsük át a szűrés és az értékadás kapcsolatát. Az adatelemzés során előfordulhat, hogy bizonyos feltételnek eleget tevő elemeket módosítani szeretnénk. Például, ha egy vektorban előzetesen a hiányzó értékeket 99-cel jelöljük, akkor a későbbi hibamentes elemzéshez `NA`-ra kell módosítanunk ezeket az értékekek.



Az `x` így már helyes módon tartalmazza a hiányzó értékeket. Ha esetleg később kiderül ezeknek az elemeknek a tényleges értéke, akkor az `NA`-t kell helyettesítenünk új értékekkel. Vigyázzunk, az `x == NA` kifejezés helytelen a hiányzó értékek tesztelésére, erre az `is.na()` függvényt kell használnunk. 


```r
x[is.na(x)] <- c(5, 7)    # hiányzó értékek módosítása
x
#>  Peti  Bori   Éva   Pál Gergő   Ili 
#>    35    37    33    21    34    40
```

Az `x` vektorban két hiányzó érték volt, így a fenti értékadás jobb oldalán két elemű vektort használunk. Ha mindkét hiányzó értéket azonos számmal szeretnénk felülírni, akkor elegendő lenne a `x[is.na(x)] <- 7` kifejezés is.

Korábban már említettük a (\@ref(indexelesspecna) alfejeztben, hogy kerüljük az értékadást `NA`-t tartalmazó indexvektor használata esetén. Azonban nem minden esetben tudunk kitérni az ilyen esetek elől. Növeljük meg a hiányzó értékeket tartalmazó `x` vektor azon elemeit 1-gyel, amelyek 36-nál kisebbek! A nyilvánvalónak látszó `x[x < 36] <- x[x < 36] + 1` parancs helytelen, hibaüzenetet ad. Az értékadás mindkét oldalán szükséges az `& !is.na(x)` hozzáfűzése a meglévő logikai kifejezéshez. 


```r
x <- c(33, NA, 32, 38, NA, 37)
x[x < 36 & !is.na(x)] <- x[x < 36 & !is.na(x)] + 1
```

#### Vektor rendezése

Egy vektor elemeit növekvő vagy csökkenő sorrendbe rendezhetjük. Az R-ben a vektor elemeit a `sort()` vagy az `order()` függvénnyel rendezhetjük.


```r
x <- c(1:5, 5:3)
x
#> [1] 1 2 3 4 5 5 4 3
sort(x)               # x elemei növekvő sorrendben
#> [1] 1 2 3 3 4 4 5 5
sort(x, decreasing=T) # x elemei csökkenő sorrendben, vagy: rev(sort(x))
#> [1] 5 5 4 4 3 3 2 1
```

A `sort()` függvény alapértelmezés szerint növekvő sorrendbe rendezi a bemeneti vektort, ha azonban a `decreasing=` paramétert `TRUE`-ra állítjuk, csökkenő rendezést kapunk. A `rev()` függvénnyel, amely a bementi vektor elemeit fordított sorrendben sorolja fel, szintén elérhetjük a csökkenő rendezettséget.

Ha a `sort()` függvénnyel átrendezett vektort a továbbiakban fel szeretnénk használni, akkor azt érdemes új objektumban tárolni (`x.2 <- sort(x)`).

A vektor rendezésének másik módja az `order()` függvényhez kapcsolódik. A visszatérési érték ekkor egy numerikus indexvektor, amellyel a bemenő vektort indexelve rendezett vektort kapunk.


```r
x <- c(1:5, 5:3)
order(x)
#> [1] 1 2 3 8 4 7 5 6
x[order(x)]
#> [1] 1 2 3 3 4 4 5 5
x[order(x, decreasing=T)];
#> [1] 5 5 4 4 3 3 2 1
```

Az `order()` függvény esetében is használhatjuk a `decreasing=` paramétert, amellyel csökkenő sorrendbe rendezhetjük a vektorunkat.

A numerikus vektorokon túl a karakteres és logikai vektorokat is sorba rendezhetjük a `sort()` és `order()` függvényekkel.

#### Részösszefoglalás {#az-r-nyelv-5-summary}

<div class="rmdsummary">
<p>Gratulálunk! Maratoni alfejezetünk végigolvasásával jelentős lépést tett meg az Olvasó a magabiztos R ismeretek megszerzéséhez. A vektor minden adatelemzési munka alapja, biztos kezelése kulcsfontosságú. Tetszőleges vektor létrehozásához a <code>c()</code> függvényt használhatjuk, és az elemeket akár nevesíthetjük is. Szabályos vektort a <code>seq()</code>, <code>seq_along()</code> és a <code>rep()</code> függvénnyel, vagy a kettőspont (<code>:</code>) operátorral készíthetünk. Megbeszéltük a vektorok közötti műveletek végrehajtásának fő szabályát: ismétléssel hozzuk azonos hosszra a vektorokat ha szükséges, majd koordinátánként végezzük el a kívánt műveletet. A vektorokat támogatják a matematikai függvények is, minden vektorelemre meghívódik a függvény. A statisztikai függvények szintén vektort várnak, de többnyire egy értéket szolgáltatnak. A vektorok típusának tesztelése az <code>is.*()</code>, a konvertálása pedig az <code>as.*()</code> függvényekkel történik.</p>
</div>

#### Feladatok {#az-r-nyelv-5-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Hozzuk létre a következő numerikus vektort: 12, 14, 17.
1. Hozzuk létre a következő karakteres vektort: "Vác", "Eger", "Pécs".
1. Hozzuk létre a következő logikai vektort: TRUE, FALSE, FALSE.
1. Hozzuk létre egy számtani sorozat egymást követő elemeit, ahol az első elem 8, az utolsó 102 és a különbség 1.
1. Hozzuk létre egy számtani sorozat egymást követő elemeit, ahol az első elem 102, az utolsó 8 és a különbség -1.
1. Hozzuk létre egy számtani sorozat egymást követő elemeit, ahol az első elem 8, az utolsó 102 és a különbség 2.
1. Hozzuk létre egy számtani sorozat egymást követő elemeit, ahol az első elem 8, a különbség 3 és a vektor 25 elemű.
1. Hozzuk létre azt a numerikus vektort, amely 12 elemű, és minden elemének -2 az értéke!
1. Hozzuk létre azt a karakteres vektort, amely 7 elemű, és minden elemének "Péntek" az értéke!
1. Hozzuk létre azt a logikai vektort, amely 7 elemű, és minden elemének TRUE az értéke!
1. Hozzuk létre azt a numerikus vektort, amely a 2, 3, 5 elemeket háromszor egymás után megismétli! Hány elemű az így létrejött vektor?
1. Hozzuk létre azt a numerikus vektort, amely a 2, 3, 5 elemeket háromszor helyben megismétli! Hány elemű az így létrejött vektor?
1. Hozzuk létre azt a numerikus vektort, amely a 2, 3, 5 elemeket helyben megismétli úgy, hogy a 2-őt 4-szer, a 3-at 5-ször és az 5-öt 7-szer ismétli meg! Hány elemű az így létrejött vektor?
1. Szabályos vektorok létrehozásának van egy korábban még nem említett módja: a `sequence()` függvény. Ismerjük meg a súgóból ezt a függvényt, és értelmezzük a `sequence(4)` és `sequence(c(4,5))` függvényhívásokat!
1. Vektorok létrehozásának számos módját megismertük ebben a fejezetben, de elemek megadása nélkül, vagy akár nulla hosszúsággal is létrehozhatunk vektort. A `double()`, `integer()`, `character()` és `logical()` függvények közvetlenül az adott típusnak megfelelő vektort hozzák létre. A súgó tanulmányozásával állítsunk elő 0 és 10 elemű vektor objektumokat mind a négy típus esetén.
1. Próbáljuk ki az \@ref(tab:statfuggvenyek) táblázatban szereplő példákat.

</div>\EndKnitrBlock{rmdexercise}

### Mátrix

A mátrix adatszerkezet egyetlen lényeges dologban különbözik a vektortól, a mátrix kétdimenziós, sorokba és oszlopokba szervezi az elemeket, míg a vektor egydimenziós (érdemes visszalapozni a \@ref(fig:adatszerkezetek-1) ábrához). A mátrix ugyanúgy homogén, mint a vektor, ennek megfelelően beszélünk *double*, *integer*, *karakteres* és *logikai* mátrixokról.

#### Mátrix létrehozása

Mátrix létrehozásához a `matrix()` függvényt használjuk ki, amely egy kiinduló vektor elemeit használja fel a mátrix feltöltéséhez. A `data=` argumentumban kell megadnunk ezt a vektort, majd az `nrow=` és/vagy `ncol=` argumentumokban közöljük a sorok és oszlopok számát.  


```r
x <- matrix(data=1:20, nrow=4)        # 4x5-ös integer mátrix
x
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    5    9   13   17
#> [2,]    2    6   10   14   18
#> [3,]    3    7   11   15   19
#> [4,]    4    8   12   16   20
```

A fenti példában a 20 elemű vektort 4 sorban rendezi el a `matrix()` függvény, ennek megfelelően 5 oszlopos lesz az `x` mátrix. A `matrix()` függvényben az `ncol=` paraméter is használható. 


```r
x <- matrix(data=1:20, nrow=4, ncol=5)        # 4x5-ös integer mátrix
x
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    5    9   13   17
#> [2,]    2    6   10   14   18
#> [3,]    3    7   11   15   19
#> [4,]    4    8   12   16   20
x <- matrix(data=1:20, nrow=4, ncol=10)       # 4x10-es integer mátrix
x
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#> [1,]    1    5    9   13   17    1    5    9   13    17
#> [2,]    2    6   10   14   18    2    6   10   14    18
#> [3,]    3    7   11   15   19    3    7   11   15    19
#> [4,]    4    8   12   16   20    4    8   12   16    20
```

Az `ncol=5` szerepeltetése nem jelent változást az előző példához képest, az `x` mátrix 4 sort és 5 oszlopot fog tartalmazni, rövidebben 4 $\times$ 5-ös. A következő sorban az `ncol=10` argumentum már egy 40 elemű mátrix létrehozását kezdeményezi, így az `1:20` vektor ismétlésével állnak elő a szükséges elemek. (Figyelmeztetést kapunk, ha a szükséges mátrixelemszám eléréséhez nem egész számszor kell ismételni a kiinduló vektort, de a mátrix ebben az esetben is létre fog jönni.)

A fenti példában azt is megfigyelhetjük, hogy a 20 elemű vektorból oszlopfolytonosan jön létre a mátrix, vagyis először az első oszlop töltődik fel a vektorelemekkel, majd a második, és így tovább. Ha sorfolytonosan szeretnénk a bemenő vektor elemeiből mátrixot képezni, akkor a `byrow=` paramétert igazra kell állítanunk.


```r
x <- matrix(1:12, nrow=3, byrow=T)    # 3x4-es integer mátrix
x
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    2    3    4
#> [2,]    5    6    7    8
#> [3,]    9   10   11   12
```

Mátrixot karakteres vagy logikai értékekből is építhetünk.


```r
matrix(c("az","egy"), nrow=2, ncol=3, byrow=T) # 2x3-as karakteres mátrix
#>      [,1]  [,2]  [,3] 
#> [1,] "az"  "egy" "az" 
#> [2,] "egy" "az"  "egy"
matrix(c(T,F,T), nrow=2, ncol=6, byrow=T)      # 2x6-os logikai mátrix   
#>      [,1]  [,2] [,3] [,4]  [,5] [,6]
#> [1,] TRUE FALSE TRUE TRUE FALSE TRUE
#> [2,] TRUE FALSE TRUE TRUE FALSE TRUE
```

Az előző fejezetben láttuk, hogy a vektorok elemeinek nevet is adhatunk, így olvashatóbbá tehetjük rögzített adatainkat. A `matrix()` függvény `dimnames=` argumentumában az egyes sorok és oszlopok elnevezéséről, valamint a két dimenzió nevéről is gondoskodhatunk.


```r
x <- matrix(0, nrow = 2, ncol = 3, 
      dimnames = list('1. dim. neve'=c("sor.1", "sor.2"),
                      '2. dim. neve'=c("oszl.1", "oszl.2", "oszl.3")))
x
#>             2. dim. neve
#> 1. dim. neve oszl.1 oszl.2 oszl.3
#>        sor.1      0      0      0
#>        sor.2      0      0      0
```

A `dimnames=` argumentum a dimenzió-, sor- és oszlopneveket listába rendezve várja. A listákról a \@ref(listadefalf) fejezetben olvashatunk. A sor- és oszlopnevek megadásánál tartsuk be az objektumok elnevezésével kapcsolatos szabályokat, azaz betűvel kezdjünk, kerüljük a szóközt és egyéb írásjeleket, de tagolásra a pontot használjuk.  

Létező mátrix esetén a `rownames()` és a `colnames(x)` függvényekkel tudjuk a sor- és oszlopneveket lekérdezni, illetve módosítani.


```r
rownames(x)                           # sornevek lekérdezése
#> [1] "sor.1" "sor.2"
colnames(x)                           # oszlopnevek lekérdezése
#> [1] "oszl.1" "oszl.2" "oszl.3"
rownames(x) <- c("eset.1", "eset.2")  # sornevek módosítása
colnames(x) <- c("o.1", "o.2", "o.3") # oszlopnevek módosítása
x
#>             2. dim. neve
#> 1. dim. neve o.1 o.2 o.3
#>       eset.1   0   0   0
#>       eset.2   0   0   0
```


#### Mátrix indexelése

A mátrixok indexelése nagyon hasonló a vektorok indexeléséhez. Itt is az index operátort (`[]`) kell használnunk, de a két dimenzió miatt vesszővel választjuk el a sorra és az oszlopra vonatkozó indexeket. Mátrix indexelésének általános alakja:

```markdown
mátrix[sorindexvektor, oszlopindexvektor] # az eredmény egy mátrix vagy egy vektor
```
A sorinedexvektorra és az oszlopindexvektorra ugyanazok a szabályok érvényesek, mint vektor esetén az indexvektorra. Használhatunk numerikus, karakteres és logikai egy vagy több elemű vektort, numerikus idexeknél negatív értéket, és természetesen el is hagyhatjuk az egyes dimenziók indexvektorait. Nézzünk ezekre néhány példát.


```r
x <- matrix(1:10, nrow=2, ncol=5, byrow=T)
x
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    2    3    4    5
#> [2,]    6    7    8    9   10
x[2, 3]                     # 1 elem elérése, vektor output
#> [1] 8
x[2, c(1,4)]                # 2 elem elérése, vektor
#> [1] 6 9
x[, c(1,4)]                 # 4 elem elérése, 2x2-es mátrix 
#>      [,1] [,2]
#> [1,]    1    4
#> [2,]    6    9
x[, -c(1,4)]                # 6 elem elérése, 2x3-as mátrix
#>      [,1] [,2] [,3]
#> [1,]    2    3    5
#> [2,]    7    8   10
x[1, ]                      # 5 elem elérése, vektor
#> [1] 1 2 3 4 5
x[c(2, 1), c(T, F, T)]      # 6 elem elérése, 2x3-as mátrix
#>      [,1] [,2] [,3]
#> [1,]    6    8    9
#> [2,]    1    3    4
```

A mátrix indexelése során a kapott új adatszerkezetek elveszthetik a kétdimenziós jellegüket és így mátrix helyett vektor is lehet az indexelés eredménye. Ha ezt el akarjuk kerülni, használjuk a `drop=FALSE` paramétert az indexben, ekkor minden esetben mátrix lesz az eredmény.


```r
x[2, 3, drop=F]             # 1 elem elérése, 1x1-es mátrix output
#>      [,1]
#> [1,]    8
x[2, c(1,4), drop=F]        # 2 elem elérése, 1x2-es mátrix 
#>      [,1] [,2]
#> [1,]    6    9
x[2, , drop=F]              # 5 elem elérése, 1x5-ös mátrix
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    6    7    8    9   10
x[, 3, drop=F]              # 2 elem elérése, 2x1-es mátrix
#>      [,1]
#> [1,]    3
#> [2,]    8
```

Amennyiben a mátrixunk sor- és oszlopnevekkel is rendelkezik, akkor ezeket is felhasználhatjuk az indexelés során.


```r
x <- matrix(1:10, nrow=2, ncol=5, byrow=T)
rownames(x) <- c("eset1", "eset2")
colnames(x) <- paste0("sz.", 1:5)
x
#>       sz.1 sz.2 sz.3 sz.4 sz.5
#> eset1    1    2    3    4    5
#> eset2    6    7    8    9   10
x["eset1", c("sz.2", "sz.1")]     # 2 elem elérése, vektor output
#> sz.2 sz.1 
#>    2    1
x[1:2, c("sz.2", "sz.1")]         # 4 elem elérése, 2x2-es mátrix
#>       sz.2 sz.1
#> eset1    2    1
#> eset2    7    6
x["eset2", paste0("sz.", 1:3)]    # 3 elem elérése, vektor
#> sz.1 sz.2 sz.3 
#>    6    7    8
x["eset1", c(T,F), drop=F]        # 3 elem elérése, 1x3-as mátrix
#>       sz.1 sz.3 sz.5
#> eset1    1    3    5
```


#### Számítások a mátrix soraiban és oszlopaiban

Az előző részben említettük, ha üresen hagyjuk a mátrix sor vagy oszlop pozícióját az indexelés során, akkor a mátrix teljes oszlopára vagy sorára tudunk hivatkozni, vagyis alapesetben vektort kapunk. Az így kapott vektorokkal tetszőleges műveleteket hajthatunk végre. Hozzunk létre egy 3 $\times$ 4-es mátrixot, amely 3 tanuló átlagát tartalmazza 4 tantárgyból.


```r
x <- matrix(c(3.7, 5.3, 5.1, 4.2, 4.4, 3.8, 2.9, 4.2, 5.1, 4, 3, 5), 
            nrow=3, ncol=4, byrow=T, 
            dimnames = list(c("Pál", "Ili", "Éva"),
                            c("matek", "magyar", "angol", "ének")))
x
#>     matek magyar angol ének
#> Pál   3.7    5.3   5.1  4.2
#> Ili   4.4    3.8   2.9  4.2
#> Éva   5.1    4.0   3.0  5.0
mean(x[1,])      # Pál féléves átlaga    
#> [1] 4.575
sd(x[,4])        # énekből a csoport átlaga 
#> [1] 0.4618802
```

Négy speciális függvénnyel az oszlopok és sorok összegét és átlagát számíthatjuk ki.


```r
rowSums(x)      # sorösszegek, a tanulók jegyeinek összege
#>  Pál  Ili  Éva 
#> 18.3 15.3 17.1
rowMeans(x)     # sorátlagok, a tanulók félév végi átlaga
#>   Pál   Ili   Éva 
#> 4.575 3.825 4.275
colSums(x)      # oszlopösszegek, a tantárgyak jegyeinek összege
#>  matek magyar  angol   ének 
#>   13.2   13.1   11.0   13.4
colMeans(x)     # oszlopátlagok, a tantárgyak átlaga
#>    matek   magyar    angol     ének 
#> 4.400000 4.366667 3.666667 4.466667
```

Általánosabb megoldás, ha az `apply()` függvényt használjuk, amelyben a mátrix soraira vagy oszlopaira vonatkozó függvényt mi határozzuk meg, így az összegzésen és az átlagszámításon kívül más függvényket is elérhetünk. Az `apply()` első paramétere maga a mátrix, a második helyen pedig 1 vagy 2 áll, attól függően, hogy a mátrix soraira (1) vagy oszlopaira (2) akarjuk a harmadik paraméterben szereplő függvényt alkalmazni.


```r
apply(x, 1, mean)    # sorátlagok, a tanulók félév végi átlaga
#>   Pál   Ili   Éva 
#> 4.575 3.825 4.275
apply(x, 1, sd)      # soronkénti szórások
#>       Pál       Ili       Éva 
#> 0.7544314 0.6652067 0.9844626
apply(x, 1, min)     # soronkénti minimumok
#> Pál Ili Éva 
#> 3.7 2.9 3.0
apply(x, 2, mean)    # oszlopátlagok, a tantárgyak átlaga
#>    matek   magyar    angol     ének 
#> 4.400000 4.366667 3.666667 4.466667
apply(x, 2, sd)      # oszloponkénti szórások
#>     matek    magyar     angol      ének 
#> 0.7000000 0.8144528 1.2423097 0.4618802
apply(x, 2, min)     # oszloponkénti minimumok
#>  matek magyar  angol   ének 
#>    3.7    3.8    2.9    4.2
```


#### Sorok és oszlopok kezelése

Mátrixokat az `rbind()` és a `cbind()` függvényekkel is építhetünk.


```r
cbind(1, 1:2, 1:4)    # mátrix létrehozása oszlopvektorokból
#>      [,1] [,2] [,3]
#> [1,]    1    1    1
#> [2,]    1    2    2
#> [3,]    1    1    3
#> [4,]    1    2    4
rbind(1, 1:2, 1:4)    # mátrix létrehozása sorvektorokból
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    1    1    1
#> [2,]    1    2    1    2
#> [3,]    1    2    3    4
```

Vektor paraméterek esetén, a felsorolt vektorok fogják alkotni az új mátrix oszlopait (`cbind()` esetén), illetve sorait (`rbind()` esetén), a rövidebb vektor, ha van ilyen, ismétlődni fog.

Új oszloppal vagy új sorral is kiegészíthetjük a már létező mátrixunkat.


```r
x <- matrix(1:12, nrow=4, ncol=3); x
#>      [,1] [,2] [,3]
#> [1,]    1    5    9
#> [2,]    2    6   10
#> [3,]    3    7   11
#> [4,]    4    8   12
cbind(-3:0, x, 13:16)  # oszlopvektorok hozzáfűzése x elé és mögé
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]   -3    1    5    9   13
#> [2,]   -2    2    6   10   14
#> [3,]   -1    3    7   11   15
#> [4,]    0    4    8   12   16
rbind(-1, x, 1)        # sorvektorok hozzáfűzése x fölé és alá      
#>      [,1] [,2] [,3]
#> [1,]   -1   -1   -1
#> [2,]    1    5    9
#> [3,]    2    6   10
#> [4,]    3    7   11
#> [5,]    4    8   12
#> [6,]    1    1    1
```

Tetszőleges pozícióba beszúrhatunk egy oszlopot vagy egy sort. Ehhez első lépésben a létező `x` mátrixhoz hozzáillesztjük az új oszlopot vagy sort, majd indexeléssel átrendezzük az oszlopokat vagy sorokat. 


```r
cbind(x, 13:16)[, c(1,2,4,3)]
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    5   13    9
#> [2,]    2    6   14   10
#> [3,]    3    7   15   11
#> [4,]    4    8   16   12
rbind(x, -1)[c(1, 2, 3, 5, 4),]
#>      [,1] [,2] [,3]
#> [1,]    1    5    9
#> [2,]    2    6   10
#> [3,]    3    7   11
#> [4,]   -1   -1   -1
#> [5,]    4    8   12
```


Hasznos lehetőség összesítő sorok vagy oszlopok mátrixhoz fűzése és elnevezése:


```r
x <- rbind(x,apply(x,2,mean))
rownames(x) <- c(1:4,"átlag")
x
#>       [,1] [,2] [,3]
#> 1      1.0  5.0  9.0
#> 2      2.0  6.0 10.0
#> 3      3.0  7.0 11.0
#> 4      4.0  8.0 12.0
#> átlag  2.5  6.5 10.5
```

A sorok vagy oszlopok sorrendjét is megcserélhetjük a mátrixban, valamint ezek törlésére is van lehetőségünk:


```r
x <- matrix(1:12, nrow=4, ncol=3); x
#>      [,1] [,2] [,3]
#> [1,]    1    5    9
#> [2,]    2    6   10
#> [3,]    3    7   11
#> [4,]    4    8   12
y <- x[, c(2, 3, 1)]          # oszlopcsere
y <- x[c(3, 2, 4, 1), ]       # sorcsere
y <- x[, c(1, 3)]             # a 2. oszlop törlése
y <- x[c(1, 3), ]             # az 2. és a 4. sor törlése
```

#### Részösszefoglalás {#az-r-nyelv-6-summary}

<div class="rmdsummary">
<p>A mátrix homogén kétdimenziós adatszerkezet, és többnyire a <code>matrix()</code> függvénnyel hozzuk létre. Indexelése a <code>[]</code> operátorral történik, ahol sor- és oszlopindex megadásra van lehetőségünk.</p>
</div>

#### Feladatok {#az-r-nyelv-6-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Hozzunk létre egy csupa 1-ből álló mátrixot, amelynek 3 sora és 2 oszlopa van!
1. Hozzunk létre egy 3 $\times$ 4-es karakteres mátrixot, amely 12 különbüző keresztnevet tartalmaz!
1. Hozzunk létre egy 3 $\times$ 4-es logikai mátrixot, amelynek 1. és 3. sora `TURE` a 2. sora pedig `FALSE` értékeket tartalmaz!
1. Mátrixok indexelésére olyan speciális indexmátrix is használható, amelynek két oszlopa van, és az elérendő elemek sor- és oszlopkoordinátáit tartalmazza. Mutassunk példát erre a `mátrix[indexmátrix]` alakú mátrixindexelésre!
  

</div>\EndKnitrBlock{rmdexercise}


### Faktor

A faktor adattípus nagyon hasonló a vektorhoz, ugyanis minden faktor egy speciális *integer* vektor, a faktor tehát homogén és egydimenziós adatszerkezet. Faktorokat elsősorban kategorikus változók értékeinek tárolására használjuk, ilyen például a személyek neme vagy iskolai végzettsége. A faktor egy lényeges ponton több mint egy egyszerű *integer* vektor. A faktor karbantart egy összerendelést az 1-gyel kezdődő numerikus egészek és a faktor lehetséges karakteres értékei, a címkék között (az \@ref(fig:adatszerkezetek-1) ábrán ezt egy piros kis téglalappal jelöltük). Egy faktorelem értéke csak ezekből a címkékből kerülhet ki, ami nagy fokú védelmet jelent számunkra az adatkezelés során. Ha például létrehozunk egy faktort az (1-`"férfi"`, 2-`"nő"`) összerendeléssel, akkor egy faktorelem csak a `"férfi"` vagy `"nő"` címkéket veheti fel, más értéket nem (az `NA` hiányzó érték termésetesen lehet faktorelem értéke). A munka során mindig a címkékkel találkozunk, a háttérben lévő numerikus egészek csak ritkán kapnak szerepet. 

#### Faktor létrehozása

A faktorokat jellemzően karakteres vagy numerikus vektorokból hozzuk létre a `factor()` függvény segítségével. A faktor létrehozásánál mindig gondoskodjunk a faktor lehetséges értékeinek, vagyis a faktor címkéiknek megadásáról. A címkéket néha (faktor)szinteknek (levels) is nevezzük. Mivel a kategorikus változóink lehetséges értékei többnyire ismertek az adatkezelés elején, a faktorszintek felsorolása nem okozhat nehézséget. Most hozzunk létre egy faktort, amely öt személy nemét tartalmazza.


```r
x <- c("férfi", "férfi", "nő", "férfi", "nő")  # karakteres vektor lérehozása
x.f <- factor(x, levels=c("férfi", "nő"))      # faktor létrehozása
x.f                                            # faktor kiíratása
#> [1] férfi férfi nő    férfi nő   
#> Levels: férfi nő
unclass(x.f)                                   # integer kódok a háttérben
#> [1] 1 1 2 1 2
#> attr(,"levels")
#> [1] "férfi" "nő"
```

Az `x.f` faktort az `x` karakteres vektorból hoztuk létre, így `x.f` ugyanúgy 5 hosszú, mint az `x`. Az `x.f` outputjában olvasható `Levels: férfi nő` rész azt közli velünk, hogy a háttérben az 1 numerikus értéknek a `"férfi"` címke, míg a 2-nek a `"nő"` címke felel meg. A belső integer kódok is feltárulnak az `unclass(x.f)` outputjában. A szám-címke összerendelést magunk szabályozhatjuk, ha a `factor()` függvény `levels=` argumentumában módosítunk a sorrenden. 


```r
x.f <- factor(x, levels=c("nő", "férfi"))      # faktor létrehozása
x.f
#> [1] férfi férfi nő    férfi nő   
#> Levels: nő férfi
```

A fenti `x.f` faktor ugyanannak az 5 személynek a nemét tartalmazza, de az összerendelést a `levels=c("nő", "férfi")` paraméterrel (1-`"nő"`, 2-`"férfi"`)-re változtattuk. Láthatjuk, a címkék sorrendje a faktor értékeitől független, mégis fontos szerepet kap majd a táblázatok és ábrák megjelenítésénél, tehát érdemes rá odafigyelni.

A `levels=` argumentum szerepeltetése a `factor()` függvényben sok kellemtlenségtől kímélhet meg minket. Ha elhagyjuk, akkor a `factor()` függvény a karakteres vektorban aktuálisan rendelkezésre álló értékekből konstruálja meg a faktort. Nézzünk erre három esetet.


```r
(x.f.1 <- factor(c("férfi", "férfi", "nő", "férfi", "nő")))
#> [1] férfi férfi nő    férfi nő   
#> Levels: férfi nő
(x.f.2 <- factor(c("férfi", "Férfi", "nő", "férfi", "nő")))
#> [1] férfi Férfi nő    férfi nő   
#> Levels: férfi Férfi nő
(x.f.3 <- factor(c("nő", "nő", "nő", "nő", "nő")))
#> [1] nő nő nő nő nő
#> Levels: nő
```

Az első esetben a faktor létrehozásához használt karakteres vektor megegyezik a korábban látottakhoz, azaz helyesen tartalmazza mind a `"férfi"`, mind a `"nő"` címkéket, így az `x.f.1` faktor a címkék lexikografikus rendezése alapján az (1-`"férfi"`, 2-`"nő"`) összerendeléssel jön létre. A második esetben karakteres vektorunk elgépelés miatt egy `"Férfi"` címkét is tartalmaz, ami az `x.f.2` faktor szintjei között is meg fog jelenni. A harmadik esetben az okozza a problémát, hogy 5 azonos nemű személy került a mintába, így a `"férfi"` címke egyáltalán nem jelenik meg az `x.f.3` faktor szintjei között. Az `x.f.2` és az `x.f.3` faktorok tehát más-más okok miatt, de hibásan tartalmazzák a faktorszinteket, és ez a későbbi működést alapvetően befolyásolja. Az `x.f.2` három különböző nemet ismer, az `x.f.3` pedig mindössze egyet. A fenti hibák a `levels=` szerepeltetésével könnyen kiküszöbölhetők.


```r
(x.f.2 <- factor(c("férfi", "Férfi", "nő", "férfi", "nő"),
                 levels=c("férfi", "nő")))   
#> [1] férfi <NA>  nő    férfi nő   
#> Levels: férfi nő
(x.f.3 <- factor(c("nő", "nő", "nő", "nő", "nő"),
                 levels=c("férfi", "nő")))
#> [1] nő nő nő nő nő
#> Levels: férfi nő
```

A fenti példákban látható, hogy a `"Férfi"` címke helyére hiányzó érték került, az `x.f.3` faktor pedig már `"férfi"` értéket is fel tud venni a jövőben.

Numerikus vektorokból is készíthetünk faktorokat. Például a könnyebb rögzíthetőség miatt öt személy nemét most numerikus vektorban hoztuk létre azzal a szabállyal, hogy a 0 jelentése nő, az 1 jelentése férfi. A faktor létrehozása során ekkor a `levels=` szerepe a lehetséges numerikus értékek felsorolása lesz, és a plusz paraméterként szereplő `labels=` segít a faktorszintek beszédes elnevezésében. Az elnevezés a `levels=`-ben lévő numerikus értékek sorrendjében történik, ezért nagyon fontos, hogy a `labels=` címkéi kövessék ezt a sorrendet.


```r
x <- c(1, 1, 0, 1, 0)     # numerikus vektor létrehozása, 0-nő, 1-férfi
(x.f.1 <- factor(x, levels=c(0, 1), 
                    labels=c("nő", "férfi")))
#> [1] férfi férfi nő    férfi nő   
#> Levels: nő férfi
(x.f.2 <- factor(x, levels=c(1, 0), 
                    labels=c("férfi", "nő")))
#> [1] férfi férfi nő    férfi nő   
#> Levels: férfi nő
```

A fenti példában látható, hogy a `levels=` értékeinek sorrendje vezérli az elnevezést, a 0 mindkét esetben `"nő"`, az 1 `"férfi"` címkéhez fog vezetni. Az `x.f.1` és `x.f.2` faktorok mindössze a háttérben lévő összerendelésben különböznek, első esetben az (1-`"nő"`, 2-`"férfi"`), míg második esetben az (1-`"férfi"`, 2-`"nő"`) lesz a faktorszintek sorrendje.

#### Szabályos faktor létrehozása

Ismétlést tartalmazó faktorokat a `gl()` függvénnyel is létrehozhatunk. Tipikusan a szintek (`n=`) számát, az ismétlések számát (`k=`) és a címkéket (`labels=`) szoktuk megadni.


```r
(x.f <- gl(n = 3, k = 2))
#> [1] 1 1 2 2 3 3
#> Levels: 1 2 3
(x.f <- gl(n = 3, k = 2, labels=c("alap", "közép", "felső")))
#> [1] alap  alap  közép közép felső felső
#> Levels: alap közép felső
```

#### Faktor indexelése és szűrése

Faktor indexelése a `[]` operátorral történik. Indexvektorként numerikus, karakteres és logikai vektorokat is használhatunk. Faktor indexelésének átalános alakja:

```markdown
faktor[indexvektor]     # az eredmény egy faktor
```

Hozzunk létre egy faktort, amely hat személy dohányzási szokását tartalmazza (D-dohányzik, ND-nem dohányzik).


```r
(x.f <- factor(c("D", "D", "ND", "D", "ND", "ND"), levels = c("ND", "D")))
#> [1] D  D  ND D  ND ND
#> Levels: ND D
x.f[1]             # az x faktor 1. eleme (faktorszintek változatlanok)
#> [1] D
#> Levels: ND D
x.f[1, drop=T]     # az x faktor 1. eleme (faktorszintek változtak)
#> [1] D
#> Levels: D
x.f[1:3]           # az x faktor 1., 2. és 3. eleme
#> [1] D  D  ND
#> Levels: ND D
x.f[c(T, F)]       # az x faktor 1, 3. és 5. eleme
#> [1] D  ND ND
#> Levels: ND D
x.f[x.f == "D"]    # x szűrése (a dohányzók)
#> [1] D D D
#> Levels: ND D
x.f[x.f != "D"]    # x szűrése (a nem dohányzók)
#> [1] ND ND ND
#> Levels: ND D
```

Az indexelés eredménye minden esetben egy faktor lesz, amelynek szintjei alapesetben megegyeznek az eredeti faktor szintjeivel. A `drop=T` argumentum a nem használt címkéket eltávolítja a faktorszintek közül. Logika kifejezéseket is használhatunk az indexelés során, azaz szűrést is végezhetünk, de vegyük figyelembe, hogy faktor esetén csak két relációs operátor használható, az egyenlő (`==`) és nem egyenlő (`!=`). 

Indexelt faktor természetesen érékadás bal oldalán is szereplhet. A faktor adatszerkezet megvéd minket az értékadások során, hiszen egy faktorelem csak a faktorszintekben szereplő értékek egyikét veheti fel.



```r
x.f                        # az x.f faktor kiírása
#> [1] D  D  ND D  ND ND
#> Levels: ND D
x.f[1] <- "ND"             # az x.f faktor 1. eleme legális értéket kap
x.f[2] <- "nem dohányzik"  # az x.f faktor 2. eleme NA lesz
x.f
#> [1] ND   <NA> ND   D    ND   ND  
#> Levels: ND D
```

Mivel a `"nem dohányzik"` címke nem szerepel a faktorszintek között, az `x.f` faktor 2. eleme `NA` lesz, egy figyelmeztető üzenet kíséretében.

#### Faktorok kezelése

A faktorok kényelmes használatát két további függvény segíti. Az `nlevels()` függvénnyel a faktorszintek számát ismerhetjük meg, a `levels()` függvénnyel lekérdezhetők és módosíthatók a faktorszintek. Nézzünk egy példát az iskolai végzettségel kapcsolatban. Összesen 7 személyről tudjuk, hogy alap-, közép- vagy felsőfokú végzettségű, de az egyszerűbb rögzítés miatt indulásként ezt az információt számokkal kódoltuk (1-alap, 2-közép, 3-felső).   


```r
# numerikus vektor létrehozása
isk.vegz   <- c(1, 1, 2, 1, 3, 3, 2)
# faktor létrehozása
isk.vegz.f <- factor(isk.vegz, levels=c("1", "2", "3")) 
isk.vegz.f                              # a faktor értéke
#> [1] 1 1 2 1 3 3 2
#> Levels: 1 2 3
nlevels(isk.vegz.f)                     # a faktor szintjeinek száma
#> [1] 3
levels(isk.vegz.f)                      # a faktor szintjei
#> [1] "1" "2" "3"
# a faktor szintjeinek módosítása
levels(isk.vegz.f) <- c("alap", "közép", "felső") 
isk.vegz.f                              # a faktor értéke
#> [1] alap  alap  közép alap  felső felső közép
#> Levels: alap közép felső
```

Az `isk.vegz.f` faktort az `"1"`, `"2"` és `"3"` címkékkel hoztuk létre, de később a `levels()` függvénnyel beszédesebb faktorszinteket hoztunk létre.

#### Részösszefoglalás {#az-r-nyelv-7-summary}

<div class="rmdsummary">
<p>A faktor olyan <em>integer</em> vektor, amely az 1-től sorszámozott értékeihez egy-egy karakteres címkét rendel. Ezek a címkék alkotják a faktorelemek lehetséges értékeit, amelyeket másnéven faktorszinteknek is neveznek. A faktor létrehozásához a <code>factor()</code> függvényt használjuk, és karakteres vektor konstansaiból vagy numerikus vektor címkeként kezelt számértékeiből jönnek létre a faktor lehetséges értékei.</p>
</div>

#### Feladatok {#az-r-nyelv-7-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Hozzuk létre azt a karakteres vektort, amely a férfi, nő karakteres konstansokat, úgy helyezi el egymás mellett, hogy a 7 darab férfi érték után 13 db nő címke következik! Hány elemű az így létrejött vektor?
1. Egy vizsgálatban az első 10 személy neme férfi, a többi 8 neme nő volt. Hozzuk létre azt a faktort, amely leírja a neme változót!
1. Egy vizsgálatban városi ("V") és falusi ("F") fiatalok vettek részt! A megkérdezettek településtípusa rendre a következő volt: F, F, V, F , V, V, V, F. Hozzuk létre azt a faktort, amely leírja a településtípus változót!
1. Egy vizsgálatban a dohányzási szokást egy kétértékű skálán mérték: 0-nem dohányzik; 1-dohányzik. A megkérdezettek dohányzási szokása a következő volt: 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0. Hozzuk létre azt a faktort, amely leírja a dohányzási szokás változót!

</div>\EndKnitrBlock{rmdexercise}





### Lista {#listadefalf}

Az eddig megismert vektor, mátrix és faktor adatszerkezet mindegyike homogén volt, csak azonos típusú értékek tárolására használhatjuk őket. A lista típusú adatokban különböző adatszerkezetű elemeket is felsorolhatunk, de sem a típusra, sem a méretre nincs korlátozás. Egy listaelem lehet vektor, mátrix, faktor, adattábla vagy akár egy másik lista is (\@ref(fig:adatszerkezetek-1) ábra). Látható, hogy a lista az R legszabadabb adatszerkezete, egydimenziós, és a célja a logikailag összetartozó, de szerkezetileg különböző adatok tárolása. 

#### Lista létrehozása

A `list()` függvénnyel hozhatunk létre legegyszerűbben listákat, itt vesszővel elválasztva kell megadnunk a lista elemeit.


```r
x <- list(1:10, c("A","B"), c=T)    # 3 elemű lista
x
#> [[1]]
#>  [1]  1  2  3  4  5  6  7  8  9 10
#> 
#> [[2]]
#> [1] "A" "B"
#> 
#> $c
#> [1] TRUE
```

A fenti példában `x` egy 3 elemű lista, az első eleme egy 10 elemű numerikus vektor, a második eleme egy 2 elemű karakteres vektor, a harmadik eleme pedig egy 1 elemű logikai vektor. A harmadik elemnek a `c` nevet adtuk, de bármelyik elemet elnevezhettük volna ezzel a módszerrel. Ha a lista értékét megjelenítjük a képernyőn, akkor a listaelemek egymás alatt jelennek meg. Az első két esetben a kettős szögletes zárójelben (`[[]]`) lévő sorszám azonosítja a lista elemeit, a harmadik esetben pedig a listaelem általunk megadott neve a dollárjel (`$`) után.

A listaelemek nevét a `names()` függvénnyel kérdezhetjük le és állíthatjuk be.


```r
names(x)                       # az x lista elemeinek neve
#> [1] ""  ""  "c"
names(x)[c(1,2)] <- c("a","b") # az x 1. és 2. elemének elnevezése
names(x)
#> [1] "a" "b" "c"
x
#> $a
#>  [1]  1  2  3  4  5  6  7  8  9 10
#> 
#> $b
#> [1] "A" "B"
#> 
#> $c
#> [1] TRUE
```


#### Lista indexelése

Egy lista indexelése a már megszokot `[]` indexoperátorral történik, amelyben továbbra is lehetőségünk van numerikus, karakteres és logikai indexvektor megadására is. 


```r
x[1]           # az x lista 1. elemét tartalmazó 1 elemű lista
#> $a
#>  [1]  1  2  3  4  5  6  7  8  9 10
x[c(2, 3)]     # az x lista 2. és 3. elemét tartalmazó 2 elemű lista
#> $b
#> [1] "A" "B"
#> 
#> $c
#> [1] TRUE
x["a"]         # az x lista 1. elemét tartalmazó 1 elemű lista
#> $a
#>  [1]  1  2  3  4  5  6  7  8  9 10
x[c(T, F, T)]  # az x lista 1. és 3. elemét tartalmazó 1 elemű lista
#> $a
#>  [1]  1  2  3  4  5  6  7  8  9 10
#> 
#> $c
#> [1] TRUE
```

A `[]` operátorral kapott eredmény minden esetben lista, még akkor is, ha a lista egyetlen elemét érjük el. Nagyon fontos ettől megkülönböztetni a `[[]]` operátor eredményét, amely a lista valamelyik (egyetlen) elemével, annak az értékével tér vissza. Itt nincs mód több listaelem elérésére, és szokás szerint numerikus vagy karakteres értékkel indexelünk.


```r
x[[1]]     # az x lista 1. eleme
#>  [1]  1  2  3  4  5  6  7  8  9 10
x[["b"]]   # az x lista 2. eleme
#> [1] "A" "B"
x[[3]]     # az x lista 3. eleme
#> [1] TRUE
```

A `[[]]` operátor alkalmazása helyett a rövidebb dollár (`$`) operátort is használhatjuk azoknak a listaelemeknek az elérésére, amelyeket korábban elneveztünk. A lista nevét és az elem nevét fűzzük össze a `$` operátorral.


```r
x$a        # az x lista 1. eleme
#>  [1]  1  2  3  4  5  6  7  8  9 10
x$b        # az x lista 2. eleme
#> [1] "A" "B"
x$c        # az x lista 3. eleme
#> [1] TRUE
```

Ha a lista elemét valamelyik módszer segítségével elértük, akkor további indexelés segítségével az elem összetevőit is lekérdezhetjük vagy módosíthatjuk.


```r
x[["a"]][3:4]       # az x lista 1. elemének 3. és 4. eleme 
#> [1] 3 4
x$a[4:5] <- 0       # az x lista 1. elemének 4. és 5. eleme 0 lesz
x$c <- 1:2          # az x lista 3. elemének módosítása    
x
#> $a
#>  [1]  1  2  3  0  0  6  7  8  9 10
#> 
#> $b
#> [1] "A" "B"
#> 
#> $c
#> [1] 1 2
```

A lista indexelésére tehát a következő lehetőségek állnak rendelkezésre:

```markdown
lista[indexvektor]     # az eredmény egy lista
lista[[index]]         # az eredmény a lista egy eleme
lista$elemnév          # az eredmény a lista egy eleme  
```

#### Művelet a listaelemekkel

Egy lista mindem elemével az `lapply()` vagy az `sapply()` függvény segítségével hajthatunk végre műveletet. 


```r
lapply(X=x, FUN=length) # az x lista minden elemének a hossza egy listába
#> $a
#> [1] 10
#> 
#> $b
#> [1] 2
#> 
#> $c
#> [1] 2
sapply(X=x, FUN=length) # az x lista minden elemének a hossza egy vektorba
#>  a  b  c 
#> 10  2  2
```

Az `lapply()` a bemenő lista elemszámával egyező méretű listával tér vissza, melynek értékei az második paraméterben szereplő függvény visszatérési értékei. Az `sapply()` hasonlóan jár el, de a visszatérési értéke egy vektor.

#### Részösszefoglalás {#az-r-nyelv-8-summary}

<div class="rmdsummary">
<p>A lista az R legszabadabb adatszerkezete, egydimenziós és inhomogén. Listát a <code>list()</code> függvénnyel hozhatunk létre, melynek argumentumában tetszőleges adatszerkezetű objektumokat felsorolhatunk, ezek alkotják a lista egyes elemeit. Lista indexelése a <code>[]</code>, <code>[[]]</code> és <code>$</code> operátorokkal is lehetséges.</p>
</div>

#### Feladatok {#az-r-nyelv-8-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">
1. Hozzunk létre egy háromelemű listát a TRUE, 12, és "Verseny" konstansokból!
1. Hozzunk létre egy háromelemű listát a TRUE, 12, és "Verseny" konstansokból, de gondoskodjunk az egyes elemek elnevezéséről, amelyek legyenek rendre: "befejezve", "indulok" és "leiras"!
1. Hozzunk létre egy háromelemű listát a TRUE, 12 és "Verseny" konstansokból, valamint az induló versenyzők végső pontszámaiból, amelyek rendre: 89, 78, 23, 67, 99, 69, 85, 77, 58, 72, 48, 81. Gondoskodjunk az egyes elemek elnevezéséről, amelyek legyenek rendre: "befejezve", "indulok", "leiras" és "pontszam"!

</div>\EndKnitrBlock{rmdexercise}





### Adattábla

Az adattábla (data frame) az R legfontosabb adatszerkezete, központi szerepet játszik az adatfeldolgozásban, lényegében minden statisztikai munka kiindulópontja. Inhomogén, kétdimenziós szerkezet, sorok és oszlopok alkotják, alapvetően azonos hosszúságú vektorokból és faktorokból épül fel (\@ref(fig:adatszerkezetek-1) ábra). Az adattábla egyesíti a mátrix és a lista adatszerkezet előnyeit. Az adattábla kétdimenziós, mint a mátrix, és inhomogén, mint a lista. Ha mátrixként tekintünk az adattáblára, akkor sorokból és oszlopokból áll, ha listaként, akkor azonos hosszúságú (oszlop)vektorok/faktorok egydimenziós sorozata.

#### Adattábla létrehozása

Adattáblát legegyszerűbben a `data.frame()`\index{data.frame()} függvénnyel hozhatunk létre, amely azonos hosszú vektorokat vagy faktorokat vár az argumentumában. A `data.frame()` tehát listaszerűen konstruálja az adattáblát.


```r
df <- data.frame(
  nev  = c("Péter", "Éva", "Lajos"),
  pont = c(34, 32, 29)
) 
df      # adattábla kiírása
#>     nev pont
#> 1 Péter   34
#> 2   Éva   32
#> 3 Lajos   29
```

A fenti `df` adattáblát egy 3 elemű karakteres vektorból, és egy 3 elemű numerikus vektorból hoztuk létre. A `data.frame()` függvénynek ezt a két vektort adtuk meg, ennek megfelelően két oszlopa lesz az adattáblának. Mindkét vektor 3 elemű, így 3 sor lesz a `df`-ben. Adattábálánk így 3 $\times$ 2-es. Mindkét argumentumokat elneveztük (`nev`, `pont`), ezekből oszlopnevek lesznek. Az oszlopok elnevezéséhez az objektumokneveknél használt szabályokat vegyük figyelembe (\@ref(objektumelnevezes) fejezet), és ne használjunk ékezetes karaktereket és szóközt. A fenti outputból kiolvasható, hogy az adattábla sornevekkel is rendelkezik, ezek automatikusan jönnek létre 1-től kezdődő sorszámmal. 

Ha a `data.frame()` függvényben a paraméterek hossza nem azonos, akkor a rövidebb vektorok és faktorok ismétléssel kiegészülnek a leghosszabb oszlop hosszára. Az ismétlés azonban csak egész számszor lehetséges, egyébként hibaüzenetet kapunk.


```r
tipus <- factor(c('A','B')); x <- 6:8; y <- 1:6
df2 <- data.frame(
   tipus, 
   pont.1=x, 
   pont.2=y
)
df2
#>   tipus pont.1 pont.2
#> 1     A      6      1
#> 2     B      7      2
#> 3     A      8      3
#> 4     B      6      4
#> 5     A      7      5
#> 6     B      8      6
```

A példában egy 6 sorból és 3 oszlopból álló adattáblát készítettünk (`df2` 6 $\times$ 3-as). A `data.frame()` függvényben nem azonos a `tipus` faktor és a két numerikus vektor (`x`, `y`) hossza, így ismétléssel kapjuk meg a fenti eredményt. Továbbá, ha elhagyjuk az argumentum nevét, akkor az oszlopnév a megfelelő objektum neve alapján jön létre. Így kapta az első oszlop a `tipus` nevet. 

#### Adattábla felépítése

Adattábláink ritkán olyan kicsik, mint a fenti `df` vagy `df2`. Sokszor több tucat sorból és oszlopból állnak, így az adattábla áttekintésére nem az adattáblát tároló objektum értékének képernyőre írása a legszerencsésebb. Kényelmesebb, ha az *RStudio* adatbázis ablakában jelenítjük meg az adattábla tartalmát, amit a *Környezet* panel megfelelő adatbázisnevén való kattintással és vagy a `View()` parancssal kezdeményezhetünk. Próbáljuk ki a `View(df)` és `View(df2)` függvényhívásokat. 

Hasznos információ szolgáltat az `str()`\index{str()} függvény is, amely az adattábla szerkezetéről ad felvilágosítást.


```r
str(df)     # a df adattábla szerkezete
#> 'data.frame':	3 obs. of  2 variables:
#>  $ nev : chr  "Péter" "Éva" "Lajos"
#>  $ pont: num  34 32 29
```

Láthatjuk, hogy a `df` adattáblánk 3 sort (megfigyelést) és 2 oszlopot (változót) tartalmaz, valamint leolvashatjuk az egyes oszlopok típusát is. Megfigyelhetjük, hogy a `nev` oszlop karakteres, a `pont` pedig numerikus vektor.

Láttuk korábban, hogy az adattábla sorai és oszlopai névvel is rendelkeznek.


```r
names(df); colnames(df)  # oszlopnevek
#> [1] "nev"  "pont"
#> [1] "nev"  "pont"
rownames(df)             # sornevek
#> [1] "1" "2" "3"
```

A `rownames()` a sorok nevét, a `colnames()` és a `names()` az oszlopok nevét írja ki, de segítségükkel ezeket módosíthatjuk is. A sorok és oszlopok nevének meghatározásánál ügyeljünk arra, hogy azok minden esetben legyenek egyediek. Két azonos sornév létrehozása hibaüzenethez vezet, de az azonos oszlopnevek használatát is kerüljük.


```r
rownames(df) <- paste0(1:3, ".szemely")   # soroknevek módosítása
names(df) <- c("X","Y")                   # oszlopnevek módosítása
df
#>               X  Y
#> 1.szemely Péter 34
#> 2.szemely   Éva 32
#> 3.szemely Lajos 29
```

A `length()` függvény az oszlopok számával tér vissza. Az `nrow()` és az `ncol()` a sor- és oszlopok számával tér vissza.


```r
length(df); ncol(df)   # oszlopok száma
#> [1] 2
#> [1] 2
nrow(df)               # sorok száma
#> [1] 3
```

#### Adattábla indexelése

Az adattáblák indexelése a mátrixok és a listáknál megtanult indexelési formákat jelentik. Az általános indexelése formák a következők:

```markdown
adattábla[sorindexvektor, oszlopindexvektor] # adattábla, vektor vagy faktor 
adattábla[sorindexvektor]                    # adattábla
adattábla$oszlopnév                          # vektor vagy faktor                    
```
 
A mátrixokhoz hasonlóan indexelhetjük a sorokat és az oszlopokat, hiszen az adattábla kétdimenziós. A `[]` operátorban szerepel egy vessző, amely a sor- és oszlopkoordinátákat választja el egymástól. Használhatjuk a következő hivatkozásokat:


```r
df2               # a df2 adattábla kiírása
#>   tipus pont.1 pont.2
#> 1     A      6      1
#> 2     B      7      2
#> 3     A      8      3
#> 4     B      6      4
#> 5     A      7      5
#> 6     B      8      6
df2[2, 3]         # a df2 2. sorában a 3. oszlop adata, vektor eredmény
#> [1] 2
df2[c(2, 3), 3]   # a df2 2. és 3. sorában a 3. oszlop adata, vektor
#> [1] 2 3
df2[c(2, 3), 1:2] # a df2 2. és 3. sorában a 1. és 2. oszlop adata, adattábla
#>   tipus pont.1
#> 2     B      7
#> 3     A      8
df2[c(2, 3), ]    # a df2 2. és 3. sora, adattábla
#>   tipus pont.1 pont.2
#> 2     B      7      2
#> 3     A      8      3
df2[2, ]          # a df2 2. sora, adattábla
#>   tipus pont.1 pont.2
#> 2     B      7      2
df2[, 3]          # a df2 3. oszlopa, vektor
#> [1] 1 2 3 4 5 6
df2[, 3, drop=F]  # a df2 3. oszlopa, adattábla
#>   pont.2
#> 1      1
#> 2      2
#> 3      3
#> 4      4
#> 5      5
#> 6      6
df2[, 1:2]        # a df2 1. és 2. oszlopa, adattábla
#>   tipus pont.1
#> 1     A      6
#> 2     B      7
#> 3     A      8
#> 4     B      6
#> 5     A      7
#> 6     B      8
```

Numerikus indexvektorok mellett használhatunk karakteres és logikai vektorokat is indexelésre.


```r
df2[, c("tipus", "pont.1")]         # minden sor, 1. és 2. oszlop
#>   tipus pont.1
#> 1     A      6
#> 2     B      7
#> 3     A      8
#> 4     B      6
#> 5     A      7
#> 6     B      8
df2[c(T, F), c("tipus", "pont.1")]  # páratlan sorok 1. és 2. oszlop
#>   tipus pont.1
#> 1     A      6
#> 3     A      8
#> 5     A      7
```

Karakteres vektorok tipikusan oszlopindexekben fordulnak elő, logikai vektorok pedig, később látjuk, az adattábla szűrésénél kapnak fontos szerepet.

Ha az adattáblára listaként tekintünk, akkor `[]` operátorban egyetlen indexvektort is szerepltethetünk, amely az adattábla oszlopoit indexeli, és minden esetben adattáblát szolgáltat, még akkor is, ha az adattábla egyetlen oszlopát érjük el.   


```r
df2[2]                    # a df2 2. oszlopa, adattábla
#>   pont.1
#> 1      6
#> 2      7
#> 3      8
#> 4      6
#> 5      7
#> 6      8
df2[1:2]                  # a df2 1. és 2. oszlopa, adattábla
#>   tipus pont.1
#> 1     A      6
#> 2     B      7
#> 3     A      8
#> 4     B      6
#> 5     A      7
#> 6     B      8
df2["tipus"]              # a df2 1. oszlopa, adattábla
#>   tipus
#> 1     A
#> 2     B
#> 3     A
#> 4     B
#> 5     A
#> 6     B
df2[c("tipus", "pont.2")] # a df2 1. és 3. oszlopa, adattábla
#>   tipus pont.2
#> 1     A      1
#> 2     B      2
#> 3     A      3
#> 4     B      4
#> 5     A      5
#> 6     B      6
```

Az adattábla egyes oszlopai a `$` operátorral is elérhetők, amely az adattábla nevét és az oszlop nevét választja el egymástól. Az eredmény minden esetben vektor vagy faktor lesz.


```r
df2$tipus               # a df2 1. oszlopa, faktor
#> [1] A B A B A B
#> Levels: A B
df2$pont.1              # a df2 2. oszlopa, vektor
#> [1] 6 7 8 6 7 8
```


Az adattábla indexelése után kapott adatszerkezetek tovább indexelhetők. Attól függően, hogy a kiinduló adattábla indexelésével kapott adatszerkezet egy- vagy kétdimenziós használhatjuk a `[]` és `$` operátorokat is.


```r
df2[4:1, 1:2][2]           # df2-ből adattábla, majd adattábla
#>   pont.1
#> 4      6
#> 3      8
#> 2      7
#> 1      6
df2[4:1, 1:2]$tipus        # df2-ből adattábla, majd faktor
#> [1] B A B A
#> Levels: A B
df2$pont.2[1:3]            # df2-ből vektor, majd vektor
#> [1] 1 2 3
```

Ne feljetsük el, hogy adattábla indexelése során a lekért elemek módosítására is lehetőségünk van, és a vektoraritmetika szabályai továbbra is teljesülnek.


```r
df2[2, 3] <- 200              # egyetlen érték módosítása 
df2$pont.2 <- df2$pont.2 + 1  # teljes oszlop módosítása
df2                           # df2 kiírása
#>   tipus pont.1 pont.2
#> 1     A      6      2
#> 2     B      7    201
#> 3     A      8      4
#> 4     B      6      5
#> 5     A      7      6
#> 6     B      8      7
```

#### Adattáblák szűrése

Az adattábla indexelésénél logikai vektorokat is használhatunk sorindexvektorban, melyek az adattábla tartalmára vonatkozó relációs kifejezések is lehetnek. Ezzel a módszerrel érhetjük el, hogy az adattábla sorait valamilyen szempont szerint leválogassuk, megszűrjük.


```r
df2[df2$tipus == "A", ]                      # az A típusú sorok leválogatása
#>   tipus pont.1 pont.2
#> 1     A      6      2
#> 3     A      8      4
#> 5     A      7      6
df3 <- df2[df2$pont.1<8 & df2$pont.2>2, 2:3] # összetett logikai kifejezés
```

Az első szűrésünk az adattábla `"A"` címkékkel rendelkező sorait válogatta le, de csak képernyőn olvashatók ezek a sorok. A második szűrés eredményét azonab megőrizzük egy új `df3` objektumban, és látható, hogy a `pont.1` és a `pont.2` numerikus vektorokra vonatkozó összetett logikai kifejezéssel végezzük.  

#### Adattáblák sorainak rendezése

Az adattábla sorainak rendezése a vektoroknál megismert `order()` függvény és a `[]` operátor kombinált alkalmazásával lehetséges. Rendezzük a `pont.1` változó alapján a `df2` sorait.


```r
df2[order(df2$pont.1), ] # df2 sorainak rendezése pont.1 növekvő sorrendjében
#>   tipus pont.1 pont.2
#> 1     A      6      2
#> 4     B      6      5
#> 2     B      7    201
#> 5     A      7      6
#> 3     A      8      4
#> 6     B      8      7
```

Az `order()` függvény `decreasing=TRUE` argumentumával csökkenő sorrendet is elérhetünk. Az `order()` függvény több oszlopot is képes fogadni, így több oszlop alapján is tudunk sorokat rendezni.


```r
# df2 sorainak rendezése pont.1 és pont.2 csökkenő sorrendjében
df2[order(df2$pont.1, df2$pont.2, decreasing=T), ] 
#>   tipus pont.1 pont.2
#> 6     B      8      7
#> 3     A      8      4
#> 2     B      7    201
#> 5     A      7      6
#> 4     B      6      5
#> 1     A      6      2
```

#### Részösszefoglalás {#az-r-nyelv-9-summary}

<div class="rmdsummary">
<p>Az adattábla minden statisztikai munka kiindulópontja. Kétdimenziós, inhomogén szerkezet, de mivel azonos hosszú vektorok vagy faktorok listájának is tekinthető, oszlopaiban homogén adatszerkezet. Létrehozása a <code>data.frame()</code> függvénnyel lehetséges, ahol az argumentumban az oszlopokat alkotó vektorokat és faktorokat kell felsorolni. Az adattábla indexelése a mátrixoknál és a listáknál tanultak alapján lehetséges.</p>
</div>

#### Feladatok {#az-r-nyelv-9-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Hozzunk létre egy 30 $\times$ 3-as adattáblát, `csoport`, `matematika` és `magyar` oszlopnevekkel. A `csoport` változó legyen egy `5.a`, `5.b` és `5.c` címkéket tetszőleges sorrendben tartalmazó faktor, a `matematika` és a `magyar` pedig 1-5 osztályzatokat tartalmazó numerikus vektor.

  </div>\EndKnitrBlock{rmdexercise}

## További adatszerkezetek és függvények

\BeginKnitrBlock{rmdlevel2}<div class="rmdlevel2">
Ebben a fejezetben:
  
* megismerjük a *tömb*, *táblázat*, *dátum*, *idő*, *időtartam* és *tibble* adatszerkezeteket,
* valamint a a munkaterület és munkakönyvtár kezelésének függvényeit.
</div>\EndKnitrBlock{rmdlevel2}

Az R legfontosabb adatszerkezetit megismertük az előző fejezetben. Az adatelemzés kiindulópontja az *adattábla*, amely a *mátrix* és a *lista* adatszerkezet előnyeit egyesíti, lényegében *vektor*ok és *faktor*ok egymásutánja. A munka során azonban találkozhatunk három vagy több dimenzióba szervezett adatokkal (*tömb* és *táblázat*), valamint szükség lehet *dátum*, *idő* és *időtartam* kezelésére is. A *Tidyverse R* megújította az adattáblát, és bevezette a saját *tibble* típusát az adatok szokásos tárolására. Definiáljuk pontosabban a fenti, új adatszerkezeteket:

* *tömb* - Azonos alaptípusú értékekből 3 vagy több dimenzió mentén készítünk adatszerkezetet.
* *táblázat* - A gyakorisági táblázatok R megfelelője, amelyben tipikusan *integer* adatokat rögzítünk, egy, két vagy több dimenzió mentén. 
* *dátum* - Egyetlen *double* érték, amelynek jelentése az `1970-01-01` óta eltelt napok száma.
* *dátum-idő* - Egyetlen *double* érték, amelynek jelentése az `1970-01-01` óta eltelt másodpercek száma.
* *időtartam* - Egyetlen *double* érték, amelynek különböző mértékegységekben mutatja két időpont közötti különbséget.
* *tibble* - Speciális adattábla, amely a `Tidyverse R` része, és megkönnyíti az adatok kezelését.   

Az \@ref(tab:adatszerkezetek) táblázatban már korábban bemutattuk az R legfontosabb adatszerkezeteit, aZ \@ref(tab:adatszerkezetek2) táblázat azokat az új  adatszerkezeteket sorlja fel, amelyeket ebben a fejezetben mutatunk be. Most is közöljük, hogy a `typeof()` és a `class()` milyen outputot szolgáltat az egyes adatszerkezetek esetén.

\begin{table}

\caption{(\#tab:adatszerkezetek2)Adatszerkezetek (folytatás)}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{llll}
\toprule
Adatszerkezet & Létrehozó parancs & typeof(x) & class(x)\\
\midrule
\cellcolor{gray!6}{integer tömb} & \cellcolor{gray!6}{\ttfamily{array(2L,dim=c(2,3,5))}} & \cellcolor{gray!6}{\ttfamily{integer}} & \cellcolor{gray!6}{\ttfamily{array}}\\
double tömb & \ttfamily{array(2,dim=c(2,3,5))} & \ttfamily{double} & \ttfamily{array}\\
\cellcolor{gray!6}{karakteres tömb} & \cellcolor{gray!6}{\ttfamily{array('a',dim=c(2,3,5))}} & \cellcolor{gray!6}{\ttfamily{character}} & \cellcolor{gray!6}{\ttfamily{array}}\\
logikai tömb & \ttfamily{array(T,dim=c(2,3,5))} & \ttfamily{logical} & \ttfamily{array}\\
\cellcolor{gray!6}{táblázat} & \cellcolor{gray!6}{\ttfamily{table(sample(1:10, 100, T))}} & \cellcolor{gray!6}{\ttfamily{integer}} & \cellcolor{gray!6}{\ttfamily{table}}\\
\addlinespace
dátum & \ttfamily{as.Date('1971-05-09')} & \ttfamily{double} & \ttfamily{Date}\\
\cellcolor{gray!6}{dátum-idő} & \cellcolor{gray!6}{\ttfamily{as.POSIXct('2018-08-01 22:00','UTC')}} & \cellcolor{gray!6}{\ttfamily{double}} & \cellcolor{gray!6}{\ttfamily{POSIXct POSIXt}}\\
időtartam & \ttfamily{as.difftime(7,units='days')} & \ttfamily{double} & \ttfamily{difftime}\\
\cellcolor{gray!6}{tibble} & \cellcolor{gray!6}{\ttfamily{tibble(x=1:3,y=letters[1:3])}} & \cellcolor{gray!6}{\ttfamily{list}} & \cellcolor{gray!6}{\ttfamily{tbl\_df tbl data.frame}}\\
\bottomrule
\end{tabular}}
\end{table}

### Tömbök és táblázatok

A tömb a mátrix általánosításával nyerhető adatszerkezet. Az azonos típusú adatokat a mátrix két dimenzió mentén rendezi össze. Azonban három vagy több dimenzió mentén is elvégezhető ez az összerendezés. Így nyerjük a három vagy több dimenziós tömböket. A mátrix két dimenziós tömbnek is tekinthető (vagy a vektor egy egy dimenziós tömbnek). A táblázat a tömbökhöz nagyon hasonló adatszerkezet, de tipikusan számlálással nyert  *integer* értékeket rögzítünk bennük. A tömbökhöz hasonlóan lehetnek egy, két, vagy több dimenziósok.


#### Tömb és táblázat létrehozása

Az `array()` függvénnyel egyszerűen hozhatunk létre tömböt. A függvény a `data=` argumentumban megadott vektor elemeit a `dim=` argumentumban megadott dimenzió-méretek mentén rendezi össze.      


```r
x <- array(data=1:12, dim=c(2, 3, 2)) # az 1:12 vektorból 3 dimenziós tömb 
x                       
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    3    5
#> [2,]    2    4    6
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    7    9   11
#> [2,]    8   10   12
```
  
Fenti 3 dimenziós *integer* tömb 2 $\times$ 3 $\times$ 2-es, azaz 2 sorból, 3 oszlopból és 2 lapból áll. Természetesen *double*, *karakteres* és *logikai* tömbök is hasonló módszerrel hozhatók létre. 

Tekintsünk egy másik példát.


```r
x <- array(data=1:20, dim=c(4, 5))
x
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    5    9   13   17
#> [2,]    2    6   10   14   18
#> [3,]    3    7   11   15   19
#> [4,]    4    8   12   16   20
```


Tehát ha `x` például 3 dimenziós, akkor az `x[1,3,2]` egy lehetséges példa indexelésére, ahol az első sor harmadik oszlopában lévő elemre gondolunk, a második lapról. A kétdimenziós mátrixok esetén csak a sor és oszlop azonosító indexre van szükségünk (például `x[2,3]`), 4 vagy afeletti dimenziószámok esetén természetesen 4 vagy több, vesszővel elválasztott indexre.



Az egydimenziós vektor többdimenziós megfelelője a tömb (array). A tömb a vektorhoz hasonlóan homogén adatszerkezet, amely a `dim` attribútummal is rendelkezik. Egy vektort könnyen átalakíthatunk például egy 3 dimenziós tömbbé a `dim()` függvény segítségével:


```r
x <- 1:8; is.vector(x)
#> [1] TRUE
dim(x) <- c(2,2,2); is.vector(x); is.array(x)
#> [1] FALSE
#> [1] TRUE
attributes(x)
#> $dim
#> [1] 2 2 2
x
#> , , 1
#> 
#>      [,1] [,2]
#> [1,]    1    3
#> [2,]    2    4
#> 
#> , , 2
#> 
#>      [,1] [,2]
#> [1,]    5    7
#> [2,]    6    8
```

Az `x` vektorból egy háromdimenziós tömböt hoztunk létre. Az `is.vector()` és az `is.array()` függvények eligazítanak az objektum adatszerkezetével kapcsolatban, vektor, illetve tömb paraméter esetén logikai igaz értéket adnak. A tömb kiíratása során az indexoperátorokban szereplő sorszámok segítségével igazodhatunk el az elemek között. A háromdimenziós `x` tömb dimenziói a sorok, oszlopok és a lapok. A 8 elemet két lapon a ` , , 1` és a ` , , 2` nevű lapokon két-két sorba `[1, ]`, `[2, ]` és két-két oszlopba `[ ,1]`, `[ ,2]` rendezve sorolja fel az R. A második lapon a 2. sor 1. eleméhez meg kell találnunk a ` , , 2` lapot, a `[2, ]` sort és az `[ ,1]` oszlopot, ami esetünkben a 6.







```r
library(MASS)
tab1 <- table(survey$Sex)
tab1
#> 
#> Female   Male 
#>    118    118
typeof(tab1)
#> [1] "integer"
class(tab1)
#> [1] "table"
dim(tab1)
#> [1] 2

tab2 <- table(survey$Sex, survey$Clap)
tab2
#>         
#>          Left Neither Right
#>   Female   21      24    73
#>   Male     18      25    74
typeof(tab2)
#> [1] "integer"
class(tab2)
#> [1] "table"
dim(tab2)
#> [1] 2 3

tab3 <- table(survey$Sex, survey$Clap, survey$Exer)
tab3
#> , ,  = Freq
#> 
#>         
#>          Left Neither Right
#>   Female   11      17    21
#>   Male      8      16    41
#> 
#> , ,  = None
#> 
#>         
#>          Left Neither Right
#>   Female    3       1     7
#>   Male      3       4     6
#> 
#> , ,  = Some
#> 
#>         
#>          Left Neither Right
#>   Female    7       6    45
#>   Male      7       5    27
typeof(tab3)
#> [1] "integer"
class(tab3)
#> [1] "table"
dim(tab3)
#> [1] 2 3 3
ftable(tab3)
#>                 Freq None Some
#>                               
#> Female Left       11    3    7
#>        Neither    17    1    6
#>        Right      21    7   45
#> Male   Left        8    3    7
#>        Neither    16    4    5
#>        Right      41    6   27

as.array(tab1)
#> 
#> Female   Male 
#>    118    118
as.array(tab2)
#>         
#>          Left Neither Right
#>   Female   21      24    73
#>   Male     18      25    74
as.array(tab3)
#> , ,  = Freq
#> 
#>         
#>          Left Neither Right
#>   Female   11      17    21
#>   Male      8      16    41
#> 
#> , ,  = None
#> 
#>         
#>          Left Neither Right
#>   Female    3       1     7
#>   Male      3       4     6
#> 
#> , ,  = Some
#> 
#>         
#>          Left Neither Right
#>   Female    7       6    45
#>   Male      7       5    27

as.vector(tab1)
#> [1] 118 118
as.matrix(tab2)
#>         
#>          Left Neither Right
#>   Female   21      24    73
#>   Male     18      25    74
as.array(tab3)
#> , ,  = Freq
#> 
#>         
#>          Left Neither Right
#>   Female   11      17    21
#>   Male      8      16    41
#> 
#> , ,  = None
#> 
#>         
#>          Left Neither Right
#>   Female    3       1     7
#>   Male      3       4     6
#> 
#> , ,  = Some
#> 
#>         
#>          Left Neither Right
#>   Female    7       6    45
#>   Male      7       5    27

as.data.frame(tab1)
#>     Var1 Freq
#> 1 Female  118
#> 2   Male  118
as.data.frame(tab2)
#>     Var1    Var2 Freq
#> 1 Female    Left   21
#> 2   Male    Left   18
#> 3 Female Neither   24
#> 4   Male Neither   25
#> 5 Female   Right   73
#> 6   Male   Right   74
as.data.frame(tab3)
#>      Var1    Var2 Var3 Freq
#> 1  Female    Left Freq   11
#> 2    Male    Left Freq    8
#> 3  Female Neither Freq   17
#> 4    Male Neither Freq   16
#> 5  Female   Right Freq   21
#> 6    Male   Right Freq   41
#> 7  Female    Left None    3
#> 8    Male    Left None    3
#> 9  Female Neither None    1
#> 10   Male Neither None    4
#> 11 Female   Right None    7
#> 12   Male   Right None    6
#> 13 Female    Left Some    7
#> 14   Male    Left Some    7
#> 15 Female Neither Some    6
#> 16   Male Neither Some    5
#> 17 Female   Right Some   45
#> 18   Male   Right Some   27

m <- matrix(1:12, ncol=4)
m
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    4    7   10
#> [2,]    2    5    8   11
#> [3,]    3    6    9   12
as.data.frame(m)
#>   V1 V2 V3 V4
#> 1  1  4  7 10
#> 2  2  5  8 11
#> 3  3  6  9 12
as.table(m)
#>    A  B  C  D
#> A  1  4  7 10
#> B  2  5  8 11
#> C  3  6  9 12

d <- as.data.frame(tab2)
as.matrix(xtabs(Freq~Var1+Var2, data=d))
#>         Var2
#> Var1     Left Neither Right
#>   Female   21      24    73
#>   Male     18      25    74
xtabs(Freq~Var1+Var2, data=d)
#>         Var2
#> Var1     Left Neither Right
#>   Female   21      24    73
#>   Male     18      25    74
```

### Dátum és idő
 
Az adatelemzés során a dátumok kezelésének két fő oka lehet, egyrészt szűrésekben használhatjuk őket, például adott dátum vagy időpont előtti, utáni vagy közötti sorok leválogatásában, másrészt statisztikai elemzések is irányulhatnak két dátum vagy időpont között eltelt időtartamra.


#### Dátum kezelése

Amennyiben le akarjuk kérdezni az aktuális dátumot, akkor a `Sys.Date()` függvényt kell használnunk.


```r
datum.1 <- Sys.Date()    # aktuális dátum, dátum típusú objektum
datum.1                  # datum.1 kiírása
#> [1] "2021-12-28"
class(datum.1)           # datum.1 típusa
#> [1] "Date"
unclass(datum.1)         # datum.1 alapja
#> [1] 18989
```

Láthatjuk, hogy a `datum.1` objektum *dátum* (*Date*) típusú annak ellenére, hogy az objektum értéke a képernyőn kettős idézőjelek között jelenik meg. A *dátum* típus alapja egy *double* szám van, amely az 1970. 01. 01. óta eltelt napok számát tartalmazza, ahogyan az `unclass(datum.1)` ezt számunkra meg is mutatja. Világos, hogy az a *double* érték lehet nulla vagy negatív is.


```r
unclass(as.Date("1980-01-01")) # a double szám pozitív
#> [1] 3652
unclass(as.Date("1970-01-01")) # a double szám nulla
#> [1] 0
unclass(as.Date("1960-01-01")) # a double szám negatív
#> [1] -3653
```

##### Dátum létrehozása karakteres adatból

Dátumot legtöbb esetben karakteres konstansból hozunk létre az `as.Date()` függvény segítségével. A dátumok változatos formában jelenhetnek meg, a szabványos `"2019-02-12"` alak mellett sok olyan forma létezik, amelyben elválasztó karakterként a perjel vagy a pont szerepel, valamint az év-hó-nap hármas sorrendje is változhat. A konkrét dátum értelmézéséhez az `as.Date()` függvény `format=` argumentumát kell helyesen beállítani. A használható kódokat a \@ref(tab:datumkodok) táblázat tartalmazza. 


```r
as.Date("2020-04-12")   # szabványos, nem kell format= argumentum
#> [1] "2020-04-12"
as.Date("2020/04/12")   # szabványos, nem kell format= argumentum
#> [1] "2020-04-12"
as.Date("04/12/2020", format="%m/%d/%Y")          # amerikai stílus
#> [1] "2020-04-12"
as.Date("12.04.2020", format="%d.%m.%Y")          # brit stílus
#> [1] "2020-04-12"
as.Date("2019. 04. 12.", format="%Y. %m. %d.")    # magyar stílus
#> [1] "2019-04-12"
Sys.getlocale("LC_TIME")                          # a helyi beállítás magyar?
#> [1] "Hungarian_Hungary.1250"
as.Date("2019. ápr. 12.", format="%Y. %b %d.")    # rövid mqgyar hónapnévvel
#> [1] "2019-04-12"
as.Date("2019. április 12.", format="%Y. %B %d.") # magyar hónapnévvel
#> [1] "2019-04-12"
lct <- Sys.getlocale("LC_TIME")                   # helyi beállítás mentése
Sys.setlocale("LC_TIME", "C")                     # észak-amerikai beállítás 
#> [1] "C"
as.Date("Apr 12, 2020", format="%b %d, %Y")       # rövid angol hónapnévvel
#> [1] "2020-04-12"
as.Date("12 April 2020", format="%d %B %Y")       # angol hónapnévvel
#> [1] "2020-04-12"
Sys.setlocale("LC_TIME", lct)  # magyar helyi beállítás visszatöltése  
#> [1] "Hungarian_Hungary.1250"
```

Magyar számítógépes környezetben a helyi beállítás (locale) alapértelmezés szerint magyar, ennek megfelelően a magyar hónapnevekkel dolgozik az `as.Date()` függvény. A `Sys.getlocale("LC_TIME")` paranccsak vizsgálhatjuk meg, hogy milyen környezetben dolgozunk. A `Sys.setlocale("LC_TIME", "C")` utasítás észak-amerikai beállításokra vált, így angol hónapnevek felismerésére nyílik lehetőség.

##### Dátum létrehozása numerikus adatokból

Dátumot a szeparáltan létező numerikus év, hónap, nap információkból is létrehozhatunk. Ehhez először az `ISOdate()` függvénnyel időpontot állítunk elő, majd az `as.Date()`-tel dátumot. Ezzel a módszerrel egyszerre több dátumot is előállíthatunk.  


```r
as.Date(ISOdate(year = 2020, month = 4, day = 12))
#> [1] "2020-04-12"
as.Date(ISOdate(year = 2020, month = 1:4, day = 12))
#> [1] "2020-01-12" "2020-02-12" "2020-03-12" "2020-04-12"
```

##### Dátum konvertálása karakteres

Sokszor a dátumokat speciális karaktersorozatként szeretnénk látni speciális alakjára, 


```r
(datum.2 <- as.Date("04/12/2020", format = "%m/%d/%Y"))
#> [1] "2020-04-12"
format(datum.2, "%Y. %m. %d.")
#> [1] "2020. 04. 12."
format(datum.2, "%Y. %B %d.")
#> [1] "2020. április 12."
format(datum.2, "%Y. %b %d.")
#> [1] "2020. ápr. 12."
```




```r
datum.2
#> [1] "2020-04-12"
(ido.1 <- as.POSIXlt(datum.2))
#> [1] "2020-04-12 UTC"
ido.1$year + 1900
#> [1] 2020
ido.1$mon + 1
#> [1] 4
ido.1$mday
#> [1] 12
```




```r
as.Date("2061. július 26", format="%Y. %B %d")
#> [1] "2061-07-26"

library(anytime)
anytime::anydate("2061. július 26")
#> [1] NA


library(lubridate)
ymd(c("2061-07-26", "2061/07/26", "2061 July 26", 
      "2061. július 26", "2061 máj. 26"))
#> [1] "2061-07-26" "2061-07-26" "2061-07-26" "2061-07-26" "2061-05-26"
dmy(c("26-07-2061", "2061/07/26", "2061 July 26", 
      "26 July, 2061", "26. júl. 2061."))
#> [1] "2061-07-26" NA           NA           "2061-07-26" "2061-07-26"

ymd_hms("2061-07-26 12:12:32")
#> [1] "2061-07-26 12:12:32 UTC"

parse_date_time("2020. June 12", orders = "Ymd", locale="Hungarian_Hungary.1250")
#> [1] "2020-06-12 UTC"

class(Sys.getlocale("LC_TIME"))
#> [1] "character"

# A Halley-üstökös visszatérése utoljára 1986-ban járt a Naprendszerünkben, így az előrejelzések szerint legközelebb 2061. július 26
```


Table: (\#tab:datumkodok) Formátumkódok a dátumokban


+-------------+------------------------+
|Formátum kód | Jelentés               |
+=============+========================+
| %Y          | év 4 számjeggyel       |
+-------------+------------------------+
| %y          | év 2 számjeggyel       |
+-------------+------------------------+
| %m          | hónap                  |
+-------------+------------------------+
| %b          | hónap rövidített neve  |
+-------------+------------------------+
| %B          | hónap teljes neve      |
+-------------+------------------------+
| %d          | nap                    |
+-------------+------------------------+


##### Két dátum közt eltelt idő


```r
(diff.1 <- difftime(datum.1, datum.2, units = "secs"))
#> Time difference of 5.4e+07 secs
unclass(diff.1)
#> [1] 5.4e+07
#> attr(,"units")
#> [1] "secs"
(diff.2 <- difftime(datum.1, datum.2, units = "mins"))
#> Time difference of 9e+05 mins
unclass(diff.2)
#> [1] 9e+05
#> attr(,"units")
#> [1] "mins"
(diff.3 <- difftime(datum.1, datum.2, units = "hours"))
#> Time difference of 15000 hours
(diff.4 <- difftime(datum.1, datum.2, units = "days"))
#> Time difference of 625 days
(diff.5 <- difftime(datum.1, datum.2, units = "weeks"))
#> Time difference of 89.28571 weeks
as.numeric(diff.1)
#> [1] 5.4e+07
as.numeric(diff.2)
#> [1] 9e+05
as.numeric(diff.3)
#> [1] 15000
as.numeric(diff.4)
#> [1] 625
as.numeric(diff.5)
#> [1] 89.28571
```



#### Idő kezelése




```r
ido.1 <- Sys.time()
ido.1
#> [1] "2021-12-28 22:36:56 CET"
unclass(ido.1)
#> [1] 1640727417

ido.2 <- as.POSIXct("2020-12-02 22:12:23", tz = "Europe/Budapest")

```






```r
Sys.timezone()
#> [1] "Europe/Prague"
datum.ido.1 <- Sys.time()
datum.ido.2 <- as.POSIXct("2018-12-02 22:12:23", tz = "Europe/Budapest")
difftime(datum.ido.1, datum.ido.2, units="min")
#> Time difference of 1615705 mins


as.POSIXct(strptime("2019.09.06. 16:34:17", "%Y.%m.%d. %H:%M:%S"))
#> [1] "2019-09-06 16:34:17 CEST"



as.POSIXct(strptime("2010-10-31 01:30:00", "%Y-%m-%d %H:%M:%S"))
#> [1] "2010-10-31 01:30:00 CEST"
OlsonNames()
#>   [1] "Africa/Abidjan"                   "Africa/Accra"                    
#>   [3] "Africa/Addis_Ababa"               "Africa/Algiers"                  
#>   [5] "Africa/Asmara"                    "Africa/Asmera"                   
#>   [7] "Africa/Bamako"                    "Africa/Bangui"                   
#>   [9] "Africa/Banjul"                    "Africa/Bissau"                   
#>  [11] "Africa/Blantyre"                  "Africa/Brazzaville"              
#>  [13] "Africa/Bujumbura"                 "Africa/Cairo"                    
#>  [15] "Africa/Casablanca"                "Africa/Ceuta"                    
#>  [17] "Africa/Conakry"                   "Africa/Dakar"                    
#>  [19] "Africa/Dar_es_Salaam"             "Africa/Djibouti"                 
#>  [21] "Africa/Douala"                    "Africa/El_Aaiun"                 
#>  [23] "Africa/Freetown"                  "Africa/Gaborone"                 
#>  [25] "Africa/Harare"                    "Africa/Johannesburg"             
#>  [27] "Africa/Juba"                      "Africa/Kampala"                  
#>  [29] "Africa/Khartoum"                  "Africa/Kigali"                   
#>  [31] "Africa/Kinshasa"                  "Africa/Lagos"                    
#>  [33] "Africa/Libreville"                "Africa/Lome"                     
#>  [35] "Africa/Luanda"                    "Africa/Lubumbashi"               
#>  [37] "Africa/Lusaka"                    "Africa/Malabo"                   
#>  [39] "Africa/Maputo"                    "Africa/Maseru"                   
#>  [41] "Africa/Mbabane"                   "Africa/Mogadishu"                
#>  [43] "Africa/Monrovia"                  "Africa/Nairobi"                  
#>  [45] "Africa/Ndjamena"                  "Africa/Niamey"                   
#>  [47] "Africa/Nouakchott"                "Africa/Ouagadougou"              
#>  [49] "Africa/Porto-Novo"                "Africa/Sao_Tome"                 
#>  [51] "Africa/Timbuktu"                  "Africa/Tripoli"                  
#>  [53] "Africa/Tunis"                     "Africa/Windhoek"                 
#>  [55] "America/Adak"                     "America/Anchorage"               
#>  [57] "America/Anguilla"                 "America/Antigua"                 
#>  [59] "America/Araguaina"                "America/Argentina/Buenos_Aires"  
#>  [61] "America/Argentina/Catamarca"      "America/Argentina/ComodRivadavia"
#>  [63] "America/Argentina/Cordoba"        "America/Argentina/Jujuy"         
#>  [65] "America/Argentina/La_Rioja"       "America/Argentina/Mendoza"       
#>  [67] "America/Argentina/Rio_Gallegos"   "America/Argentina/Salta"         
#>  [69] "America/Argentina/San_Juan"       "America/Argentina/San_Luis"      
#>  [71] "America/Argentina/Tucuman"        "America/Argentina/Ushuaia"       
#>  [73] "America/Aruba"                    "America/Asuncion"                
#>  [75] "America/Atikokan"                 "America/Atka"                    
#>  [77] "America/Bahia"                    "America/Bahia_Banderas"          
#>  [79] "America/Barbados"                 "America/Belem"                   
#>  [81] "America/Belize"                   "America/Blanc-Sablon"            
#>  [83] "America/Boa_Vista"                "America/Bogota"                  
#>  [85] "America/Boise"                    "America/Buenos_Aires"            
#>  [87] "America/Cambridge_Bay"            "America/Campo_Grande"            
#>  [89] "America/Cancun"                   "America/Caracas"                 
#>  [91] "America/Catamarca"                "America/Cayenne"                 
#>  [93] "America/Cayman"                   "America/Chicago"                 
#>  [95] "America/Chihuahua"                "America/Coral_Harbour"           
#>  [97] "America/Cordoba"                  "America/Costa_Rica"              
#>  [99] "America/Creston"                  "America/Cuiaba"                  
#> [101] "America/Curacao"                  "America/Danmarkshavn"            
#> [103] "America/Dawson"                   "America/Dawson_Creek"            
#> [105] "America/Denver"                   "America/Detroit"                 
#> [107] "America/Dominica"                 "America/Edmonton"                
#> [109] "America/Eirunepe"                 "America/El_Salvador"             
#> [111] "America/Ensenada"                 "America/Fort_Nelson"             
#> [113] "America/Fort_Wayne"               "America/Fortaleza"               
#> [115] "America/Glace_Bay"                "America/Godthab"                 
#> [117] "America/Goose_Bay"                "America/Grand_Turk"              
#> [119] "America/Grenada"                  "America/Guadeloupe"              
#> [121] "America/Guatemala"                "America/Guayaquil"               
#> [123] "America/Guyana"                   "America/Halifax"                 
#> [125] "America/Havana"                   "America/Hermosillo"              
#> [127] "America/Indiana/Indianapolis"     "America/Indiana/Knox"            
#> [129] "America/Indiana/Marengo"          "America/Indiana/Petersburg"      
#> [131] "America/Indiana/Tell_City"        "America/Indiana/Vevay"           
#> [133] "America/Indiana/Vincennes"        "America/Indiana/Winamac"         
#> [135] "America/Indianapolis"             "America/Inuvik"                  
#> [137] "America/Iqaluit"                  "America/Jamaica"                 
#> [139] "America/Jujuy"                    "America/Juneau"                  
#> [141] "America/Kentucky/Louisville"      "America/Kentucky/Monticello"     
#> [143] "America/Knox_IN"                  "America/Kralendijk"              
#> [145] "America/La_Paz"                   "America/Lima"                    
#> [147] "America/Los_Angeles"              "America/Louisville"              
#> [149] "America/Lower_Princes"            "America/Maceio"                  
#> [151] "America/Managua"                  "America/Manaus"                  
#> [153] "America/Marigot"                  "America/Martinique"              
#> [155] "America/Matamoros"                "America/Mazatlan"                
#> [157] "America/Mendoza"                  "America/Menominee"               
#> [159] "America/Merida"                   "America/Metlakatla"              
#> [161] "America/Mexico_City"              "America/Miquelon"                
#> [163] "America/Moncton"                  "America/Monterrey"               
#> [165] "America/Montevideo"               "America/Montreal"                
#> [167] "America/Montserrat"               "America/Nassau"                  
#> [169] "America/New_York"                 "America/Nipigon"                 
#> [171] "America/Nome"                     "America/Noronha"                 
#> [173] "America/North_Dakota/Beulah"      "America/North_Dakota/Center"     
#> [175] "America/North_Dakota/New_Salem"   "America/Nuuk"                    
#> [177] "America/Ojinaga"                  "America/Panama"                  
#> [179] "America/Pangnirtung"              "America/Paramaribo"              
#> [181] "America/Phoenix"                  "America/Port-au-Prince"          
#> [183] "America/Port_of_Spain"            "America/Porto_Acre"              
#> [185] "America/Porto_Velho"              "America/Puerto_Rico"             
#> [187] "America/Punta_Arenas"             "America/Rainy_River"             
#> [189] "America/Rankin_Inlet"             "America/Recife"                  
#> [191] "America/Regina"                   "America/Resolute"                
#> [193] "America/Rio_Branco"               "America/Rosario"                 
#> [195] "America/Santa_Isabel"             "America/Santarem"                
#> [197] "America/Santiago"                 "America/Santo_Domingo"           
#> [199] "America/Sao_Paulo"                "America/Scoresbysund"            
#> [201] "America/Shiprock"                 "America/Sitka"                   
#> [203] "America/St_Barthelemy"            "America/St_Johns"                
#> [205] "America/St_Kitts"                 "America/St_Lucia"                
#> [207] "America/St_Thomas"                "America/St_Vincent"              
#> [209] "America/Swift_Current"            "America/Tegucigalpa"             
#> [211] "America/Thule"                    "America/Thunder_Bay"             
#> [213] "America/Tijuana"                  "America/Toronto"                 
#> [215] "America/Tortola"                  "America/Vancouver"               
#> [217] "America/Virgin"                   "America/Whitehorse"              
#> [219] "America/Winnipeg"                 "America/Yakutat"                 
#> [221] "America/Yellowknife"              "Antarctica/Casey"                
#> [223] "Antarctica/Davis"                 "Antarctica/DumontDUrville"       
#> [225] "Antarctica/Macquarie"             "Antarctica/Mawson"               
#> [227] "Antarctica/McMurdo"               "Antarctica/Palmer"               
#> [229] "Antarctica/Rothera"               "Antarctica/South_Pole"           
#> [231] "Antarctica/Syowa"                 "Antarctica/Troll"                
#> [233] "Antarctica/Vostok"                "Arctic/Longyearbyen"             
#> [235] "Asia/Aden"                        "Asia/Almaty"                     
#> [237] "Asia/Amman"                       "Asia/Anadyr"                     
#> [239] "Asia/Aqtau"                       "Asia/Aqtobe"                     
#> [241] "Asia/Ashgabat"                    "Asia/Ashkhabad"                  
#> [243] "Asia/Atyrau"                      "Asia/Baghdad"                    
#> [245] "Asia/Bahrain"                     "Asia/Baku"                       
#> [247] "Asia/Bangkok"                     "Asia/Barnaul"                    
#> [249] "Asia/Beirut"                      "Asia/Bishkek"                    
#> [251] "Asia/Brunei"                      "Asia/Calcutta"                   
#> [253] "Asia/Chita"                       "Asia/Choibalsan"                 
#> [255] "Asia/Chongqing"                   "Asia/Chungking"                  
#> [257] "Asia/Colombo"                     "Asia/Dacca"                      
#> [259] "Asia/Damascus"                    "Asia/Dhaka"                      
#> [261] "Asia/Dili"                        "Asia/Dubai"                      
#> [263] "Asia/Dushanbe"                    "Asia/Famagusta"                  
#> [265] "Asia/Gaza"                        "Asia/Harbin"                     
#> [267] "Asia/Hebron"                      "Asia/Ho_Chi_Minh"                
#> [269] "Asia/Hong_Kong"                   "Asia/Hovd"                       
#> [271] "Asia/Irkutsk"                     "Asia/Istanbul"                   
#> [273] "Asia/Jakarta"                     "Asia/Jayapura"                   
#> [275] "Asia/Jerusalem"                   "Asia/Kabul"                      
#> [277] "Asia/Kamchatka"                   "Asia/Karachi"                    
#> [279] "Asia/Kashgar"                     "Asia/Kathmandu"                  
#> [281] "Asia/Katmandu"                    "Asia/Khandyga"                   
#> [283] "Asia/Kolkata"                     "Asia/Krasnoyarsk"                
#> [285] "Asia/Kuala_Lumpur"                "Asia/Kuching"                    
#> [287] "Asia/Kuwait"                      "Asia/Macao"                      
#> [289] "Asia/Macau"                       "Asia/Magadan"                    
#> [291] "Asia/Makassar"                    "Asia/Manila"                     
#> [293] "Asia/Muscat"                      "Asia/Nicosia"                    
#> [295] "Asia/Novokuznetsk"                "Asia/Novosibirsk"                
#> [297] "Asia/Omsk"                        "Asia/Oral"                       
#> [299] "Asia/Phnom_Penh"                  "Asia/Pontianak"                  
#> [301] "Asia/Pyongyang"                   "Asia/Qatar"                      
#> [303] "Asia/Qostanay"                    "Asia/Qyzylorda"                  
#> [305] "Asia/Rangoon"                     "Asia/Riyadh"                     
#> [307] "Asia/Saigon"                      "Asia/Sakhalin"                   
#> [309] "Asia/Samarkand"                   "Asia/Seoul"                      
#> [311] "Asia/Shanghai"                    "Asia/Singapore"                  
#> [313] "Asia/Srednekolymsk"               "Asia/Taipei"                     
#> [315] "Asia/Tashkent"                    "Asia/Tbilisi"                    
#> [317] "Asia/Tehran"                      "Asia/Tel_Aviv"                   
#> [319] "Asia/Thimbu"                      "Asia/Thimphu"                    
#> [321] "Asia/Tokyo"                       "Asia/Tomsk"                      
#> [323] "Asia/Ujung_Pandang"               "Asia/Ulaanbaatar"                
#> [325] "Asia/Ulan_Bator"                  "Asia/Urumqi"                     
#> [327] "Asia/Ust-Nera"                    "Asia/Vientiane"                  
#> [329] "Asia/Vladivostok"                 "Asia/Yakutsk"                    
#> [331] "Asia/Yangon"                      "Asia/Yekaterinburg"              
#> [333] "Asia/Yerevan"                     "Atlantic/Azores"                 
#> [335] "Atlantic/Bermuda"                 "Atlantic/Canary"                 
#> [337] "Atlantic/Cape_Verde"              "Atlantic/Faeroe"                 
#> [339] "Atlantic/Faroe"                   "Atlantic/Jan_Mayen"              
#> [341] "Atlantic/Madeira"                 "Atlantic/Reykjavik"              
#> [343] "Atlantic/South_Georgia"           "Atlantic/St_Helena"              
#> [345] "Atlantic/Stanley"                 "Australia/ACT"                   
#> [347] "Australia/Adelaide"               "Australia/Brisbane"              
#> [349] "Australia/Broken_Hill"            "Australia/Canberra"              
#> [351] "Australia/Currie"                 "Australia/Darwin"                
#> [353] "Australia/Eucla"                  "Australia/Hobart"                
#> [355] "Australia/LHI"                    "Australia/Lindeman"              
#> [357] "Australia/Lord_Howe"              "Australia/Melbourne"             
#> [359] "Australia/North"                  "Australia/NSW"                   
#> [361] "Australia/Perth"                  "Australia/Queensland"            
#> [363] "Australia/South"                  "Australia/Sydney"                
#> [365] "Australia/Tasmania"               "Australia/Victoria"              
#> [367] "Australia/West"                   "Australia/Yancowinna"            
#> [369] "Brazil/Acre"                      "Brazil/DeNoronha"                
#> [371] "Brazil/East"                      "Brazil/West"                     
#> [373] "Canada/Atlantic"                  "Canada/Central"                  
#> [375] "Canada/Eastern"                   "Canada/Mountain"                 
#> [377] "Canada/Newfoundland"              "Canada/Pacific"                  
#> [379] "Canada/Saskatchewan"              "Canada/Yukon"                    
#> [381] "CET"                              "Chile/Continental"               
#> [383] "Chile/EasterIsland"               "Cuba"                            
#> [385] "CST6CDT"                          "EET"                             
#> [387] "Egypt"                            "Eire"                            
#> [389] "EST"                              "EST5EDT"                         
#> [391] "Etc/GMT"                          "Etc/GMT-0"                       
#> [393] "Etc/GMT-1"                        "Etc/GMT-10"                      
#> [395] "Etc/GMT-11"                       "Etc/GMT-12"                      
#> [397] "Etc/GMT-13"                       "Etc/GMT-14"                      
#> [399] "Etc/GMT-2"                        "Etc/GMT-3"                       
#> [401] "Etc/GMT-4"                        "Etc/GMT-5"                       
#> [403] "Etc/GMT-6"                        "Etc/GMT-7"                       
#> [405] "Etc/GMT-8"                        "Etc/GMT-9"                       
#> [407] "Etc/GMT+0"                        "Etc/GMT+1"                       
#> [409] "Etc/GMT+10"                       "Etc/GMT+11"                      
#> [411] "Etc/GMT+12"                       "Etc/GMT+2"                       
#> [413] "Etc/GMT+3"                        "Etc/GMT+4"                       
#> [415] "Etc/GMT+5"                        "Etc/GMT+6"                       
#> [417] "Etc/GMT+7"                        "Etc/GMT+8"                       
#> [419] "Etc/GMT+9"                        "Etc/GMT0"                        
#> [421] "Etc/Greenwich"                    "Etc/UCT"                         
#> [423] "Etc/Universal"                    "Etc/UTC"                         
#> [425] "Etc/Zulu"                         "Europe/Amsterdam"                
#> [427] "Europe/Andorra"                   "Europe/Astrakhan"                
#> [429] "Europe/Athens"                    "Europe/Belfast"                  
#> [431] "Europe/Belgrade"                  "Europe/Berlin"                   
#> [433] "Europe/Bratislava"                "Europe/Brussels"                 
#> [435] "Europe/Bucharest"                 "Europe/Budapest"                 
#> [437] "Europe/Busingen"                  "Europe/Chisinau"                 
#> [439] "Europe/Copenhagen"                "Europe/Dublin"                   
#> [441] "Europe/Gibraltar"                 "Europe/Guernsey"                 
#> [443] "Europe/Helsinki"                  "Europe/Isle_of_Man"              
#> [445] "Europe/Istanbul"                  "Europe/Jersey"                   
#> [447] "Europe/Kaliningrad"               "Europe/Kiev"                     
#> [449] "Europe/Kirov"                     "Europe/Lisbon"                   
#> [451] "Europe/Ljubljana"                 "Europe/London"                   
#> [453] "Europe/Luxembourg"                "Europe/Madrid"                   
#> [455] "Europe/Malta"                     "Europe/Mariehamn"                
#> [457] "Europe/Minsk"                     "Europe/Monaco"                   
#> [459] "Europe/Moscow"                    "Europe/Nicosia"                  
#> [461] "Europe/Oslo"                      "Europe/Paris"                    
#> [463] "Europe/Podgorica"                 "Europe/Prague"                   
#> [465] "Europe/Riga"                      "Europe/Rome"                     
#> [467] "Europe/Samara"                    "Europe/San_Marino"               
#> [469] "Europe/Sarajevo"                  "Europe/Saratov"                  
#> [471] "Europe/Simferopol"                "Europe/Skopje"                   
#> [473] "Europe/Sofia"                     "Europe/Stockholm"                
#> [475] "Europe/Tallinn"                   "Europe/Tirane"                   
#> [477] "Europe/Tiraspol"                  "Europe/Ulyanovsk"                
#> [479] "Europe/Uzhgorod"                  "Europe/Vaduz"                    
#> [481] "Europe/Vatican"                   "Europe/Vienna"                   
#> [483] "Europe/Vilnius"                   "Europe/Volgograd"                
#> [485] "Europe/Warsaw"                    "Europe/Zagreb"                   
#> [487] "Europe/Zaporozhye"                "Europe/Zurich"                   
#> [489] "GB"                               "GB-Eire"                         
#> [491] "GMT"                              "GMT-0"                           
#> [493] "GMT+0"                            "GMT0"                            
#> [495] "Greenwich"                        "Hongkong"                        
#> [497] "HST"                              "Iceland"                         
#> [499] "Indian/Antananarivo"              "Indian/Chagos"                   
#> [501] "Indian/Christmas"                 "Indian/Cocos"                    
#> [503] "Indian/Comoro"                    "Indian/Kerguelen"                
#> [505] "Indian/Mahe"                      "Indian/Maldives"                 
#> [507] "Indian/Mauritius"                 "Indian/Mayotte"                  
#> [509] "Indian/Reunion"                   "Iran"                            
#> [511] "Israel"                           "Jamaica"                         
#> [513] "Japan"                            "Kwajalein"                       
#> [515] "Libya"                            "MET"                             
#> [517] "Mexico/BajaNorte"                 "Mexico/BajaSur"                  
#> [519] "Mexico/General"                   "MST"                             
#> [521] "MST7MDT"                          "Navajo"                          
#> [523] "NZ"                               "NZ-CHAT"                         
#> [525] "Pacific/Apia"                     "Pacific/Auckland"                
#> [527] "Pacific/Bougainville"             "Pacific/Chatham"                 
#> [529] "Pacific/Chuuk"                    "Pacific/Easter"                  
#> [531] "Pacific/Efate"                    "Pacific/Enderbury"               
#> [533] "Pacific/Fakaofo"                  "Pacific/Fiji"                    
#> [535] "Pacific/Funafuti"                 "Pacific/Galapagos"               
#> [537] "Pacific/Gambier"                  "Pacific/Guadalcanal"             
#> [539] "Pacific/Guam"                     "Pacific/Honolulu"                
#> [541] "Pacific/Johnston"                 "Pacific/Kanton"                  
#> [543] "Pacific/Kiritimati"               "Pacific/Kosrae"                  
#> [545] "Pacific/Kwajalein"                "Pacific/Majuro"                  
#> [547] "Pacific/Marquesas"                "Pacific/Midway"                  
#> [549] "Pacific/Nauru"                    "Pacific/Niue"                    
#> [551] "Pacific/Norfolk"                  "Pacific/Noumea"                  
#> [553] "Pacific/Pago_Pago"                "Pacific/Palau"                   
#> [555] "Pacific/Pitcairn"                 "Pacific/Pohnpei"                 
#> [557] "Pacific/Ponape"                   "Pacific/Port_Moresby"            
#> [559] "Pacific/Rarotonga"                "Pacific/Saipan"                  
#> [561] "Pacific/Samoa"                    "Pacific/Tahiti"                  
#> [563] "Pacific/Tarawa"                   "Pacific/Tongatapu"               
#> [565] "Pacific/Truk"                     "Pacific/Wake"                    
#> [567] "Pacific/Wallis"                   "Pacific/Yap"                     
#> [569] "Poland"                           "Portugal"                        
#> [571] "PRC"                              "PST8PDT"                         
#> [573] "ROC"                              "ROK"                             
#> [575] "Singapore"                        "Turkey"                          
#> [577] "UCT"                              "Universal"                       
#> [579] "US/Alaska"                        "US/Aleutian"                     
#> [581] "US/Arizona"                       "US/Central"                      
#> [583] "US/East-Indiana"                  "US/Eastern"                      
#> [585] "US/Hawaii"                        "US/Indiana-Starke"               
#> [587] "US/Michigan"                      "US/Mountain"                     
#> [589] "US/Pacific"                       "US/Samoa"                        
#> [591] "UTC"                              "W-SU"                            
#> [593] "WET"                              "Zulu"                            
#> attr(,"Version")
#> [1] "2021e"

datum.1 > datum.2
#> [1] TRUE
datum.ido.1 <= datum.ido.2
#> [1] FALSE

unclass(datum.ido.1)
#> [1] 1640727417
```


sec
Seconds (0–61)

min
Minutes (0–59)

hour
Hours (0–23)

mday
Day of the month (1–31)

mon
Month (0–11)

year
Years since 1900

wday
Day of the week (0–6, 0 = Sunday)

yday
Day of the year (0–365)

isdst
Daylight Saving Time flag




### Részösszefoglalás {#az-r-nyelv-12-summary}

<div class="rmdsummary">

</div>

### Feladatok {#az-r-nyelv-12-exercise}

\BeginKnitrBlock{rmdexercise}<div class="rmdexercise">  
1. Konvertáljuk dátummá a következő két sztringet: `"6November2020"`, `"2013-02-29"`! Utóbbi esetben mi lehet a hiba oka?
1. A `seq()` függvény `from=` és `to=` argumentuma a dátum típusú objektumokkal is működik. A `by=` argumentum értéke ilyenkor lehet numerikus (ekkor napokat jelent), de lehet `x weeks`, `x months` vagy `x years`, ahol `x` nullánál nagyobb egész lehet. Hozzunk létre egy dátum-vektort 2020 összes hétfőjének dátumával! 
</div>\EndKnitrBlock{rmdexercise}



<!-- as.Date("6November2020","%d%B%Y") -->

<!-- d1<-as.Date("2020-01-06") -->
<!-- d2<-as.Date("2020-12-28") -->

<!-- x<-seq(from=d1, to=d2, by="weeks") -->
<!-- typeof(x) -->
<!-- class(x) -->

                                                                                       
### Tibble

A *Tidyverse R* használata során az adatainkat *tibble* típusú objektumban tároljuk. Használatához töltsük be a **tidyverse** csomagot. 


```r
library(tidyverse)
x <- rep(c('A','B'), times=4); y <- rep(6:9, times=2); z <- 1:8
df <- tibble(nev=x, pont.1=y, pont.2=z)
df
#> # A tibble: 8 x 3
#>   nev   pont.1 pont.2
#>   <chr>  <int>  <int>
#> 1 A          6      1
#> 2 B          7      2
#> 3 A          8      3
#> 4 B          9      4
#> 5 A          6      5
#> 6 B          7      6
#> 7 A          8      7
#> 8 B          9      8
```

A tibble objektumok alaptípusa lista, de az osztálytípusok között megjelennek a tibble-re specifikus osztályok is. A A `tbl_df` osztály jelenléte hozza magával azokat az új tulajdonságokat és lehetőségeket, amit a Tidyverse R központi adatszerkezetévé teszi ezt az objektumtípust.


```r
attributes(df)
#> $class
#> [1] "tbl_df"     "tbl"        "data.frame"
#> 
#> $row.names
#> [1] 1 2 3 4 5 6 7 8
#> 
#> $names
#> [1] "nev"    "pont.1" "pont.2"
typeof(df); class(df)
#> [1] "list"
#> [1] "tbl_df"     "tbl"        "data.frame"
```

A tibble és a data frame típusú objektumok között az átjárhatóságot az `as_tibble()` és az `as.data.frame()` függvény biztosítja.


```r
as_tibble(df)
#> # A tibble: 8 x 3
#>   nev   pont.1 pont.2
#>   <chr>  <int>  <int>
#> 1 A          6      1
#> 2 B          7      2
#> 3 A          8      3
#> 4 B          9      4
#> 5 A          6      5
#> 6 B          7      6
#> 7 A          8      7
#> 8 B          9      8
as.data.frame(df)
#>   nev pont.1 pont.2
#> 1   A      6      1
#> 2   B      7      2
#> 3   A      8      3
#> 4   B      9      4
#> 5   A      6      5
#> 6   B      7      6
#> 7   A      8      7
#> 8   B      9      8
```

A tibble típus tesztelése az `is_tibble()` segítségével történik, de a tibble típusú objektumokra az `is.data.frame()` is igaz értékkel tér vissza: 


```r
is_tibble(df); is.data.frame(df)
#> [1] TRUE
#> [1] TRUE
```


Melyek a data frame és a tibble közötti különbségek? Már három eltérést akár észre is vehettünk. Az első a tibble létrehozásához kötődik. Egy tibble típusú objektum, csak azonos hosszúságú oszlopvektorokból hozható létre, így biztonságosabban konstruálható, mint az ismétlést is támogató data frame típusú objektumok. Tibble esetében csak az egy hosszú vektorok ismétlése megengedett. Tehát ez a konstrukció működik:


```r
tibble(a=c("a", "b", "c"), p=1)
#> # A tibble: 3 x 2
#>   a         p
#>   <chr> <dbl>
#> 1 a         1
#> 2 b         1
#> 3 c         1
```


A második különbség, hogy a tibble a létrehozás során nem végez automatikus típuskonverziót. Tehát a karakteres vektorokat nem alakítja át faktorokká.


```r
str(df)
#> tibble [8 x 3] (S3: tbl_df/tbl/data.frame)
#>  $ nev   : chr [1:8] "A" "B" "A" "B" ...
#>  $ pont.1: int [1:8] 6 7 8 9 6 7 8 9
#>  $ pont.2: int [1:8] 1 2 3 4 5 6 7 8
```


A harmadik különbség az adatok megjelenítésében van. Tibble esetében csak az első 10 sor jelenik meg, és annyi oszlop, amennyi az aktuális képernyőre kifér. A több oszlop neve alul jelenik meg. Az oszlopnevek alatt az oszlop típusa is megjelenik. 


A negyedik eltérés a tibble indexeléséhez kötődik. Az `[` operátor használata során minden esetben tibble típusú objektumot kapunk, nem kaphatunk vektort, azaz nem történhet dimenzióvesztés.


```r
df[, 2]
#> # A tibble: 8 x 1
#>   pont.1
#>    <int>
#> 1      6
#> 2      7
#> 3      8
#> 4      9
#> 5      6
#> 6      7
#> 7      8
#> 8      9
df[1, ]
#> # A tibble: 1 x 3
#>   nev   pont.1 pont.2
#>   <chr>  <int>  <int>
#> 1 A          6      1
df[1, 2]
#> # A tibble: 1 x 1
#>   pont.1
#>    <int>
#> 1      6
df[1, 2, drop=T]
#> [1] 6
```




### A munkaterület függvényei



Megbeszéltük, hogy a munka során az objektumaink a memória speciális területére, a munkaterületre (workspace) kerülnek. Ha még korábban nem is hoztunk létre objektumot, akkor a következő három parancs, három objektumot hoz létre a munkaterületen:


```r
fib.0 <- 0
fib.1 <- 1
fib.2 <- fib.0 + fib.1
```

A munkaterületen létrehozott objektumok neveit az `ls()` függvény listázza ki:


```r
# ls()
```

A munkaterületről objektumot az `rm()` paranccsal távolíthatunk el, például a


```r
rm(fib.0)         # fib.0 törlése
ls()
#>  [1] "a"               "alap"            "d"               "D"              
#>  [5] "datum.1"         "datum.2"         "datum.ido.1"     "datum.ido.2"    
#>  [9] "df"              "df2"             "df3"             "diff.1"         
#> [13] "diff.2"          "diff.3"          "diff.4"          "diff.5"         
#> [17] "egyutthato.a"    "egyutthato.b"    "egyutthato.c"    "eset.1"         
#> [21] "eset.2"          "eset.3"          "fib.1"           "fib.2"          
#> [25] "fiu"             "foglalkozas"     "hazas"           "ido.1"          
#> [29] "ido.2"           "import_example"  "isk.vegz"        "isk.vegz.f"     
#> [33] "iteletek"        "lakohely"        "lct"             "m"              
#> [37] "magassag"        "nev"             "nevek"           "obj.double"     
#> [41] "obj.integer"     "obj.karakteres"  "obj.logikai"     "peter.bmi"      
#> [45] "peter.magassaga" "peter.sulya"     "pontszamok"      "pulzus.atlag"   
#> [49] "Pulzus.atlag"    "regi.v.1"        "regi.v.2"        "szamok"         
#> [53] "tab1"            "tab2"            "tab3"            "table.kiir"     
#> [57] "tan.ido"         "tipus"           "uj.v"            "v.d"            
#> [61] "v.i"             "v.k"             "v.l"             "van.kocsija"    
#> [65] "x"               "x.d"             "x.f"             "x.f.1"          
#> [69] "x.f.2"           "x.f.3"           "y"               "z"              
#> [73] "z.uj"
```

a `fib.0` objektumot távolította el, így az `ls()` eredményében ez nem is szerepel. Az összes munkaterület-objektum eltávolítása a


```r
# rm(list = ls())   # összes objektum törlése
# ls()
```

segítségével történik.


### A munkakönyvtár függvényei

Az R használata során mindig van egy kitüntetett, aktuális könyvtárunk, amelyet munkakönyvtárnak nevezünk. A munkakönyvtár célja, hogy az állományok nyitása és mentése során, ha nem használunk külön könyvtárhivatkozást, akkor ez lesz az alapértelmezett könyvtár.

A munkakönyvtár az R-ben lekérdezhető ill. beállítható a `getwd()` és a `setwd()` parancsok kiadásával. Például


```r
getwd()
setwd("C:/Data/peldak")
```

parancsokkal először megismerjük az aktuális könyvtárat, majd megváltoztatjuk a `C:/Data/peldak` könyvtárra. Figyeljük meg, hogy az elérési útban perjelet (`/`) használtunk.

Megjegyezzük, hogy az RStudio projekt üzemmódú használata során nincs szükség a munkakönyvtár beállítására a `setwd()` paranccsal, sőt, kerüljük a használatát. A munkakönyvtárunk a munka során végig maradjon meg az alapértelmezetten beállított könyvtár, maga a projektkönyvtár.

A munkakönyvtár jelentőségét tovább növeli, hogy az R indításakor ebben a könyvtárban 2 állomány létezését figyeli:
* `.Rhistory` (a visszahívható parancsokat tartalmazó szöveges állomány) 
* `.RData` (a tárolt objektumokat tartalmazó bináris állomány).

A fenti állományok ugyanis betöltésre kerülnek az R indításakor, ha azokat az R megtalálja a munkakönyvtárban. Így ezek után, az `.Rhistory` állományból jövő parancsok között válogathatunk a parancssor használata során, illetve az `.RData` állományban tárolt objektumok azonnal elérhetőek, vagyis lesz egy induló munkaterületünk.   


### Csomagkezelő függvények

Korábban megbeszéltük, hogy a csomagok adatobjektumokat és függvényeket tartalmaznak. Az ún. egyéb csomagok (számuk kb. 17000) elsődleges célja az *Alap R* tudásának kiegészítése.  

Az R indítása után néhány csomag automatikusan betöltésre kerül a standard csomagok közül. Ezeket a csomagokat és egyéb ún. környezeteket listázhatunk ki a `search()` függvénnyel.


```r
search()
detach("tools:rstudio")
```


```r
## [1] ".GlobalEnv"        "package:stats"     "package:graphics" 
## [4] "package:grDevices" "package:utils"     "package:datasets" 
## [7] "package:methods"   "Autoloads"         "package:base"
```


A fenti eredményben a `package` karaktersorozattal kezdődő elemek mutatják, hogy melyek az éppen betöltött csomagok. A listában nem szereplő, de korábban telepített csomagok betöltéséhez használjuk a `library()` vagy `require()` függvényeket.



```r
library(MASS)
require(foreign)
search()
```


```r
##  [1] ".GlobalEnv"        "package:foreign"   "package:MASS"     
##  [4] "package:stats"     "package:graphics"  "package:grDevices"
##  [7] "package:utils"     "package:datasets"  "package:methods"  
## [10] "Autoloads"         "package:base"  
```

A fenti példában a **MASS** és a **foreign** csomag betöltését és annak hatását követhetjük nyomon a `search()` függvény ouputjára. Egy csomag betöltése azt jelenti, hogy a csomagban lévő függvények és objektumok a memóriába kerültek, azokat a parancsainkban ezután szabadon felhasználhatjuk.

Egy adott csomagban (esetünkben a **foreign** csomagban) lévő függvények és objektumok a


```r
library(help=foreign)
```

vagy a 


```r
help(package=foreign)
```


paranccsal kérdezhetők le. Betöltött csomagok esetében használhatjuk az


```r
ls(name="package:foreign", all.names = T)
ls(name="package:base", all.names = T)

```

parancsot is, amely a csomag adatobjektumainak és függvényeinek a nevét listázza.

Betöltött csomagot a `detach()`\index{detach()} függvénnyel távolíthatunk el a memóriából:


```r
detach(package:foreign)
detach(package:MASS)
```


Ha a használni kívánt csomag még nincs telepítve a számítógépünkre, akkor az \@ref(Csomagok_telepitese) fejezetben ismertetett módok egyikét válasszuk, attól függően, hogy a csomag melyik tárhelyről érhető el.

A CRAN-ról elérhető csomagok közül telepítsük fel a **DescTools** és **psych** csomagokat:


```r
install.packages("DescTools")
install.packages("psych")
```


A számítógépünkön telepített csomagokról az `installed.packages()` függvény ad tájékoztatást. Amennyiben a 


```r
csomagok <- installed.packages()
View(csomagok)                    # RStudio-ban vagy RGui-ban
```

parancsot kiadjuk az RStudio-ban, akkor csomagjainkat kényelmesen áttekinthetjük.


Csomagok frissítésére használjuk a már korábban említett


```r
update.packages()
```

parancsot.

### Feladatok {#az-r-nyelv-14-exercise}

\BeginKnitrBlock{rmdlevel1}<div class="rmdlevel1">
1. Írassuk ki a munkaterület objektumait!
1. Hozzunk létre egy `pulzus` nevű objektumot és újra írassuk ki a munkaterület objektumneveit!
1. Távolítsuk el a `pulzus` objektumot a munkaterületről!
1. Határozzuk meg az aktuális munkakönyvtárat!
1. Növeljük meg a betű méretét az RGui, az R Commander és az R Studio alkalmazásokban is!
1. Vizsgáljuk meg, hogy a számítógépünkön van-e telepítve a **DescTools** csomag, ha nincs telepítsük! Derítsük ki, hogy a **DescTools** csomagnak mi a célja? Soroljunk fel három függvényt és adattáblát ebből a csomagból! Távolítsuk el a memóriából a **DescTools** csomagot!
1. Telepítsük a számítógépünkre a következő csomagokat: **HSAUR2**, **psych**, **prettyR**, **descr** és **pastecs**!
</div>\EndKnitrBlock{rmdlevel1}



## Objektumok és típusok

Az R-ben használható objektumok név-érték párok, vagyis minden objektumnak van neve és értéke. Objektumok alatt ebben a könyvben az adatobjektumokat értjük, bár már említettünk, hogy valójában a függvények is objektumoknak tekinthetők az R-ben, hiszen a függvénynek is van neve, és értéke, az utóbbi pedig utasítások sorozata. Az R-ben minden objektum, például az eddig vizsgált vektorok, attribútumokkal is rendelkezhetnek. Az attribútumok név-értek párok, amelyek speciális tulajdonságokkal ruházzák fel az objektumunkat. Például a `names` nevű attribútummal a vektor egyes elemeit nevezhetjük el. Későbbiekben látjuk a `dim`, `dimnames`, `level` és `class` attribútumok jelentőségét is.

Egy objektum összes attribútuma az `attributes()` függvénnyel kérdezhetők le. Ha a `names` attribútumra vagyunk kíváncsiak a `names()` függvényt is használhatjuk. Ha létrehozunk egy `x` numerikus vektort, akkor 


```r
x <- 1:5        # integer vektor
attributes(x)   # x attribútumainak kiírása 
#> NULL
names(x)        # x name attribútumának kiírása
#> NULL

x <- numeric(0)
mode(x) <- "list"
class(x)
#> [1] "list"
length(x)
#> [1] 0

attr(x, "length") <- "integer"
```

Az `x` numerikus vektornak nincsenek attribútumai. A `NULL` az általános, elem nélküli vektort jelenti. A fenti outputban szereplő két `NULL` esetünkben azt jelzi, hogy nem állítottunk be semmilyen attribútumot, így `names` attribútumot sem.


```r
x <- c("a"=1, "b"=2, "c"=3, "d"=4, "e"=5) # integer vektor
attributes(x)                  # x attribútumainak kiírása 
#> $names
#> [1] "a" "b" "c" "d" "e"
names(x)                       # x name attribútumának kiírása
#> [1] "a" "b" "c" "d" "e"
```

A `names` attribútum beállítható a `names()` függvénnyel is.


```r
names(x) <- c("elégtelen", "elégséges", "közepes", "jó", "jeles")
attributes(x)                  # x attribútumainak kiírása 
#> $names
#> [1] "elégtelen" "elégséges" "közepes"   "jó"        "jeles"
names(x)                       # x name attribútumának kiírása
#> [1] "elégtelen" "elégséges" "közepes"   "jó"        "jeles"
```

A `names` attribútum értéke karakteres vektor lehet, amely az outputokban is megjelenik és a indexelésben is felhasználhatjuk. 


```r
x
#> elégtelen elégséges   közepes        jó     jeles 
#>         1         2         3         4         5
x[c("közepes", "jó")]
#> közepes      jó 
#>       3       4
```

Rögzítsük a (0, 1, 2) értékek előfordulási gyakoriságait a (18, 12, 20) elemeket tartalmazó vektorban. Az elemek nevei most is karakteres konstansok lesznek, az automatikus konverzióról az R gondoskodik.


```r
y <- c(18, 12, 20)
names(y) <- 0:2
y
#>  0  1  2 
#> 18 12 20
names(y)
#> [1] "0" "1" "2"
```

Az `y` vektor indexelésénél fontos, hogy megkülönböztessük a numerikus és a karakteres indexeket, az utóbbiaknál mindig idézőjelet kell használnunk.


```r
x[1]
#> elégtelen 
#>         1
x["1"]
#> <NA> 
#>   NA
x[c(1,3)]; x[c("0", "2")]
#> elégtelen   közepes 
#>         1         3
#> <NA> <NA> 
#>   NA   NA
```

Egyetlen attribútum lekérdezésére és beállítására az `attr()` függvényt is használhatjuk. Az `attr()` függvényben meg kell adnunk az elérendő attribútum nevét is.


```r
attr(x, "names") <- c("A", "B", "C", "D", "E")
attr(x, "names")
#> [1] "A" "B" "C" "D" "E"
attributes(x)
#> $names
#> [1] "A" "B" "C" "D" "E"
```

Attribútumok törlésére a `NULL` értéket használjuk.


```r
names(x) <- NULL             # names attribútum törlése
attr(x, "names") <- NULL     # names attribútum törlése
attributes(x) <- NULL        # az összes attribútum törlése
```

A `dim` argumentum


```r
x <- 1:12                      # integer vektor
x
#>  [1]  1  2  3  4  5  6  7  8  9 10 11 12
attr(x, "dim") <- c(2,6)       # integer mátrix (2x6-os)       
attributes(x)
#> $dim
#> [1] 2 6
x
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    1    3    5    7    9   11
#> [2,]    2    4    6    8   10   12
attr(x, "dim") <- c(2, 3, 2)   # integer tömb (2x3x2-es)
attributes(x)
#> $dim
#> [1] 2 3 2
x
#> , , 1
#> 
#>      [,1] [,2] [,3]
#> [1,]    1    3    5
#> [2,]    2    4    6
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3]
#> [1,]    7    9   11
#> [2,]    8   10   12
```

Amennyiben 



```r
x <- 1:12                      # integer vektor
attr(x, "dim") <- c(2,6)       # integer mátrix (2x6-os)       
dimnames(x) <- list(nem=c("férfi", "nő"), osztaly=LETTERS[1:6])        
x
#>        osztaly
#> nem     A B C D  E  F
#>   férfi 1 3 5 7  9 11
#>   nő    2 4 6 8 10 12
attributes(x)
#> $dim
#> [1] 2 6
#> 
#> $dimnames
#> $dimnames$nem
#> [1] "férfi" "nő"   
#> 
#> $dimnames$osztaly
#> [1] "A" "B" "C" "D" "E" "F"
```


Osztályok

A faktor ennek megfelelően tartalmaz egy `levels` attribútumot, amely a faktor különböző értékeit (szintjeit) sorolja fel. A faktorok `class` attribútumának értéke pedig `factor`.



```r
f <- factor(c("a", "b", "a"))
attributes(f)
#> $levels
#> [1] "a" "b"
#> 
#> $class
#> [1] "factor"
levels(f)
#> [1] "a" "b"
class(f)
#> [1] "factor"
class(f) <- NULL
#attributes(f)<- NULL
#f
unclass(f)
#> [1] 1 2 1
#> attr(,"levels")
#> [1] "a" "b"
```

A `class()` függvény az objektum `class` argumentumával tér vissza. Azok az objektumok, amelyek nem rendelkeznek `class` argumentummal, a `class()` visszatérési értéke 

* `"numeric"`, ha az objektum *integer* vagy *double* vektor 
* `"array"` és/vagy `"matrix"`, ha az objektum rendelkezik `dim` attributummal
* más esetben a `typeof()` visszatérési értékével.

Az `unclass()` visszatérési értéke az az objektum, amelynek a `class` attribűtumát eltávolították.


A korábban tárgyat típusok mindegyike osztály: *Date*, *difftime*, *POSIXct*, *POSIXlt*, *table*.



```r
x <- as.Date("2020-03-12")
attributes(x)
#> $class
#> [1] "Date"
class(x)
#> [1] "Date"

x <- Sys.Date()-as.Date("2020-03-12")
x
#> Time difference of 656 days
attributes(x)
#> $class
#> [1] "difftime"
#> 
#> $units
#> [1] "days"
class(x)
#> [1] "difftime"

x <- ISOdate(year = 2020, month = 12, day = 2)
x
#> [1] "2020-12-02 12:00:00 GMT"
attributes(x)
#> $class
#> [1] "POSIXct" "POSIXt" 
#> 
#> $tzone
#> [1] "GMT"
class(x)
#> [1] "POSIXct" "POSIXt"

x <- as.POSIXlt(x)
x
#> [1] "2020-12-02 12:00:00 GMT"
attributes(x)
#> $names
#> [1] "sec"   "min"   "hour"  "mday"  "mon"   "year"  "wday"  "yday"  "isdst"
#> 
#> $class
#> [1] "POSIXlt" "POSIXt" 
#> 
#> $tzone
#> [1] "GMT"
class(x)
#> [1] "POSIXlt" "POSIXt"

x <- table(sample(LETTERS[1:3], 100, replace = T))
x
#> 
#>  A  B  C 
#> 44 24 32
attributes(x)
#> $dim
#> [1] 3
#> 
#> $dimnames
#> $dimnames[[1]]
#> [1] "A" "B" "C"
#> 
#> 
#> $class
#> [1] "table"
class(x)
#> [1] "table"
```




A listaelemek nevét a `x` lis `names` attribútuma tartalmazza, segítségével a többi elemnek is adhatunk értéket:


```r
names(x)
#> [1] "A" "B" "C"
names(x)[c(1,2)] <- c("a","b")
names(x)
#> [1] "a" "b" "C"
x
#>  a  b  C 
#> 44 24 32
```



#### Értékek kizárása

A faktor létrehozásánál gondoskodhatunk bizonyos értékek kizárásáról, olyan értékekről, amelyeket nem szeretnénk a faktorban felsorolni:



```r
factor(c(1:5, NA, 3:6))
#>  [1] 1    2    3    4    5    <NA> 3    4    5    6   
#> Levels: 1 2 3 4 5 6
```

Alapértelmezés szerint az `NA` értéket zárjuk ki a faktor szintjeiből, de ezt megváltoztathatjuk az `exclude=` paraméter használatával:


```r
factor(c(1:5, NA, 3:6), exclude=NULL)
#>  [1] 1    2    3    4    5    <NA> 3    4    5    6   
#> Levels: 1 2 3 4 5 6 <NA>
factor(c(1:5, NA, 3:6), exclude=c(4, NA))
#>  [1] 1    2    3    <NA> 5    <NA> 3    <NA> 5    6   
#> Levels: 1 2 3 5 6
```

Ahogy látjuk a fenti példában, akár az `NA` értéket is bevonhatjuk a faktor szintjeibe, akár más értékeket is kizárhatunk az `NA`-n kívül.

Nézzük, hogyan tekint az R az adattáblára.


```r
#typeof(df); class(df); length(df)
#is.list(df); is.matrix(df); is.data.frame(df)
```

Az adattáblák alaptípusa `list`, osztálytípusa pedig `data.frame` a hossza pedig az alkotó (oszlop)vektorok/faktorok száma. Az adattáblára tehát tekinthetünk úgy, mint egy listára, melynek elemei az adattábla oszlopai lesznek.


**Feladat**

2**3**4
(2**3)**4
2**(3**4)



[^1]: Más programozási nyelvekben az "objektum" helyett a "változó" elnevezést használják, de a változó fogalma már foglalt a statisztikában, így mi is az objektumot használjuk.
[^2]: További értékadás operátorok a `->`, `<<-`, `->>` és a `=`. Ezeket nem használjuk ebben a könyvben.




