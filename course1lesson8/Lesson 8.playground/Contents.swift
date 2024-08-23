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

func getTemp(in city: String) -> (String, Int) {
    let temp = Int.random(in: -2...16)
    return (city, temp)
}

let (city, temp) = getTemp(in: "Kherson")
print("Temperature in city \(city) is \(temp) degrees C")

func getTempNew(in city: String) -> (city: String, temp: Int) {
    let temp = Int.random(in: -2...16)
    return (city, temp)
}

let tempInCity = getTempNew(in: "Irpin")
print("Temperature in city \(tempInCity.city) is \(tempInCity.temp) degrees C")

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
        print("Enter for adults only")
    }
    
    print("\(name) \(surname), Welcome!")
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
                    print(age)
                    print("\(name) \(surname), Welcome!")
                } else {
                    print("Enter for adults only")
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
        print("Enter for adults only")
        return
    }
    print(age)
    
    print("\(name) \(surname), Welcome!")
}

//surname = ""
//age = 16

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
        print("Enter for adults only")
        return
    }
    print(age!)
    
    print("\(name!) \(surname!), Welcome!")
}

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
    
    print("\(name) \(surname), Welcome!")
}

createNewUserV5(name: name, surname: surname, email: email, age: age)

//: ### Опциональная последовательность

class Person {
    var id: String?
    var residence: Residence?
}

class Residence {
    var address: Address?
}

class Address {
    var street: String?
    var building: String?
    var apartment: String?
}

var person: Person?

if let residence = person?.residence {
    if let address = residence.address {
        if let apartment = address.apartment {
            print("The apartment number is \(apartment)")
        }
    }
}

if let apartment = person?.residence?.address?.apartment {
    print("The apartment number is \(apartment)")
}
