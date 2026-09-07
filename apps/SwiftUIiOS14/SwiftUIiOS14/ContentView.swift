//
//  ContentView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 07.09.2026.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        VStack {
            Text(model.title)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
