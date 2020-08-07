chcp 1250
set telepules=velence
awk -v seed=0 -v telepules=%telepules% -f kernyilv.awk %telepules%.html