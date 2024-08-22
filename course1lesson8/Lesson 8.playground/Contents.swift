import UIKit

//: # Lesson 8



//: # Дополнительные коцепции Swift



//: ## Кортежи



/*:
 
    (valueOne, ValueTwo, ValueThree,…)

*/

var currentWeather = (22, "Sunny")

class Weather {
    var currentWeather: (Int, String)
    
    init(currentWeather: (Int, String)) {
        self.currentWeather = currentWeather
    }
}

let weather = Weather(currentWeather: currentWeather)

weather.currentWeather

//: ### Получение доступа к элементам

weather.currentWeather.0
weather.currentWeather.1

weather.currentWeather.0 = 24
weather.currentWeather.1 = "Rainy"

let (temperature, atmos) = weather.currentWeather
temperature
atmos

//: ### Именование элементов кортежа



//: ### Массовое присвоение значений



//: ## Guard



//: ### Синтаксис



/*:

    guard condition else { return }

 */


