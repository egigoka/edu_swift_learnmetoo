//: [Previous](@previous)

import Foundation

//: ## Словари
//: > Неупорядоченные коллекции, которые хранят в себе пары «ключ-значение». Тип ключа словаря может отличаться от типа значения. При этом сами ключи и значения должны быть одного типа

//Полная форма записи словаря
var someStringDictionary = Dictionary<String, String>()
var moreStringDictionary: Dictionary<String, String> = [:]

// Сокращенная форма записи словаря
var anotherSomeDictionary = [Int: String]()

var carWashQueue: [String: String] = [:]

// Инициализация словаря с данными
carWashQueue = ["E095AB": "Red camry"]

// Изменение значения для ключа




// Изменение значения с сохранением старого значения




// Добавление новой пары ключ-значение




// Удаление значения по ключу с сохранением значения

//: [Next](@next)

