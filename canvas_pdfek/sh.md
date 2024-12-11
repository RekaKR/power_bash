5. Shell script I.
   Lépjünk be terminálkapcsolattal a kiszolgálóra (szamrend.inf.elte.hu).
   Készítsünk egy ideiglenes könyvtárat, amibe elhelyezhetjük az órán készített
   állományainkat (pl. mkdir szamrend5; cd szamrend5).
1. Shell script parancsfájlok:
   a. Parancsfájl készítés
   i. Szöveges fájl, x jog, chmod parancs
   ii. # megjegyzés
   iii. egy sorba több parancs is írható, a ; az elválasztó
   iv. echo almafa; echo alatt # ez az első program (echo –n)
   b. Parancsfájl futtatás
   i. ./parancsnév
   ii. bash parancsnév
   iii. Script első sora gyakran ilyen: #!/bin/sh
1. Jelentés: Ki értelmezze a fájlt.
   c. .profile állomány
   i. Belépéskor lefut. Alapból ezen a gépen nincs.
   ii. Feladat: Készíts magadnak egy .profile állományt, ami üdvözöl
   belépéskor!
1. Változók, paraméterek, beolvasás (read):
   a. Környezeti változók, env parancs
   i. PS1 változó, prompt értéke, bash-ban, \u= usernév, \h=hostnév
1. PS2, másodlagos prompt
   ii. Egy változó értéke: $név
   iii. PATH változó
1. Feladat: Bővítsük a PATH változót a . könyvtárral!
   (PATH=$PATH:. ) Miért a .profile állományba írjuk a
   módosítást?
   b. Összes változó, set parancs
   i. Saját változó definiálás: n=alma
   ii. Shellben látjuk, de scriptben nem. export n , ettől n környezeti
   változó lesz, látszik scriptben.
   iii. Változó megszüntetése: unset n
   c. Script paraméterek
   i. $0 parancs neve, $1 első, $2, …$9 kilencedik paraméter
1. Feladat: állapítsuk meg, mi a shell program neve, amiben
   éppen dolgozunk, illetve milyen paraméterekkel van indítva.
   ii. $# paraméterek száma
   iii. $\* összes paraméter
   d. Feladat: Írjon shell parancsot ami kiíja a paramétereinek számát és az
   összes paramétert!
   e. Feladat: Írjon shell parancsot, ami a paraméter értékénél eggyel nagyobbat
   ad meg! Írja ki a paraméter kétszeresét is! expr
   f. Feladat: Írjunk shell parancsot, ami bekéri a hallgató nevét, és életkorát,
   majd megjeleníti azt!
1. Szűrők, csövek (pipe):
   a. Parancs kimenet egy másik parancs bemeneteként jelenik meg: | jel
   i. more, head, tail, sort parancs: cat nagyfile|more
   i. Feladat: Írjunk parancsot, ami rendezve kiírja egy fájl első
   és utolsó n sorát. n legyen paraméter!
   ii. wc parancs, példa: cat .profile|wc
   i. Feladat: mondjuk meg, hány bejegyzés van a
   könyvtárunkban!
   iii. cut parancs
   i. Feladat: Írjunk shell programot, ami az első és utolsó
   paramétert kiírja, majd összeadja őket! (utolsó=`echo $*|cut
–f$# -d” ”`)
   ii. Feladat Kérdezzük le a rendszer összes felhasználójának
   adatait a getent passwd parancs segítségével és tegyük
   bele felhasznalok.txt állományba, hány felhasználóról
   kapunk információt?
   iv. grep parancs
   i. Feladat: Határozzuk meg, hogy hány z betűvel kezdődő
   felhasználó van bejelentkezve! (who|grep ^i|wc -l)
   ii. Feladat: Írjuk bele a torolt_felhasznalok.txt állományba a
   rendszerből ideiglenesen törölt felhasználók nevét!
   Segítség: az ideiglenesen törölt felhasználók a 666-os
   felhasználó-azonosítót kapják. (grep ':666:' <
   felhasznalok.txt | cut -f1 -d: >
   torolt_felhasznalok.txt)
1. Input-Output átirányítás
   a. > output átirányítás
   i. Feladat: Mit jelent: echo alma >&2 ? (Kimenet, a hibakimenetre
   megy.)
   ii. Feladat: Irányítsuk a kimenetet a ’feneketlen kukába’! (echo kukába
   > /dev/null )
   > b. >> hozzáfűzés
   > c. < input átirányítás
   > d. << here input
   > i. Feladat: Mit jelent?
   > cat <<alma
   <title> Shell script 1. </title>
   <body> Programjaim: </body>
   </html>
   alma
   (cat paramétere lesz a cat <<alma, alma közti sorok)
   e. 2> hiba kimenet átirányítás („2>&1” a hiba kimenet és az egyszerű
   kimenet összefűzése, kukába a hibával: 2>/dev/null)
1. Töröljük az ideiglenes állományokat, lépjünk ki a terminálprogramból, majd az
   operációs rendszerből.
1. Ha időnk és kedvünk engedi...
   a. Színekkel is felturbózhatjuk a promptot, pl. az export
   PS1=”[\033[01;32m\]\u@\h\[\033[01;34m\] \w
   \$\[\033[00m\]” kiadását követően zöld és kék színben jelennek meg
   a számunkra fontos információk. Az ANSI kódok táblázatát a
   http://en.wikipedia.org/wiki/ANSI_escape_code lapon találjuk.
   b. Módosítsuk a .profile-t úgy, hogy belépés után az előbbi prompt jelenjen
   meg.
   c. Feladat: Mit csinál a cat <a.txt >>a.txt parancs (létező a.txt
   esetén) és miért rossz ez nekünk? A feladat (megoldást, kipróbálást nem
   feltétlenül kell megcsinálni) megbeszélése során hívjuk fel a hallgatók
   figyelmét a CTRL-C kombinációra, illetve a befejezést követően ha
   kipróbáltuk, mindenképp töröljük az a.txt-t!
1. Segédanyag(ok):
   a. bash tutorial: http://www.freeos.com/guides/lsst/
   b. bash szkriptek gyűjteménye: http://bash.cyberciti.biz/

1. gyakorlat. Shell script II.
   Lépjünk be terminálkapcsolattal a kiszolgálóra (szamrend.inf.elte.hu). A mostani
   gyakorlaton ismerkedjünk meg az elágazások, ciklusok lehetőségeivel!
1. Ismétlés, aritmetikai műveletek
   a. expr utasítás, használati forma: expr kif1 op kif2, az operandus
   alapműveleti jel lehet: +,-,_,/, %(mod),<,>,<=,>=, = (egyenlő),
   !=(nemegyenlő), figyeljünk a paraméterek közti kötelező helyközre!
   i. Példa: a=expr 2 + 3 #hiba, mert ez egy értékadás!
   ii. Helyesen: a=`expr 2 + 3`; echo $a # 5
   iii. A _, / stb. speciális jelentéssel is bírnak, ezért ilyenkor használni
   kell a \ karaktert: expr 3 \* 4
   iv. Feladat: Egy fájlban tárolunk egy számot. Növeljük egyel az
   értékét! (n=`cat file`; expr $n + 1>file )
b. Beolvasás, read utasítás
i. Feladat: Írjon masol névre hallgató programot, ami felhasználói
felületet ad a cp (copy) parancshoz! (Bekérjük read-del a
másolandó és a célfájl nevét.)
c. Minta keresés, grep.
i. Feladat: Írjunk scriptet, aminek segítségével keressük meg azokat a
fájlokat egy könyvtárban és az alkönyvtáraiban, amikben a
paraméterül adott szó megtalálható. (grep –l –r $1 $2 $1 a szó, $2 a
könyvtár)
ii. Feladat: Válasszuk ki azokat a sorokat egy fájlból, amelyek a bor
szót önállóan tartalmazzák! Legyen a szó paraméterként
megadható! (cat file| grep –w bor )
d. Csere, tr parancs
i. Feladat: Cseréljük ki egy szó betűit csupa nagybetűkre! (echo
$szo|tr [a-z] [A-Z])
1. Elágazások
   a. test utasítás, logikai értékkel tér vissza, használata: test kif1 op kif2, vagy
   [ kif1 op kif2 ]
   i. Számok összehasonlítása (-lt, -gt, -le, -ge, -eq, -ne)
1. Feladat: Döntsük el, hogy egy szám nagyobb-e mint 10?
   (test 6 –gt 10; echo $?)
   ii. Szövegek összehasonlítása ( =, !=)
1. Feladat: Egy a változóba írjunk be egy szót. Döntsük el,
   hogy ez a fradi volt-e?
   iii. Összetett kifejezés (-o, vagy, -a és)
1. Feladat: Döntsük el, hogy egy szám 0 és 5 között van-e?
   b. if utasítás
   i. Feladat: Olvassunk be egy számot, írjuk ki válaszként, hogy 10-nél
   nagyobb, kisebb vagy egyenlő-e a beolvasott szám!
   ii. Feladat: Írj scriptet, ami kiírja, hogy délelőtt vagy délután vagy este
   van-e?
   iii. Feladat (opcionálisan): Módosítsd a .profile állományt ami a
   napszaknak megfelelően köszönt!
   c. case elágazás
   i. Feladat: Írjunk futtat parancsot, ami a paraméterektől függően más
   és más programot futtat! Ha –d a paraméter, akkor futtassuk a date
   parancsot, ha –w akkor írjuk ki a bejelentkezett felhasználók nevét,
   ha –l akkor a könyvtár tartalmát írja ki! Ha nem egy paraméterrel,
   vagy rossz paraméterrel futtatjuk a programot, írjon ki mini
   segítséget!
1. Ciklusok:
   a. for ciklus
   i. Feladat: Írjuk 5-ször a képernyőre: Hajrá Fradi!
   ii. Feladat: Írjunk programot, ami kiírja a bejelentkezett
   felhasználókat! (Figyeljünk a többszörös bejelentkezésre!)
   (for i in `who|cut –f1 –d” ”|sort -u`
   do
   echo $i bejelentkezett!
   done)
   b. while ciklus
   i. Feladat: Oldjuk meg a for első feladatát while ciklus segítségével!
   ii. Feladat: Olvassunk be egymás után 5 számot és adjuk össze őket!
   c. until ciklus
   i. Feladat: Oldjuk meg a for első feladatát until ciklus segítségével!
   ii. Feladat: Írjon menürendszerű programot until segítségével! Ha az 1
   számot választjuk, akkor meghívjuk a bejelentkezett felhasználókat
   kiíró programunkat, ha a 2-es számot választjuk, akkor meghívjuk
   az 5 számot összeadó programunkat, ha a 3 számot adjuk meg,
   akkor kilépünk a programból!
   #!/bin/sh

# Menu untillal

#

#

until
clear
echo
echo Válasszon programot!
echo
echo 1 Bejelentkezett felhasználók
echo 2 5 szám összeadása
echo 3 Vége
echo
echo -n Adja meg a megfelelő számot:
read szam
[ $szam -eq 3 ]
do
case $szam in

1.  echo Most csinálom az elsőt
    ;;
2.  echo Ez a masik.
    ;;
    \*) echo Rossz opciót adott meg!
    ;;
    esac
    sleep 5
    done
    echo Örültem, hogy engem választott!

4) Kilépünk a terminálprogramból, majd az operációs rendszerből
