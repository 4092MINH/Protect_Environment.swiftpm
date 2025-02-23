import SwiftUI

class WonGameObservant: ObservableObject{
    @Published var wonGame1 = false // MARK: Debug
    @Published var wonGame2 = false
    @Published var wonGame3 = false
    @Published var secretEnding = false
}
struct ContentView: View {
    @State private var showMinigames = false
    @StateObject var wonData = WonGameObservant()
    var body: some View {
        if showMinigames {
            MinigamesView()
        } else {
            IntroView(showMinigames: $showMinigames)
        }
    }
}

struct MinigamesView: View {
    @StateObject var wonData = WonGameObservant()
    var body: some View {
        VStack{
            NavigationView {
                VStack {
                    Text("The Magical Map of Vietnam").font(.title).padding()
                    Text("Tap to travel and help!")
                    Spacer()
                    HStack {
                        VStack {
                            if !wonData.wonGame1{
                                NavigationLink { // UINavigationController.push
                                    SaveTheOceanView()
                                        .environmentObject(wonData)
                                } label: {
                                    VStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 100, height: 100)
                                            .overlay(
                                                Image("ha-long-bay-menu")
                                                    .resizable()
                                                    .scaledToFill()
                                            )
                                        Text("Ha Long Bay")
                                    }
                                    .padding(.trailing, 30)
                                }
                            } else{
                                VStack {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 100, height: 100)
                                        .overlay(
                                            Image("trophy")
                                                .resizable()
                                                .scaledToFill()
                                        )
                                    Text("Ha Long Bay")
                                        .foregroundColor(.orange)
                                }
                                .padding(.trailing, 30)
                            }
                            Button("info"){
                                print("Ha Long")
                            }
                            .padding(.trailing, 30)
                            .foregroundColor(.black)
                        }
                        VStack {
                            if !wonData.wonGame2{
                                NavigationLink {
                                    EcoTourismProctectionView()
                                        .environmentObject(wonData)
                                } label: {
                                    VStack {
                                        VStack {
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 100, height: 100)
                                                .overlay(
                                                    Image("sapa-menu")
                                                        .resizable()
                                                        .scaledToFill()
                                                )
                                            Text("Sapa")
                                        }.rotationEffect(.degrees(-10))
                                            .padding(.leading, 20)
                                    }.rotationEffect(.degrees(10))
                                        .padding(.leading, 20)
                                }
                            } else {
                                VStack {
                                    VStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 100, height: 100)
                                            .overlay(
                                                Image("trophy")
                                                    .resizable()
                                                    .scaledToFill()
                                            )
                                        Text("Sapa")
                                            .foregroundColor(.orange)
                                    }.rotationEffect(.degrees(-10))
                                        .padding(.leading, 20)
                                }.rotationEffect(.degrees(10))
                                    .padding(.leading, 20)
                            }
                            
                            Button("info"){
                                print("sapa")
                            }
                            .padding(.leading, 40)
                            .foregroundColor(.black)
                        }
                    }.padding(.bottom, 0)
                    VStack {
                        if !wonData.wonGame3{
                            NavigationLink {
                                DragDropView()
                                    .environmentObject(wonData)
                            } label: {
                                VStack {
                                    VStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 100, height: 100)
                                            .overlay(
                                                Image("vung-tau-menu")
                                                    .resizable()
                                                    .scaledToFill()
                                            )
                                        Text("Vung Tau")
                                    }.rotationEffect(.degrees(-10))
                                        .padding(.top, 0)
                                }.rotationEffect(.degrees(10))
                                    .padding(.top, 0)
                            }
                        } else{
                            VStack {
                                VStack {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 100, height: 100)
                                        .overlay(
                                            Image("trophy")
                                                .resizable()
                                                .scaledToFill()
                                        )
                                    Text("Vung Tau")
                                        .foregroundColor(Color.orange)
                                }.rotationEffect(.degrees(-10))
                                    .padding(.top, 0)
                            }.rotationEffect(.degrees(10))
                                .padding(.top, 0)
                        }
                        Button("info"){
                            print("Vung Tau")
                        }
                        .padding(.top, 0)
                        .foregroundColor(.black)
                    }
                    Spacer()
                }
            }
            if wonData.wonGame1 == true && wonData.wonGame2 == true && wonData.wonGame3 == true {
                NavigationLink{
                    @EnvironmentObject var wonData: WonGameObservant
                    if wonData.secretEnding{
                        SecretEndingView()
                    }
                    else{
                        NormalEndingView()
                    }
                } label:{
                    Image("arrow")
                        .resizable()
                        .frame(width: 200, height: 100)
                        .scaledToFit()
                        .padding(.bottom, 5)
                        .overlay(
                            Text("Come back to Minh's house")
                                .font(.custom("chalkduster", size: 20))
                                .foregroundColor(.white)
                        )
                }
            }
        }
    }
}
struct previewMenu: PreviewProvider {
    static var previews: some View {
        MinigamesView()
    }
}
