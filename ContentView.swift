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

struct MinigamesView: View {
    @State private var showInfo: Int = 0
    var body: some View {
        ZStack {
            VStack{
                NavigationView {
                    VStack {
                        Text("The Magical Map of Vietnam").font(.title).padding()
                        Text("Tap to travel and help!")
                        Spacer()
                        HStack {
                            VStack {
                                if !wonGame1{
                                    NavigationLink { // UINavigationController.push
                                        SaveTheOceanView()
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
                                    showInfo = 1
                                }
                                .padding(.trailing, 30)
                                .foregroundColor(.black)
                            }
                            VStack {
                                if !wonGame2{
                                    NavigationLink {
                                        EcoTourismProctectionView()
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
                                    showInfo = 2
                                }
                                .padding(.leading, 40)
                                .foregroundColor(.black)
                            }
                        }.padding(.bottom, 0)
                        VStack {
                            if !wonGame3{
                                NavigationLink {
                                    DragDropView()
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
                                showInfo = 3
                            }
                            .padding(.top, 0)
                            .foregroundColor(.black)
                        }
                        Spacer()
                    }
                }
                if wonGame1 && wonGame2 && wonGame3 {
                    NavigationLink{
                        if secretEnding{
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
            if (showInfo != 0){
                Rectangle()
                    .frame(width: 350, height: 600)
                    .cornerRadius(10)
                    .foregroundColor(.gray)
                    .overlay(
                        VStack{
                            Spacer()
                            Text(infoPlace[showInfo]) // Hoặc Text bạn muốn hiển thị
                                .font(.custom("chalkduster", size: 20))
                                .foregroundColor(.white)
                            Spacer()
                            Button("Close"){
                                showInfo = 0
                            }
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            Spacer()
                        }
                    )
            }
        }
    }
}
struct previewMenu: PreviewProvider {
    static var previews: some View {
        MinigamesView()
    }
}
