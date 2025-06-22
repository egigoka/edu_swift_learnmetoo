//
//  Person.swift
//  RandomContacts
//
//  Created by egigoka on 22.06.2025.
//

struct Person {
    let name: String
    let surname: String
    let email: String
    let phoneNumber: String
}

extension Person {
    
    static func getRandomItems() -> [Person] {
        var persons: [Person] = []
        for _ in 0..<10 {
            persons.append(
                Person(
                    name: DataManager.names.remove(at: Int.random(in: 0..<10)),
                    surname: DataManager.names.remove(at: Int.random(in: 0..<10)),
                    email: DataManager.names.remove(at: Int.random(in: 0..<10)),
                    phoneNumber: DataManager.names.remove(at: Int.random(in: 0..<10))
                )
            )
        }
        return persons
    }
    
}

class DataManager {
    
    static var names = ["John", "Jane", "Robert", "Michael", "William",
                        "David", "Richard", "Charles", "Joseph", "Thomas"]
    static var surnames = ["Smith", "Johnson", "Williams", "Jones", "Brown",
                           "Davis", "Miller", "Wilson", "Moore", "Taylor"]
    static var emails = ["accountant@gmail.com", "engineer@gmail.com",
                         "designer@gmail.com", "developer@gmail.com",
                         "tester@gmail.com", "manager@gmail.com",
                         "sales@gmail.com", "writer@gmail.com",
                         "artist@gmail.com", "coder@gmail.com"]
    static var phoneNumbers = ["+77123456789", "+77876543210", "+77012345678",
                               "+77987654321", "+77567891234", "+77456789123",
                               "+77345678912", "+77234567891", "+77145678912",
                               "+77056789123"]
    
}
