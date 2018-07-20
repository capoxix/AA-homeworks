const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like some tea?', function (ans) {
    console.log(`You replied ${ans}.`);
    reader.question('Would you like some biscuits?', function (ans2) {
      console.log(`You replied ${ans2}.`);

      const firstAns = (ans === 'yes') ? 'do' : 'don\'t';
      const secondAns = (ans2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstAns} want tea and you ${secondAns} want biscuits.`);
      reader.close();
    });
  });
}

teaAndBiscuits();
