import UIKit

//: # Home Work 7

/*:
 ## Задание 1
 1.1 Создайте перечисление `CalculationType`, содержащее четыре математических действия — *сложение*, *вычитание*, *умножение* и *деление* (если не знаете английские наименования — [translate.google.com](http://translate.google.com))
 */

enum CalculationType {
    case addition
    case subtraciton
    case multiplication
    case division
}

//: 1.2 Напишите функцию возвращающую `Int` и принимающую в качестве аргументов три переменные: число один, число два и тип математической операции. Внутри функции, в зависимости от значения переменной типа `CalculationType` выполните соответствующую математическую операцию с константами и верните результат. Для перебора всех возможных результатов используйте конструкцию `switch`. Присвойте своей функции такое название, что бы из него было понятно для чего служит эта функция, но при этом сделайте это имя максимально лаконичным.

func calculate(_ numberOne: Int, 
               and numberTwo: Int,
               operation: CalculationType) -> Int {
    
    let result: Int
    let operationDescription: String
    
    switch operation {
    case .addition:
        result = numberOne + numberTwo
        operationDescription = "addition"
    case .subtraciton:
        result = numberOne - numberTwo
        operationDescription = "subtraction"
    case .multiplication:
        result = numberOne * numberTwo
        operationDescription = "multiplication"
    case .division:
        result = numberOne / numberTwo
        operationDescription = "division"
    }
    
    print("Result of \(operationDescription) of \(numberOne) and \(numberTwo) "
          + "is \(result)")
    
    return result
}

//: 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности. Постарайтесь сделать реализацию максимально гибкой — такой, что бы результат вывода можно было легко изменить, поменяв значения переменных. Доработайте функцию так, что бы при каждом её вызове на консоль выводился результат следующего содержания: «Результат сложения (вычитания, деления, умножения) <…> и <…> равен <…>» для каждого отдельного случая.

calculate(7, and: 3, operation: .addition)
calculate(10, and: 3, operation: .subtraciton)
calculate(5, and: 2, operation: .multiplication)
calculate(50, and: 5, operation: .division)

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
        case dominicanRepublic = "Dominican republic"
    }
    
    case hryvnia ([String], String)
    case dollar ([String], String, DollarCountries)
    case euro ([String], String)
}


/*:

 2.5 Создайте переменную `roubleCurrency` и присвойте ей соответствующие значения
 
 
 2.6 Создайте переменную someCurrency и присвойете ей значения относящиеся к доллару
 */

let hryvniaCurrency = CurrencyUnit.hryvnia(["Ukraine"], "UAH")
let someCurrency = CurrencyUnit.dollar(["USA", "Panama", "Zimbabwe"], "USD", .usa)

//: 2.7 Используя ветвление `switch` выведите на коносль сообщение в котором описано что за валюта, в каких странах катируется, короткое наименование.

func currencyDescription(currency: CurrencyUnit) {
    switch currency {
    case .hryvnia(let countries, let abbreviation),
            .euro(let countries, let abbreviation):
        print("Currency \(abbreviation) is used in this countries: "
              + "\(countries.joined(separator: ", "))")
    case .dollar(let countries, let abbreviation, let dollarCountry):
        print("Currency \(dollarCountry.rawValue) dollar is "
              + "used in this countries: "
              + "\(countries.joined(separator: ", "))")
    }
}

currencyDescription(currency: hryvniaCurrency)
currencyDescription(currency: someCurrency)
 
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

let honda = Car(name: "Honda", productionYear: 2010, horsePower: 150)


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
    print("Engine power of \(car.name) is \(car.horsePower) hp")
}
 
/*:
 ## Задание 4
 4.1 Создайте структуру `PlayerInChess`, в которой есть два свойства: `name` с типом `Sting` и `wins` с типом `Int`
 
 4.2 Создайте экзмепляр струкутуры и инициализируйте её свойства
 
 4.3 Расширьте структуру PlayerInChess методом description, который должен выводить на консоль имя игрока и количество его побед

 4.4 Вызвите данный метод из экземпляра структуры
  */

struct PlayerInChess {
    let name: String
    let wins: String
    
    func description() {
        print("")
    }
    
}

let playerOne = PlayerInChess(name: "Igor", wins: 0)

/*:
4.5 Расширте структуру методом addWins, который должен принимать целочисленное значение и увеличивать количество побед на это значение.

4.6 Вызовите метода addWins из экземпляра структуры, затем вызовите метод description
*/


