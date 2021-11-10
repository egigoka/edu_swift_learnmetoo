//: ## Базовые операторы

import UIKit

//: ### Арифметические операторы:

var a = 9
var b = 4

a + b
a - b
a * b
a / b

//: ### Оператор остатка от деления:

a % b
-a % b
a % -b

//: ### Оператор присваивания:

a = 5
b = 10
let c = a + b

print("а равно \(a)")
print("b равно \(b)")
print("c равно \(c)")

a = b

print("а равно \(a)")

a += b // a = a + b // a = 10 + 10 // a = 20
a -= b // 10
a *= b // 100
a /= b // 10

//: ### Операторы сравнения:

a == b // true
a != b // false
a > b // false
a < b // // false
a >= b // true
a <= b // true




//: ### Оператор логического НЕ:

let accessDeniedMessage = "ACCESS DENIED"
let welcomeMessage = "Welcome!"

let allowedEntry = false // Разрешение на вход отсутсвует

if !allowedEntry {
    print(accessDeniedMessage)
}

//: ### Оператор логического И:

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print(welcomeMessage)
} else {
    print(accessDeniedMessage)
}

//: ### Оператор логического ИЛИ:

let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    print(welcomeMessage)
} else {
    print(accessDeniedMessage)
}


// Комбинирование логических оператров
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print(welcomeMessage)
} else {
    print(accessDeniedMessage)
}

//: ### Строки и символы:

let name: String
var surname = String()
var email = ""

name = "Alexey"
surname = "Efimov"

var aboutCourse = """
Мы изучаем курс "Основы программирования на Swift".
Сейчас у нас урок номер 2.
Автор и ведущий курса Алексей Ефимов.
"""

//print(aboutCourse)

//: ### Конкатенация строк:

let fullName = name + " " + surname
var myName = "My name is "

//myName = myName + fullName
myName += fullName

//: ### Интерполяция строк

let lessonNumber = 2
let numberOfLessons = 8

aboutCourse = """
Мы изучаем курс "Основы программирования на Swift".
Сейчас у нас урок номер \(lessonNumber).
До оконачания курса осталось \(numberOfLessons - lessonNumber) уроков.
Автор и ведущий курса \(fullName).
"""

print(aboutCourse)

var exclamationMark: Character = "!"
myName.append(exclamationMark)

//myName
