//
//  DataManager.swift
//  RandomContacts
//
//  Created by egigoka on 29.06.2025.
//

class DataManager {
    
    static let shared = DataManager()
    
    var names = ["John", "Jane", "Robert", "Michael", "William",
                        "David", "Richard", "Charles", "Joseph", "Thomas"]
    var surnames = ["Smith", "Johnson", "Williams", "Jones", "Brown",
                           "Davis", "Miller", "Wilson", "Moore", "Taylor"]
    var emails = ["accountant@gmail.com", "engineer@gmail.com",
                         "designer@gmail.com", "developer@gmail.com",
                         "tester@gmail.com", "manager@gmail.com",
                         "sales@gmail.com", "writer@gmail.com",
                         "artist@gmail.com", "coder@gmail.com"]
    var phoneNumbers = ["+77123456789", "+77876543210", "+77012345678",
                               "+77987654321", "+77567891234", "+77456789123",
                               "+77345678912", "+77234567891", "+77145678912",
                               "+77056789123"]
    
    func getRandomPeople() -> [Person] {
        var persons: [Person] = []
        for _ in 0..<10 {
            let max = names.count
            persons.append(
                Person(
                    name: names.remove(at: Int.random(in: 0..<max)),
                    surname: surnames.remove(at: Int.random(in: 0..<max)),
                    email: emails.remove(at: Int.random(in: 0..<max)),
                    phoneNumber: phoneNumbers.remove(at: Int.random(in: 0..<max))
                )
            )
        }
        return persons
    }
    
    private init() {}
}
