//
//  CustomProgressView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct CustomProgressView: View {
    @State private var downloadAmount = 0.0
    
    var body: some View {
        VStack {
            ProgressView("Downloading...", value: downloadAmount, total: 100)
            Button("Download") {
                setTimer()
            }
        }
    }
    
    private func setTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            if downloadAmount < 100 {
                downloadAmount += 5
            }
        }
    }
}

#Preview {
    CustomProgressView()
}
