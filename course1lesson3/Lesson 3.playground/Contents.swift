//Урок 3

import UIKit



//: ## Конструкция if
/*:
    if condition {
        some code
    }
 
*/

print("====КОНСТРУКЦИЯ if====")

var someNumber = 10

if someNumber < 4 {
    print("The condition is true")
}

someNumber = 1


if someNumber < 4 {
    print("The condition is true")
}
/*:
    if conditionOne {
        some code
    } else if conditionTwo {
        some code
    }
*/

print("\n====КОНСТРУКЦИЯ else if====")

someNumber = 10

if someNumber < 4 { // false
    print("The first condition is true")
} else if someNumber < 8 { // false
    print("The second condition is true")
}

someNumber = 1

if someNumber < 4 { // true
    print("The first condition is true")
} else if someNumber < 8 { // true, but never executed
    print("The second condition is true")
}

if someNumber < 4 { // true
    print("The first condition is true")
}

if someNumber < 8 { // true
    print("The second condition is true")
}

/*:
    if conditionOne {
        some code
    } else if conditionTwo {
        some code
    } else {
        some code
    }
 */

print("\n====КОНСТРУКЦИЯ if-else====")

someNumber = 10

if someNumber < 4 { // false
    print("The first condition is true")
} else if someNumber < 8 { // false
    print("The second condition is true")
} else if someNumber < 10 { // false
    print("The third condition is true")
} else {
    print("Nothing was true")
}

//: ### Тернарный оператор

print("\n====ТЕРНАРНЫЙ ОПЕРАТОР====")

// condition ? some code : some code

let a = 5
let b = 10
var c = 0

if a < 10 {
    print("The condition is true")
} else {
    print("The condition is false")
}

a < 10 ? print("The condition is true") : print("The condition is false")

if a < 10 {
    c = a - b
} else {
    c = a + b
}

c = a < 10 ? a - b : a + b

//: ## Switch statement

/*:
    switch значение для сопоставления {
    case значение 1:
        инструкция для первого значения
    case значение 2, значение 3:
        инструкция для второго и третьего значения
    default:
        инструкция, если совпадений с шаблонами не найдено
    }
*/

print("\n====SWITCH STATEMENT====")

var someCharacter: Character = "a"

if someCharacter == "a" {
    print("It's an A")
} else if someCharacter == "b" {
    print("It's a B")
} else if someCharacter == "c" {
    print("It's a C")
} else {
    print("Don't know what it is")
}

someCharacter = "B"

if someCharacter == "a" || someCharacter == "A" {
    print("It's an A")
} else if someCharacter == "b" || someCharacter == "B" {
    print("It's a B")
} else if someCharacter == "c" || someCharacter == "C" {
    print("It's a C")
} else {
    print("Don't know what it is")
}

switch someCharacter {
case "a", "A":
    print("It's an A")
case "b", "B":
    print("It's a B")
case "c", "C":
    print("It's a C")
default:
    print("Don't know what it is")
}

//: ### Соответствие диапазону

print("\n====СООТВЕТСТВИЕ ДИАПАЗОНУ====")

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount = ""

switch approximateCount {
case ..<0:
    print("Error")
case 0:
    naturalCount = "no"
case 1:
    naturalCount = "one"
case 2..<5:
    naturalCount = "a few"
case 5...11:
    naturalCount = "several"
case 12...99:
    naturalCount = "dozens of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)")

//: ## Опциональные типы

var someString = ""
var optionalString: String?

var possibleNumber = "12345e"
var convertedNumber = Int(possibleNumber)

convertedNumber = 16
convertedNumber = nil

//: ### Извлечение опционалов

if convertedNumber == nil {
    print("convertedNumber doesn't contains integer value")
}

//: ### Принудительное извлечение опционалов

convertedNumber = 16

if convertedNumber != nil {
//    convertedNumber = nil
    print("convertedNumber has integer value of \(convertedNumber!)")
}

//: ### Привязка опционалов

convertedNumber = nil

if let convertedNumber = convertedNumber {
    print("convertedNumber has integer value of \(convertedNumber)")
} else {
    print("convertedNumber doesn't contains integer value")
}

//: ### Неявно извлеченные опционалы

var name = ""
var userName: String! = "Tim"

//userName = nil
name = userName
