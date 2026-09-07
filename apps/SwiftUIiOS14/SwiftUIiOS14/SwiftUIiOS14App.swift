//
//  SwiftUIiOS14App.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 07.09.2026.
//

import SwiftUI
import Combine

@main
struct SwiftUIiOS14App: App {
    @StateObject var model = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}

class DataModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var title = "Hello"
}
