//
//  DataManager.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//
import Foundation

class DataManager {
    static let shared = DataManager()
    
    private let names = ["Bruce", "John", "Mark", "Steve", "Bill",
        "Tony", "Lisa", "Tina", "Karen", "Shlorp"]
    private let surnames = ["Wayne", "Snow", "Musk", "Wozniak", "Gates",
                    "Rogers", "Simpson", "Johnson", "White", "Black"]
    private let phones = ["4155550101", "2125550199", "3105550123",
                  "6465550177", "4085550142", "6175550188",
                  "2025550110", "3055550166", "7025550135",
                  "7136661246"]
    private let emails = [
        "bruce.wayne@wayneenterprises.com",
        "john.snow@winterfell.org",
        "mark.musk@spacemail.io",
        "steve.wozniak@applefan.net",
        "bill.gates@contoso.com",
        "tony.rogers@avengersmail.com",
        "lisa.simpson@springfield.edu",
        "tina.johnson@examplemail.com",
        "karen.white@whiteco.org",
        "karen.black@blackinc.co"
    ]
    
    private init() {}
    
    func generateContacts() -> [Person] {
        var names = names
        var surnames = surnames
        var phones = phones
        var emails = emails
        
        var persons: [Person] = []
        
        for _ in 0..<names.count {
            persons.append(Person(
                id: UUID().uuidString,
                name: names.remove(at: Int.random(in: 0..<names.count)),
                surname: surnames.remove(at: Int.random(in: 0..<surnames.count)),
                phone: phones.remove(at: Int.random(in: 0..<phones.count)),
                email: emails.remove(at: Int.random(in: 0..<emails.count))
            ))
        }
        
        return persons
    }
    
    func generateContact() -> Person {
        Person(
            id: UUID().uuidString,
            name: names[Int.random(in: 0..<names.count)],
            surname: surnames[Int.random(in: 0..<surnames.count)],
            phone: phones[Int.random(in: 0..<phones.count)],
            email: emails[Int.random(in: 0..<emails.count)]
        )
    }
}

