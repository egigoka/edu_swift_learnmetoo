/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */

let list: [Any] = [1, 1.1, true, false, "funky sheet", 2, 3, 4, 42, 6.999, 0.3]

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */

for item in list {
    if let int = item as? Int {
        print("Целое число \(int)")
    } else if let double = item as? Double {
        print("Вещественное число \(double)")
    } else if let string = item as? String {
        print("Строка \"\(string)\"")
    } else if let bool = item as? Bool {
        print("Булево значение \(bool)")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */

let dict: [String: Any] = ["Answer to question of life, universe and everything": 42,
                          "Is something true?": true,
                          "Name of George Washington": "George",
                          "0.1 + 0.2 =": 0.1 + 0.2,
                          "√10": "3.333333333333333333333333333333333333333333"]


for (key, value) in dict {
    if let int = value as? Int {
        print("\(key): \(int)")
    } else if let double = value as? Double {
        print("\(key): \(double)")
    } else if let string = value as? String {
        print("\(key): \"\(string)\"")
    } else if let bool = value as? Bool {
        print("\(key): \(bool)")
    }
}
/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */

var total = 0.0

for (key, value) in dict {
    if let int = value as? Int {
       total += Double(int)
    } else if let double = value as? Double {
        total += double
    } else if let string = value as? String {
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

for (key, value) in dict {
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
