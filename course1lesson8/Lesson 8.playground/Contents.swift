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

for (city, temp) in cityTemp {
    print("In \(city) temperature now is \(temp)º")
}

print()

let cityList = cityTemp.sorted(by: <)

for cityTemp in cityList {
    print("In \(cityTemp.key) temperature now is \(cityTemp.value)º")
}
print()


func getTemp(in city: String) -> (city: String, temp: Int) {
    let temp = Int.random(in: -2...16)
    return (city, temp)
}

let (city, temp) = getTemp(in: "Vinnytsia")
print("In \(city) temperature now is \(temp)º")
print()

let tempInCity = getTemp(in: "Vinnytsia")
print("In \(tempInCity.city) temperature now is \(tempInCity.temp)º")
print()

//: ## Guard



//: ### Синтаксис

/*:

    guard condition else { return }

 */


