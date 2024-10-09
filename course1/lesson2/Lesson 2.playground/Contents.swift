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

print("a equal \(a)")
print("b equal \(b)")
print("c equal \(c)")

a = b
print("a equal \(a)")

a += b // a = a + b // a = 10 + 10 // a = 20
a -= b // 10
a *= b // 100
a /= b // 10

//: ### Операторы сравнения:

a == b // true
a != b // false
a > b // false
a < b // false
a >= b // true
a <= b // true

//: ### Оператор логического НЕ:

let accessDeniedMessage = "ACCESS DENIED"
let welcomeMessage = "Welcome!"

let allowedEntry = false

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

// Combining of logical operators

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
We are attending a course "Basics of programming on Swift".
Now we're on 2nd lesson.
Author and lector is Alexey Efimov
"""

//print(aboutCourse)

//: ### Конкатенация строк:

let fullName = name + " " + surname

var myName = "My name is "

myName += fullName

//: ### Интерполяция строк

let lessonNumber = 2
let numberOfLessons = 8

aboutCourse = """
We are attending a course "Basics of programming on Swift".
Now we're on \(lessonNumber) lesson.
Until end of the course \(numberOfLessons - lessonNumber) lessons left.
Author and lector is \(fullName)
"""

print(aboutCourse)

let exclamationMark: Character = "!"

myName.append(exclamationMark)
