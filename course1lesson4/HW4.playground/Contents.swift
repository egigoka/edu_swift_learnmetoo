import UIKit
//: ## Home Work 4

/*:
 ### Задание 1
 1.1 Пользователь открывает вклад (deposit) в банке на 5 лет на сумму 500 тыс. 
 рублей. Процентная ставка годовых (rate) составляет 11%. Необходимо просчитать
 сумму дохода (profit) по окончании срока действия (period) вклада.  Для
 решения данной задачи используйет цикл for-in. Примечание: сумма вклада
 увеличивается с каждым годом и процент нужно считать уже от увелеченной суммы.
 
 1.2 Выведите результат на консоль в таком виде: "Сумма вклада через <... > лет 
 увеличится на <...> и составит <...>"
 */

var deposit = 500000.0
let initialDeposit = deposit
let rate = 0.11
let period = 5

// Ensure input values are valid
if period > 0 && rate > 0 && deposit > 0 {
    // Compute the final deposit using for-in loop
    for _ in 1...period {
        // Multiply deposit balance by (1 + rate) to get balance at the end of 
        // the year
        deposit *= 1.0 + rate
    }
    
    let profit = deposit - initialDeposit
    
    // Output final results with formatted financial values
    print("Deposit amount after \(period) years will increase by "
          + "\(String(format: "%.2f", profit)) and "
          + "will be \(String(format: "%.2f", deposit))")
} else {
    print("Invalid input values. Deposit, rate, and period must be positive.")
}

/*:
 ### Задание 2
 2.1 Создайте целочисленные переменные `base` и `power` с любым значениями на ваше усмотрение.
 
 2.2 При помощи цикла `for in` возведите переменную `base` в степень `power` и присвойте результат переменной `result`
 
 2.3 Выведите результат на консоль в следующем виде: «<…> в <…> степени равно <…>»
 */

let base = 3
let power = 2
var result = 1

if power < 0 {
    print("Negative powers are not supported.")
} else {
    for _ in 1...power {
        result *= base
    }
    print("\(base) to the power of \(power) equals \(result)")
}

/*:
 ### Задание 3
 3.1 Создайте целочисленный массив данных с любым набором чисел.
*/

let numbers = [1,69,42,420]

//: 3.2 Выведите на консоль все четные числа из массива

for number in numbers {
    if number % 2 == 0 {
        print("even \(number)")
    }
}

//: 3.3 Используя оператор Continue выведите на консоль все нечетные числа из массива. Оператор continue предназначен для перехода к очередной итерации, игнорируя следующий за ним код. Т.е. вам нужно выполнить проверку на четность числа, и если оно оказалось четным перейти к следующей итерации.

for number in numbers {
    if number % 2 == 0 {
        continue
    }
    print("odd \(number)")
}

//: ### Задание 4
//: 4.1 Создайте цикл (интревал можно задать от 1 до 10) в котором будет случайным образом вычисляться число в пределах от 1 до 10. Если число будет равно 5, выведите на коносль сообщение с номером итерации, например (Что бы выпало число 5 понадобилось 3 итерации) и остановите цикл. Для остановки цикла используйте оператор breack. Оператор break предназначен для досрочного завершения работы цикла. При этом весь последующий код в теле цикла игнорируется.

for counter in 1...10 {
    let randomNumber = Int.random(in: 1...10)
    if randomNumber == 5 {
        print("To get random number equal 5 we tried \(counter) times")
        break
    }
}

/*:
 ### Задание 5
  5.1 На 10 метровый столб лезет черепашка. За день она забирается на два метра, за ночь съезжает на 1. Определите при помощи цикла, через сколько дней она заберетсья на столб. Подумайте над тем, какой цикл использовать в этой ситуации.
 */

var progress = 0
var daysPassed = 0

while progress < 10 {
    daysPassed += 1
    progress += 2
    if progress >= 10 {
        break
    }
    progress -= 1
}

print("To get to the top of the pole turtle wasted \(daysPassed) days")
