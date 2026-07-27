//
//  UserNameText.swift
//  Lesson2
//
//  Created by egigoka2kz on 21.07.2026.
//

import SwiftUI

struct UserNameText: View {
    var userName: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("USER NAME: ")
            Text(userName)
                .font(.largeTitle)
            Spacer()
        }
    }
}

#Preview {
    UserNameText(userName: "TEST")
}
