import UIKit

//: ## Home Work 2

/*:
 ### Задание 1
 1.1 Объявите два свойства с типом `Float` и присвойте каждому число с дробной частью — например, 3.14 или 42.0
 
 1.2 Объявите еще одно свойство с типом `Double` и присвойте ей сумму двух переменных типа `Float`
 
 1.3 Выведите результат при помощи `print()`
 */
let floatOne: Float = 3.14
let floatTwo: Float = 42.0

let double = Double(floatOne + floatTwo)

print(double)
/*:
 ### Задание 2
 2.1 Создайте переменную `numberOne` и присвойте ей любое целочисленное значение
 
 2.2 Создайте ещё одну целочисленную переменную `numberTwo` и присвойте ей любое значение меньше `numberOne`
 
 2.3 Присвойте новой целочисленной константе `result` результат деления `numberOne` на `numberTwo`
 
 2.4 Присвойте новой целочисленной константе `remainder` остаток от деления `numberOne` на `numberTwo`
 
 2.5 Выведите на консоль сообщение: «При делении <...> на <...> результат равен <...>, остаток равен <...>», подставив вместо (<...>) свои результаты.
 
 2.6 Выведите на консоль фразу: «Результат деления <...> на <...> равен <...> <...>/<...>». Поясню: в математике результатом деления 5 на 3 будет натуральная дробь 1 2/3 (одна целая две третьих, здесь мы используем стандартную математическую запись, а не оператор деления). Вам необходимо вывести на консоль именно такой результат от деления `numberOne` на `numberTwo` в виде натуральной дроби — например «Результат деления 7 на 3 равен 2 1/3».
 
 */
let numberOne = 10

let numberTwo = 3

let result = numberOne / numberTwo

let remainder = numberOne % numberTwo

print("При делении \(numberOne) на \(numberTwo) результат равен \(result), остаток равен \(remainder)")

print("Результат деления \(numberOne) на \(numberTwo) равен \(result) \(remainder)/\(numberTwo)")

/*:
 ### Задание 3
 3.1 Объявите константу `dayOfBirth` и присвоейте ей дату вашего рождения
 
 3.2 Объявите константу `mothOfBirth` и присвоейте ей месяц вашего рождения
 
 3.3 Объявите константу `yearOfBirth` и присвоейте ей год вашего рождения
 
 3.4 Необходимо рассчитать прожитое вами время время с момента вашего рождения по текущую дату в разных единицах измерения (в годах, месяцах, днях и секундах). За текущее время возьмите сегодняшнюю дату и 0 часов 0 минут. Високосные года учитывать не надо. Пусть среднее количество дней в месяце будет 30. Создайте необходимые для решения данной задачи свойства. Для расчета всех необходимых величин используйте только арифметические операторы. Ни каких функций использоваться не должно.
 
 3.5 Выведите результат решения на консоль в виде текста (n years, n months, n days and n seconds have passed since my birth). Можете использовать свой текст. Например, если я родился 9 ноября 1980 года, а текущая дата 29.01.20, то результат будет следующим: **39 years, 470 months, 14120 days and 1219968000 seconds have passed since my birth**
 
 3.6 Выведите на консоль сообщение о том в каком квартале вы родились. Для этого используейте операторы сравнения, что бы сравнить номер месяца вашего рождения с одним из четрырех кварталов. Например если номер месяца больше 0 и меньше или равно 3, то это будет первый квартал. Для получения результата используйте конструкцию if
 */
let dayOfBirth = 18
let monthOfBirth = 7
let yearOfBirth = 2000

let currentDay = 31
let currentMonth = 7
let currentYear = 2022

let secondsInMinute = 60
let minutesInHour = 60
let hoursInDay = 24
let daysInMonth = 30
let monthsInYear = 12

let secondsPassed = (currentYear - yearOfBirth) * monthsInYear * daysInMonth * hoursInDay * minutesInHour * secondsInMinute + (currentMonth - monthOfBirth) * daysInMonth * hoursInDay * minutesInHour * secondsInMinute + (currentDay * dayOfBirth) * hoursInDay * minutesInHour * secondsInMinute
let daysPassed = secondsPassed / secondsInMinute / minutesInHour / hoursInDay
let monthsPassed = daysPassed / daysInMonth
let yearsPassed = monthsPassed / monthsInYear

print("\(yearsPassed) years, \(monthsPassed) months, \(daysPassed) days and \(secondsPassed) seconds have passed since my birth")

let quarterOfBirth: String

if monthOfBirth <= 3 {
    quarterOfBirth = "1st"
} else if monthOfBirth <= 6 {
    quarterOfBirth = "2nd"
} else if monthOfBirth <= 9 {
    quarterOfBirth = "3rd"
} else {
    quarterOfBirth = "4th"
}

print("I've born in \(quarterOfBirth) quarter of year")
/*:
 ### Задание 4
 Задание на вашу способность гуглить. Необходимо вычислить синус от числа 1 и округлить результат до тысячных.
 > Подсказка: в результате должно получиться 0.841
 */

let sinOfOne = sin(1.0)
let sinOfOneRounded = String(format: "%.3f", sinOfOne)
