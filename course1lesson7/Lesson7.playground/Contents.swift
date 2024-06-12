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
    if weekday == .monday || weekday == .tuesday {
        print("Today is \(weekday). The alarm is set to 8 am.")
    } else {
        print("Today is \(weekday). Alarm is not set.")
    }
}

setupAlarm(for: weekday)

//: ### Использование инструкции Switch

func setupAlarmV2(for weekday: Weekday) {
    switch weekday {
    case .monday:
        print("The alarm is set to 8 am.")
    case .tuesday:
        print("The alarm is set to 8-30 am.")
    case .wednesday:
        print("The alarm is set to 9 am.")
    case .thursday:
        print("The alarm is set to 7-30 am.")
    case .friday:
        print("Yay! Friday!")
    default:
        print("Weekend. The alarm is not set")
    }
}

setupAlarmV2(for: weekday)

//: ### Исходные значения

enum Countries: String {
    case usa = "USA"
    case ukraine = "Ukraine"
    case taiwan = "Taiwan"
}

let usa = Countries.usa

print("Case name: \(usa)")
print("Case value: \(usa.rawValue)")

enum WeekdayV2: String {
    case monday = "The alarm is set to 8 am"
    case tuesday = "The alarm is set to 8:30 am"
    case wednesday = "The alarm is set to 9 am"
    case thursday = "The alarm is set to 7:30 am"
    case friday = "Yay! Friday!"
    case saturday
    case sunday
}

var weekdayV2 = WeekdayV2.sunday
print(weekdayV2.rawValue)

if let taiwan = Countries(rawValue: "Taiwan"){
    print(taiwan.rawValue)
}


enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

let somePlanet = Planet.earth
print("Earth is the \(somePlanet.rawValue) planet of the Solar system")

//: ### Инициализация

if let possiblePlanet = Planet(rawValue: 7) {
    print("The seventh planet is \(possiblePlanet)")
}

//: ### Связанные значения (ассоциированные параметры)

enum WeekdayV3 {
    case workday(message: String, time: Int)
    case weekend(message: String)
}

let weekDayV3 = WeekdayV3.workday(message: "Set the alarm to", time: 8)

func setupAlarmV3(for weekday: WeekdayV3) {
    switch weekday {
    case let .workday(message, time):
        print("\(message) \(time)")
    case let .weekend(message):
        print("\(message)")
    }
}

setupAlarmV3(for: weekDayV3)


//: # Structures

let playerOne = "Player One"
let player1XPosition = 10
let player1YPosition = 5

let playerTwo = "Player Two"
let player2XPosition = 8
let player2YPosition = 3

func playersPosition(player: String, x: Int, y: Int) {
    print("The position of \(player): X: \(x), Y: \(y)")
}

playersPosition(player: playerOne, x: player1XPosition, y: player1YPosition)
playersPosition(player: playerTwo, x: player2XPosition, y: player2YPosition)

struct PositionOnMap {
    let player: String
    var x: Int
    let y: Int
    
    func printPlayerPosition() {
        print("The position of \(player): X: \(x), Y: \(y)")
    }
}

var playerOnePosition = PositionOnMap(player: playerOne, x: 10, y: 8)
var playerTwoPosition = PositionOnMap(player: playerTwo, x: 7, y: 5)

playerOnePosition.player
playerOnePosition.x = 7
playerOnePosition.y
playerOnePosition.printPlayerPosition()

//: ### Сравение классов и структур

class MacBook {
    var name: String
    let year: Int
    let color: String
    
    init(name: String, year: Int, color: String) {
        self.name = name
        self.year = year
        self.color = color
    }
    
    func printDescription() {
        print("\(name) \(year) \(color)")
    }
}

let macBookPro = MacBook(name: "MacBook Pro", year: 2020, color: "Space Gray")
macBookPro.printDescription()

let macBookAir = macBookPro
macBookAir.name = "MacBook Air"

macBookPro.printDescription()
macBookAir.printDescription()

struct IPhone {
    var name: String
    let color: String
    let capacity: Int
    
    func printDescription() {
        print("\(name) \(color) \(capacity)GiB")
    }
}

let iPhoneXR = IPhone(name: "iPhone XR", color: "Coral", capacity: 128)
var iPhone11 = iPhoneXR

iPhone11.name = "iPhone 11"

iPhoneXR.printDescription()
iPhone11.printDescription()

var someInt = 10
var anotherInt = 15

someInt = anotherInt
anotherInt = 20

//: ### Методы в структурах


