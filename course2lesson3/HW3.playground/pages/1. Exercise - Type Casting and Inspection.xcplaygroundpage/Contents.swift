/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */

let list: [Any] = [2, 5, 3.1, "String", true]

for item in list {
    print(item)
}

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */

for item in list {
    switch item {
    case is Int: print("\(item) is Int")
    case is Double: print("\(item) is Double")
    case is String: print("\"\(item)\" is String")
    case is Bool: print("\(item) is Bool")
    default: print("Unowed value: \(item)")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */

let dict: [String: Any] = [
    "Integer": 23,
    "Double": 3.14,
    "String": "String",
    "Bool true": true,
    "Bool false": false
]


for (key, value) in dict {
    print("Key \(key), value: \(value)")
}
/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */

var total = 0.0

for value in dict.values {
    if let int = value as? Int {
       total += Double(int)
    } else if let double = value as? Double {
        total += double
    } else if value is String {
        total += 1
    } else if let bool = value as? Bool {
        total += bool ? 2 : -3
    }
}

print(total)

/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */

total = 0

for value in dict.values {
    if let int = value as? Int {
       total += Double(int)
    } else if let double = value as? Double {
        total += double
    } else if let string = value as? String, let double = Double(string) {
        total += double
    }
}

print(total)

//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
