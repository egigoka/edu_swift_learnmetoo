//
//  UserNameText.swift
//  Lesson2
//
//  Created by egigoka2kz on 21.07.2026.
//

import SwiftUI

struct UserNameText: View {
    @Binding var userName: String
    
    var body: some View {
        HStack {
            Text("USER NAME: ")
            Text(userName)
                .font(.largeTitle)
        }
    }
}

#Preview {
    UserNameText(userName: .constant("TEST"))
}
