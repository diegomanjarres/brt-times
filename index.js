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

const initialSpottings = {[STATION_ONE]:{},[STATION_TWO]:{}}

const insertOnDatabase = (row) => {
  knex('spottings').insert(row)
    .then(()=>console.log('inserted',row)).catch(console.log)
}
const offsets = {[STATION_ONE]:0, [STATION_TWO]:0}
const registerEvent = (place, line) => {
  if (!line)return
  if (line.startsWith('restart') || line.startsWith('start')){
    offsets[place]= +line.split(' - ')[2]
    return
  }
  const split = line.split('\t')
  const row = { mac:split[1], manufacturer:split[2], place, time: +offsets[place] + +split[0]}
  //insertOnDatabase(row)
  let initial = initialSpottings[place][row.mac]
  if(!initial || row.time < initial){
    initialSpottings[place][row.mac] = row.time;
  }
}

const generateFakeEvents = (row) => {
  var distribution = gaussian(row.time, 600);

  return [...Array(20)].map(() => {
    var sample = distribution.ppf(Math.random());
    return { ...row, time: sample }
  })
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
      trips.push(trip)//, ...generateFakeEvents(trip))
    })
  _(initialSpottings[STATION_TWO])
    .entries()
    .filter(([k,v]) => initialSpottings[STATION_ONE][k])
    .forEach(([k,v]) => {
      const time = initialSpottings[STATION_ONE][k] - v
      if ( time < 0) return
      const trip = { mac:k, from:STATION_TWO, start:v, time }
      trips.push(trip)//, ...generateFakeEvents(trip))
    })

  trips.forEach((t) => {
    console.log(_.values(t).join(','))
  })

}
spottingOneLineReader.on('line', registerEvent.bind(null,STATION_ONE));
spottingTwoLineReader.on('line', registerEvent.bind(null,STATION_TWO));

spottingOneLineReader.on('close', closeCb);
spottingTwoLineReader.on('close', closeCb);
