import UIKit

//: ## Home Work 5
/*:
 ### Задание 1
 Создайте словарь, который содержит результаты игр спортивной команды в чемпионате (например по хоккею). Ключом словаря должно быть название команды соперника, а в качестве значения должен быть массив с результатами игр с этим соперником. Необходимо вывести на консоль результаты игр. Выглядить это должно примерно следующим образом:
 
 - Игра с Салават Юлаев - 3:6
 
 - Игра с Салават Юлаев - 5:5
 
 - Игра с Авангард - 2:1
 
 - Игра с Авангард - 2:3
 
 - Игра с АкБарс - 3:3
 
 - Игра с АкБарс - 1:2
 */

let games = [
    "Salavat Yulaev": ["3:6", "5:5"],
    "Avangard": ["2:1", "2:3"],
    "AkBars": ["3:3", "1:2"]
]

for (name, results) in games {
    for result in results{
        print("Game with \(name) - \(result)")
    }
}

/*:
 ### Задание 2
 2.1 Создайте функцию, которая считает общую сумму денег, хранящихся в кошельке. В кошельке имеются купюры различного достоинства от 50 до 5000 рублей
 */

func totalMoneyInWallet(bills: [Int:Int]) -> Int {
    var total = 0
    
    for (value, count) in bills {
        total += value * count
    }
    
    return total
}

//: 2.2 Заполните массив различными купюрами и подсчитайте общую сумму

let wallet = [
    10000: 20,
    5000: 3,
    2000: 1,
    1000: 1,
    500: 3,
    200: 2,
    100: 1,
    50: 1,
    20: 3,
    10: 4,
    5: 1,
    1: 3
]

totalMoneyInWallet(bills: wallet)
/*:
 ### Задание 3
 3.1 Создайте функцию, которая определяет является ли число четным или нет. В случае, если число является четным, функция должна возвращать `true`. Иначе - `false`. Подумайте над названием функции, оно должно быть ёмким и в то же время не очень длинным
 */

func isEven(_ int:Int) -> Bool {
    int%2 == 0
}

/*:
3.2 Создайте функцию, которая определяет делится ли число на *3* без остатка. Функция так же должна возвращать булево значение. Так же подумайте над названием функции
*/

func isDividableByThree(_ int: Int) -> Bool {
    int%3 == 0
}

/*:
 3.3 Создайте функцию, которая создает возрастающий массив чисел в интервале от *x* до *y*. Данный интервал должен определять пользователь при вызове функции. Если хотите усложить задание, то пусть данная функция создает массив случайных чисел в заданном интервале с уникальными значениями
 */

func createArrayOfInts(from start: Int, to end: Int) -> [Int] {
    var output: [Int] = []
    
    var currentPosition = start
    
    while currentPosition <= end {
        output.append(currentPosition)
        currentPosition += 1
    }
    
    return output
    
}

/*:
3.4 Создайте массив чисел от *1* до *100*, используя для этого вышесозданную функцию
 */

let arrayOfints = createArrayOfInts(from: 1, to: 100)

/*:
 3.5 Создайте функции для удаления всех четных чисел из массива и чисел, которые делятся на *3*. Для определения четного числа и числа которое делится на *3* используейте ранее созданные функции из задания **3.1** и **3.2**.
 */

func filterArrayWithClosure(_ input: [Int], closure: (Int) -> Bool) -> [Int] {
    var output: [Int] = []
    
    for number in input {
        if !closure(number) {
            output.append(number)
        }
    }
    
    return output
}

var smallerArrayOfInts = filterArrayWithClosure(arrayOfints, closure: isEven)
print(smallerArrayOfInts)

smallerArrayOfInts = filterArrayWithClosure(smallerArrayOfInts, closure: isDividableByThree)
print(smallerArrayOfInts)
