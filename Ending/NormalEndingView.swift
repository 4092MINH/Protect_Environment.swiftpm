//
//  EndNormallyView.swift
//  Protect_Environment
//
//  Created by Phan Nguyễn Khánh Minh on 24/2/25.
//

import SwiftUI

struct NormalEndingView: View {
    @State private var script = [
        "Finally Minh went to his house and get a lot of clap from everyone",
        "Congratulations!"
    ]
    @State private var currentScene = 0
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text(script[currentScene])
                    .font(.headline).padding()
                Spacer()
                Image("minh")
                    .resizable()
                    .frame(width: 200, height: 280)
                    .scaledToFit()
                    .padding()
                    
                Image("clapping")
                    .resizable()
                    .scaledToFit()
            }.onTapGesture {
                if currentScene < script.count - 1 {
                    currentScene += 1
                }
            }
        }
    }
}
struct EndNormalPreview: PreviewProvider {
    static var previews: some View {
        NormalEndingView()
    }
}
