import SwiftUI
import SpriteKit

struct DragDropView: View {
    var scene: DragDropGameScene {
        let scene = DragDropGameScene()
        scene.size = CGSize(width: 500, height: 1000)
        scene.scaleMode = .fill
        scene.onFinished = onFinished
        return scene
    }
    @EnvironmentObject var wonData: WonGameObservant
    @State private var script = [
        "Welcome to Vung Tau",
        "In Vung Tau, you will 4 rig disconnected",
        "Four rigs in the top and in the bottome is the stakeholders",
        "Four centre rigs is the responsibility",
        "You have to match them the rigs correctly to get the key",
        "Let's start!"
    ]
    @State private var currentScene = 0
    var body: some View {
        if currentScene < script.count {
            ZStack {
                VStack {
                    Spacer()
                    Text(script[currentScene])
                        .font(.headline).padding()
                    Spacer()
                    Image("minh").resizable().scaledToFit().padding()
                }.onTapGesture {
                    currentScene += 1
                }
            }
        } else {
            SpriteView(scene: scene)
                .frame(width: 500, height: 1000)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    func onFinished() {
        wonData.wonGame3 = true
        print(wonData.wonGame1, wonData.wonGame2, wonData.wonGame3)
        presentationMode.wrappedValue.dismiss()
    }
}

class DragDropGameScene: SKScene {
    private var numLine: Int = 0
    private var selectedNode: SKSpriteNode?
    private var pairConnect: (a: SKNode?, q: SKNode?) = (nil, nil)
    var onFinished: () -> Void = {}
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let location = touch.location(in: self)
        let touchedNode = atPoint(location)
        if let spriteNode = touchedNode as? SKSpriteNode, spriteNode.name != nil, spriteNode.name!.contains("A") || spriteNode.name!.contains("Q") {
            //if selectedNode != nil{
            //    selectedNode?.color = selectedNode!.name!.contains("A") ? .green: .blue
            //}
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
                    let firstChar = String(pairConnect.a!.name!.first!)
                    let lastChar = String(pairConnect.a!.name!.last!)
                    if let firstAccess = Int(firstChar), let lastAccess = Int(lastChar){
                        if(successfullyConnected[firstAccess - 1][lastAccess - 1] == false){
                            let line = createLine(from: pairConnect.a!, to: pairConnect.q!)
                            successfullyConnected[firstAccess - 1][lastAccess - 1] = true
                            numLine += 1
                            addChild(line)
                            if numLine == 4{
                                let returnNode = SKLabelNode(fontNamed: "Chalkduster")
                                returnNode.text = "Finished"
                                returnNode.fontSize = 50
                                returnNode.name = "return"
                                returnNode.fontColor = .blue
                                returnNode.position = CGPoint(x: 250, y: 475)
                                addChild(returnNode)
                            }
                        }
                    }
                }
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = nodes(at: location)
        for node in touchedNode {
            if node.name == "return" {
                onFinished()
                node.removeFromParent()
                return
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
struct DragDropPreview1: PreviewProvider{
    static var wonData = WonGameObservant()
    static var previews: some View {
        DragDropView()
    }
}
