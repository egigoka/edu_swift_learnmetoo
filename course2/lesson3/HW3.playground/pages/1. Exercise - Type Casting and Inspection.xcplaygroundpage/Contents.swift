/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */

import Foundation

let items: [Any] = [1.1, 2.2, 3.3, 4, 5, 6, "string", "also string", true, false]

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */

for item in items {
    if let item = item as? Int {
        print("Int \(item)")
    }
}

for item in items {
    if let item = item as? Double {
        print("Double \(item)")
    }
}

for item in items {
    if let item = item as? String {
        print("String \"\(item)\"")
    }
}

for item in items {
    if let item = item as? Bool {
        print("Bool \(item)")
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
    if let value = value as? Double {
        print("\(key): \(String(format: "%.2f", value))")
    } else if let value = value as? Int {
        print("\(key): \(value)")
    } else if let value = value as? String {
        print("\(key): \(value)")
    } else if let value = value as? Bool {
        print("\(key): \(value)")
    }
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
    } else if let _ = value as? String {
        total += 1
    } else if let value = value as? Bool {
        total += value ? 2 : -4
    }
}

print(total)
/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */

total = 0

for (_, value) in jsonIGuess {
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
