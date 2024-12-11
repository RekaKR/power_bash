7. gyakorlat. Shell script III.
   I/O átirányítás, szűrők, csövek,: wc, grep, sort, cut, tee, sed, reguláris kifejezések).
   Ismétlés, scriptek, szerkezetek
   a) Feladat: Írjunk shell script programot, ami kiszámolja egy szám (n) faktoriálisát!
   (Pl. while ciklus, i 2-től n-ig, majd a ciklusmagban f=`expr $f \* $i`. A
   feladatmegoldásoknál ne használjunk let utasítást, elég használni, megtanulni az
   expr-t, és használjuk a normál parancsbehelyettesítést! `parancs`) Ellenőrizzük,
   hogy kaptunk-e paramétert!
   b) Feladat: Írjunk script programot, ami szavakat olvas be egészen addig, míg a vége
   szót nem írjuk be, majd sorba rendezve kiírja a képernyőre azokat! (Használjunk
   ideiglenes fájlt!)
   c) Feladat: Írjunk programot, amelyik a paraméterül kapott számokat összeadja és az
   összeget a szabványos kimenetre írja! A program maximum 10 számot tudjon
   összeadni! A paraméterül megadott számok helyett megadhatjuk a –help kapcsolót,
   aminek hatására írjunk ki rövid ismertetőt a programról!
   d) Feladat: Írjunk programot, ami szétválogat egy paraméterben megadott fájlt páros és
   páratlan sorokra, majd ezeket új fájlokban elhelyezi! (dióhéjban: counter=0; while
   read line; do if [ $( expr $counter % 2) ]; echo $line > file_even; else echo $line >
   file_odd; fi; (( counter ++ )); done < bemeneti_file) vagy (cat file | while …)
   e) Feladat: Írjunk shell script programot, ami a háttérben fut és fél percenként
   ellenőrzi, hogy egy felhasználó bejelentkezett-e a rendszerbe! A felhasználó nevét
   paraméterként kell megadni!
   f) Feladat: Jelentkezzünk be egyszerre két terminálon. Ha az egyik ablakban elindítjuk
   az uzenet nevű most megírandó script programot, akkor az egy percen keresztül 5
   másodpercenként írjon egy üzenetet a másik terminálablakunkba! (Megoldás kulcsa:
   echo üzenet >/dev/pts/2, ha pts/2 a másik terminál azonosítója, vagy használjuk a
   'write <felhasznalonev>' parancsot)
   Szűrők
   a) Feladat: Telefonregiszter program, amely kapcsolók segítségével a következőket
   tudja: -a kapcsoló megadása esetén felvesz egy nevet és egy telefonszámot a
   listába (ügyeljünk a dupla elemekre), -d kapcsoló megadása esetén törölje a
   paraméterként megadott nevet és a hozzá tartozó telefonszámot, kapcsoló nélkül
   pedig keresse meg az illeszkedő neveket és írja ki hozzá a telefonszámokat. A –c
   kapcsolóra adja meg a regiszterben tárolt telefonszámok darabszámát. Az –o
   kapcsolóra rendezve írja ki a neveket – egyszeresen. (A tároláshoz használt
   szövegfájl formája szabadon meghatározható, segítségképp: a vesszővel vagy
   kettősponttal elválasztott mezők használata javasolt)
   b) Feladat: Módosítsuk az 1/a (faktoriális számoló programot) úgy, hogy
   szűrőként is tudjuk használni! (Ha nincs paraméter, n= `cat`….)
   c) Feladat: Módosítsuk az 1/c (paraméterek összeadását végző programot) úgy,
   hogy szűrőként is tudjuk használni! (Ha nincs paraméter, for i in `cat`….)
   d) Feladat: Írjunk programot, ami a paraméterben megadott fájlokat átnevezi csupa
   kisbetűsre! (segítség: echo $\*|tr '[A-Z]' '[a-z]')
   e) Feladat: Bővítsük az előző programot úgy, hogy kapcsolóval megadható legyen,
   hogy kisbetűsíteni vagy nagybetűsíteni akarunk!
   f) Feladat: Írjunk programot, ami egy paraméterben megadott állományban az
   összes elkódolt email címből valódit készít, majd azokat listázza a kimeneten.
   Egyúttal kerüljenek ki egy fájlba is az eredmények. (tee) Elkódolt email címek
   például (minden esetben gipsz@jakab.hu cím az eredeti): gipsz kukac jakab pont
   hu, gipsz at jakab dot hu, gipsz_nospam_jakab.hu, stb.)

8. gyakorlat. Shell script IV.
   Reguláris kifejezések, soron belüli mintaillesztés (grep), soron belüli csere (sed)
   esetleg awk – gyakorlás a korábbi órákon fel nem dolgozott feladatokkal.
   Reguláris kifejezések, grep, sed, awk
9. Feladat: Készítsünk scriptet, amelyik a paraméterében megadott fájlból a csak
   számokat tartalmazó sorokat írja ki! (valós számokra is gondoljunk)
10. Feladat: Készítsünk scriptet, amelyik megszámolja, hogy hány csak karaktereket
    tartalmazó sor van a fileban! Megoldások: s=0; while read …< file vagy grep –c …
11. Feladat: Készítsünk scriptet, amelyik egy adott szót (paraméterként megadott)
    tartalmazó sorokat nem másolja át egy másik fájlba! grep –v
12. Feladat: Készítsünk scriptet, amelyik a paraméterében megadott fájlból a csak azokat a
    sorokat írja ki, amelyikben sem az alma sem a korte szó nem szerepel megadott szó
    sem szerepel!
    cat file | grep –v „[alma\|korte]” vagy cat file | sed „/alma\|korte/d” vagy cat file | awk
    ’$1 !~ /alma|korte/ {print $1}’
13. Feladat: Cseréljük ki egy fájlban szereplő minden adott szót (paraméterben) egy
    másikra! sed „s/$1/$2/”
14. Feladat: Egy fájlban kétjegyű számok vannak – írjuk ki fordított sorrendben a
    számjegyeket! sed "s/\([0-9]\)\([0-9]\)/\2\1/"
15. Feladat: Egy fájlban soronként két szó van. Cseréljük meg a szavak sorrendjét a
    sorokban! cat file |sed „s/\([a-zA-Z]\+\)\( \+\)\([a-zA-Z\)/\3\2\1/” vagy
    cat file | awk ’{print $2,$1}’
16. Feladat: Egy fájlban számokat találunk soronként egyet-egyet. Adjuk össze ezeket!
    Megoldás while read …. < file vagy cat file | awk ’BEGIN {s=0} {s+=$1} END{print
    s}’
17. Feladat: Egy fájlban számokat és szövegeket tárolunk vegyesen. A nemcsak számokat
    tartalmazó sorokat másoljuk át egy új fájlba! Megoldások: grep –v regkif vagy
    awk ’$1 !~ /regkif/ {print $1}’
18. Feladat: Írjunk programot, ami beolvas egy számot a bemenetről, majd kiírja azt
    fordítva! (dióhéjban: while [ $szam -gt 0]do $aktualis=$(( $szam % 10 )); $szam=$((
    $szam / 10 )); forditva=$( echo ${forditva}${aktualis}); done)
    Az alábbi megoldás nem használja a let utasítást, helyette expr-t használ, és normál
    parancsbehelyettesítést használ (` parancs`).
    #!/bin/sh

#

echo -n Irjon be egyszamot:
read szam
forditva=""
while
[ $szam -gt 0 ]
do
akt=`expr $szam \% 10`

# echo $akt

szam=`expr $szam \/ 10`

# echo $szam

forditva=`echo "${forditva}$akt"`
done
echo -n A forditott szamsorrend:
echo $forditva 11. Feladat: Írjunk programot, ami beolvas egy számot a bemenetről, majd kiírja a
számjegyek összegét! (hasonló az előzőhöz, csak összegezni kell az értékeket) 12. Feladat (sok-sok extra pontért): Írjunk programot, ami megfordítja soronként a
paraméterben megadott fájl tartalmát! (segítség: átmeneti tárolásra egy tömböt
használjunk)

10. gyakorlat PowerShell gyakorlat I.
    PowerShell alapok megismerése, scriptek írása, a már megismert UNIX shellel való
    összehasonlítása
    Mondjuk el, hogy a PowerShell parancsok objektumokon dolgoznak! Nem kisbetűnagybetű érzékeny! UTF-8 kódolású, magyar ékezetes betűk is használhatóak! A
    .NET-ben megvalósított lehetőségeket, osztályokat is felhasználhatjuk. Mondjuk el,
    hogy a parancsoknak van aliasa, a shellben megszokott formalizmus is használható!
    Csővezeték, IO átirányítás a megszokott módon történik!
    Beszéljünk a script futtatási jogosultságról (executionpolicy), amit be kell otthon
    állítaniuk. Grafikus, karakteres változat.
    Feladatok
1. Mutassuk meg, hogy hol található a Windows-ban! Win8 és Win10 alatt:
   %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe. Egyébként
   keresés PowerShell ISE.
1. Felfele nyíl, tabulátor, intellisense
1. Fontos ismerni a help-et, itt get-help, get-command. Mutassuk meg a PS utasítások
   szerkezetét: parancs, paraméterek és argumentumok.
1. Próbáljuk ki a get-childitem, copy-item, rename-item, remove-item, new-item
   file/directory, get-content, set-location, push-location, pop-location parancsokat.
   Figyeljünk a write-host és write-output különbségre! Mutassuk meg, hogy még a
   dátum is objektum! (get-date).year…
1. Csővezeték használata ugyanolyan, mint a UNIX-ban, de az eredmény objektum.
   Ismerjük meg a következő szűrőket: format-list, format-table, sort-object (sort),
   where-object, select-object, select-string (grep), measure-object (wc), out-File, getmember!
1. Változók – get-variable (pshome, home) - utaljunk a shell env, set parancsaira!
   Hozzunk létre saját változókat! Mutassuk meg a unixtól eltérő lehetőségeket!
   Objektum is lehet egy változó értéke! Adjuk értéket egy változónak egy fájl tartalom
   beolvasásával, amit szöveges tömbként használhatunk! ($X=get-content file; $x[2];
$x.length; $x+=”új elem” ) Lássunk egy asszociatív tömböt is!
$y=@{„a”=”A”;”b”=”B”}; $y[„b”]; $y.keys ; $y.values
1. Készítsünk egy egyszerű scriptet, helló világ! Kiterjesztése ps1, (set-executionpolicy
   remotesigned). Mutassuk meg a PS ISE használatát!
1. Készítsünk scriptet, amelyik az aktuális könyvtár bejegyzései közül a fájlokat kiírja!
1. Készítsünk scriptet, amelyik meghatározza egy fájl sorainak a számát!
   (cat fájl | measure-object).Count; UNIX-ban cat fájl | wc –l)
1. Készítsünk scriptet, amelyik kiírja a paraméterei számát! ($args.Length; Unix-ban $# )
1. Készítsünk scriptet, amelyik az első és második paramétert összeadja illetve kiírja a
   szorzatukat is! (UNIX-ban kell az expr és a `` is)
1. Készítsünk scriptet, amelyik egy fájl soraiban lévő szavak közül kiírja a másodikat! A
   szavak között például legyen szóköz. ($sor.split(„ „)[1], UNIX-ban cut)
1. Készítsünk scriptet, amelyik egy fájl sorainak 2-5 karaktereit írja ki!
   ((ls).substring[2,3]; UNIX-ban cut –c2-5)

1. gyakorlat PowerShell gyakorlat II.
   Programszerkezetek, számolási feladatok.
   Mindenhol kérdezzünk rá arra, hogy UNIX alatt hogyan oldotta/oldaná meg a feladatot!
1. Feladat: Készítsen scriptet, amelyik kiszámolja a paraméterben megadott faktoriális
   értékét! (Mutassuk meg mindkét paraméter átvételi lehetőséget: $args, [int]$n
   használatával is!) Ellenőrizze, hogy kapott-e paramétert! (Param(
   [Parameter(Mandatory=$true)] [int]$n)
1. Feladat: Készítsen scriptet, amelyik kiszámolja az összes paraméter összegét! (foreach
   vagy for és $args.length)
1. Feladat: Módosítsa az előző scriptet úgy, hogy szűrőként is használhassa! ($input; UNIX
   `cat`)
1. Feladat: Készítsen el egy másodfokú egyenletet kiszámító scriptet, amelyik billentyűzetről
   olvassa be az adatokat! ([math]::sqrt(), [double]read-host)
1. Feladat: Készítsen scriptet, amelyik egy fájl páros és páratlan sorait külön-külön fájlokba
   másolja! Ellenőrizze, hogy létezik-e a fájl! (Test-Path)
1. Feladat: Készítsen scriptet, amelyik egy egész számról eldönti, hogy prím-e! (while)
1. Feladat: Készítsen scriptet, amelyik meghatározza a két egész szám legnagyobb közös
   osztóját!
1. Feladat: Készítsen scriptet, amelyik meghatározza egy intervallumba tartozó prímeket! A
   prím meghatározását írja meg függvényként! (function prim_e($szam){… return …})
1. Feladat: Írjunk programot, ami egy paraméterben megadott állományban az összes
   elkódolt email címből valódit készít, majd azokat listázza a kimeneten. Egyúttal
   kerüljenek ki egy fájlba is az eredmények. Elkódolt email címek például (minden esetben
   gipsz@jakab.hu cím az eredeti): gipsz kukac jakab pont hu, gipsz at jakab dot hu,
   gipsz_nospam_jakab.hu, stb.)
1. Feladat: Készítsen scriptet, amelyik egy fájl sorait fordítva írja ki. (az első sort utoljára)
   Kezeljük tömbként…
1. Feladat: Készítsen scriptet, amelyik a fájl sorait soronként fordítva írja ki! (az első betűt
   utoljára) ($sor.substring(); UNIX pl. rev vagy cut… )
1. Feladat: Készítsen scriptet, amelyik egy soronként két szóból álló fájlban a szavakat
   megcseréli (soronként)! (split; UNIX-ban, sed, awk, …)
1. Írassuk ki a gépen lévő driveokat! get-psdrive hklm (local machine), hkcu (current user)
   Olvassuk ki az env tartalmát! Set-location env: ; get-childitem
1. gyakorlat PowerShell gyakorlat III.
   Gyakorlás, (hibakezelés csak ha marad rá idő)
1. Készítsünk scriptet, amelyik a paraméterként érkező két számot elosztja. Ellenőrizzük,
   hogy kaptunk-e két egész paramétert! Nullával való osztást védjük ki try catch
   használatával! Használjuk a trap lehetőséget is! Trap {„ hiba szoveg”; continue} script
1. Készítsünk scriptet, amelyik egy listában megadott fájlokat törli. Figyeljünk rá, hogy
   hiba nélkül lefusson az alkalmazás akkor is, ha egy adott file nem létezik!
   remove-item … –erroraction silentlycontinue
1. Készítsünk scriptet, amelyik egy fájlban lévő neptun azonosítókban megkeresi azokat,
   amelyek egy adott karakterláncot tartalmaznak és ezeket külön másolja! Oldjuk meg a
   feladatot úgy is, hogy ebben az esetben kivételt dobunk, majd ezt kezeljük.
   throw throw new-object Exception, try vagy trap
1. Készítsünk scriptet, amelyik egy fájlban megadott azonosítókhoz létrehoz olyan nevű
   könyvtárakat, ha azok még nem léteztek! A könyvtárak mindegyikébe másoljon be,
   egy a kezdő felhasználónak szóló read.me fájlt, amelyet szintén paraméterként kap
   meg! Ellenőrizze, hogy léteznek-e a fájlok és azt, hogy az azonosítók lehetnek-e
   Neptun kódok! (a Neptun kód 7 hosszú, vegyesen karakter és számjegy lehet)
1. Készítsünk scriptet, amelyik egy fájlban Neptun kódokat kap és generáljunk hozzá
   adott hosszúságú jelszavakat! Írjuk ki egy kimeneti fájlba soronként egy-egy kódot és
   a hozzátartozó jelszót! (szövegesen : ( ) $szam=New-Object system.random;
$véletlen=($szam.next(1,34))
1. Készítsünk scriptet, amelyik egy könyvtár tartalmát szétválogatja a paraméterben
   megadott kiterjesztéseknek megfelelően. (Például a jpg képeket a jpg könyvtárba
   másolja stb.)
1. Készítsen scriptet, amelyik egy adott könyvtár és tetszőleges mélységben annak
   alkönyvtárainak teljes méretét meghatározza!
1. Készítsen scriptet, amelyik az összes, egy fájlban megadott alkalmazásokat elindítja
   vagy kilövi – ez függjön egy kapcsolótól! (start-process, stop-process )
1. Készítsen scriptet, amelyik kilistázza azokat a fájlokat, amelyek a megadott napon
   (paraméter) belül lettek módosítva!
   where-object{ $_.LastAccessTime –lt (Get-Date).AddDays(-$nap) }; UNIX-ban a
   find
1. Készítsen scriptet, amelyik kilistázza azokat a fájlokat, amelyek a megadott napon
   belül, a megadott méretnél nagyobbak!
