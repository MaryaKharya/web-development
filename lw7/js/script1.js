let n
let isPrime
function isPrimeNumber(n) {
  if (Array.isArray(n)) {
    for (let i = 0; i < n.length; i++) {
      isPrime = true
      for (let j = 2; j < n[i]; j++) {
        if (n[i] % j == 0){
          isPrime = false
          console.log(`${n[i]} is not prime number`) 
          break
        }
      }
      if (isPrime) {
        console.log(`${n[i]} is prime number`) 
      }
    }
  } else if (Number.isInteger(n)) {
    isPrime = true
    for (let j = 2; j < n; j++) {
      if (n % j == 0) {
        isPrime = false
        console.log(`${n} is not prime number`)
        break
      }
    }
    if (isPrime) {
      console.log(`${n} is prime number`) 
    }
  } else {
      console.log('data entered incorrectly')
  }
}