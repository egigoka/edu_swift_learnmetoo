import UIKit

//: # Lesson 8



//: # Дополнительные коцепции Swift



//: ## Кортежи



/*:
 
    (valueOne, ValueTwo, ValueThree,…)

*/

class Weather {
    var currentWeather: (Int, String)
    
    init(currentWeather: (Int, String)) {
        self.currentWeather = currentWeather
    }
}

let weather = Weather(currentWeather: (22, "Sunny"))

weather.currentWeather

//: ### Получение доступа к элементам

weather.currentWeather.0
weather.currentWeather.1

weather.currentWeather.0 = 24
weather.currentWeather.1 = "Rainy"

let (temperature, atmos) = weather.currentWeather
temperature
atmos

let (temperatureNew, _) = weather.currentWeather

let temperatureNewNew = weather.currentWeather.0

//: ### Именование элементов кортежа

var currentWeather = (temp: 22, atmos: "Sunny", windSpeed: 6)

currentWeather.temp
currentWeather.atmos
currentWeather.windSpeed

//: ### Массовое присвоение значений

// не надо применять

let numberOne = 1
let numberTwo = 2
let numberThree = 3

let numberOneNew = 1, numberTwoNew = 2, numberThreeNew = 3

let (x, y, z) = (numberOne, numberTwo, numberThree)

let (a, b, c) = (1, 2, 3)

var cityTemp = [
    "Kyiv": Int.random(in: -2...16),
    "Mariupol": Int.random(in: -2...16),
    "Bucha": Int.random(in: -2...16)
]

for (city, temp) in cityTemp {
    print("Temperature in city \(city) is \(temp) degrees C")
}

let cityList = cityTemp.sorted(by: <)

for cityTemp in cityList {
    print("\(cityTemp.key) - \(cityTemp.value)")
}

//: ## Guard



//: ### Синтаксис



/*:

    guard condition else { return }

 */


