function isPrimeNumber(n) {
  if (Array.isArray(n)) {
    for (let i of n) {
      if (typeof i === 'number') {
        if (PrimeElement(i)) {
          console.log(`${i} is prime number`)
        } else {
            console.log(`${i} is not prime number`)
          }
      } else {
          console.log('data entered incorrectly') 
        }
    }
  }
  if (typeof n === 'number') {
    if (PrimeElement(n)) {
      console.log(`${n} is prime number`)
    } else {
        console.log(`${n} is not prime number`)
      }
  }
  if ((!typeof n === 'number') && (!Array.isArray(n))) {
    console.log('data entered incorrectly')
  }
}

function PrimeElement(e) {
    let isPrime = true
    for (let j = 2; j < e; j++) {
      if (e % j == 0) {
        isPrime = false
      }
    }
    return isPrime
}
