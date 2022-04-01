import UIKit

let age = 16

if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}


//&& - 2 conditions - true
let temp = 25
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

//Or - 1 condition - true
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}
