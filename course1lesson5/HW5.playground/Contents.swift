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

let teamsGamesResults = [
    "Toronto Maple Leafs": ["1:2", "3:2"],
    "Chicago Blackhawks": ["2:0"],
    "Montreal Canadiens": ["7:16", "8:3", "0:0"]
]

for (clubName, gameResults) in teamsGamesResults {
    for gameResult in gameResults {
        print("Game with \(clubName) - \(gameResult)")
    }
}

/*:
 ### Задание 2
 2.1 Создайте функцию, которая считает общую сумму денег, хранящихся в кошельке. В кошельке имеются купюры различного достоинства от 50 до 5000 рублей
 */

func countMoney(_ currency: [Int: Int]) -> Int {
    var total = 0
    
    for (value, count) in currency {
        total += value * count
    }
    return total
}

//: 2.2 Заполните массив различными купюрами и подсчитайте общую сумму

let cash = [1: 7, 10: 1, 50: 3, 200: 3, 1000: 3, 2000: 1, 5000:60]

print(countMoney(cash))

/*:
 ### Задание 3
 3.1 Создайте функцию, которая определяет является ли число четным или нет. В случае, если число является четным, функция должна возвращать `true`. Иначе - `false`. Подумайте над названием функции, оно должно быть ёмким и в то же время не очень длинным
 */

func isEven(number: Int) -> Bool {
    number % 2 == 0
}

/*:
 3.2 Создайте функцию, которая определяет делится ли число на *3* без остатка. Функция так же должна возвращать булево значение. Так же подумайте над названием функции
 */

func isDivisibleByThree(number: Int) -> Bool {
    number % 3 == 0
}

/*:
 3.3 Создайте функцию, которая создает возрастающий массив чисел в интервале от *x* до *y*. Данный интервал должен определять пользователь при вызове функции. Если хотите усложить задание, то пусть данная функция создает массив случайных чисел в заданном интервале с уникальными значениями
 */

func createArray(from start: Int, to end: Int) -> [Int] {
    var arrayOfNumbers: [Int] = []
    
    for currentNumber in start...end {
        arrayOfNumbers.append(currentNumber)
    }
    arrayOfNumbers.shuffle()
    
    return arrayOfNumbers
}

/*:
 3.4 Создайте массив чисел от *1* до *100*, используя для этого вышесозданную функцию
 */

var arrayOfNumbers = createArray(from: 1, to: 100)

/*:
 3.5 Создайте функции для удаления всех четных чисел из массива и чисел, которые делятся на *3*. Для определения четного числа и числа которое делится на *3* используейте ранее созданные функции из задания **3.1** и **3.2**.
 */

func removeByClosure(numbers: [Int], closure: (Int) -> Bool) -> [Int] {
    var outputNumbers: [Int] = []
    
    for number in numbers {
        if !closure(number){
            outputNumbers.append(number)
        }
    }
    return outputNumbers
}

var someNumbers = arrayOfNumbers
var someAnotherNumbers = arrayOfNumbers
var anotherArrayOfNumbers = arrayOfNumbers

arrayOfNumbers = removeByClosure(numbers: arrayOfNumbers, closure: isEven)
arrayOfNumbers = removeByClosure(numbers: arrayOfNumbers,
                                 closure: isDivisibleByThree)
print(arrayOfNumbers)

someNumbers = removeByClosure(numbers: someNumbers) { $0 % 2 == 0 }
someNumbers = removeByClosure(numbers: someNumbers) { $0 % 3 == 0 }

someAnotherNumbers = removeByClosure(numbers: someAnotherNumbers) { number in
    number % 2 == 0
}

// inout parameter

func removeByClosureV2(numbers: inout [Int], closure: (Int) -> Bool) {
    for number in numbers {
        if closure(number), let index = numbers.firstIndex(of: number) {
            numbers.remove(at: index)
        }
    }
}

print(anotherArrayOfNumbers.count)
removeByClosureV2(numbers: &anotherArrayOfNumbers) { $0 % 3 == 0 }
print(anotherArrayOfNumbers.count)

func removeByClosureV3(numbers: [Int], closure: (Int) -> Bool) -> [Int] {
    numbers.filter { !closure($0) }
}

anotherArrayOfNumbers = removeByClosureV3(numbers: anotherArrayOfNumbers) { $0 % 2 == 0}
print(anotherArrayOfNumbers.count)

anotherArrayOfNumbers = anotherArrayOfNumbers.filter() { $0 % 5 != 0}
print(anotherArrayOfNumbers.count)

anotherArrayOfNumbers.removeAll() { $0 % 7 == 0 }
print(anotherArrayOfNumbers.count)
