import UIKit

protocol Building {
    var rooms: Int {get}
    var cost: Int {get set}
    var agent: String {get}
    func summary ()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agent = "Ana S."
    func summary (){
        print("This  property has  \(rooms) rooms. The price is \(cost). You can contact our sales agent: \(agent)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agent = "James W."
    func summary (){
        print("This office has \(rooms) rooms The price is \(cost). You can contact our sales agent: \(agent)")
    }
}


let houseOne = House(rooms: 5, cost: 50_000)
let officeOne = Office(rooms: 3, cost: 30_000)
houseOne.summary()
officeOne.summary()
