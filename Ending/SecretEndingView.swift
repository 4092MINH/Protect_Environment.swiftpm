//
//  EndNormallyView.swift
//  Protect_Environment
//
//  Created by Phan Nguyễn Khánh Minh on 24/2/25.
//

import SwiftUI

struct SecretEndingView: View {
    @State private var script = [
        "Oh no! Why it's still polluted",
        "I can't believe it!",
        "I can't protect the environment lonely",
        "We must work together"
    ]
    @State private var currentScene = 0
    var body: some View {
        ZStack {
            VStack {
                Image("rac-thai-sinh-hoat")
                    .resizable()
                    .frame(width: 400, height: 1000)
                    .scaledToFit()
                    .overlay(
                        Text(script[currentScene])
                            .font(.headline).padding()
                    )
            }.onTapGesture {
                if currentScene < script.count - 1 {
                    currentScene += 1
                }
            }
        }
    }
}
struct SecretEndingPreview: PreviewProvider {
    static var previews: some View {
        SecretEndingView()
    }
}
