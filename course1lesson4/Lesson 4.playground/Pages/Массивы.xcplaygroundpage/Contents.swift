import UIKit

//: # Урок 4. Типы коллекций
//: ## Массивы
//: > Хранят в себе упорядоченные, но при этом не уникальные значения одного типа

 // Неизменяемый массив с типом данных String
let strings = ["a", "b", "c"]

 // Неизменяемый массив с типом данных Character
let characters: [Character] = ["a", "b", "c"]

 // Пустой массив с типом Int
var integers = [Int]()
var numbers: [Int] = []

 // Присваивание данных массиву
integers = [1, 2, 3]

 // Теперь наш массив имеет другие данные
integers = [4, 5, 6]

 // Добавление новых значений к уже существующим
integers += [7, 8]

 // Добавление новго значения при помощи метода append
integers.append(9)

 // Добавление нового элемента по индексу
integers.insert(1, at: 0)

let someIntegers = [12, 17]

 // Создание нового массива, путём объеденения двух других массивов
numbers = integers + someIntegers

 //Удаление последнего элемента из массива и сохранение его в константе
let lastValueFromNumbers = numbers.removeLast()

 //Результат после удаления последнего элемента
numbers

 //Удаление первого элемента из массива и сохранение его в константе
numbers.removeFirst()

 // Результат после удаления первого элемента
numbers

 // Удаление значения по индексу
numbers.remove(at: 1)

 // Результат после удаления значение по индексу
numbers

 // Количество элементов массива
numbers.count

 // Удаление всех элементов массива
numbers.removeAll()

 // Обнуление массива путём присваивания ему пустого массиву
integers = []

integers = [10, 20, 40]

 // Замена значения по индексу 2 на новое значение
integers[2] = 30

 // Результат после замены
integers

//: ### Использование логического свойства isEmpty



//: [Next](@next)
