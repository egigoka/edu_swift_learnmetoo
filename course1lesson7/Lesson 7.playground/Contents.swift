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
    case wenesday
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
    case .wenesday:
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

//: ### Инициализация



//: ### Связанные значения (ассоциированные параметры)



//: ## Структуры



/*:
    struct StructureName {
        var nameOfVarioable: DataType
        func someFunction {
            some code
        }
    }
 
 */



//: ### Сравение классов и структур



//: ### Методы в структурах


