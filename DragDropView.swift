import SwiftUI
import SpriteKit

struct DragDropView: View {
    var scene: DragDropGameScene {
        let scene = DragDropGameScene()
        scene.size = CGSize(width: 500, height: 1000)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 500, height: 1000)
            .edgesIgnoringSafeArea(.all)
    }
}

class DragDropGameScene: SKScene {
    private var selectedNode: SKSpriteNode?
    private var pairConnect: (a: SKNode?, q: SKNode?) = (nil, nil)
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let location = touch.location(in: self)
        let touchedNode = atPoint(location)
        if let spriteNode = touchedNode as? SKSpriteNode{
            if selectedNode != nil{
                selectedNode?.color = selectedNode!.name!.contains("A") ? .green: .blue
            }
            selectedNode = spriteNode
            selectedNode?.color = .red
            //addChild(label)
            //showSpeechBubble(for: selectedNode!, text: FindText(pairChosen: selectedNode))
            if spriteNode.name!.contains("A"){
                pairConnect.a = selectedNode
            }
            if spriteNode.name!.contains("Q"){
                pairConnect.q = selectedNode
            }
            if (pairConnect.a?.name != nil && pairConnect.q?.name != nil){
                if (pairConnect.a!.name!.first == pairConnect.q!.name!.first &&
                    pairConnect.a!.name!.last == pairConnect.q!.name!.last){
                    //print(pairConnect.a!.name!, pairConnect.q!.name!)
                    let line = createLine(from: pairConnect.a!, to: pairConnect.q!)
                    addChild(line)
                }
            }
        }
    }
    
    private func createLine(from nodeFrom: SKNode, to nodeTo: SKNode) -> SKShapeNode{
        let fromPoint = nodeFrom.position
        let toPoint = nodeTo.position
        
        // Tạo một đường thẳng từ nodeFrom đến nodeTo
        let path = CGMutablePath()
        path.move(to: fromPoint)
        path.addLine(to: toPoint)
        
        // Tạo SKShapeNode từ đường thẳng
        let line = SKShapeNode(path: path)
        line.strokeColor = .black // Màu của đường thẳng
        line.lineWidth = 2.0 // Độ dày của đường thẳng
        
        return line
    }
}
extension DragDropGameScene{//MARK: Setup Scene
    private func makeOilRig(coe_x: Double, coe_y: Double, name nameOilRig: String) -> SKSpriteNode{
        let oilRig = SKSpriteNode(imageNamed: "oil-rig")
        oilRig.size = CGSize(width: 75, height: 75)
        oilRig.position = CGPoint(x: size.width * coe_x, y: size.height * coe_y)
        oilRig.name = nameOilRig
        return oilRig
    }
    override func didMove(to view: SKView) {
        backgroundColor = .white
        
        let cityGovernment = makeOilRig(coe_x: 0.25, coe_y: 0.85, name: "1Q1")
        addChild(cityGovernment)
        makeWrapText(x: Int(scene!.size.width - 163), y: 737, string: findText(pairChosen: cityGovernment))
        
        let industrialCorporations = makeOilRig(coe_x: 0.75, coe_y: 0.85, name: "1Q2")
        addChild(industrialCorporations)
        makeWrapText(x: 87, y: 737, string: findText(pairChosen: industrialCorporations))
        
        let vietnameseMedia = makeOilRig(coe_x: 0.25, coe_y: 0.55, name: "1A1")
        addChild(vietnameseMedia)
        makeWrapText(x: 87, y: 600, string: findText(pairChosen: vietnameseMedia))
        
        let localResidents = makeOilRig(coe_x: 0.75, coe_y: 0.55, name: "1A2")
        addChild(localResidents)
        makeWrapText(x: Int(scene!.size.width - 163), y: 600, string: findText(pairChosen: localResidents))
        
        let enforceLaws = makeOilRig(coe_x: 0.25, coe_y: 0.45, name: "2A1")
        addChild(enforceLaws)
        makeWrapText(x: Int(scene!.size.width - 163), y: 337, string: findText(pairChosen: enforceLaws))
        
        let investEcoFriendly = makeOilRig(coe_x: 0.75, coe_y: 0.45, name: "2A2")
        addChild(investEcoFriendly)
        makeWrapText(x: 87, y: 337, string: findText(pairChosen: investEcoFriendly))
        
        let raiseAwareness = makeOilRig(coe_x: 0.25, coe_y: 0.15, name: "2Q1")
        addChild(raiseAwareness)
        makeWrapText(x: Int(scene!.size.width - 163), y: 200, string: findText(pairChosen: raiseAwareness))
        
        let organizeProtests = makeOilRig(coe_x: 0.75, coe_y: 0.15, name: "2Q2")
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
struct DragDropPreview: PreviewProvider {
    static var previews: some View {
        DragDropView()
    }
}

