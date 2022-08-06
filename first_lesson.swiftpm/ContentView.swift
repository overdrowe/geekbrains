import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "faceid")
                .resizable()
                .imageScale(.small)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}
