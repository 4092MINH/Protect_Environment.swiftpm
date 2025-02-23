import SwiftUI

struct IntroView: View {
    @State private var currentScene = 0
    
    @Binding var showMinigames: Bool
    
    @State private var titleScripts = [
        "This is Minh",
        "Minh is a young environmental guardian who is chosen by the Spirit of Vietnam to restore the country’s natural beauty",
        "One day, while walking near a polluted river, Minh encounters Ms. Apple, a magical talking fish, who is choking on a plastic bag",
        "Rescue Ms. Apple by tapping the screen to remove the plastic bag",
        "Vietnam’s most beautiful landmarks are being destroyed by pollution and over-tourism",
        "This is the magical map of Vietnam that will help you find the places that need your help",
        "Start your journey"
    ]
    
    var body: some View {
        VStack {
            Spacer()
            Text(titleScripts[currentScene]).padding()
            Spacer()
            HStack {
                if (currentScene < 2) {
                    Image("minh")
                        .resizable()
                        .scaledToFit()
                        .padding()
                } else if (currentScene < 4) {
                    Image("plasticbag")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.5)
                        .rotationEffect(
                            .degrees(currentScene == 3 ? 15 : -15)
                        )
                        .scaleEffect(currentScene == 3 ? 1.05 : 1)
                        .animation(
                            .easeInOut(duration: 0.2)
                            .repeatForever()
                        )
                } else if (currentScene < 7) {
                    Image("fish")
                        .resizable()
                        .scaledToFit()
                }
                    
            }
        }.onTapGesture {
            currentScene += 1
            if (currentScene == 7) {
                showMinigames = true
                currentScene = 0
            }
        }
    }
}
