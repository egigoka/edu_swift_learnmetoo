//: [Previous](@previous)

import Foundation

//: ## Множества
//: > Хранят в себе неупорядоченные, но при этом уникальные значения одного типа

// Создание пустого множества
let characters: Set<Character> = []

let integers = Set<Int>()

// Создание множества с типом стринг
var strings: Set = ["a", "a", "a", "b", "c"]

// Добавление нового элемента в множество
strings.insert("d")

strings

// Проверка на наличие определенного элемента во множестве
strings.contains("b")

// Сортировка с использованием метода sorted() для последующей итерации по множеству
let array = strings.sorted(by: >)

//: [Next](@next)
