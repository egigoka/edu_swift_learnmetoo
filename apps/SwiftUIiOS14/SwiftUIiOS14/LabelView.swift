//
//  LabelView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        Label("User Name", systemImage: "person.crop.circle")
            .font(.largeTitle)
        Label {
            Text("User Name")
                .foregroundStyle(.red)
                .font(.largeTitle)
                .padding()
                .backgroundStyle(.gray.opacity(0.2))
                .clipShape(Capsule())
        } icon: {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 64, height: 64)
                .offset(y: 5)
        }

    }
}

#Preview {
    LabelView()
}
