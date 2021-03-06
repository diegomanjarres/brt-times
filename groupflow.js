const {precission, input} = process.env
const readline = require('readline')
const fs = require('fs');

const round = (precission) => (x) => Math.floor(x/precission) * precission
console.log('time,spottings')

var lineReader = readline.createInterface({
  input: fs.createReadStream(input)
});
let group = 0
let groupCount=0
lineReader.on('line', (line) => {
  const splitLine = line.split(',')
  if(isNaN(splitLine[1]))return

  const lineGroup =  round(precission)(splitLine[1])/60
  if(lineGroup==group){
    groupCount++
    return
  }

  console.log(group+ ',' + groupCount)
  group=lineGroup
  times = groupCount=0
});
