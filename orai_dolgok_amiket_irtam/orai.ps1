ls - elemei a mappának
get-alias - parancsok
h - history
cat .\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt - historik ezek is, mindenhol
gal ls - megmtatja, hogy micsizik
cmd /c - cmd /c indit vlmi dos-izét
cmd /c dir /od - úgy listázza, hogy a legutolsó a mai
/? - dos ablakban működik csak, kiad vlmi dolgokat
gal echo - he?!
echo hello - kiirja, hogy hello
ps1 a kiterjesztése ezeknek
notepad 1.ps1 <- ezzel új ablakba nyitok, okézok, beleirok
.\nev.ps1 <- ezzel futtatod
get-variable - környezeti változók
pwd - kiirja hol vagyunk, vagy mi - a get locationnek a röviditése
$PSVersionTable - a verziója
wsl hasznos lehet valamire
get-date|get-member - idő meg mindenféle része
(get-date).DayOfYear - hanyadik nap az évben
366-(get-date).DayOfYear - mennyi nap van hátra (szökőévben)

változónál mindig $-el kezdek
$ora=(get-date).Hour
$ora - kiirja az órát

rm - remove
Get-Help > 1help.txt - belerakom a Get-Help-et az 1help.txt-be
get-help Remove-Item -examples - dolgok
man Remove-Item -examples - dolgok

"{0:P}%" -f (42/110) - formázgatások 2 tizedesjegyre
$ossz=(cat .\1help.txt).count

$ures=(cat .\1help.txt|Select-String -pattern '^$').count
"{0:P}%" -f ($ures/$ossz)
ss64 - f-operator


"x`tx*2`tx*3" -> x       x*2     x*3
notepad 1tabla.ps1 >> létrehozok egy "1tabla" txt-et 

"x`tx*2`tx*3"

for ($x=1;$x -le 10; $x++)
{
  $x2=$x*$x; $x3=$x*$x*$x
  echo "$x`t$x2`t$x3"
}

Ctrl+c >> ez hasznos, ha behal a cucc

# megszámolni mappa dolgokat, meg file dolgokat:
ls -file - kilistázza a fileokat
ls -Directory - kilistázza a könyvtárakat
(ls -Directory).count - számolom
(ls -file).count - számolom
(ls).count - itt is számolom
 
# kiirja a paramunkat, amit beadtunk
$param1=$args[0]
write-host $param1

$ossz=$args[0]

$param1=$args[1]
 
if ($ossz.count -eq 0) {$mappa="."}

else {$mappa=$param1}
 
$mappa
 
$param1=$args[0]

if ($args.count -eq 0) {$mappa="."}

else {$mappa=$param1}
 
# kommentelni tudok
 
echo $mappa

(ls $mappa -Directory).count

(ls $mappa -file).count

[Math]::pi
[Math]::Sin(90)
[Math]::Cos(90)


wsl -l -o
$szo=Read-Host "szo="
$szo
notepad valami.ps1 - file csinálása ezzel a névvel

$szo=Read-Host "szo="
while ($szo -ne "vege")
{
  echo $szo >>szoveg.txt
  $szo=Read-Host "szo="
}
if (test-path szoveg.txt)
{
  cat szoveg.txt|sort; rm szoveg.txt
}

# intként beolvasom a szam.txt-ből a számom és elmentem a szam változóba 
[int]$szam=cat szam.txt
# hozzáadok egyet
$szam=$szam+1
# csak úgy kiiratom
$szam
# beleirom/felül irom a szam.txt-be
echo $szam >szam.txt
# kiirom
cat .\szam.txt


for ($i=0; $i-le 90; $i=$i+10)
{
"{0:N5}" -f ($i*[math]::pi/180)
}

$szo=Read-Host "szo="
$szo
h
notepad valami.ps1
gal rm
h
valami.ps1
cat valami.ps1
szoveg.txt
.\valami.ps1
ls
notepad szam.txt
cat szam.txt
$szam=(cat szam.txt)+1
$szam
$szam=cat szam.txt
$szam
$szam+1
$szam=cat szam.txt
$szam=$zam+1
$szam
$szam=cat szam.txt
$szam=$szam+1
$szam
[int]$szam=cat szam.txt
$szam=$szam+1
$szam
echo $szam >szam.txt
cat .\szam.txt
man ls
ls -File
ls -File
ls -Dir
(ls | measure Length -sum)
(ls | measure Length -sum).sum
ls
(ls -file | measure Length -sum)
(ls -file | measure Length -sum).sum
(ls -file | measure Length -sum).sum / 1Kb
(ls \windoes | measure Length -sum).sum / 1GB
(ls \windwes | measure Length -sum).sum / 1GB
(ls \windows | measure Length -sum).sum / 1GB
(ls \windows | measure Length -sum).sum / 1MB
(ls \windows -Recurse | measure Length -sum).sum / 1MB
(ls \windows | measure Length -sum).sum / 1MB
h
(ls | measure Length -sum).sum
/3
1/3
1..10
10..1
[int]$fok=10
$radian=90*3.14/180
$radian
$radian=90*3.14/180
90*3.14/180
$radian=90*[math]::pi/180
$radian
notepad konvert.ps1
.\valami.ps1
notepad valami.ps1
.\konvert.ps1



 for ($x=0;$x -le 360; $x = $x + 10)
{
	write-host -NoNewline $x
	write-host -NoNewline "     "
	"{0:N2}" -f($x * ([Math]::PI/180))
 
}


notepad konvert.ps1
write-host -NoNewline "szo: "; echo vlmi
for ($i=1; $i-le 20; $i=$i+1) {write-host -NoNewline "x"}


#bash belépés
ssh c8m9le@szamrend
ctr d kilépés bash scripthez


$sum=0; [int]$szor=1; $atlag=0; [int]$i=0; [int]$line=0
foreach($line in Get-Content .\1szamok.txt) {
#$line
$sum=$sum+$line
#$sum
$szor=$line*$szor
#$szor
$i++
}
 

$i
$sum
$szor
#$atlag
Ez nem tudom, h. jó -e
 
h >041224-pwsh-hist.txt