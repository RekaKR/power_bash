#Shell szkript beadandó feladatok.

#Egy autó századmásodpercenként méri mozgás közben, hogy milyen távolságba van előtte vagy utána "valami"
#és ez alapján dönt arról, gyorsítania kell vagy lassítani vagy esetleg megállni.
#Ezeket az adatokat most egy adatfájlban tároljuk: időpont (év.hó.nap óra:perc:mperc:szmp), sebesség, távolságelejétől, távolsághátuljától)

#Készítsen auto.sh néven egy szkriptet, ami megadja, hogy hányszor állt meg az autó. (Hány olyan hely van,
#ahol a következő adat több, mint 1 perc múlva érkezett. Ha áll az autó, nem mér.)!

#Készítsen fekez.sh néven szkriptet, ami megadja, hogy mikor kellett fékezni.
#Fékezni akkor kell, ha az előtte levő autó távolsága K-méternél kisebb.  pl: ./fekez.sh 100)

#Készítsen legkozelebb.sh néven szkriptet, ami megadja, hogy mikor volt a legközelebb hozzá valami (bármelyik irányból).


#1. auto.sh
#!/bin/bash

#Initialize variables
prev_time=""
stop_count=0

#Read the file line by line
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

#Output the stop count
echo "The car stopped $stop_count times."



#2. fekez.sh
#!/bin/bash

#Check if the user provided a distance threshold
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <distance_threshold>"
    exit 1
fi

threshold=$1

#Read the file line by line
while IFS= read -r line; do
    # Extract the distance in front
    distance_front=$(echo "$line" | awk '{print $3}')

    # Check if the distance is less than the threshold
    if (( $(echo "$distance_front < $threshold" | bc -l) )); then
        # Print the timestamp
        echo "$line" | awk '{print $1}'
    fi
done < "datafile.txt"



#3.legkozelebb.sh
#!/bin/bash

#Initialize variables
closest_distance=99999999
closest_time=""

#Read the file line by line
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

#Output the closest time
echo "The closest moment was at $closest_time with a distance of $closest_distance."