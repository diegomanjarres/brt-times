const readline = require('readline')
const fs = require('fs');
const _ = require('lodash');
var gaussian = require('gaussian');

var knex = require('knex')({
  client: 'pg',
  connection: 'postgresql://postgres@localhost:5433/brt_times',
});

var spottingOneLineReader = readline.createInterface({
  input: fs.createReadStream('./logs0312/heroes/probemon_out.txt')
});
var spottingTwoLineReader = readline.createInterface({
  input: fs.createReadStream('./logs0312/calle100/fullout.txt')
});
const STATION_ONE='heroes'
const STATION_TWO='calle100'
fs.writeFileSync(`./logs0312/results/trips_${STATION_ONE}.csv`,'mac,dep_station,dep_time,time\n')
fs.writeFileSync(`./logs0312/results/trips_${STATION_TWO}.csv`,'mac,dep_station,dep_time,time\n')


const initialSpottings = {[STATION_ONE]:{},[STATION_TWO]:{}}

const offsets = {[STATION_ONE]:0, [STATION_TWO]:0}
const registerEvent = (place, line) => {
  if (!line)return
  if (line.startsWith('restart') || line.startsWith('start')){
    offsets[place]= +line.split(' - ')[2]
    return
  }
  const split = line.split('\t')
  const row = { mac:split[1], manufacturer:split[2], place, time: +offsets[place] + +split[0]}
  let initial = initialSpottings[place][row.mac]
  if(!initial || row.time < initial){
    initialSpottings[place][row.mac] = row.time;
  }
}

const flow = []
let finished = 0;
const closeCb = () => {
  finished++
  if (finished < 2) return;
  _(initialSpottings[STATION_ONE])
    .entries()
    .forEach(([k,v]) => {
      const spotting = { from:STATION_ONE, start:v }
      flow.push(spotting)
    })
  _(initialSpottings[STATION_TWO])
    .entries()
    .forEach(([k,v]) => {
      const spotting = { from:STATION_TWO, start:v }
      flow.push(spotting)
    })

  flow.forEach((t) => {
    fs.appendFileSync(`./logs0312/results/flow_${t.from}.csv`,_.values(t).join(',') + '\n')
  })

}
spottingOneLineReader.on('line', registerEvent.bind(null,STATION_ONE));
spottingTwoLineReader.on('line', registerEvent.bind(null,STATION_TWO));

spottingOneLineReader.on('close', closeCb);
spottingTwoLineReader.on('close', closeCb);
