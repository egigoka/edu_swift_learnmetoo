//: [Previous](@previous)

import Foundation

//: ### Функции как замыкания


//: Отбираем числа меньше заданного значения



//: Отбираем числа больше заданного значения



//: Функция для отбора чисел, относительно заданного значения



//: Функция для отбора числе меньше указанного значения



//: Функция для отбора числе больше указанного значения



//: Отбор чисел меньше указанного значения

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: lesThanValue)

//: Отбор чисел больше указанного значения

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: greaterThanValue)

//: ### Замыкающие выражения

/*:
 
 Замыкания бывают трех видов:
 
 - Глобальные функции — это замыканиями, у которых есть имя и которые не захватывают никакие значения.
 
 - Вложенные функции — это замыканиями, у которых тоже есть имя, но при этом они могут использовать или захватывать значения из родительской функции.
 
 - Замыкающие выражения - это безымянные функции, которые написаны в облегченном синтаксисе, которые могут захватывать значения из окружающего контекста
 
 */


/*:
    { (параметры) -> тип результата in
        тело замыкающего выражения
    }
 */



/*:
 Изпользование замыкания в качестве аргумента
 
 Отбор чисел меньше указанного значения
 */

filterWithPredicateClosure(
    value: someValue,
    numbers: numbers,
    closure: { (number: Int, value: Int) -> Bool in
        number < value
    }
)

//: Отбор чисел больше указанного значения

filterWithPredicateClosure(
    value: someValue,
    numbers: numbers,
    closure: { (number: Int, value: Int) -> Bool in
        number > value
    }
)


//: Вывод типа из контекста

filterWithPredicateClosure(
    value: someValue,
    numbers: numbers,
    closure: { (number, value) in number < value }
)

filterWithPredicateClosure(
    value: someValue,
    numbers: numbers,
    closure: { (number, value) in number > value }
)

//: Неявные возвращаемые значения из замыканий с одним выражением



//: Сокращенные имена параметров

filterWithPredicateClosure(
    value: someValue,
    numbers: numbers,
    closure: { $0 < $1 }
)

filterWithPredicateClosure(
    value: someValue,
    numbers: numbers,
    closure: { $0 > $1 }
)

//: Последующее замыкание

filterWithPredicateClosure(value: someValue, numbers: numbers) { $0 < $1 }
filterWithPredicateClosure(value: someValue, numbers: numbers) { $0 > $1 }

//: Операторные функции

filterWithPredicateClosure(value: someValue, numbers: numbers, closure: <)
filterWithPredicateClosure(value: someValue, numbers: numbers, closure: >)
