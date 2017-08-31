var madLib = (verb, adjective, noun) => `We shall ${verb.uppercase} the ${adjective.uppercase} ${noun.uppercase}`

var isSubString = (searchString, subString) => searchString.index(subString) != -1

var fizzBuzz = list => list.filter(n => (n % 3) ^ (n % 5))

var isPrime = n => {
    if (n < 2)
        return false

    for(let i = 2; i < n; i++)
        if (n % i == 0)
            return false

    return true
}

var sumNPrimes = n => {
    sum = 0, fp = 2

    if (n <= 0)
        return sum

    while (n > 0){
        if (isPrime(fp))
            n -= 1,
            sum += fp

        fp++
    }

    return sum
}


console.log(
    madLib('eat', 'ferociously', 'beans')
)

console.log(
    `is 5 prime? Should be: ${isPrime(5)}`
)

console.log(
    sumNPrimes(2),
    sumNPrimes(3),
    sumNPrimes(4)
)
