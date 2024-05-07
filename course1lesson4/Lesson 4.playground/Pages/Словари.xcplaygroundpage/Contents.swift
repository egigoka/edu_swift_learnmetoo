//: [Previous](@previous)

import Foundation

//: ## Словари
//: > Неупорядоченные коллекции, которые хранят в себе пары «ключ-значение». Тип ключа словаря может отличаться от типа значения. При этом сами ключи и значения должны быть одного типа

var someStringDictionary = Dictionary<String, String>() // full form of dict def
var moreStringDictionary: Dictionary<String, String> = [:]
var anotherSomeDictionary = [String: Int]() // shortened form of dict def

var carWashQueue: [String: String] = [:]

// Инициализация словаря с данными



// Изменение значения для ключа



// Изменение значения с сохранением старого значения



// Добавление новой пары ключ-значение



// Удаление значения по ключу с сохранением значения



//: [Next](@next)

