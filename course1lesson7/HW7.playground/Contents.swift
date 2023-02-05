import UIKit

//: # Home Work 7

/*:
 ## Задание 1
 1.1 Создайте перечисление `CalculationType`, содержащее четыре математических действия — *сложение*, *вычитание*, *умножение* и *деление* (если не знаете английские наименования — [translate.google.com](http://translate.google.com))
 */

enum CalculationType {
    case addtiton
    case subtraction
    case multiplication
    case division
}

//: 1.2 Напишите функцию возвращающую `Int` и принимающую в качестве аргументов три переменные: число один, число два и тип математической операции. Внутри функции, в зависимости от значения переменной типа `CalculationType` выполните соответствующую математическую операцию с константами и верните результат. Для перебора всех возможных результатов используйте конструкцию `switch`. Присвойте своей функции такое название, что бы из него было понятно для чего служит эта функция, но при этом сделайте это имя максимально лаконичным.

func calculate(operation: CalculationType,
               for numberOne: Int,
               and numberTwo: Int) -> Int? {
    var result = numberOne

    switch operation {
    case .addtiton: result += numberTwo
    case .subtraction: result -= numberTwo
    case .multiplication: result *= numberTwo
    case .division:
        if numberTwo == 0 {
            print("Division by zero.")
            return nil
        }
        result /= numberTwo
    }

    print("Result of \(operation) with numbers \(numberOne)"
          + "and \(numberTwo) is \(result)")

    return result
}

//: 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности. Постарайтесь сделать реализацию максимально гибкой — такой, что бы результат вывода можно было легко изменить, поменяв значения переменных. Доработайте функцию так, что бы при каждом её вызове на консоль выводился результат следующего содержания: «Результат сложения (вычитания, деления, умножения) <…> и <…> равен <…>» для каждого отдельного случая.

let numberOne = 10
let numberTwo = 3
var result: Int? = 0

result = calculate(operation: .addtiton, for: numberOne, and: numberTwo)
result = calculate(operation: .subtraction, for: numberOne, and: numberTwo)
result = calculate(operation: .multiplication, for: numberOne, and: numberTwo)
result = calculate(operation: .division, for: numberOne, and: numberTwo)

print()

/*:
 ## Задание 2
 2.1 Создайте перечисление `CurrencyUnit` со следующими членами: `rouble`, `dollar`, `euro`.
 
 
 2.2 Внутри перечисления `CurrencyUnit` создайте еще одно перечисление `DollarCountrys`, в котором содержиться перчень стран, национальной валютой которых является доллар (USA, Canada, Australia)
 
 
 2.3 Рубль и Евро должны иметь типы связанных значений следующего вида: `([String], String)`, где массив должен содержать перечень тех стран, в которых используется валюта, а тип стринг - сокращенное наименование валюты.
 
 
 2.4 Доллар должен иметь на один ассоциативный параметр больше, в соответствии с перечислением `DollarCountrys`. Например если взять доллар США, то список стран, где использоуется данная валюта может быть таким: США, Доминиканская республика и т.д. Сокращенное наименование валюты: USD. Страна где печатается валюта: USA. Тогда как для рубля и евро нужно будет определить только список стран и аббривиатуру валюты.
 */

enum CurrencyUnit {

    enum DollarCountries: String {
        case usa = "USA"
        case canada = "Canada"
        case australia = "Australia"
    }

    case hryvnia(countriesUsing: [String], currencyCode: String)
    case dollar(countriesUsing: [String],
                currencyCode: String,
                countryEmitent: DollarCountries)
    case euro(countriesUsing: [String], currencyCode: String)

}

/*:

 2.5 Создайте переменную `roubleCurrency` и присвойте ей соответствующие значения
 
 
 2.6 Создайте переменную someCurrency и присвойете ей значения относящиеся к доллару
 */

let hryvniaCurrency = CurrencyUnit.hryvnia(countriesUsing: ["Ukraine"],
                                          currencyCode: "UAH")
let someCurrency = CurrencyUnit.dollar(countriesUsing: ["USA", "Puerto Rico"],
                                       currencyCode: "USD",
                                       countryEmitent: .usa)

//: 2.7 Используя ветвление `switch` выведите на коносль сообщение в котором описано что за валюта, в каких странах катируется, короткое наименование.

func printCurrencyDescription(currency: CurrencyUnit) {
    switch currency {
    case let .hryvnia(countriesUsing, currencyCode),
         let .euro(countriesUsing, currencyCode):
        let countries = countriesUsing.joined(separator: ", ")
        print("Currency is used in: \(countries), "
              + "currency code: \(currencyCode)")
    case let .dollar(countriesUsing, currencyCode, countryEmitent):
        let countries = countriesUsing.joined(separator: ", ")
        print("Dollar is used in: \(countries), "
              + "currency code: \(currencyCode), "
              + "emitent is \(countryEmitent.rawValue)")
    }
}

printCurrencyDescription(currency: hryvniaCurrency)
printCurrencyDescription(currency: someCurrency)
print()

/*:
 ## Задание 3
 3.1 Создайте структуру `Car` со следующими элементами:
 - `name: String`
 - `porductionYear: Int`
 - `horsePower: Int`
 */

struct Car {
    var name: String
    let productionYear: Int
    var horsePower: Int
}

//: 3.2 Создайте экземпляр структуры `Car` с названием какого либо автомобильного бренда, например `honda`.

let honda = Car(name: "Honda Accord", productionYear: 2020, horsePower: 134)

//: 3.3 Создайте копию экземпляра `honda`, например, `hondaCivic`

var hondaCivic = honda

//: 3.4 Присвойте новое значение переменной name структуры `hondaCivic`

hondaCivic.name = "Honda Civic"

//: 3.5 Создайте цикл с пятью итерациями, в котором в каждой итерации необходимо увеличивать значение horsePower у структуры hondaCivic на единицу

for _ in 1...5 {
    hondaCivic.horsePower += 1
}

//: 3.6 Выведите значения структур `honda` и `hondaCivic` на консоль в следующем виде: "Мощность двигателя <..> составляет <...> л.с."

for car in [honda, hondaCivic] {
    print("Power of \(car.name) is \(car.horsePower)HP")
}
 print()
/*:
 ## Задание 4
 4.1 Создайте структуру `PlayerInChess`, в которой есть два свойства: `name` с типом `Sting` и `wins` с типом `Int`
 
 4.2 Создайте экзмепляр струкутуры и инициализируйте её свойства
 
 4.3 Расширьте структуру PlayerInChess методом description, который должен выводить на консоль имя игрока и количество его побед

 4.4 Вызвите данный метод из экземпляра структуры
  */

struct PlayerInChess {
    let name: String
    var wins: Int

    mutating func addWins(count: Int) {
        wins += count
    }

    func printDescription() {
        print("Player \"\(name)\" has won \(wins) games")
    }
}

var playerInChess = PlayerInChess(name: "John", wins: 10)
playerInChess.printDescription()

/*:
4.5 Расширте структуру методом addWins, который должен принимать целочисленное значение и увеличивать количество побед на это значение.

4.6 Вызовите метода addWins из экземпляра структуры, затем вызовите метод description
*/

playerInChess.addWins(count: 10)
playerInChess.printDescription()
