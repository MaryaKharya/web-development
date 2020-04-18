function isPrimeNumber(n) {
  if (Array.isArray(n)) {
    for (let i of n) {
      if (typeof i === 'number') {
        if (primeElement(i)) {
          console.log(`${i} is prime number`);
        } else {
            console.log(`${i} is not prime number`);
          }
      } else {
          console.log('data entered incorrectly'); 
        }
    }
  } else {
      if (typeof n === 'number') {
        if (primeElement(n)) {
          console.log(`${n} is prime number`);
        } else {
            console.log(`${n} is not prime number`);
          }
      } else {
          console.log('data entered incorrectly');
        }
    }
}

function primeElement(e) {
    let isPrime = true;
    for (let j = 2; j < e; j++) {
      if (e % j == 0) {
        isPrime = false;
      }
    }
    return isPrime;
}
