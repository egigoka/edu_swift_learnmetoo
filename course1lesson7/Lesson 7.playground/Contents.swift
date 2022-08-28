import UIKit

//: # Lesson 7

//: ## Перечисления

var someDay = "Monday"

func setupAlarm(for day: String) {
    if day == "Monday" || day == "Tuesday" {
        print("Today is \(day). The alarm is set at 8 am.")
    } else {
        print("Today is \(day). Alarm not set.")
    }
}

setupAlarm(for: someDay)

someDay = "tuesday"

setupAlarm(for: someDay)

/*:
    enum EnumerationName {
        case enumeration
    }
 
 */

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

var weekday = Weekday.monday
weekday = .friday

func setupAlarm(for weekday: Weekday) {
    switch weekday {
    case .monday:
        print("Alarm is set to 8 am.")
    case .tuesday:
        print("Alarm is set to 8 am.")
    case .wednesday:
        print("Alarm is set to 8 am.")
    case .thursday:
        print("Alarm is set to 8 am.")
    case .friday:
        print("Yay! The last day of the week!")
    default:
        print("Weekend. Alerm is not set")
    }
}

setupAlarm(for: weekday)
print()

//: ### Использование инструкции Switch



//: ### Исходные значения

enum Countries: String {
    case usa = "USA"
    case ukraine = "Ukraine"
    case taiwan = "Taiwan"
}

let usa = Countries.usa
print("case name: \(usa)")
print("case value: \(usa.rawValue)")

enum WeekdayVer2: String {
    
    case monday = "The alarm is set to 8 am"
    case tuesday = "The alarm is set to 8:30 am"
    case wednesday = "The alarm is set to 9 am"
    case thursday = "The alarm is set to 7:30 am"
    case friday = "Yay! The last day of the week"
    case saturday
    case sunday
}

var weekdayVer2 = WeekdayVer2.sunday

if let ukraine = Countries(rawValue: "Ukraine") {
    print(ukraine.rawValue)
}

print("case name: \(weekdayVer2)")
print("case value: \(weekdayVer2.rawValue)")
print()

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var somePlanet = Planet.earth
print("Earth is the \(somePlanet.rawValue) planet from the Sun")

//: ### Инициализация

if let possiblePlanet = Planet(rawValue: 7) {
    print("The seventh planet is \(possiblePlanet)")
}
//: ### Связанные значения (ассоциированные параметры)

enum WeekdayVer3 {
    case workday(message: String, time: Int)
    case weekend(message: String)
}

let weekDayVer3 = WeekdayVer3.workday(message: "Set alarm to" , time: 8)

func setupAlarmVer2(for weekday: WeekdayVer3) {
    switch weekday {
    case let .workday(message, time):
        print("\(message) \(time)")
    case let .weekend(message):
        print(message)
    }
}

setupAlarmVer2(for: weekDayVer3)

//: ## Структуры

let playerOne = "Player One"
var player1XPosition = 10
var player1YPosition = 5

let playerTwo = "Player Two"
var player2XPosition = 8
var player2YPosition = 3

func playersPosition(player: String, x: Int, y: Int) {
    print("The position of \(player): X\(x):Y\(y)")
}

playersPosition(player: playerOne, x: player1XPosition, y: player1YPosition)
playersPosition(player: playerTwo, x: player2XPosition, y: player2YPosition)

struct PositionOnMap {
    let player: String
    var x: Int
    var y: Int
    
    func printPlayerPosition () {
        print("The position of \(player): X\(x):Y\(y)")
    }
}


var playerOnePosition = PositionOnMap(player: playerOne, x: 10, y: 8)
var playerTwoPosition = PositionOnMap(player: playerTwo, x: 7, y: 5)

playerOnePosition.player
playerOnePosition.x = 7
playerOnePosition.y
playerOnePosition.printPlayerPosition()

/*:
    struct StructureName {
        var nameOfVarioable: DataType
        func someFunction {
            some code
        }
    }
 
 */



//: ### Сравение классов и структур

class MacBook {
    var name: String
    var year: Int
    var color: String
    
    init(name: String, year: Int, color: String) {
        self.name = name
        self.year = year
        self.color = color
    }
    
    func printDescription() {
        print("\(name) \(year) \(color)")
    }
}

let macBookPro = MacBook(name: "MacBook Pro", year: 2022, color: "Space Gray")


let macBookAir = macBookPro
macBookPro.name = "MacBook Air"
macBookPro.printDescription()
macBookAir.printDescription()

struct IPhone {
    var name: String
    var color: String
    var capacity: Int
    
    func printDescription() {
        print("\(name) \(color) \(capacity)GiB")
    }
}

let iPhoneXR = IPhone(name: "iPhone XR", color: "Coral", capacity: 128)
var iPhone11 = iPhoneXR
iPhone11.name = "iPhone 11"

iPhoneXR.printDescription()
iPhone11.printDescription()
//: ### Методы в структурах



