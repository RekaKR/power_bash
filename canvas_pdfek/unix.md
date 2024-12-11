2. gyakorlat. Unix alapok I.
   szamrend.inf.elte.hu (pandoran-n)
   bejelentkezés/jelszó: pandoras-s
1. Hálózati kapcsolatok még Windows-ból: telnet/ssh, ftp/scp, bináris/szöveges ftp.
   Putty/Winscp programok, elérhetőségük, használatuk.
1. A public_html könyvtár szerepe. Mondjuk el, hogy a tárhelyükre felhelyezett
   anyagokért felelősséget vállalnak. (nem üzemeltethetnek web-shopot, fájlmegosztót
   stb) A jelen kiszolgáló rendszere miatt ez nem felhasználói könyvtárban, hanem
   public könyvtárban van!
1. Ismerkedés a linux-al: szerkezete: kernel, parancsértelmező (shell), programok. A
   kernel végzi a rendszer erőforrásainak megosztását és a futó folyamatok
   ütemezését, valamint a felhasználói programok számára egy interfészt biztosít a
   hardver felé. A kernel körül helyezkedik el a shell (héj, burok) ami biztosítja a
   kapcsolatot a felhasználó és a kernel között.
1. A Linux könyvtárszerkezete, fontosabb könyvtárak:
   / A főkönyvtár, a könyvtárfa kiindulópontja
   /home Ehhez csatlakoznak a felhasználók könyvtárai
   /dev A hardvereszközöket reprezentáló fájlok
   /etc A legfontosabb konfigurációs fájlok
   /usr/bin Közhasználatú parancsok
   /sbin A superuser és a rendszerindító parancsok
   /usr/doc Dokumentációs fájlok
   /usr/local/man Kézikönyv oldalak
   /tmp Ideiglenes fájlok
   /var Konfigurációs fájlok (Linkek az /usr-ből)
   /lib Megosztott programkönyvtárak
   /proc A processzek fájlrendszere
1. Alap unix parancsok:
   a. passwd helyett kpasswd, who, whoami
   b. shell fogalma, aktuális shell: bash, felfele nyíl, tabulátor
   c. pwd, ls és legfontosabb paraméterei ls –l, ls -al, parancsok értelmezése,
   unix filerendszer alapok, /, /etc, /var stb. könyvtárak, cd, mkdir, rmdir .
   i. Másolás, cp, mozgatás, mv, tartalom megnézés, cat
   d. I/O átirányítás, ennek segítségével file létrehozása. File törlés, rm, nincs
   ezután „undelete”
   e. Feladat: hozzon létre a könyvtárszerkezetet: foci/nb1, foci/nb2, majd
   ezalatt, utána töröljük, rm –r
   f. Link ln parancs.
   g. Irassuk ki egy nagy könyvtár tartalmát a képernyőre. Majd egy fájlba és azt
   a more vagy less paranccsal megjeleníteni.( ls /bin > /lsbin majd
   h. more /lsbin). Ezután tegyük ugyanezt pipeline használatával (ls /bin | more)
   i. Csomagoljuk össze könyvtárunk tartalmát zip illetve tar fájlokban.
   j. Felhasználó keresése: finger. „Beszélgetés” másik felhasználóval: talk.
1. Levelezés:
   a. Mondjuk el, hogy egy unix kiszolgáló jellemzően egyúttal SMTP szerver is
   (Windows szervernél csak mostanra az win2003-tól), így minden
   felhasználó automatikusan egy postafiókot is jelent. Mivel ez a postafiók az
   inf.elte.hu tartomány fiókja, ezt a pine is kiolvassa, de célszerű ezt egy
   böngészőből olvasni, használni! (Jelenleg nem működik. A levelezés a
   felhőbe került át.)
   b. Röviden SMTP-ről, IMAP-ról.
   c. Minden hallgatónak lehet/van inf-es címe. Mondjuk el, hogy spam-eket
   nem illik indítani.
   d. talk usernév [tty] Az üzenetek letiltható a mesg n paranccsal
1. Jogosítványok:
   a. Az alábbi parancsok „normál” unix fájlrendszer alatt működnek. Jelen infes kiszolgálón a home könyvtár AFS rendszerű. Ezen is van látszólag
   chmod, de AFS rendszeren az fs parancson keresztül lehet a
   jogosítványokat állítani. fs setacl illetve fs listacl a legfontosabb 2 parancs.
   Ezekről és más AFS jogosítványokról bővebben előadáson lesz szó, illetve
   manual, és egyéb internetes dokumentációkban találhatunk leírást,
   mintákat. Gyakorlaton csak az fs listacl fájlnév forma használata
   szerepeljen!
   b. ls –l, rwx-ek, módosításuk, UNIX fájlrendszer alatt!
   c. chmod:
   chmod u+x file név: Végrehajtási jogosultságot ad a file tulajdonosának
   chmod go-rx file nevek: Visszavonja az olvasási és végrehajtási
   jogosultságokat a csoport- és az egyéb felhasználóktól
   chmod 644 file név: Olvasási és írási jogosultságot ad a tulajdonos, csak
   olvasási jogosultságot ad minden egyéb felhasználó számára
   d. Állomány alapjogok, umask
   e. Tulajdonjog megváltoztatása: chown
1. Írassuk ki az aktuális könyvtárban lévő összes html kiterjesztésű file utolsó 2 sorát.
   a. find . -name "\*.html" -exec tail -2 {} \;
1. Töröljük le a munkakönyvtárból az összes fájlt és a könyvtárat is.
   a. rm \*
   b. cd ..
   c. rmdir temp/
1. Kilépünk a terminálprogramból, majd az operációs rendszerből

1. gyakorlat. Unix alapok II.
   Téma: Processzek: ps, kill, trap, bg, fg, wait. Szövegszerkesztés: vi, pico, joe. Midnigth
   Commander: mc., Sorok manipulációja, Bootolás lokális gépen.).
   Folytassuk az előző óra anyagát, lépjünk be terminálkapcsolattal a kiszolgálóra
   Folyamatok - processzek
   A Unix és így a Linux rendszerek többfeladatos (multitasking) operációs rendszerek,
   időosztásos (time sharing) módszert használva több programot is képesek egyszerre futtatni.
   A kellően gyors váltások miatt a felhasználó számára mindez egyidejűséget kelt.
   A párhuzamosan futtatott feladatokat (folyamatokat) kezelni is tudjuk: lekérdezni, leállítani,
   időzíteni, priorizálni.
   A Unix minden futó feladathoz külön azonosítót PID (processz identificator) rendel, hogy az
   egyszerre futó - akár azonos – programpéldányok között különbséget tudjon tenni. A PID egy
   egész szám, amely a gép bekapcsolásakor 1-ről indul és minden elindított feladat esetén
   eggyel növekszik. (A legnagyobb PID limit érték lekérdezhető az alábbi paranccsal: cat
   /proc/sys/kernel/pid_max)
   Futó folyamatok lekérése
   A futó folyamatokat a ps paranccsal kérhetjük le.
   Az egyes mezők jelentése:
   PID - a folyamat azonosítója
   TTY - a vezérlõ terminál azonosítója, jelen esetben ez a ttyp0
   STAT - a folyamat állapota
   TIME - a processz által eddig elhasznált processzor idő
   A rendszerben futó összes folyamatot, a legbővebb információkkal Linux alatt a "ps -aux"
   opciókkal kérhetjük le. Ekkor a processzekről megtudjuk még tulajdonosukat, az időpontot
   amikor elindultak, valamint különféle erőforrás használati információkat (CPU, memória
   használat, a program mérete a memóriában).
   top: Információk a processzekről és egyéb statisztikák a rendszerről. A top folyamatosan fut,
   és 5 másodpercenként frissíti a megjelenített információkat. Kilépni a "q" megnyomásával
   lehet.
   Programok indítása
   Programok indítása előtérben: A program az előtérben fut, amíg nem fejezi be futását addig
   a felhasználó az adott héjban (shell, burok) nem indíthat újabb programot. Az előtérben futó
   program birtokolja a billentyűzetet. A hagyományos elindítással, tehát alapértelmezés szerint
   a programok az előtérben futnak. Vagy az fg <parancsnév> használatával.
   Programok indítása háttérben: Háttérben úgy tudunk futtatni programot, hogy ’&’ jelet kell
   gépelni a parancs után.
   Feladat:
1. sleep 20
   20 másodpercig vár, előtérben futtatva. A vezérlést 20 másodperc múlva kapjuk
   vissza.
1. sleep 20&
   20 másodpercig vár a háttérben. Két számot ír ki, pl.: [1] 532 majd visszaadja a
   vezérlést. Az első szám az adott burok feladatazonosítója, a második a rendszeren
   érvényes egyedi feladatazonosító, PID. Majd 20 másodperc múlva, amikor a folyamat
   végzett, a burok üzenetet küld a felhasználónak pl.: [1] + Done. A felhasználó csak
   akkor kap értesítést, amikor a következő ENTER-t megnyomja.
1. nohup <parancsnév>: (no hangup): Ha egy parancs elé a nohup kulcsszót
   tesszük, az adott program futása nem szakad meg a felhasználó kijelentkezésekor.
   Kimenete hozzáfűződik a nohup.out állományhoz.
   nohup ls
   more nohup.out
   Processzek kezelése
   Az előtérben futó folyamatot be kell fagyasztani ahhoz, hogy később a háttérben, kívülről
   lehessen irányítani. ctrl + z.
   Pl.: sleep 100, majd ctrl + z, továbbá kapunk egy folyamatazonosítót is, későbbi
   felhasználásra. Ezt követően a ps-t kiadva láthatjuk a még futó folyamatot.
   • fg: Egy háttérben futó vagy befagyasztott folyamatot az előtérbe helyezhetünk vele.
   fg %1 vagy fg sleep
   • bg: Egy befagyasztott programot a háttérben folytathatunk.
   • jobs: belső feladatazonosítók lekérdezése. Kiírja továbbá a futó folyamatok állapotát is
   (Running, Stopped, stb.)
   • kill: Folyamat bezárása. „Normál” felhasználó csak a saját folyamatait állíthatja le,
   a rendszergazda bárkiét. A kill parancs, paramétere lehet a folyamat száma vagy pedig
   a processz azonosítója (PID).
   Hagyományos leállítás:
   kill %1
   kill 3954
   Példa: A yes parancs y karakterek végtelen sorozatát küldi a kimenetére. Hogy ne
   kelljen az y-ok végtelen sorát látni irányítsuk át a kimenetet egy alkalmas helyre:
   /dev/null - egy un. fekete lyuk: a beleirányított összes információt elnyeli: yes >
   /dev/null
   Így kaptunk egy előtérben futó jobot. Hogy a háttérbe tegyuk, a "&" jelet kell
   alkalmaznunk: yes > /dev/null &
   Feladat: a kill paranccsal állítsuk le a futó folyamatot.
   • Jelek: 0-15 közti számok, valójában egy eseményt jelöl egy szám
   o Egy jel küldése egy processznek: kill –jel PID
   o PL: 2 – ctrl+c, 9- kill ,feltétel nélküli befejezés
   o 15 jel az alapértelmezés, ez a szoftver befejezés
   Feladat: Lépjünk be két terminál kapcsolattal, egyik ablakban indítsunk el egy
   szövegszerkesztőt, majd ezt lőjük ki a másik ablakból! (kill -15 PID)
   Szignálok: A Unix rendszer a folyamatok vezérlését a folyamatoknak küldött ún. szignálok
   (signals) segítségével végzi: a ^Z billentyû például egy STOP szignált küld az előtérben futó
   processznek. Processzt kiölni szintén szignál(ok) segítségével lehet: az előtérben futó program
   a ^C (Ctrl-c) megnyomására egy INT szignált kap, amely rendszerint a program elhalálozását
   vonja maga után. Háttérben futó folyamatainkat a "kill" paranccsal irthatjuk ki:
   alapértelmezés szerint a "kill" egy TERM (terminate) szignált küld a megadott folyamatnak.
   Ha más (nem TERM) szignált akarunk küldeni, a kill parancsot megfelelően paraméterezni
   kell, például a STOP szignálhoz: "kill -STOP pid". Ennek ugyanolyan hatása van, mintha az a
   folyamat az előtérben futna, és a ^Z-t nyomtuk volna meg: a folyamat felfüggesztett állapotba
   kerül. Folyamatot megölni még a HUP (hangup) és a KILL szignálokkal is lehet. (Az előbb
   látott nohup parancs ezen HUP szignál ellen teszi immunissá a folyamatot.) A sokféle
   látszólag azonos hatású szignál oka, hogy korántsem azonos hatásúak: például a HUP és a
   TERM szignálokat a folyamat felülbírálhatja, saját szignál-kezelő rutint állíthat be (így van ez
   az INT szignálnál is). Ezeket a szignálokat a folyamat kapja meg, és alapértelmezés szerinti
   kezelő rutinjuk lép ki. A KILL szignál hatására viszont a kernel öli meg a folyamatot, annak
   megkérdezése nélkül. Ezért nem probléma Unixban, ha egy folyamat "lefagy", végtelen
   ciklusba kerül: egy KILL szignál mindig megoldja a problémát.
   Szignált csak saját processzeinknek küldhetünk (kivéve a root-ot, aki bármely processzel
   rendelkezhet). Az eddig felsoroltakon kívül még számos egyéb szignál van, megemlítjük még
   az ALARM szignált: a rendszert megkérhetjük, hogy megadott idő múlva küldjön egyet. Ezt
   használják időzítési célokra, többek között a "sleep" utasítás is így mûködik. De szignálokat
   használ a rendszer sok más egyéb, a folyamatot érintő rendszerinformáció közlésére is, de
   ezek főleg programozók számára érdekesek.
   Processz erőforrás-felhasználás
   • time <parancsnév>: Ha egy parancs elé a time kulcsszót írjuk, akkor a burok az
   indított program befejezése után statisztikai adatokat ad a feladat által használt
   erőforrásokról, kiírja, hogy mennyi idő alatt futott le és mekkora terhelést jelentett a
   rendszer számára.
   pl.: time ls
   • strace <parancsnév>: Hibakereséshez használatos parancs. Az indított
   program minden rendszerhívását kiírja.
   pl.: strace ls
   pl: strace –p 16543 - a figyelt folyamat azonosítója
   Csapdák (eseménykezelés):
   trap parancs. Bizonyos jeleket lehet, címzés nélkül küldeni, ctrl+c, ctrl+\ (3, quit)
   Feladat: A ctrl+c leütésére írjuk ki: Hajrá ELTE!
   Megoldás: trap ’echo Hajrá ELTE!’ 2
   Feladat: Szüntessük meg ezt a csapdát, „eseménykézelést”!:
   Megoldás: trap ’’ 2
   Szövegszerkesztés
   vi (vim)
   Lényeges, mert mindenhol van! (szamalap-on a vim (improved) indul el!)
   Parancsmód: esc bill.
1. mentés:
   a. :w, :x – kilépés mentéssel
   b. :wq – mentés, bezárás
   c. :q! – kilépés mentés nélkül
1. karakter törlés: x
1. sortörlés: dd, 3 sor törlés: 3dd
1. Beillesztés: p
1. Keresés: /mit
Szerkesztőmód: i, a, o
Segítség:
• http://www.szabilinux.hu/vi/index.html
• www.linuxvilag.hu/content/files/cikk/36/cikk_36_78_80.pdf
Feladat:
Készítsük el az alábbi fájlt vi.html néven a webes mappánkba (public_html):
<html>
 <body>
 <p>Nem is olyan bonyolult ez a szerkeszto</p>
 </body>
</html>
pico
Fontosabb parancsok a képernyőn
joe
Help: ctrl+k, h
Feladat: Módosítsuk például a címkét az index.html állományban!
Midnight Commander (mc)
Fontos, többcélú fájlmenedzsment program, akár szövegszerkesztőként, FTP kliensként is
használható. Hasonlít a sokak által ismert Norton Commanderhez. Kétpaneles, de mindkét
panel a távoli gépre vonatkozik!
Sorok manipulációja
A szűrők később visszatérnek a scriptes részben! Elegendő arra utalni, hogy milyen fontos
feladatot látnak el. Nem kell ezeket a feladatokat megoldani, elég egy-két példa!
Parancsként és szűrőként is működnek pl. wc, grep, cut, sort
Feladat:
1. Számoljuk meg az aktuális könyvtárban lévő bejegyzések számát. Készítsük el a
   megoldást parancsként és szűrőként is a megoldást!
1. Listázzuk ki az aktuális könyvtár alkönyvtárait! (A könyvtáraknál d az első karakter –
   grep ^d, cut )
1. Listázzuk ki a bejelentkezett felhasználók azonosítóját és csak azt! (who, cut)
1. Listázzuk ki egy tetszőleges szöveges fájl sorait abc sorba rendezve!
1. Cseréljük ki egy fájlban lévő karaktereket a nagybetűs párjukra!
1. Számoljuk meg, hogy egy fájlban hány olyan sor van, amelyik az alma szót
   tartalmazza és semmi mást! (tr, grep ^alma$, wc)
1. Csak az egészeket tartalmazó sorokat engedje át a szűrő (grep ^[\+-]?[1-9][0-9]\*$)
   Egyebek
   • Nézzük meg boot során van-e több (boot) partíció!
   • Próbáljunk a lokális gépen linuxot bootolni!
   o Nézzük meg itt is az alap parancsokat!
   • Kilépünk a terminálprogramból, majd az operációs rendszerből
