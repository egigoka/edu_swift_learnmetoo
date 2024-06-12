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

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluton
}



//: ### Инициализация



//: ### Связанные значения (ассоциированные параметры)



//: ### Сравение классов и структур



//: ### Методы в структурах


