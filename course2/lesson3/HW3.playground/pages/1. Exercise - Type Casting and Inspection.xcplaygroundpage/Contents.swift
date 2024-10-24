/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */

import Foundation

let items: [Any] = [1.1, 2.2, 3.3,
                    4, 5, 6,
                    "string", "also string",
                    true, false]

for item in items {
    print(item)
}

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */

for item in items {
    if let int = item as? Int {
        print("Int \(int)")
    } else if let double = item as? Double {
        print("Double \(double)")
    } else if let string = item as? String {
        print("String \"\(string)\"")
    } else if let bool = item as? Bool {
        print("Bool \(bool)")
    }
}

for item in items {
    switch item {
    case is Int: print("Int \(item)")
    case is Double: print("Double \(item)")
    case is Bool: print("Bool \(item)")
    case is String: print("String \(item)")
    default: print("Unknown type \(item)")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */

let jsonIGuess: [String: Any] = ["one": 1.1,
                                 "two": 2,
                                 "three": "string",
                                 "four": true,
                                 "five": "5",
                                 "six": "6.66"]

for (key, value) in jsonIGuess {
    print("\(key): \(value)")
}

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */

var total = 0.0

for (_, value) in jsonIGuess {
    if let value = value as? Double {
        total += value
    } else if let value = value as? Int {
        total += Double(value)
    } else if value is String {
        total += 1
    } else if let value = value as? Bool {
        total += value ? 2 : -3
    }
}

print(total)

/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */

total = 0

for value in jsonIGuess.values {
    if let value = value as? Double {
        total += value
    } else if let value = value as? Int {
        total += Double(value)
    } else if let value = value as? String, let double = Double(value) {
        total += double
    }
}

print(total)

//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
