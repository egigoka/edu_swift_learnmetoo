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



//: ### Именование элементов кортежа



//: ### Массовое присвоение значений



//: ## Guard



//: ### Синтаксис

/*:

    guard condition else { return }

 */


