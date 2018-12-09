const {input} = process.env
const readline = require('readline')
const fs = require('fs');

console.log('group,avg_time')
var lineReader = readline.createInterface({
  input: fs.createReadStream(input)
});

const avg =(arr) => {
  if(!arr.length)return 0
  return arr.reduce((a,b) => +a + +b ,0) / arr.length
}

let group = 0
let times = []

lineReader.on('line', (line) => {
  if(line.startsWith('mac'))return
  const [,,,time,depTime] = line.split(',')
  if(depTime==group){
    times.push(time)
    return
  }

  console.log(group + ','+ avg(times))
  group=depTime
  times = [time]
});
