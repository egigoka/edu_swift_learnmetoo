//
//  ContentView.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import SwiftUI

struct CourseListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
            }
            .navigationTitle(Text("Courses"))
            .navigationBarItems(trailing: Button("Fetch data") {
                
            })
        }
    }
}

#Preview {
    CourseListView()
}
