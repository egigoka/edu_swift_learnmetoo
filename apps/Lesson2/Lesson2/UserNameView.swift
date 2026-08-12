//
//  UserNameText.swift
//  Lesson2
//
//  Created by egigoka2kz on 21.07.2026.
//

import SwiftUI

struct UserNameView: View {
    var userName: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("USER NAME: ")
                .frame(height: 60)
            Text(userName)
                .font(.largeTitle)
            Spacer()
        }
    }
}

#Preview {
    UserNameView(userName: "TEST")
}
