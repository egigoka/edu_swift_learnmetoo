//
//  CourseImage.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import SwiftUI

struct CourseImage: View {
    let imageData: Data?
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(radius: shadowIsOn ? 10 : 0)
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "x.square") }
        guard let image = UIImage(data: data) else {
            return Image(systemName: "x.square")
        }
        return Image(uiImage: image)
    }
}

#Preview {
    CourseImage(
        imageData: nil,
        imageSize: CGSize(width: 100, height: 100),
        cornerRadius: 10,
        shadowIsOn: true
    )
}
