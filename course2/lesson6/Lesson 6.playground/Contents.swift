import UIKit

//: ## Протоколы



//: ### CustomStringConvertable

let string = "Hello, world!"
print(string)

let number = 10
print(number)

let bool = true
print(bool)

class Shoes: CustomStringConvertible {
    
    let color: String
    let size: Int
    let hasLaces: Bool
    
    var description: String {
        "Shoes(color: \"\(color)\", size: \(size), hasLaces: \(hasLaces))"
    }
    
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
    
    
}

let myShoes = Shoes(color: "Brown", size: 41, hasLaces: true)
print(myShoes)

//: ### Equatable

struct Employee {
    let firstName: String
    let lastName: String
    let jobTitle: String
    let phoneNumber: String
}

let employees = [
    Employee(
        firstName: "Alexey",
        lastName: "Efimov",
        jobTitle: "Teacher",
        phoneNumber: "+7-777-777-77-77"),
    Employee(
        firstName: "Ivan",
        lastName: "Akulov",
        jobTitle: "Head",
        phoneNumber: "+7-777-888-88-88"),
    Employee(
        firstName: "Ivan",
        lastName: "Danilin",
        jobTitle: "Teacher",
        phoneNumber: "+7-777-999-99-99")
]

//: ### Comparable
 


//: ### Создание собственного протокола



//: ### Делегирование


