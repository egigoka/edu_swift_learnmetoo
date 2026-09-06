//
//  GridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 06.09.2026.
//

import SwiftUI

struct GridView: View {
    let awards = Award.getAwards()
    
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
            CustomGridView(items: activeAwards, columns: 2) { award in
                VStack {
                    award.awardView
                    Text(award.title)
                }
            }
            .navigationTitle("Your Awards: \(activeAwards.count)")
        }
    }
}

#Preview {
    GridView()
}
