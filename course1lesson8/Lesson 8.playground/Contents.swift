import UIKit

//: # Lesson 8

//: # Дополнительные коцепции Swift

//: ## Кортежи


/*:
 
    (valueOne, ValueTwo, ValueThree,…)

*/

var currentWeather = (22, "Sunny")

class Weather{
    var currentWeather: (Int, String)
    
    init(currentWeather: (Int, String)){
        self.currentWeather = currentWeather
    }
}

let weather = Weather(currentWeather: currentWeather)
weather.currentWeather

//: ### Получение доступа к элементам

weather.currentWeather.0 = 24
weather.currentWeather.1 = "Rainy"

let (temperature, _) = weather.currentWeather
temperature
//atmos

//: ### Именование элементов кортежа

var currentWeatherVer2 = (temp: 22, atmos: "Sunny", windSpeed: 6)
currentWeatherVer2.temp
currentWeatherVer2.atmos
currentWeatherVer2.windSpeed

//: ### Массовое присвоение значений

// good
let numberOne = 1
let numberTwo = 2
let numberThree = 3

// bad
var (x, y, z) = (numberOne, numberTwo, numberThree)

var cityTemp = ["Kiyv": Int.random(in: -2...16),
                "Odessa": Int.random(in: -2...16),
                "Lviv": Int.random(in: -2...16)]

//: ## Guard



//: ### Синтаксис

/*:

    guard condition else { return }

 */


