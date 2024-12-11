Belépés (otthon): ssh <neptun>@szamrend.inf.elte.hu
Belépés: 		  ssh <neptun>@szamrend



-----------------------------------------------------------
# Fontosabb parancsok (Unix parancs)
	Get-Command (gcm) 		# összes parancs kiíratása
	Write-Output (echo) 	# képernyőre írás, egyszerű, pipe használat
	Get-Help 				# help
	Get-Process (ps) 		# futó processzek kiírása
	Get-ChildItem (dir, ls) # könyvtár tartalom
	Get-Location (pwd) 		# aktuális mappa
	New-Item –itemtype directory almadir (#mkdir) # fájl vagy könyvtár létrehozása
	Copy-Item (cp) 				 # másolás
	Remove-Item (rm, rmdir, del) # fájl, könyvtár törlése 
 	Move-Item (mv) 				 # fájl, könyvtár mozgatás 
 	Rename-Item (ren) 	# átnevezés 
	Test-Path # fájl vagy könyvtár vagy reg.kulcs, létezik-e?
	
-----------------------------------------------------------
# console-ra írás
	echo hello # kiírja "hello"
-----------------------------------------------------------
# File írás
	# jegyzettömb létrehozása pl. "1" néven
		notepad 1.ps1
		notepad 1.sh
	# pl egy változót kiírunk egy file-ba
		$probaValtozo="cucc" > 2proba.txt
		
-----------------------------------------------------------
# futtatás
	.\1.ps1 
-----------------------------------------------------------
# időre vonatkozó adatok
	get-date 				 # aktuális idő;
	(get-date).DayOfYear 	 # hányadik nap - több függvény van;
	366-(get-date).DayOfYear # mennyi nap van hátra (szökőévben)
	# (get-date). beírása után Tab feldobja a lehetőségeket (Day, Month, Year, Hour stb.; AddMonth(...

-----------------------------------------------------------
# Változó deklarálás mindig $-el kezd
		$ora=(get-date).Hour 	#aktuális idő óra információ
		$ora 					# változó értékének kiírása
		$downloadsMeasure=(ls \Users\tamas\Downloads | measure Length -sum).sum / 1MB
	# adat bekérése console-ról
		$szo=Read-Host "szo=" 	#"szo" változóba infó kérése;
		$szo 					# változó értékének kiírása
	# adat bekérése console-ról inicializálással
		Set-Variable –Name alma –value "jonatán" # alma >> változó neve; "jonatán" >> inicializálás
	
-----------------------------------------------------------
# Formázások / formátumok
	# formázás 2 tizedesjegyre
		"{0:P}%" -f (42/110) 
	# fontosabb formátumok
		[int] [char] [string] [datetime] [boolean]
	# tömb
		$tömb=@("alma","körte","barack")
		$tömb2=2,3,4,5
		# tömb műveleteket
			echo $tömb[1] 			# körte
			echo $tömb[1..2] 		# körte barack
			echo $tömb.Length 		# hossz
			$tömb.contains("alma")  # -> True
		# asszociatív tömb /struct ($atömb=@{„kulcs”=„érték”; …})
			$tömb3=@{a=4;b=5}
			$tömb3[a]=10 		# értékadás
			$tömb3+=@{c=11} 	# új elem hozzáadás
		
	
	https://devblogs.microsoft.com/scripting/use-powershell-and-conditional-formatting-to-format-numbers/
	
-----------------------------------------------------------	
# Mappa parancsok
	ls -file 				# kilistázza a fileokat
	ls -Directory 			# kilistázza az adott mappában lévő al-könyvtárakat
	(ls -Directory).count 	# megszámolja az adott mappában lévő al-könyvtárakat
	(ls -file).count 		# megszámolja az adott mappában lévő file-okat
	(ls).count 				# hihetetlen, de megszámolja az adott mappában lévő file-okat és mappákat is
	(ls | measure Length -sum)
	ls | measure Length -sum).sum
	ls -file | measure Length -sum)
	(ls -file | measure Length -sum).sum
	(ls -file | measure Length -sum).sum / 1Kb
	(ls \windows | measure Length -sum).sum / 1GB #Windows mappa tartalmának mérete
	(ls \windows -Recurse | measure Length -sum).sum / 1MB
	(ls \windows | measure Length -sum).sum / 1MB
	
-----------------------------------------------------------
# Adatmanipuláció & feldolgozás
	[int]$szam=cat szam.txt 	# int-ként beolvasom a szam.txt-ből a számom és elmentem a szam változóba
	$szam=$szam+1 				# hozzáadok egyet
	$szam 						# csak úgy kiiratom
	echo $szam >szam.txt 		# beleirom/felül irom a szam.txt-be
	cat .\szam.txt 				# kiírom
	
-----------------------------------------------------------
# Matek
	# cikusban kiírjuk fok értéket radiánban format:: float
		for ($i=0; $i-lt 90; $i=$i+10) {$i * ([Math]::PI/180)}
	# cikusban kiírjuk fok értéket radiánban format:: float.5
		for ($i=0; $i-le 90; $i=$i+10) {"{0:N5}" -f ($i*[math]::pi/180)}
	# cikusban kiírjuk fok-radián értékeket format:: float.2
		for ($x=0;$x -le 360; $x = $x + 10)
		{
			write-host -NoNewline $x
			write-host -NoNewline "     "
			"{0:N2}" -f($x * ([Math]::PI/180))
		}
	# Matek parancsok
		[Math]::pi
		[Math]::Sin(90)
		[Math]::Cos(90)
		stb...
		
-----------------------------------------------------------
# Ciklusok
	# for -- pl. console-ra kiír 20 db. 'x' karaktert
		for ($i=1; $i-le 20; $i=$i+1) 
		{
			write-host -NoNewline "x"
		}
	# while -- pl. console-ra bekér egy "szo" változóba string értéket, amíg a string értéke nem "vege" 
		$szo=Read-Host "szo="
		while ($szo -ne "vege")
		{
		  echo $szo >>szoveg.txt
		  $szo=Read-Host "szo="
		}
	# foreach($i in tömb) {ciklusmag}
		$t=2,3,4,5
		foreach($i in $t)
		{
			write-host $i
		}

-----------------------------------------------------------
# Elágazás
	# operátorok:
		# -eq, -ne,-gt,-lt, -le, -ge
		# -not, -and, -or,-xor logikai tagadás, és, vagy
		# -like *,?,[ab.] karakterek, -match reg. kif. használat
	$a=3
	if ($a -gt 2)
	{ Write-Host "A" $a "nagyobb mint 2." }
	else
	{ Write-Host "Nem nagyobb mint 2."}

	
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# Órai feladatok
	# 1) faktoriális
	function nfaktor($n)
	{
		$f=1
		for($i=2;$i -le $n;$i++) {$f*=$i}
		return $f
	}
	echo "N faktoriális"
	nfaktor(5) 		# fv meghívás
	
----------------------------------------------------------
	# 2) parameterkent megadott mappaban megszamolni a fajlokat es mappakat
	function mappaKontroll($mappa)
	{
		write-host "Adj meg egy vizsgálandó mappát:"
		$mappa=Read-Host "mappa="
		if ($mappa = $null)
		{
			$mappa = Get-Location
		}
		(ls $mappa).count
	}
	
	https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-use-parameters-in-powershell/
	https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/format-wide?view=powershell-7.4

-----------------------------------------------------------
	# 3) Üdv script
	
	function hello()
	{
		#!/usr/bin/env pwsh

		# Az aktuális felhasználó neve
		$currentUser = $env:USERNAME

		# Az aktuális idő
		$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

		# Üzenet kiírása
		Write-Host "Hello, $currentUser! Az aktuális idő: $currentDateTime"
	}
	
-----------------------------------------------------------
	# 4f) olvass be szavakat bill-rol, mig a vege szot nem irjuk.
	# irasd ki rendezve, irasd ki az a betuvel kezdodoeket.
	
	$szo=Read-Host "szo="  	#"szo" változóba infó kérése;
	$szo 					#kiírja a beolvasott adatot
	
	# adat beolvasása file-ba
	notepad szoveg.txt
	$szo=Read-Host "szo="
	while ($szo -ne "vege")
	{
	  echo $szo >>szoveg.txt
	  $szo=Read-Host "szo="
	}
	if (test-path szoveg.txt)
	{
	  cat szoveg.txt|sort; /*rm szoveg.txt*/ # ha ki akarjuk törölni
	}
	
-----------------------------------------------------------	
	# 5f) keszits tablazatot, 1-tol 1-vel 10-ig
	# tabulátorral választja el x1, x2 és x3-at, majd 1-10-ig ciklusban kiírja x2 és x3-at
	"x`tx*2`tx*3"
	for ($x=1;$x -le 10; $x++)
	{
	  $x2=$x*$x; $x3=$x*$x*$x
	  echo "$x`t$x2`t$x3"
	}
	
	https://4sysops.com/archives/do-the-math-with-powershell/
	https://ss64.com/ps/syntax-f-operator.html
	https://stackoverflow.com/questions/9904352/how-to-create-printf-effect-in-powershell
	
-----------------------------------------------------------	
	# 6) adott file-ban (pl. 1szamok.txt) lévő számokra végzett alapműveletek
	
	[int]$num=5 > szam.txt
	
	notepad 1szamok.txt 	# példa input file létrehozása
	
	$sum=0; [int]$szor=1; $atlag=0; [int]$i=0; [int]$line=0
	foreach($line in Get-Content .\1szamok.txt) 
	{
		#$line
		$sum=$sum+$line
		#$sum
		$szor=$line*$szor
		#$szor
		$i++
	}
	# eljárás változó értékek kiírása
	$i
	$sum
	$szor
	$atlag
	
-----------------------------------------------------------	
	# 6f) szam.txt-ben egy szam, adj hozza 1-et es ird vissza az adott file-ban (pl. 1szamok.txt) lévő számokra végzett alapműveletek
	
	# A fájl neve
	$filePath = "szam.txt"

	# A szám beolvasása a fájlból
	$szam = Get-Content -Path $filePath

	# Ellenőrizzük, hogy a fájl tartalma szám-e
	if (-Not [int]::TryParse($szam, [ref]$null)) 
	{
		Write-Host "A fájl tartalma nem érvényes szám."
		exit 1
	}
	$korrigaltSzam = [int]$szam + 1
	Set-Content -Path $filePath -Value $korrigaltSzam
	Write-Host "A fájl frissítve: $szam -> $korrigaltSzam"
	
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------


# ZH 1. feladat
# Készítse el a következő feladatokhoz a shell szkript megoldásokat. 
# 1) Készítsen 1.sh néven egy szkriptet, amelyik 3 számot vár (parancssorból vagy csövön át) és kiírja őket nagyságrendben. 
# pl. .\1.sh 4 7 2 => 2 4 7  vagy echo 4 7 2 | .\1.sh => 2 4 7 2. 

	notepad Feladat1_int.txt # Megnyitja a fájlt, ha létezik, vagy létrehozza

	# Kérjük be a három számot a felhasználótól
	for ($i=0; $i -le 2; $i=$i+1)
	{
		[int]$szam=Read-Host "szam="
		echo $szam >> Feladat1_int.txt # Mentjük a fájlba

	}

	# Ellenőrizzük, hogy létezik-e a fájl
	if (Test-Path Feladat1_int.txt) {
			# Sorba rendezzük és megjelenítjük a tartalmat
			#cat Feladat1_int.txt|sort;
			Get-Content Feladat1_int.txt | Sort-Object | ForEach-Object { Write-Output $_ }
	}

	# Fájl törlése a folyamat végén (opcionális)
	#rm Feladat1_int.txt
	Remove-Item Feladat1_int.txt


-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# ZH 2. feladat
# Készítsen 2.sh néven egy szkriptet, amelyik parancssorban vár könyvtárneveket és ezeket a szkript 
# létrehozza és bemásol beléjük egy read.me fájlt. Nem kell ellenőrizni a könyvtárak vagy a fájl meglétét) 
# pl. .\2.sh jpg png docx => Létrejön egy jpg, egy png és egy docx nevű könyvtár, amelyekbe bemásolja a read-me fájlt 

# A bemásolandó ReadMe fájl tartalma
$ReadMeFile = "Ez egy read-me fájl."

# Végigmegyünk az argumentumokon
foreach ($directory in $args) {
    # Könyvtár létrehozása
    New-Item -ItemType Directory -Path $directory

    # read-me fájl létrehozása a könyvtárban
    $readMePath = "$directory\read-me.txt"
    Set-Content -Path $readMePath -Value $ReadMeFile
}

Write-Host "A könyvtárak és a ReadMe fájlok létrejöttek."

# Futtatás
.\2.sh jpg png docx 

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# ZH 3. feladat
# Készítsen 3.sh néven egy szkriptet, amelyik egy fájlnevet vár paraméterként. 
# A fájlban soronként egy-egy egész szám szerepel.
# Írjuk ki mindegyik helyett a négyzetét!
# pl 3.sh szamok.txt => 4 9 25 //ha a fájl sorai: 2 3 és 5 
 
>> 6) órai feladat - ld. fent


-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
# ZH 4. feladat
# Készítsen 4.sh néven egy szkriptet, amelyik egy fájlnevet vár paraméterként. 
# A fájlban soronként két szó van. Írjuk ki a hosszabbikat!
# pl. 4.sh szavak => almafa cseresznye narancs //ha a fájlban 3 sor van: alma almafa; cseresznye, dinnye; narancs eper
 
# Paraméterként várja a fájl nevét
$filePath = $args[0]

# Beolvassuk a fájl tartalmát
$tmpAdat = Get-Content -Path $filePath

# Soronként feldolgozzuk a fájl tartalmát
foreach ($adottSor in $tmpAdat) 
{
    # A szavak különválasztása
    $szoSplited = $adottSor -split '\s+'

    # Ellenőrizzük, hogy legalább két szó van-e
    if ($szoSplited.Count -ge 2) 
	{
        if ($szoSplited[0].Length -ge $szoSplited[1].Length) 
		{
            Write-Host $szoSplited[0]
        } else 
		{
            Write-Host $szoSplited[1]
        }
    } 
	else 
	{
        Write-Host "Hiba: Az alábbi sor nem tartalmaz két szót: '$adottSor'"
    }
}

# Futtatás & kell egy file pl. szavak.txt
.\4.ps1 szavak.txt
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
 

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

#ez+az

#!/usr/bin/env pwsh

# Ellenőrizzük, hogy legalább egy paramétert megadtak-e
if (-not $args) {
    Write-Host "Használat: .\2.ps1 <könyvtár1> <könyvtár2> ..."
    exit 1
}

# A bemásolandó fájl tartalma
$readMeContent = "Ez egy read-me fájl tartalma."

# Végigmegyünk az összes parancssori argumentumon
foreach ($directory in $args) {
    # Könyvtár létrehozása
    New-Item -ItemType Directory -Path $directory -Force | Out-Null

    # read-me fájl létrehozása a könyvtárban
    $readMePath = Join-Path -Path $directory -ChildPath "read-me.txt"
    Set-Content -Path $readMePath -Value $readMeContent
}

Write-Host "A megadott könyvtárak létrejöttek, és a read-me fájl bemásolva."




#Ezen felül szükség lehet még elágazásra a beadandóban
#Elágazás powershell-ben:
$szam = 4;

if ($szam -eq 4) 
{
    echo "A szám 4";
} elseif ($szam -eq 5) {
    echo "A szám 5";
} else {
    echo "A szám nem 4 vagy 5.";
}

#testfile sorainak feldolgozása
$lines = cat testfile;
foreach($line in $lines)
{
# line változóban mindig az aktuális sor van, ha a sorban vesszővel elválasztott
# értékek vannak, kinyerhetjük bárhányadik értéket a $line.Split(",") segítségével
# pl. minden sorból a 2. érték kivágása és megjelenítése:
    $line.Split(",")[1]; #Figyeljünk az index-re. 2. érték indexe 1, mert 0-tól indexelünk

# Ha nem csak megjeleníteni szeretnénk, hanem tovább dolgozni egy értékkel,
# el is menthetjük változóba
    $valtozo=$line.Split(",")[1];
    echo "A valtozo értéke is $valtozo"     
#Figyeljünk rá, hogy alapból szövegeket olvasunk be. Ha számként szeretnénk dolgozni egy változóval 
#(pl. műveleteket végezni vele), akkor így kezelhetjük számként: [int]$valtozo  
}