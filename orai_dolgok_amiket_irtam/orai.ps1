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
megszámolni mappa dolgokat, meg file dolgokat:
ls -file - kilistázza a fileokat
ls -Directory - kilistázza a könyvtárakat
(ls -Directory).count - számolom
(ls -file).count - számolom
(ls).count - itt is számolom
 
kiirja a paramunkat, amit beadtunk
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



  Id CommandLine
  -- -----------
   2 wsl -l -o
   7 $szo=Read-Host "szo="
   8 $szo
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
 
[int]$szam=cat szam.txt //intként beolvasom a szam.txt-ből a számom és elmentem a szam változóba
$szam=$szam+1 //hozzáadok egyet
$szam //csak úgy kiiratom
echo $szam >szam.txt //beleirom/felül irom a szam.txt-be
cat .\szam.txt // kiirom


for ($i=0; $i-le 90; $i=$i+10)
{
"{0:N5}" -f ($i*[math]::pi/180)
}

7 $szo=Read-Host "szo="
8 $szo
9 h
10 notepad valami.ps1
13 gal rm
14 h
15 valami.ps1
16 cat valami.ps1
17 szoveg.txt
23 .\valami.ps1
24 ls
25 notepad szam.txt
26 cat szam.txt
27 $szam=(cat szam.txt)+1
28 $szam
29 $szam=cat szam.txt
30 $szam
31 $szam+1
32 $szam=cat szam.txt
33 $szam=$zam+1
34 $szam
35 $szam=cat szam.txt
36 $szam=$szam+1
37 $szam
38 [int]$szam=cat szam.txt
39 $szam=$szam+1
40 $szam
41 echo $szam >szam.txt
42 cat .\szam.txt
43 man ls
44 ls -File
45 ls -File
46 ls -Dir
47 (ls | measure Length -sum)
48 (ls | measure Length -sum).sum
49 ls
50 (ls -file | measure Length -sum)
51 (ls -file | measure Length -sum).sum
52 (ls -file | measure Length -sum).sum / 1Kb
53 (ls \windoes | measure Length -sum).sum / 1GB
54 (ls \windwes | measure Length -sum).sum / 1GB
55 (ls \windows | measure Length -sum).sum / 1GB
56 (ls \windows | measure Length -sum).sum / 1MB
57 (ls \windows -Recurse | measure Length -sum).sum / 1MB
58 (ls \windows | measure Length -sum).sum / 1MB
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

92 notepad konvert.ps1
94 write-host -NoNewline "szo: "; echo vlmi
98 for ($i=1; $i-le 20; $i=$i+1) {write-host -NoNewline "x"}

100 ssh c8m9le@szamrend
101 ctr d kilépés bash scripthez

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
 
104 h >041224-pwsh-hist.txt

