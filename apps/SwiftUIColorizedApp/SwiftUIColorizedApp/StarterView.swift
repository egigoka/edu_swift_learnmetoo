//
//  StarterView.swift
//  SwiftUIColorizedApp
//
//  Created by Alexey Efimov on 20.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct StarterView: View {
    @State private var showSwiftUIView = false
    @State private var showUIKitView = false
    
    var body: some View {
        VStack {
            Button("Show SwiftUI View") {
                showSwiftUIView = true
            }
            .sheet(isPresented: $showSwiftUIView) {
                ContentView()
            }
            
            Button("Show UIKit View") {
                showUIKitView = true
            }
            .sheet(isPresented: $showUIKitView) {
                ColorViewControllerRepresentation()
                    .ignoresSafeArea()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
