//: [Previous](@previous)

import Foundation

//: ## Словари
//: > Неупорядоченные коллекции, которые хранят в себе пары «ключ-значение». Тип ключа словаря может отличаться от типа значения. При этом сами ключи и значения должны быть одного типа

var someStringDictionary = Dictionary<String, String>() // full form of dict def
var moreStringDictionary: Dictionary<String, String> = [:]
var anotherSomeDictionary = [String: Int]() // shortened form of dict def

var carWashQueue: [String: String] = [:]

// Инициализация словаря с данными

carWashQueue = ["E095AB": "Red Toyota", "X127MT": "White BMW X6"]

// Изменение значения для ключа

carWashQueue["E095AB"] = "Red Camry"

carWashQueue

// Изменение значения с сохранением старого значения

let oldValue = carWashQueue.updateValue("Gray BMW X6", forKey: "X127MT")

carWashQueue

// Добавление новой пары ключ-значение

carWashQueue["M987AB"] = "Green Chevrolet Niva"

carWashQueue

// Удаление значения по ключу с сохранением значения

carWashQueue.removeValue(forKey: "X127MT")

carWashQueue.count

carWashQueue.removeAll()

//: [Next](@next)

