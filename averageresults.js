const {input} = process.env
const readline = require('readline')
const fs = require('fs');


var lineReader = readline.createInterface({
  input: fs.createReadStream('./' + input)
});

const avg =(arr) => {
  return arr.reduce((a,b) => +a + +b ,0) / arr.length
}

let group = 0
let times = []

lineReader.on('line', (line) => {
  const [,,,time,depTime] = line.split(',')
  //console.log(time, depTime, times);
  // if(time>1800)return
  if(depTime==group){
    times.push(time)
    return
  }

  console.log(group,avg(times))
  group=depTime
  times = [time]
});
