import SwiftUI

struct ContentView: View {
    @State private var showMinigames = false
    
    var body: some View {
        if showMinigames {
            MinigamesView()
        } else {
            IntroView(showMinigames: $showMinigames)
        }
    }
}
// UINavigationController => SwiftUI NavigationView

struct MinigamesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("The Magical Map of Vietnam").font(.title).padding()
                Text("Tap to travel and help!")
                Spacer()
                HStack {
                    NavigationLink { // UINavigationController.push
                        SaveTheOceanView()
                    } label: {
                        VStack {
                            Rectangle().fill(Color.blue).frame(width: 100, height: 100)
                            Text("Ha Long Bay")
                        }.rotationEffect(.degrees(10))
                            .padding()
                    }
                    NavigationLink {
                        EcoTourismProctectionView()
                    } label: {
                        VStack {
                            VStack {
                                Rectangle().fill(Color.green).frame(width: 100, height: 100)
                                Text("Sapa")
                            }.rotationEffect(.degrees(-10))
                                .padding()
                        }.rotationEffect(.degrees(10))
                            .padding()
                    }
                    
                }
                VStack {
                    NavigationLink {
                        DragDropView()
                    } label: {
                        VStack {
                            VStack {
                                Rectangle().fill(Color.green).frame(width: 100, height: 100)
                                Text("Ho Chi Minh City")
                            }.rotationEffect(.degrees(-10))
                                .padding()
                        }.rotationEffect(.degrees(10))
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}
