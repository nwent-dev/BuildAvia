import SwiftUI

struct OnboardingView: View {
    var onFinish: () -> Void
    
    @State private var currentPage = 0
    private let pages = [
        "Welcome to 'Build Your Plane'! ✈️\nHave you ever dreamed of assembling your own airplane? Now you have the chance!",
        "How to Play:\n🔹 Choose the parts — tap on the body, wings, engines, and chassis to find the perfect combination.",
        "🔹 Watch the timer — you have only 60 seconds to complete the assembly! The timer shows how much time is left.",
        "🔹 Build a complete plane — if all the parts match, you'll see your fully assembled aircraft!",
        "💡 Tip: The faster you complete the correct assembly, the better! Can you finish in time?"
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \ .self) { index in
                        Text(pages[index])
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                Button(action: {
                    if currentPage < pages.count - 1 {
                        currentPage += 1
                    } else {
                        onFinish()
                    }
                }) {
                    Text(currentPage < pages.count - 1 ? "Next" : "Start Game")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 30)
            }
        }
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
            AppDelegate.orientationLock = .landscape // And making sure it stays that way
        }.onDisappear {
            AppDelegate.orientationLock = .landscape // Unlocking the rotation when leaving the view
        }
    }
}

#Preview {
    OnboardingView(onFinish: {})
}
