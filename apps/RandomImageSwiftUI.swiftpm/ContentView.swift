import SwiftUI

struct ContentView: View {
    
    @StateObject private var loader = ImageLoader()
    
    var body: some View {
        VStack(spacing: 40) {
            
            if let imageUrl = loader.imageUrl {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.5)
                }
                .frame(width: 320, height: 320)
                .clipped()
            } else {
                ProgressView()
                    .frame(width: 320, height: 320)
            }
            
            Button(action: refreshImage) {
                Text("Snow next")
                    .foregroundColor(.white)
                    .frame(width: 160, height: 40)
                    .background(Color.blue.cornerRadius(8))
            }
        }
        .task {
            await loader.fetchRandomImage(with: "snow")
        }
    }
    
    private func refreshImage() {
        Task {
            await loader.fetchRandomImage(with: "snow")
        }
    }
}
