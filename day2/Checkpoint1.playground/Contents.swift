import UIKit

/*
 -Creates a constant holding any temperature in Celsius.
 -Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
 -Prints the result for the user, showing both the Celsius and Fahrenheit values.
 */


let temperature = 40

let fahrenheit = (temperature * 9 / 5 ) + 32

print("\(temperature)ºC to Fahrenheit :  \(fahrenheit)ºF")
