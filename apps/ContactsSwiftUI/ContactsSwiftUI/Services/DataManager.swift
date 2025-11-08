//
//  DataManager.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//
import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    let names = ["Bruce", "John", "Mark", "Steve", "Bill",
        "Tony", "Lisa", "Tina", "Karen", "Shlorp"]
    let surnames = ["Wayne", "Snow", "Musk", "Wozniak", "Gates",
                    "Rogers", "Simpson", "Johnson", "White", "Black"]
    let phones = ["4155550101", "2125550199", "3105550123",
                  "6465550177", "4085550142", "6175550188",
                  "2025550110", "3055550166", "7025550135",
                  "7136661246"]
    let emails = [
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
}
