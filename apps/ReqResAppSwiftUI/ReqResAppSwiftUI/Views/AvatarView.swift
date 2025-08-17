//
//  AvatarView.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import SwiftUI

struct AvatarView: View {
    let user: User
    let size: CGFloat
    
    var body: some View {
        if user.avatar != nil {
            AsyncImage(url: user.avatar) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: size, height: size)
            .clipShape(Circle())
        } else {
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
        }
    }
}

#Preview {
    AvatarView(user: User.example, size: 64)
}
