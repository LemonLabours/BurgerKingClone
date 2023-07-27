import SwiftUI

struct ContentView: View {
    @State private var isShowingLaunchView = true

    var body: some View {
        Group {
            if isShowingLaunchView {
                LaunchView()
                    .transition(.opacity) // Add any custom transition you want here
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                isShowingLaunchView = false
                            }
                        }
                    }
            } else {
                StartView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
