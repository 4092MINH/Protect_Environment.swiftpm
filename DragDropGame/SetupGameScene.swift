//
//  File.swift
//  
//
//  Created by Phan Nguyễn Khánh Minh on 23/2/25.
//
import SwiftUI
import SpriteKit
extension DragDropGameScene{//MARK: Setup Scene
    private func makeOilRig(coe_x: Double, coe_y: Double, name nameOilRig: String) -> SKSpriteNode{
        let oilRig = SKSpriteNode(imageNamed: "oil-rig")
        oilRig.size = CGSize(width: 75, height: 75)
        oilRig.position = CGPoint(x: size.width * coe_x, y: size.height * coe_y)
        oilRig.name = nameOilRig
        return oilRig
    }
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "just-ocean")
        background.size = CGSize(width: self.size.width * 2, height: self.size.height)
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2) // Đặt vị trí ở giữa scene
        background.zPosition = -1 // Đảm bảo background ở phía sau các node khác
        addChild(background)
        background.name = "ocean"
        backgroundColor = .white
        
        randomPair.shuffle()
        let cityGovernment = makeOilRig(coe_x: 0.25, coe_y: 0.85, name: "1Q\(randomPair[0])")
        addChild(cityGovernment)
        makeWrapText(x: Int(scene!.size.width - 163), y: 737, string: findText(pairChosen: cityGovernment))
        
        let industrialCorporations = makeOilRig(coe_x: 0.75, coe_y: 0.85, name: "1Q\(randomPair[1])")
        addChild(industrialCorporations)
        makeWrapText(x: 87, y: 737, string: findText(pairChosen: industrialCorporations))
        
        randomPair.shuffle()
        let vietnameseMedia = makeOilRig(coe_x: 0.25, coe_y: 0.55, name: "1A\(randomPair[0])")
        addChild(vietnameseMedia)
        makeWrapText(x: 87, y: 600, string: findText(pairChosen: vietnameseMedia))
        
        let localResidents = makeOilRig(coe_x: 0.75, coe_y: 0.55, name: "1A\(randomPair[1])")
        addChild(localResidents)
        makeWrapText(x: Int(scene!.size.width - 163), y: 600, string: findText(pairChosen: localResidents))
        
        randomPair.shuffle()
        let enforceLaws = makeOilRig(coe_x: 0.25, coe_y: 0.45, name: "2A\(randomPair[0])")
        addChild(enforceLaws)
        makeWrapText(x: Int(scene!.size.width - 163), y: 337, string: findText(pairChosen: enforceLaws))
        
        let investEcoFriendly = makeOilRig(coe_x: 0.75, coe_y: 0.45, name: "2A\(randomPair[1])")
        addChild(investEcoFriendly)
        makeWrapText(x: 87, y: 337, string: findText(pairChosen: investEcoFriendly))
        
        randomPair.shuffle()
        let raiseAwareness = makeOilRig(coe_x: 0.25, coe_y: 0.15, name: "2Q\(randomPair[0])")
        addChild(raiseAwareness)
        makeWrapText(x: Int(scene!.size.width - 163), y: 200, string: findText(pairChosen: raiseAwareness))
        
        let organizeProtests = makeOilRig(coe_x: 0.75, coe_y: 0.15, name: "2Q\(randomPair[1])")
        addChild(organizeProtests)
        makeWrapText(x: 87, y: 200, string: findText(pairChosen: organizeProtests))
    }
    
    private func findText(pairChosen: SKSpriteNode?) -> String{
        pairChosen?.color = .red
        var text: String = ""
        if pairChosen!.name!.contains("A"){
            if let firstAccess = Int(String(pairChosen!.name!.first!)){
                if let lastAccess = Int(String(pairChosen!.name!.last!)){
                    text = frameResponsibility[firstAccess - 1][lastAccess - 1]
                    //print(firstAccess, lastAccess)
                }
            }
        }
        if pairChosen!.name!.contains("Q"){
            if let firstAccess = Int(String(pairChosen!.name!.first!)){
                if let lastAccess = Int(String(pairChosen!.name!.last!)){
                    text = frameStakeHolder[firstAccess - 1][lastAccess - 1]
                    //print(firstAccess, lastAccess)
                }
            }
        }
        return text
    }
}
extension DragDropGameScene{//MARK: Them wrap text de bai vao trong Scene
    private func makeWrapText(x x_place: Int, y y_place: Int, edge edge_square: Int = 75, string: String){
        let squareSize = CGSize(width: edge_square, height: edge_square)
        let square = SKSpriteNode(color: .lightGray, size: squareSize)
        square.position = CGPoint(x: x_place + Int(squareSize.width / 2), y: y_place + Int(squareSize.height) / 2)
        addChild(square)
        
        let label = SKLabelNode(text: string)
        label.fontName = "Arial"
        label.fontColor = .black
        label.numberOfLines = 0 // Cho phép xuống dòng
        label.preferredMaxLayoutWidth = squareSize.width - 20 // Padding
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        
        // Điều chỉnh kích thước font chữ để vừa với hình vuông
        adjustFontSizeToFit(label: label, maxSize: squareSize)
        square.addChild(label)
    }
    
    private func adjustFontSizeToFit(label: SKLabelNode, maxSize: CGSize) {
        let padding: CGFloat = 20
        var fontSize = maxSize.height
        
        while fontSize > 1 {
            label.fontSize = fontSize
            let textWidth = label.frame.width
            let textHeight = label.frame.height
            
            if textWidth <= maxSize.width - padding && textHeight <= maxSize.height - padding {
                break
            }
            fontSize -= 1
        }
    }
}
struct DragDropPreview2: PreviewProvider {
    static var previews: some View {
        DragDropView()
    }
}
