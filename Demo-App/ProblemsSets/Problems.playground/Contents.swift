import UIKit

//Problem -1
//2.25 4.50 1.25 5 = 27
let res = ((2.25 + 4.50)/1.25) * 5


//Problem -2 ,  2 approcahes for gettingn nth fibonaici 
//recursive arrpocah:
func fibRecurseive(_ n: Int) -> Int {
    if (n == 0){
        return 0
    } else if (n == 1) {
        return 1
    }
    return fibRecurseive(n-1) + fibRecurseive(n-2)
}

//Iterative arrpocah:
func fibIterative(_ n: Int) {
    var f1=1, f2=1, fib=0
    for i in 3...n {
        fib = f1 + f2
        print("Fibonacci: \(i) = \(fib)")
        f1 = f2
        f2 = fib
    }
}


//Problem -3 - Check for Anagram
//recursive arrpocah:
func checkForAnagram(strtingOne: String, stringTwo: String) -> Bool {
    return strtingOne.lowercased().sorted() == stringTwo.lowercased().sorted()
}
