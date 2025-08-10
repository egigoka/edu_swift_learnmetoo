import SwiftUI

struct ContentView: View {
    
    private let picsInfo = "https://pixabay.com/api/?key=\(Secrets.shared.pixabayKey)&q=\(Url.shared.encode("sea"))"
    
    var body: some View {
        VStack(spacing: 40) {
            
            AsyncImage(url: URL(string: base)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.5).frame(width: 320, height: 320)
            }
            
            
            
            Button(action: {}) {
                Text("Snow next")
                    .foregroundColor(.white)
                    .frame(width: 160, height: 40)
                    .background(Color.blue.cornerRadius(8))
            }
        }
    }
}
