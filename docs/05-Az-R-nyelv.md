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

