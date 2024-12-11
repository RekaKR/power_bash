
-----------------------------------------------------------
# Hasznos parancsok
	read -p "Add meg a neved: " nev
	echo "Szia, $nev!" 		# echo: Üzenet kiírása.
	ls -l    				# Részletes lista
	ls -a    				# Rejtett fájlokkal
	cp forras.txt cel.txt 	# másolás
	cp -r 					# forrasKonyvtar celKonyvtar  # Könyvtár másolása rekurzívan
	mv regiNev.txt ujNev.txt 
	mv fajl.txt mappa/  	# Fájl áthelyezése mappába
	rm fajl.txt 			# Fájlok törlése.
	rm -r konyvtar/  		# Könyvtár törlése rekurzívan
	mkdir ujKonyvtar 		# Új könyvtár létrehozása.
	mkdir -p a/b/c  		# Többszintű könyvtár létrehozása
	rmdir konyvtar 			# Üres könyvtár törlése.
	touch ujFajl.txt 		#  Üres fájl létrehozása vagy meglévő fájl érintése (időbélyeg frissítése).
	cat fajl.txt 			# Fájl tartalmának megjelenítése.
	head fajl.txt 			# Fájl elejének megjelenítése.
	head -n 5 fajl.txt  	# Első 5 sor
	tail fajl.txt 			# Fájl végének megjelenítése.
	tail -f fajl.txt  		# Fájl folyamatos követése
	grep "keresendo" fajl.txt 		# Sorok keresése szövegfájlban.
	grep -i "keresendo" fajl.txt  	# Nem érzékeny a kis- és nagybetűkre
	wc fajl.txt 			# Szavak, sorok és karakterek számolása.
	wc -l fajl.txt  		# Csak a sorok száma
	awk '{print $1}' fajl.txt  # Első oszlop kiírása
	sed 's/eredeti/uj/g' fajl.txt  # Cserék végrehajtása, Szöveg helyettesítése és manipulálása.
	du -h  					# Könyvtárméret megtekintése Humán-olvasóbarát formátumban
	chmod 755 fajl.txt		# Fájl jogosultságainak módosítása.
	chmod +x script.sh  	# Futási jog engedélyezése
	wget http://example.com/fajl.txt # Fájl letöltése
	--tar -cvf arch.tar fajl.txt 	# Fájlok archiválása és kibontása.
	--tar -xvf arch.tar  			# Kicsomagolás
	zip fajl.zip fajl.txt 			# file tömörítés
	zip -r konyvtar.zip konyvtar/  	# dir tömörítés
	unzip fajl.zip 					# kicsomagolás
	unzip fajl.zip -d celKonyvtar/ 	# ZIP-fájl kibontása egy megadott könyvtárba
	
	return # Függvényből való kilépés adott visszatérési értékkel.
	exit  # Szkriptből való kilépés adott visszatérési értékkel.
	
-----------------------------------------------------------
# Függvény létrehozása
	my_function() {
		# Parancsok itt
		echo "Ez egy függvény."
	}

	# Függvény hívása
	my_function

-----------------------------------------------------------
# if-else blokk
	if [[ feltétel ]]; then
		# Parancsok, ha a feltétel igaz
		echo "Igaz."
	elif [[ másik_feltétel ]]; then
		# Parancsok, ha a másik feltétel igaz
		echo "Másik igaz."
	else
		# Parancsok, ha egyik feltétel sem igaz
		echo "Hamis."
	fi

-----------------------------------------------------------
# case blokk
	case "$valtozo" in
		"érték1")
			echo "Érték 1 találat."
			;;
		"érték2")
			echo "Érték 2 találat."
			;;
		*)
			echo "Nincs találat."
			;;
	esac

-----------------------------------------------------------
# for ciklus
	# Lista elemeinek bejárása
	for item in elem1 elem2 elem3; do
		echo "Elem: $item"
	done

	# Számok iterálása
	for ((i = 1; i <= 5; i++)); do
		echo "Szám: $i"
	done


-----------------------------------------------------------
# while ciklus
	count=1
	while [[ $count -le 5 ]]; do
		echo "Szám: $count"
		((count++))
	done

-----------------------------------------------------------
# until ciklus
	count=1
	until [[ $count -gt 5 ]]; do
		echo "Szám: $count"
		((count++))
	done


-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# Órai feladat
	# 1) faktoriális
	
	#!/bin/bash
	nfaktor() {
		local n=$1
		local f=1
		for (( i=2; i<=n; i++ ))
		do
			f=$(( f * i ))
		done
		echo $f
	}

	echo "N faktoriális"
	nfaktor 5
	
	Magyarázat:
	Függvény definíció: A nfaktor() függvény ugyanúgy van definiálva, mint PowerShell-ben, de Bash-ban a függvények nem igényelnek kulcsszót, mint a PowerShell-ben (function).
	Paraméterek: A $1 az első paramétert jelenti, amit a függvényhívás során adunk át (itt az n értéket).
	Változók: A változókat Bash-ban local kulcsszóval deklaráljuk, hogy azok csak a függvényen belül legyenek elérhetők.
	Ciklus: A for ciklus Bash-ban a (( )) szintaxissal működik, és az i++ a változó növelését jelenti.
	Szorzás: A $(( )) szintaxist használjuk aritmetikai műveletekhez, például a szorzáshoz.

----------------------------------------------------------
# Órai feladat
	# 2) parameterkent megadott mappaban megszamolni a fajlokat es mappakat
	
	#!/bin/bash
	mappaKontroll() {
		local mappa
		echo "Adj meg egy vigyálandó mappát:"
		read -p "mappa=" mappa

		# Ha a felhasználó nem adott meg mappát, használjuk az aktuális könyvtárat
		if [ -z "$mappa" ]; then
			mappa=$(pwd) # pwd adja az aktuális könyvtárat
		fi

		# Számoljuk meg az elemeket a mappában
		local count=$(ls -1 "$mappa" 2>/dev/null | wc -l)

		echo "A mappában található elemek száma: $count"
	}
	mappaKontroll

	Magyarázat:
	Függvény definiálása:
	A mappaKontroll egy Bash függvény, amelyben a local kulcsszóval deklaráljuk a helyi változókat.
	Felhasználói input kezelése:
	A read parancs kéri be a felhasználói adatot. Ha nem adnak meg semmit, a változó (mappa) üres lesz.
	Alapértelmezett mappa beállítása:
	Az [ -z "$mappa" ] Bash feltétel ellenőrzi, hogy a változó üres-e.
	Ha üres, a pwd parancs segítségével az aktuális könyvtárat használjuk alapértelmezettként.
	Elemek számának meghatározása:
	Az ls -1 parancs felsorolja a mappa elemeit soronként. A wc -l megszámolja a sorokat, így az elemek számát adja vissza.
	A 2>/dev/null kifejezés elnyeli az esetleges hibákat (például ha a mappa nem létezik).
	Kimenet:
	Kiírjuk a mappában található elemek számát.

-----------------------------------------------------------
# Órai feladat
	# 3) Üdv script
	
	#!/bin/bash
	hello() {
		# Az aktuális felhasználó neve
		local currentUser=$USER

		# Az aktuális idő
		local currentDateTime=$(date +"%Y-%m-%d %H:%M:%S")

		# Üzenet kiírása
		echo "Hello, $currentUser! Az aktuális idő: $currentDateTime"
	}
	hello

	Magyarázat:
	Felhasználónév lekérése:
	Bash-ban a $USER változó tárolja az aktuális felhasználó nevét, amelyet közvetlenül használhatunk.
	Idő lekérése:
	A date parancsot használjuk, a +"%Y-%m-%d %H:%M:%S" formátummal adja vissza az időt az év-hónap-nap és óra:perc:másodperc formátumban.
	Üzenet kiírása:
	Az echo parancsot használjuk a konzolra történő üzenet kiírásához, ami ekvivalens a PowerShell Write-Host parancsával.
	Függvény definiálása és meghívása:
	A függvény Bash-ban a functionName() szintaxissal van definiálva. A végén egyszerűen meghívjuk a hello függvényt.

-----------------------------------------------------------
# Órai feladat
	# 4f) olvass be szavakat bill-rol, mig a vege szot nem irjuk.
	# irasd ki rendezve, irasd ki az a betuvel kezdodoeket.
	
	# "szo" változóba adat bekérése
	#!/bin/bash
	read -p "szo=" szo
	echo "$szo" # Kiírja a beolvasott adatot

	# Adat beírása fájlba
	nano szoveg.txt # A nano egy egyszerű szövegszerkesztő Bash környezetben

	# Újabb adatbekérés és fájlba írás ciklusban
	read -p "szo=" szo
	while [ "$szo" != "vege" ]; do
		echo "$szo" >> szoveg.txt
		read -p "szo=" szo
	done

	# Ellenőrizzük, hogy a fájl létezik-e
	if [ -f szoveg.txt ]; then
		sort szoveg.txt # A fájl tartalmát rendezetten kiírjuk
		# Ha törölni akarjuk a fájlt:
		# rm szoveg.txt
	fi
	
	Magyarázat:
	Adatbekérés:
	A read -p "szo=" szo parancs bekéri a felhasználótól a szo változó értékét, hasonlóan a PowerShell Read-Host parancsához.
	Fájl szerkesztése:
	A nano helyettesíti a notepad alkalmazást Linux/Bash környezetben. Ez a fájlban meglévő szöveg szerkesztésére szolgál.
	Ciklus adatbekéréshez és fájlba íráshoz:
	A while ciklus addig fut, amíg a szo változó értéke nem "vege". Az összehasonlítást a [ "$szo" != "vege" ] szintaxissal végezzük.
	Fájl létezésének ellenőrzése:
	Az if [ -f szoveg.txt ] ellenőrzi, hogy a szoveg.txt nevű fájl létezik-e. Ha igen, a sort parancs rendezetten kiírja a fájl tartalmát.
	Fájl törlése (opcionális):
	A megjegyzett rm szoveg.txt parancs eltávolítja a fájlt, ha szükséges.
	
-----------------------------------------------------------	
# Órai feladat
	# 5f) keszits tablazatot, 1-tol 1-vel 10-ig
	# tabulátorral választja el x1, x2 és x3-at, majd 1-10-ig ciklusban kiírja x2 és x3-at


	# Fejléc kiírása
	#!/bin/bash
	echo -e "x\tx*2\tx*3"

	# Ciklus 1-től 10-ig
	for x in {1..10}; do
		x2=$((x * x))   # Négyzet kiszámítása
		x3=$((x * x * x)) # Köb kiszámítása
		echo -e "$x\t$x2\t$x3" # Kiírás tabulátorokkal
	done

	Magyarázat:
	Fejléc kiírása:
	Az echo -e engedélyezi az escape karakterek használatát, például a \t tabulátor karaktert.
	Ciklus definiálása:
	A for x in {1..10} szintaxissal egy tartományt adunk meg 1-től 10-ig. Ez megfelel a PowerShell for($x=1;$x -le 10;$x++) kifejezésének.
	Szorzás:
	Az aritmetikai műveleteket a $(( )) szintaxissal végezzük Bash-ban. Például x * x a négyzetet, x * x * x a köböt számítja ki.
	Tabulált kiírás:
	A \t karaktert használjuk tabulátor helyére. Az -e opció szükséges az echo parancsnál, hogy az escape karaktereket helyesen értelmezze.
	
	
	
-----------------------------------------------------------	
# Órai feladat
	# 6) adott file-ban (pl. 1szamok.txt) lévő számokra végzett alapműveletek
	
	# Példa input fájl létrehozása (szövegszerkesztő megnyitás)
	
	#!/bin/bash
	nano 1szamok.txt

	# Változók inicializálása
	sum=0
	szor=1
	atlag=0
	i=0

	# Sorok bejárása a fájlból
	while read -r line; do
		# Összeg frissítése
		sum=$((sum + line))
		# Szorzat frissítése
		szor=$((szor * line))
		# Sorok számlálása
		i=$((i + 1))
	done < 1szamok.txt

	# Átlag számítása (ha legalább egy sor volt a fájlban)
	if [ "$i" -gt 0 ]; then
		atlag=$((sum / i))
	fi

	# Eredmények kiírása
	echo "Sorok száma: $i"
	echo "Összeg: $sum"
	echo "Szorzat: $szor"
	echo "Átlag: $atlag"
	
-----------------------------------------------------------	
# Órai feladat
	# 6f) szam.txt-ben egy szam, adj hozza 1-et es ird vissza!adott file-ban (pl. 1szamok.txt) lévő számokra végzett alapműveletek
	
	#!/bin/bash

	# A fájl neve
	filePath="szam.txt"

	# Ellenőrizzük, hogy a fájl létezik-e
	if [[ ! -f "$filePath" ]]; then
		echo "A fájl nem létezik."
		exit 1
	fi

	# A szám beolvasása a fájlból
	szam=$(cat "$filePath")

	# Ellenőrizzük, hogy a fájl tartalma szám-e
	if ! [[ "$szam" =~ ^[0-9]+$ ]]; then
		echo "A fájl tartalma nem érvényes szám."
		exit 1
	fi

	# A szám korrigálása
	korrigaltSzam=$((szam + 1))

	# Az új érték mentése a fájlba
	echo "$korrigaltSzam" > "$filePath"

	echo "A fájl frissítve: $szam -> $korrigaltSzam"
	
	
	
	
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# ZH 1. feladat
---------------
# Készítse el a következő feladatokhoz a shell szkript megoldásokat. 
# 1) Készítsen 1.sh néven egy szkriptet, amelyik 3 számot vár (parancssorból vagy csövön át) és kiírja őket nagyságrendben. 
# pl. .\1.sh 4 7 2 => 2 4 7  vagy echo 4 7 2 | .\1.sh => 2 4 7 2. 	

	#!/bin/bash

	# A fájl neve
	filePath="Feladat1_int.txt"

	# Megnyitjuk a fájlt szerkesztésre
	if ! command -v notepad &> /dev/null; then
		echo "A notepad alkalmazás nem érhető el."
	else
		notepad "$filePath"
	fi

	# Háromszor megkérdezzük a felhasználótól a számot
	for ((i = 0; i <= 2; i++)); do
		read -p "szam=" szam
		if ! [[ "$szam" =~ ^-?[0-9]+$ ]]; then
			echo "Érvénytelen szám. Próbálja újra."
			((i--))
			continue
		fi
		echo "$szam" >> "$filePath"
	done

	# Ha a fájl létezik, rendezzük sorba a tartalmát
	if [[ -f "$filePath" ]]; then
		sort "$filePath"
	fi

	# A fájl törlése az eljárás végén (opcionális)
	rm -f "$filePath"
	
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# ZH 2. feladat
---------------
# Készítsen 2.sh néven egy szkriptet, amelyik parancssorban vár könyvtárneveket és ezeket a szkript 
# létrehozza és bemásol beléjük egy read.me fájlt. Nem kell ellenőrizni a könyvtárak vagy a fájl meglétét) 
# pl. .\2.sh jpg png docx => Létrejön egy jpg, egy png és egy docx nevű könyvtár, amelyekbe bemásolja a read-me fájlt 

	#!/bin/bash

	# A bemásolandó ReadMe fájl tartalma
	readMeFile="Ez egy read-me fájl."

	# Végigmegyünk az argumentumokon
	for directory in "$@"; do
		# Könyvtár létrehozása
		mkdir -p "$directory"

		# read-me fájl létrehozása a könyvtárban
		readMePath="$directory/read-me.txt"
		echo "$readMeFile" > "$readMePath"
	done

	echo "A könyvtárak és a ReadMe fájlok létrejöttek."

	# Példa futtatásra
	# ./2.sh jpg png docx
	
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# ZH 3. feladat
---------------
# Készítsen 3.sh néven egy szkriptet, amelyik egy fájlnevet vár paraméterként. 
# A fájlban soronként egy-egy egész szám szerepel.
# Írjuk ki mindegyik helyett a négyzetét!
# pl 3.sh szamok.txt => 4 9 25 //ha a fájl sorai: 2 3 és 5 

	#!/bin/bash

	# Paraméterként várja a fájl nevét
	filePath="$1"

	# Ellenőrizzük, hogy a fájl létezik-e
	if [[ ! -f "$filePath" ]]; then
		echo "Hiba: A fájl nem található."
		exit 1
	fi

	# Beolvassuk a fájl tartalmát
	while IFS= read -r line; do
		# Ellenőrizzük, hogy a sor egy szám-e
		if [[ "$line" =~ ^-?[0-9]+$ ]]; then
			# Kiírjuk a szám négyzetét
			echo $((line * line))
		else
			echo "Hiba: Nem szám: '$line'"
		fi
	done < "$filePath"

	# Példa futtatásra
	# ./3.sh szamok.txt


-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# ZH 4. feladat
---------------
# Készítsen 4.sh néven egy szkriptet, amelyik egy fájlnevet vár paraméterként. 
# A fájlban soronként két szó van. Írjuk ki a hosszabbikat!
# pl. 4.sh szavak => almafa cseresznye narancs //ha a fájlban 3 sor van: alma almafa; cseresznye, dinnye; narancs eper

	#!/bin/bash

	# Paraméterként várja a fájl nevét
	filePath="$1"

	# Ellenőrizzük, hogy a fájl létezik-e
	if [[ ! -f "$filePath" ]]; then
		echo "Hiba: A fájl nem található."
		exit 1
	fi

	# Beolvassuk a fájl tartalmát
	mapfile -t tmpAdat < "$filePath"

	# Soronként feldolgozzuk a fájl tartalmát
	for adottSor in "${tmpAdat[@]}"; do
		# A szavak különválasztása
		IFS=' ' read -r -a szoSplited <<< "$adottSor"

		# Ellenőrizzük, hogy legalább két szó van-e
		if [[ ${#szoSplited[@]} -ge 2 ]]; then
			if [[ ${#szoSplited[0]} -ge ${#szoSplited[1]} ]]; then
				echo "${szoSplited[0]}"
			else
				echo "${szoSplited[1]}"
			fi
		else
			echo "Hiba: Az alábbi sor nem tartalmaz két szót: '$adottSor'"
		fi

	done

	# Példa futtatásra
	# ./script.sh szavak.txt
	
	
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
ZH feladat
----------
Egy autó századmásodpercenként méri mozgás közben, hogy milyen távolságba van előtte vagy utána "valami" 
és ez alapján dönt arról, gyorsítania kell vagy lassítani vagy esetleg megállni. 
Ezeket az adatokat most egy adatfájlban tároljuk: időpont (év.hó.nap óra:perc:mperc:szmp), sebesség, távolságelejétől, távolsághátuljától)

1) Készítsen auto.sh néven egy szkriptet, ami megadja, hogy hányszor állt meg az autó. 
(Hány olyan hely van, ahol a következő adat több, mint 1 perc múlva érkezett. 
Ha áll az autó, nem mér.)!
2) Készítsen fekez.sh néven szkriptet, ami megadja, hogy mikor kellett fékezni. 
Fékezni akkor kell, ha az előtte levő autó távolsága K-méternél kisebb.  pl: ./fekez.sh 100)
3) Készítsen legkozelebb.sh néven szkriptet, ami megadja, hogy mikor volt a legközelebb hozzá valami (bármelyik irányból).

# 1) auto.sh
------------

	#!/bin/bash
	Initialize variables
	prev_time=""
	stop_count=0

	Read the file line by line
	while IFS= read -r line; do
		# Extract the timestamp
		current_time=$(echo "$line" | awk '{print $1}')

		if [ -n "$prev_time" ]; then
			# Convert timestamps to seconds since epoch
			prev_seconds=$(date -d "$prev_time" +%s)
			current_seconds=$(date -d "$current_time" +%s)

			# Calculate the time difference
			time_diff=$((current_seconds - prev_seconds))

			# Check if the time difference is greater than 60 seconds
			if [ $time_diff -gt 60 ]; then
				stop_count=$((stop_count + 1))
			fi
		fi

		# Update the previous time
		prev_time=$current_time

	done < "datafile.txt"

	Output the stop count
	echo "The car stopped $stop_count times."
 
 
 # 2) fekez.sh.sh
-----------------
 
	#!/bin/bash
	Check if the user provided a distance threshold
	if [ "$#" -ne 1 ]; then
		echo "Usage: $0 <distance_threshold>"
		exit 1
	fi

	threshold=$1

	Read the file line by line
	while IFS= read -r line; do
		# Extract the distance in front
		distance_front=$(echo "$line" | awk '{print $3}')

		# Check if the distance is less than the threshold
		if (( $(echo "$distance_front < $threshold" | bc -l) )); then
			# Print the timestamp
			echo "$line" | awk '{print $1}'
		fi
	done < "datafile.txt"
	
	 
 # 3) legkozelebb.sh
--------------------

	#!/bin/bash
	Initialize variables
	closest_distance=99999999
	closest_time=""

	Read the file line by line
	while IFS= read -r line; do
		# Extract the distances and timestamp
		distance_front=$(echo "$line" | awk '{print $3}')
		distance_back=$(echo "$line" | awk '{print $4}')
		timestamp=$(echo "$line" | awk '{print $1}')

		# Find the minimum distance
		if (( $(echo "$distance_front < $closest_distance" | bc -l) )); then
			closest_distance=$distance_front
			closest_time=$timestamp
		fi

		if (( $(echo "$distance_back < $closest_distance" | bc -l) )); then
			closest_distance=$distance_back
			closest_time=$timestamp
		fi
	done < "datafile.txt"

	Output the closest time
	echo "The closest moment was at $closest_time with a distance of $closest_distance."

# End