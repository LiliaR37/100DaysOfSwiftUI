import UIKit

class Animal {
   let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}


class Dog: Animal {
    
    func speak() {
        print("Generic dog barking")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    
    
    func speak() {
        print("Miauuww")
    }
}

class Corgi: Dog {
    
  
    override func speak() {
        print("I'm a corgiiiii and I have short \(legs) legs")
    }
}

class Poodle: Dog {
    override func speak() {
        print("I'm a Poodleeee and I have \(legs) legs")
    }
}

class Persian: Cat {
    override func speak() {
        if isTame == true {
            print("I'm a Persian Cat, I have \(legs) legs and I love you 💖")
        } else {
            print("I hate you 😒")
        }
       
    }
    
       
}

class Lion: Cat {
    
    override func speak() {
        
        if isTame == true {
            print("I'm a Lion!! I'm The King 🦁!! and I have \(legs) legs")
        } else {
            print("I'm a Lion!! I'm The King!! and I have \(legs) legs")
            print("You should run, I'm hungry ")
        }
        
    }
    
    
 
}

 

let corgi = Corgi(legs: 4)
corgi.speak()

let persian = Persian(legs: 4, isTame: false)
persian.speak()
let lion = Lion(legs: 4, isTame: false)
lion.speak()
