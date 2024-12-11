# SSH belépés
# Otthon
ssh <neptun>@szamrend.inf.elte.hu
# Egyéb
ssh <neptun>@szamrend

# Fontosabb parancsok
alias get-command='compgen -c' # Összes parancs
echo "hello"                  # Képernyőre írás
man                           # Súgó
ps                            # Futó folyamatok
ls                            # Könyvtár tartalom
pwd                           # Aktuális mappa
mkdir almadir                 # Könyvtár létrehozása
cp                            # Másolás
rm                            # Törlés
mv                            # Mozgatás
mv old_name new_name          # Átnevezés
test -e file_or_directory     # Ellenőrzés, hogy létezik-e

# Idő
date                          # Aktuális idő
date +%j                      # Év hányadik napja
echo $((365 - $(date +%j)))   # Hátralévő napok száma

# Változók
ora=$(date +%H)               # Aktuális óra
echo $ora                     # Változó értékének kiírása
read -p "Adj meg egy szót: " szo # Adat bekérése konzolról
echo "$szo"                   # Kiíratás

# File írás
echo "valami szöveg" > proba.txt # Írás fájlba

# Futtatás
chmod +x script.sh            # Futtathatóvá tétel
./script.sh                   # Futtatás

# Formázások
printf "%.2f\n" 3.14159       # 2 tizedesjegy formázás

# Tömb
tomb=("alma" "körte" "barack") # Tömb definiálás
echo ${tomb[1]}               # Elem kiírás
echo ${#tomb[@]}              # Tömb mérete

# Könyvtár parancsok
ls -p | grep -v /             # Fájlok listázása
ls -d */                      # Könyvtárak listázása
ls | wc -l                    # Összes elem megszámolása
du -sh /windows               # Windows könyvtár mérete

# Adatfeldolgozás
szam=$(cat szam.txt)          # Fájl beolvasása változóba
szam=$((szam + 1))            # Növelés
echo $szam > szam.txt         # Visszaírás fájlba

# Matek
for i in {0..90..10}; do
  echo "Fok: $i Rádián: $(bc -l <<< "$i*3.14159/180")"
done

# Ciklusok
for i in {1..20}; do
  echo -n "x"
done

while read -p "Adj meg egy szót: " szo && [ "$szo" != "vege" ]; do
  echo $szo >> szoveg.txt
done

for elem in "${tomb[@]}"; do
  echo $elem
done

# Elágazás
a=3
if [ $a -gt 2 ]; then
  echo "$a nagyobb mint 2"
else
  echo "$a nem nagyobb mint 2"
fi

# Függvények
faktorialis() {
  local n=$1
  local f=1
  for ((i = 2; i <= n; i++)); do
    f=$((f * i))
  done
  echo $f
}
faktorialis 5

# Feladatok
# 1. Feladat: 3 számot vár, és nagyság szerint rendez
sort_numbers() {
  echo "$@" | tr " " "\n" | sort -n | tr "\n" " "
}
sort_numbers 4 7 2

# 2. Feladat: Könyvtárak létrehozása és `read-me.txt` létrehozása
create_directories() {
  for dir in "$@"; do
    mkdir -p "$dir"
    echo "Ez egy read-me fájl" > "$dir/read-me.txt"
  done
}
create_directories jpg png docx

# 3. Feladat: Egy fájlban lévő számok négyzetei
square_numbers() {
  while read -r line; do
    echo $((line * line))
  done < "$1"
}
square_numbers szamok.txt

# 4. Feladat: Fájlból hosszabb szó kiírása
longer_word() {
  while read -r word1 word2; do
    if [ "${#word1}" -ge "${#word2}" ]; then
      echo "$word1"
    else
      echo "$word2"
    fi
  done < "$1"
}
longer_word szavak.txt

#!/bin/bash

# Ellenőrizzük, hogy legalább egy paramétert megadtak-e
if [ "$#" -eq 0 ]; then
    echo "Használat: ./2.sh <könyvtár1> <könyvtár2> ..."
    exit 1
fi

# A bemásolandó fájl tartalma
readMeContent="Ez egy read-me fájl tartalma."

# Végigmegyünk az összes parancssori argumentumon
for directory in "$@"; do
    # Könyvtár létrehozása
    mkdir -p "$directory"

    # read-me fájl létrehozása a könyvtárban
    echo "$readMeContent" > "$directory/read-me.txt"
done

echo "A megadott könyvtárak létrejöttek, és a read-me fájl bemásolva."


# Elágazás Bash-ben
szam=4

if [ "$szam" -eq 4 ]; then
    echo "A szám 4"
elif [ "$szam" -eq 5 ]; then
    echo "A szám 5"
else
    echo "A szám nem 4 vagy 5"
fi


# Fájl sorainak feldolgozása
while IFS= read -r line; do
    # Ha a sor vesszővel elválasztott értékeket tartalmaz, dolgozzuk fel
    IFS=',' read -ra values <<< "$line"

    # Második érték kiválasztása (ha van)
    if [ "${#values[@]}" -ge 2 ]; then
        valtozo="${values[1]}"
        echo "A változó értéke: $valtozo"
    fi
done < testfile
