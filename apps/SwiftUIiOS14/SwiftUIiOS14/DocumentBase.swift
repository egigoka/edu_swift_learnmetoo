//
//  DocumentBase.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI
import UniformTypeIdentifiers

struct DocumentBase: View {
    var body: some View {
        
    }
}

struct TextFile: FileDocument {
    static let readableContentTypes: [UTType] = [.plainText]
    var text = ""
    
    init(initialText: String = "") {
        text = initialText
    }
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
    
    
}

#Preview {
    DocumentBase()
}
