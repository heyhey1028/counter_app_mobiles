import SwiftUI

struct ContentView: View {
    @State private var counter = 0

    var body: some View {
        VStack {
            Spacer()

            Text("You have pushed the button this many times:")
                .font(.body)

            Text("\(counter)")
                .font(.system(size: 48, weight: .bold))
                .padding()

            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                Button(action: {
                    counter += 1
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
