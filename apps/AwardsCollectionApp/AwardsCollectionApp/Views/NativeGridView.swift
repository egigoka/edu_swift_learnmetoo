//
//  NativeGridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 06.09.2026.
//

import SwiftUI

struct NativeGridView: View {
    let awards = Award.getAwards()
    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(activeAwards, id: \.title) { award in
                        VStack {
                            award.awardView
                            Text(award.title)
                        }
                    }
                }
            }
            .navigationTitle("Your Awards: \(activeAwards.count)")
        }
    }
}

#Preview {
    NativeGridView()
}
