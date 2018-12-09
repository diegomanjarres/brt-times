const {precission, input} = process.env
const readline = require('readline')
const fs = require('fs');

const round = (precission) => (x) => Math.floor(x/precission) * precission
console.log('time,trips')

var lineReader = readline.createInterface({
  input: fs.createReadStream(input)
});
let group = 0
let groupCount=0
lineReader.on('line', (line) => {
  const splitLine = line.split(',')
  if(isNaN(splitLine[2]))return

  const lineGroup =  round(precission)(splitLine[2])
  if(lineGroup==group){
    groupCount++
    return
  }

  console.log(group+ ',' + groupCount)
  group=lineGroup
  times = groupCount=0
});
