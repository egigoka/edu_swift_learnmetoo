//
//  SwiftUIView.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import SwiftUI

struct UserRowView: View {
    var user: User
    
    var body: some View {
        HStack {
            AvatarView(user: user, size: 64)
            Text(user.fullName)
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User.example)
    }
}

//#Preview {
//    UserRowView()
//}
