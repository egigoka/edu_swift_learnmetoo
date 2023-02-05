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

weather.currentWeather.0 = 24
weather.currentWeather.1 = "Rainy"

let (temperature, _) = weather.currentWeather
temperature
// atmos

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

var name = ""
var surname = ""
var email = ""
var age = 0

func createNewUserV1(name: String, surname: String, email: String, age: Int) {
    if name != "" {
        print(name)
    } else {
        print("Enter your name")
    }

    if surname != "" {
        print(surname)
    } else {
        print("Enter your surname")
    }

    if email != "" {
        print(email)
    } else {
        print("Enter your email")
    }

    if age >= 18 {
        print(age)
    } else {
        print("Enter for adult only")
    }

    print("\(name) \(surname), welcome!")
}

createNewUserV1(name: name, surname: surname, email: email, age: age)
print()

func createNewUserV2(name: String, surname: String, email: String, age: Int) {
    if name != "" {
        print(name)
        if surname != "" {
            print(surname)
            if email != "" {
                print(email)
                if age >= 18 {
                    print("\(name) \(surname), welcome!")
                } else {
                    print("Enter for adult only")
                }
            } else {
                print("Enter your email")
            }
        } else {
            print("Enter your surname")
        }
    } else {
        print("Enter your name")
    }
}

name = "Alexey"
surname = "Efimov"
email = "lex.efimov@swiftbook.ru"
age = 18

createNewUserV2(name: name, surname: surname, email: email, age: age)
print()

func createNewUserV3(name: String, surname: String, email: String, age: Int) {
    if name == "" {
        print("Enter your name")
        return
    }

    print(name)

    if surname == "" {
        print("Enter your surname")
        return
    }

    print(surname)

    if email == "" {
        print("Enter your email")
        return
    }

    print(email)

    if age < 18 {
        print("Enter for adult only")
    }

    print("\(name) \(surname), welcome!")
}

// surname = ""
// age = 16

createNewUserV3(name: name, surname: surname, email: email, age: age)
print()

func createNewUserV4(name: String?,
                     surname: String?,
                     email: String?,
                     age: Int?) {

    if name == nil || name?.count == 0 {
        print("Enter your name")
        return
    }

    print(name!)

    if surname == nil || surname?.count == 0 {
        print("Enter your surname")
        return
    }

    print(surname!)

    if email == nil || email?.count == 0 {
        print("Enter your email")
        return
    }

    print(email!)

    if age == nil || age! < 18 {
        print("Enter for adult only")
    }

    print("\(name!) \(surname!), welcome!")
}

createNewUserV4(name: name, surname: surname, email: email, age: age)
print()
//: ### Синтаксис

/*:

    guard condition else { return }

 */

func createNewUserV5(name: String?,
                     surname: String?,
                     email: String?,
                     age: Int?) {
    guard let name = name, name.count > 0 else { return }
    guard let surname = surname, surname.count > 0 else { return }
    guard let email = email, email.count > 0 else { return }
    guard let age = age, age >= 18 else { return }

    print("\(name) \(surname), welcome!")
}

createNewUserV5(name: name, surname: surname, email: email, age: age)
print()

//: ### Опциональная последовательность

class Person {
    var id: String?
    var residence: Residence?
}

class Residence {
    var adress: Adress?
}

class Adress {
    var street: String?
    var building: String?
    var apartment: String?
}

var person: Person?

if let residence = person?.residence {
    if let adress = residence.adress {
        if let apartment = adress.apartment {
            print("The apartment number is \(apartment)")
        }
    }
}

if let apartment = person?.residence?.adress?.apartment {
    print("The apartment number is \(apartment)")
}
