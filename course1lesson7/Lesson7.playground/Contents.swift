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

//: ### Использование инструкции Switch



//: ### Исходные значения



//: ### Инициализация



//: ### Связанные значения (ассоциированные параметры)



//: ### Сравение классов и структур



//: ### Методы в структурах


