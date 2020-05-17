./station.py North_Terminus 4001 4002 4004 &
./station.py East_Station 4003 4004 4002 4006 &
./station.py West_Station 4005 4006 4004 &

curl 'http://localhost:4001/?to=West_Station'