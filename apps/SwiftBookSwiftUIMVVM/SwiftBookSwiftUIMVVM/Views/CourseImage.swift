//
//  CourseImage.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import SwiftUI

struct CourseImage: View {
    let imageData: Data?
    
    var body: some View {
        getImage(from: imageData)
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
    CourseImage(imageData: nil)
}
