import Cocoa

// July 1st
// Jerry_Ren

// MARK: - Primes

fileprivate func isItPrime(targetNumber: Int) -> Bool {
    
    var primeOrNot: Bool = false
    
    guard targetNumber > 1 else { return false }
    
    if (targetNumber == 2) { primeOrNot = !primeOrNot}
        
    else {
        let checkPoint = Int(sqrt(Double(targetNumber))) + 1
        
        for factor in 2...checkPoint {
            if targetNumber % factor == 0 {
                primeOrNot = false
                break
            } else {
                primeOrNot = true
            }
        }
    }
    print(primeOrNot)
    return primeOrNot
}

isItPrime(targetNumber: 43)
isItPrime(targetNumber: 999)
isItPrime(targetNumber: 11100113)
isItPrime(targetNumber: 11100111)
isItPrime(targetNumber: 2)


// MARK: - Fibonacci Builder

func fiboNacci(targetNumber: Int) -> Int {
    
    var fiboResult = 0
    
    if targetNumber >= 0 && targetNumber <= 1 {
        fiboResult = targetNumber
    }
    var x = 0
    var y = 1
    var z = 2
    
    for i in 2..<targetNumber {
        z = x + y
        x = y
        y = z
    }
    fiboResult = x + y
    print(fiboResult)
    
    return fiboResult
}

fiboNacci(targetNumber: 10)
fiboNacci(targetNumber: 87)


// MARK: - Factorial Calculator

func factCalc(targetNumber: Int) -> Int {
    
    var finalFact = 0
    var transitionArray: [Int] = []
    
    for index in 1...targetNumber {
        transitionArray.append(index)
    }

    finalFact = transitionArray.reduce(1, { (m, n) in
        m * n
    })
    print(finalFact)
    return finalFact
}

factCalc(targetNumber: 6)
factCalc(targetNumber: 20)



// MARK: -  Too time-inefficient sadly
//func fibonacciRecursive (target: Int) -> Int {
//    var fiboResult = 0
//    if target >= 0, target <= 1 {
//        fiboResult = target
//    } else if target >= 2 {
//        fiboResult = fibonacciRecursive(target: target-2) + fibonacciRecursive(target: target-1)
//    }
//    return fiboResult
//}
//fibonacciRecursive(target: 10)
