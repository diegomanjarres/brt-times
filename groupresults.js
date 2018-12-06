const {precission, input} = process.env
const readline = require('readline')
const fs = require('fs');

const round = (precission) => (x) => Math.floor(x/precission) * precission

var lineReader = readline.createInterface({
  input: fs.createReadStream('./' + input)
});
lineReader.on('line', (line) => {
  const splitLine = line.split(',')
  if (+splitLine[3]>1800)return
  splitLine[4] =  round(precission)(splitLine[2])
  console.log(splitLine.join(','))
});
