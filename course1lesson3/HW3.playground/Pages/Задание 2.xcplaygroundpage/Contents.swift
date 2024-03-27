
import Foundation

/*:
 ## Упражнение - опциональные значения
 
 >Во время выполнения упражнений данного плейграунда, вы будете выводить в консоль опциональные значения.  Компилятор Swift выдаст предупреждение: «Expression implicitly coerced from `Int?` to Any».  Для целей выполнения заданий, можете данные предупреждения игнорировать.
 
 Ваше приложение запрашивает пользователя его возраст.  Введённые пользователем данные передаются вам в виде текста, `String`.  Однако, вам нужно сохранить значение в виде целого числа `Int`.  Пользователь может сделать ошибку и ввести неверные данные.
 
 Объявите переменную `userInputAge` типа `String` и присвойте ей значение "34e" для моделирования опечатки.  Затем определите константу `userAge` типа `Int` и используйте конструктор `Int` для преобразования `userInputAge`.  Какую ошибку вы получаете?
 */

var userInputAge = "34e"
//var userAge: Int = Int(userInputAge)
// cannot assign optional Int value to an Int variable

/*:
 Теперь поменяйте тип `userAge` на `Int?`, и напечатайте значение `userAge`.  Почему значение `userAge` равно `nil`?  Ответьте в комментарии или внутри команды print.
 */

var userAge = Int(userInputAge)

print(userAge)
// not all characters are numbers, so it fallbacks to nil

/*:
 Теперь исправьте опечатку в значении `userInputAge`.  Что-нибудь в результатах вывода кажется вам неуместным?
 
 Напечатайте `userAge` снова, но теперь извлеките `userAge` с помощью оператора «!».
 */

userInputAge = "34"

userAge = Int(userInputAge)

print(userAge)
// prints that value is optional

print(userAge!)

/*:
 Используйте привязку опционалов для извлечения `userAge`.  Если `userAge` содержит значение, выведите его в консоль.
 */

if let userAge = userAge {
    print("User entered age of \(userAge)")
}

/*:
 Теперь снова эмулируйте опечатку и попробуйте вывести на консоль целочисленное значение переменной `userInputAge`, при помощи оператора "!". Какую ошибку вы получите? Почему?
 */

userInputAge = "34e"

//print(Int(userInputAge)!)
// cannot forcefully unwrap nil because it doesn't contain value

//: [Ранее: Задание 1](@previous)  |  задание 2 из 4  |  [Далее: Задание 3](@next)
