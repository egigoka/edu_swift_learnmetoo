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
            
            let name = DataManager.names.
            
            persons.append(Person(name: DataManager.names.randomElement() ?? , surname: <#T##String#>, email: <#T##String#>, phoneNumber: <#T##String#>
        }
    }
    
}

class DataManager {
    
    let names = ["John", "Jane", "Robert", "Michael", "William", "David", "Richard", "Charles", "Joseph", "Thomas"]
    let surnames = ["Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor"]
    let emails = ["accountant@gmail.com", "engineer@gmail.com", "designer@gmail.com", "developer@gmail.com", "tester@gmail.com", "manager@gmail.com", "sales@gmail.com", "writer@gmail.com", "artist@gmail.com", "coder@gmail.com"]
    let phoneNumbers = ["+79123456789", "+79876543210", "+79012345678", "+79987654321", "+79567891234", "+79456789123", "+79345678912", "+79234567891", "+79145678912", "+79056789123"]
    
}
