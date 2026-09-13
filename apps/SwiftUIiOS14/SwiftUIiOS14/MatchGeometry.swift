//
//  MatchGeometry.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct MatchGeometry: View {
    @State private var isFlipped = false
    @Namespace private var animation
    
    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Circle", in: animation)
                Text("Text")
                    .font(.headline)
                    .matchedGeometryEffect(id: "Text", in: animation)
            } else {
                Text("Text")
                    .font(.headline)
                    .matchedGeometryEffect(id: "Text", in: animation)
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "Circle", in: animation)
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    MatchGeometry()
}
