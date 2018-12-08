const {input}= process.env;
const readline = require('readline')
const fs = require('fs');


var linereader = readline.createInterface({
  input: fs.createReadStream(input)
});

let offset = 0
const registerEvent = (line) => {
  if (!line)return
  if (line.startsWith('restart') || line.startsWith('start')){
    offset= +line.split(' - ')[2]
    return
  }
  const split = line.split('\t')
  split[0]= +split[0] +offset
  console.log(split.join('\t'))
}

linereader.on('line', registerEvent);
