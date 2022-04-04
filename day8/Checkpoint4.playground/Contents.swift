import UIKit

/*
 The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 If you can’t find the square root, throw a “no root” error.
 */


enum SquareRootError: Error {
    case outOfBounds, noRoot
}


func squareRoot(_ num: Int ) throws -> Int {
    var sqroot = 0
    for i in 1...100 {
        if i * i == num {
            sqroot  = i
            return sqroot
        } else {
            SquareRootError.noRoot
        }
    }
    
    if num < 1 || num > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    return sqroot
   
    
    
    
}

let num = 9
do {
    let result = try squareRoot(num)
    print("Square root:  \(result)")
} catch SquareRootError.outOfBounds {
    print("The number \(num) is out of bounds")
} catch SquareRootError.noRoot{
    print("Sorry, no root")
} catch {
    print("There was an error.")
}
