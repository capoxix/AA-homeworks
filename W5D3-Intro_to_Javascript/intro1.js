function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  //x has been declared as a constant global variable
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  //x has been defined for the block scope
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  // let x = 'out of block again';
  console.log(x);
}

function madLib(str1, str2, str3) {
  console.log(`We shall ${ str1.toUpperCase() } the ${ str2.toUpperCase() } ${ str3.toUpperCase() }.`)
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

function fizzBuzz(array) {
  var result = []

  for(var i = 0; i < array.length; i++){
    if (array[i] % 3 == 0 && array[i] % 5 != 0) {
      result.push(array[i]);
    }
    if (array[i] % 5 == 0 && array[i] % 3 != 0) {
      result.push(array[i]);
    }
  }

  return result;
}

function isPrime(n) {
  if (n < 2) {
    return false;
  }
  for (var i = 2; i < n; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  var sum = 0;
  var count = 0
  var i = 2;
  while (count < n){
    if (isPrime(i)){
      sum += i;
      count += 1;
    }
    i++
  }
  return sum
}
