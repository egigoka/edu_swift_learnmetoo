//
//  DetailsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct DetailsList: View {
    let persons: [Person]
    
    var body: some View {
        List(persons) { person in
            Section(person.fullName) {
                <#code#>
            }
        }
    }
}

struct DetailInfo: View {
    var body: some View {
        
    }
}

#Preview {
    DetailsList()
}
