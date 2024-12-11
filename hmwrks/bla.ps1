#Power shell szkript beadandó feladatok.

#Egy autó századmásodpercenként méri mozgás közben, hogy milyen távolságba van előtte vagy utána "valami"
#és ez alapján dönt arról, gyorsítania kell vagy lassítani vagy esetleg megállni.
#Ezeket az adatokat most egy adatfájlban tároljuk: időpont (év.hó.nap óra:perc:mperc:szmp), sebesség, távolságelejétől, távolsághátuljától)

#Készítsen auto.sh néven egy szkriptet, ami megadja, hogy hányszor állt meg az autó. (Hány olyan hely van,
#ahol a következő adat több, mint 1 perc múlva érkezett. Ha áll az autó, nem mér.)!

#Készítsen fekez.sh néven szkriptet, ami megadja, hogy mikor kellett fékezni.
#Fékezni akkor kell, ha az előtte levő autó távolsága K-méternél kisebb.  pl: ./fekez.sh 100)

#Készítsen legkozelebb.sh néven szkriptet, ami megadja, hogy mikor volt a legközelebb hozzá valami (bármelyik irányból).




#1. auto.ps1
#Adatfájl elérési útja
$adatfajl = "adatfajl.txt"

#Változók inicializálása
$elozoido = $null
$megallas_szam = 0

#Fájl soronkénti olvasása
Get-Content $adatfajl | ForEach-Object {
    # Időbélyeg kinyerése
    $jelenlegi_ido = ($ -split '\s+')[0]

    if ($elozo_ido) {
        # Időbélyegek átalakítása DateTime objektumokká
        $elozo_datum = [DateTime]::ParseExact($elozo_ido, "yyyy.MM.dd HH:mm:ss:fff", $null)
        $jelenlegi_datum = [DateTime]::ParseExact($jelenlegi_ido, "yyyy.MM.dd HH:mm:ss:fff", $null)

        # Időkülönbség kiszámítása
        $ido_kulonbseg = ($jelenlegi_datum - $elozo_datum).TotalSeconds

        # Ellenőrzés, hogy az időkülönbség nagyobb-e 60 másodpercnél
        if ($ido_kulonbseg -gt 60) {
            $megallas_szam++
        }
    }

    # Előző idő frissítése
    $elozo_ido = $jelenlegi_ido
}

#Megállások számának kiírása
Write-Output "Az autó $megallas_szam alkalommal állt meg."



#2. fekez.ps1
param(
    [Parameter(Mandatory=$true)]
    [double]$kuszobertek
)

#Adatfájl elérési útja
$adatfajl = "adatfajl.txt"

#Fájl soronkénti olvasása
Get-Content $adatfajl | ForEach-Object {
    # Sor adatainak kinyerése
    $adatok = $_ -split '\s+'
    $idobelyeg = $adatok[0]
    $elso_tavolsag = [double]$adatok[2]

    # Ellenőrzés, hogy a távolság kisebb-e a küszöbértéknél
    if ($elso_tavolsag -lt $kuszobertek) {
        # Időbélyeg kiírása
        Write-Output $idobelyeg
    }
}



#3. legkozelebb.ps1
#Adatfájl elérési útja
$adatfajl = "adatfajl.txt"

#Változók inicializálása
$legkisebbtavolsag = [double]::MaxValue
$legkozelebbi_ido = ""

#Fájl soronkénti olvasása
Get-Content $adatfajl | ForEach-Object {
    # Sor adatainak kinyerése
    $adatok = $ -split '\s+'
    $idobelyeg = $adatok[0]
    $elso_tavolsag = [double]$adatok[2]
    $hatso_tavolsag = [double]$adatok[3]

    # Legkisebb távolság megkeresése
    if ($elso_tavolsag -lt $legkisebb_tavolsag) {
        $legkisebb_tavolsag = $elso_tavolsag
        $legkozelebbi_ido = $idobelyeg
    }

    if ($hatso_tavolsag -lt $legkisebb_tavolsag) {
        $legkisebb_tavolsag = $hatso_tavolsag
        $legkozelebbi_ido = $idobelyeg
    }
}

#Legközelebbi időpont kiírása
Write-Output "A legközelebbi pillanat $legkozelebbi_ido időpontban volt, $legkisebb_tavolsag távolsággal."