import UIKit

struct Car {
    let model: String
    let seats: Int
    private(set) var gear: Int
    
    init(model: String, seats: Int){
        self.model = model
        self.seats = seats
        gear = 0
    }
    
    mutating func gearUp() {
        if gear < 6 {
            gear += 1
        }
        print("Current gear: \(gear)")
    }
    
    mutating func gearDown() {
        if gear > 0 {
            gear -= 1
        }
        if gear == 0 {
            print("Current gear: Neutral")
        }else{
            print("Current gear: \(gear)")
        }
        
    }
}

var car = Car(model: "Tesla", seats: 4)

print(car.model)
print("\(car.seats) seats")
print(car.gear)
car.gearUp()
car.gearUp()
car.gearUp()

car.gearDown()

