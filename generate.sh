input=./logs0312/trips_heroes.txt precission=300 node groupresults.js > logs0312/results/trips_heroes_grouped.txt
input=./logs0312/trips_heroes.txt precission=300 clean=1 node groupresults.js > logs0312/results/trips_heroes_grouped_clean.txt
input=./logs0312/trips_calle100.txt precission=300 node groupresults.js > logs0312/results/trips_calle100_grouped.txt
input=./logs0312/trips_calle100.txt precission=300 clean=1 node groupresults.js > logs0312/results/trips_calle100_grouped_clean.txt
input=./logs0312/results/trips_calle100_grouped.txt node averageresults.js > logs0312/results/trips_calle100_average.txt
input=./logs0312/results/trips_heroes_grouped.txt node averageresults.js > logs0312/results/trips_heroes_average.txt
input=./logs0312/flow_heroes.txt precission=300 node groupflow.js > logs0312/results/flow_heroes_grouped.txt
input=./logs0312/flow_calle100.txt precission=300 node groupflow.js > logs0312/results/flow_calle100_grouped.txt
