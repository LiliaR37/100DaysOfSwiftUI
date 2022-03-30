import UIKit

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

//append
beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")



var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

//.count to read how many items are in an array
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

//Remove
characters.remove(at: 2)
print(characters.count)

//All
characters.removeAll()
print(characters.count)

//Containt - true or false
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

//Sorted
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

//Reverse
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
