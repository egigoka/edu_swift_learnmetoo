import UIKit

//: ## Home work 3

/*:
 ### Задание 1
 Представьте, что вы владелец розничного магазина и вам необходимо закупить товар, стоимость которого варьируется от его количества. Если количество закупаемого товара меньше 10 позиций, то цена равна 1000 рублей за штуку. От 10 до 20 единиц товара будет стоить вам 800 рублей за штуку. И вы заплатите 600 рублей за единцу при единовременно покупке от 20 единиц. Создайте условие для расчета цены за еденицу товара в зависмости от его количества и подсичитайте общую сумму используя конструкцию `if-else`. Постарайтесь написать короткое и читаемое решение
 */

let qty = 11
var price = 0
var totalSum = 0

if qty < 10 {
    price = 1000
} else if qty < 20 {
    price = 800
} else {
    price = 600
}

totalSum = qty * price

print("Quantity: \(qty), price: \(price), total: \(totalSum)")

//: |  задание 1 из 4  |  [Далее: Задание 2](@next)
