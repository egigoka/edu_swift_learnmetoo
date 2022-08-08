import Foundation

/*:
 ### Задание 4
 С помощью блоков `case` вы определяете возможные значения, которые может принять выражение. Однако Swift позволяет в пределах одного блока case указать не только на значение рассматриваемого параметра, но и на зависимость от какого-либо условия. Данный функционал реализуется с помощью ключевого слова `where` в блоке `case`. В этом задании вам необходимо отсортировать конфеты **M&M's** по цвету и по начинке. В первую кучку нужно собрать красные конфеты с шоколадом внутри. Во вторую кучку собирите все желтые конфеты с орехами. А втретью кучку коричневые и зеленые с шоколадом внутри. Нужно реализовать только логику для сортировки конфет.
 
 */

//let color = "red"
//let color = "yellow"
let color = "brown"
//let color = "green"
let filling = "choco"
//let filling = "nuts"

switch color {
case "red" where filling == "choco":
    print("Red with chocolate, goes to pile one")
case "yellow" where filling == "nuts":
    print("Yellow with nuts, goes to pile two")
case "brown" where filling == "choco", "green" where filling == "choco":
    print("Brown or green with chocolate, goes to pile three")
default:
    print("Unknown combination, goes to \"unknown\" pile")
}

//: [Ранее: Задание 3](@previous)  |  задание 4 из 4  |
