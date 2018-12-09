const {precission, input, clean} = process.env
const readline = require('readline')
const fs = require('fs');

const round = (precission) => (x) => Math.floor(x/precission) * precission

console.log('mac,dep_station,dep_time,time,dep_time_group')
var lineReader = readline.createInterface({
  input: fs.createReadStream(input)
});
lineReader.on('line', (line) => {
  const splitLine = line.split(',')
  if(isNaN(+splitLine[3])) return 
  if (clean && +splitLine[3]>1800)return
  splitLine[4] =  round(precission)(splitLine[2])
  console.log(splitLine.join(','))
});
