import SwiftUI

@main
struct CounterApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .navigationTitle("Flutter Demo Home Page")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
