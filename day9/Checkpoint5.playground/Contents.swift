import UIKit

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let evens: () = luckyNumbers.filter { $0 % 2 != 0 }.sorted(by: <).map{"\($0) is a Lucky number"  }.forEach{print($0)}





