input=logs0312/heroes/probemon_out_pc+rp.txt node sync.js > logs0312/heroes/spottings_sync.txt
input=logs0312/calle100/fullout732.txt node sync.js > logs0312/calle100/spottings_sync.txt
node calculateflow.js
input=./logs0312/results/flow_heroes.csv precission=600 node groupflow.js > logs0312/results/flow_heroes_grouped.csv
input=./logs0312/results/flow_calle100.csv precission=600 node groupflow.js > logs0312/results/flow_calle100_grouped.csv
input=./logs0312/results/trips_heroes.csv precission=600 node grouptripsflow.js > logs0312/results/trips_flow_heroes_grouped.csv
input=./logs0312/results/trips_calle100.csv precission=600 node grouptripsflow.js > logs0312/results/trips_flow_calle100_grouped.csv
node calculatetrips.js
input=./logs0312/results/trips_heroes.csv precission=600 node groupresults.js > logs0312/results/trips_heroes_grouped.csv
input=./logs0312/results/trips_heroes.csv precission=600 clean=1 node groupresults.js > logs0312/results/trips_heroes_grouped_clean.csv
input=./logs0312/results/trips_calle100.csv precission=600 node groupresults.js > logs0312/results/trips_calle100_grouped.csv
input=./logs0312/results/trips_calle100.csv precission=600 clean=1 node groupresults.js > logs0312/results/trips_calle100_grouped_clean.csv
input=./logs0312/results/trips_calle100_grouped.csv node averageresults.js > logs0312/results/trips_calle100_average.csv
input=./logs0312/results/trips_heroes_grouped.csv node averageresults.js > logs0312/results/trips_heroes_average.csv
input=./logs0312/results/trips_calle100_grouped_clean.csv node averageresults.js > logs0312/results/trips_calle100_average_clean.csv
input=./logs0312/results/trips_heroes_grouped_clean.csv node averageresults.js > logs0312/results/trips_heroes_average_clean.csv
input=./logs0312/results/trips_calle100_grouped.csv node medianresults.js > logs0312/results/trips_calle100_median.csv
input=./logs0312/results/trips_heroes_grouped.csv node medianresults.js > logs0312/results/trips_heroes_median.csv
input=./logs0312/results/trips_calle100_grouped_clean.csv node medianresults.js > logs0312/results/trips_calle100_median_clean.csv
input=./logs0312/results/trips_heroes_grouped_clean.csv node medianresults.js > logs0312/results/trips_heroes_median_clean.csv
