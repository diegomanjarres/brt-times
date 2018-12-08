const readline = require('readline')
const fs = require('fs');
const _ = require('lodash');

const STATION_ONE='heroes'
const STATION_TWO='calle100'

fs.writeFileSync(`./logs0312/results/trips_${STATION_ONE}.csv`,'mac,dep_station,dep_time,time\n')
fs.writeFileSync(`./logs0312/results/trips_${STATION_TWO}.csv`,'mac,dep_station,dep_time,time\n')

var spottingOneLineReader = readline.createInterface({
  input: fs.createReadStream('./logs0312/heroes/spottings_sync.txt')
});
var spottingTwoLineReader = readline.createInterface({
  input: fs.createReadStream('./logs0312/calle100/spottings_sync.txt')
});

const initialSpottings = {[STATION_ONE]:{},[STATION_TWO]:{}}

const registerEvent = (place, line) => {
  if (!line)return
  const split = line.split('\t')
  const row = { mac:split[1], manufacturer:split[2], place, time: +split[0]}
  let initial = initialSpottings[place][row.mac]
  if(!initial || row.time < initial){
    initialSpottings[place][row.mac] = row.time;
  }
}

const trips = []
let finished = 0;
const closeCb = () => {
  finished++
  if (finished < 2) return;
  _(initialSpottings[STATION_ONE])
    .entries()
    .filter(([k,v]) => initialSpottings[STATION_TWO][k])
    .forEach(([k,v]) => {
      const time = initialSpottings[STATION_TWO][k] - v
      if ( time < 0) return
      const trip = { mac:k, from:STATION_ONE, start:v, time }
      trips.push(trip)
    })
  _(initialSpottings[STATION_TWO])
    .entries()
    .filter(([k,v]) => initialSpottings[STATION_ONE][k])
    .forEach(([k,v]) => {
      const time = initialSpottings[STATION_ONE][k] - v
      if ( time < 0) return
      const trip = { mac:k, from:STATION_TWO, start:v, time }
      trips.push(trip)
    })

  trips.forEach((t) => {
    fs.appendFileSync(`./logs0312/results/trips_${t.from}.csv`,_.values(t).join(',') + '\n')
  })

}
spottingOneLineReader.on('line', registerEvent.bind(null,STATION_ONE));
spottingTwoLineReader.on('line', registerEvent.bind(null,STATION_TWO));

spottingOneLineReader.on('close', closeCb);
spottingTwoLineReader.on('close', closeCb);
