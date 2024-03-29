
import Foundation

/*:
 ### Задание 3
 Как вы знаете, после выполнения кода, расположенного в блоке `case`, происходит завершение работы конструкции `switch-case`. Однако в некоторых случаях требуется не завершать работу конструкции `switch-case`, а перейти к выполнению кода в следующем блоке `case`. Для этого в конце блока `case` указывается ключевое слово `fallthrough`. Представьте, что существует три уровня готовности к чрезвычайным ситуациям: **A**, **B** и **C**. Каждая степень предусматривает выполнение ряда мероприятий, причем каждый последующий уровень включает в себя мероприятия предыдущих уровней. В зависимости от переданного уровня необходимо вывести на консоль все предназначенные для выполнения мероприятия. При этом минимальный уровень готовности — это **C**, максимальный — **A** (включает в себя мероприятия уровней C и B). В случае возникновения ситуации **A** необходимо "Выключить все электрические приборы". **B** - "Закрыть входные двери и окна". **C** - "Соблюдать спокойствие"
 */

let levelOfWarning = "a"

switch levelOfWarning {
case "a", "A":
    print("Turn off all electric devices")
    fallthrough
case "b", "B":
    print("Close all windows and entrance doors")
    fallthrough
case "c", "C":
    print("Don't panic and don't forget a towel")
default:
    break
}

//: [Ранее: Задание 2](@previous)  |  задание 3 из 4  |  [Далее: Задание 4](@next)
