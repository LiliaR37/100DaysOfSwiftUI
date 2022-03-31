import UIKit

/*
 This time the challenge is to create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.
 */

let names = ["Andrea", "David", "Lucy","David","Laura","Andrea"]

let countNames = names.count

let setNames = Set(names)
let countSet = setNames.count

print("The number of items:  \(countNames) and number of uniques items: \(countSet) ")
