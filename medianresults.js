const {input} = process.env
const readline = require('readline')
const fs = require('fs');

console.log('group,median')
var lineReader = readline.createInterface({
  input: fs.createReadStream(input)
});

function median(input) {
    let numbers = input.map((x) => +x)
    // median of [3, 5, 4, 4, 1, 1, 2, 3] = 3
    var median = 0, numsLen = numbers.length;
    numbers = numbers.sort((a,b) => a-b);

    if (
        numsLen % 2 === 0 // is even
    ) {
        // average of two middle numbers
        median = (numbers[numsLen / 2 - 1] + numbers[numsLen / 2]) / 2;
    } else { // is odd
        // middle number only
        median = numbers[(numsLen - 1) / 2];
    }

    return median;
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

  console.log(group + ','+ median(times))
  group=depTime
  times = [time]
});
