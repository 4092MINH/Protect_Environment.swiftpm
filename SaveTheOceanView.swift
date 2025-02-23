import SwiftUI
import SpriteKit

class TrashCollectionGameScene: SKScene {
    private var trashesImg = ["apple","banana","fish","bottle"]
    private var score = 0 {
        didSet {
            labelScore.text = "Score: \(score)"
        }
    }
    
    private var hasWon = false
    
    var onFinished: () -> Void = {}
    
    private var labelScore = SKLabelNode(fontNamed: "Chalkduster")
    
    private var playButton: SKLabelNode = {
        let button = SKLabelNode(text: "Play")
        button.fontSize = 50
        button.fontName = "Chalkduster"
        button.fontColor = .blue
        button.position = CGPoint(x: 200, y: 400)
        button.name = "play"
        return button
    }()
    
    override func didMove(to view: SKView) {
        labelScore.fontColor = .red
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        labelScore.text = "Score: \(score)"
        labelScore.position = CGPoint(x: 200, y: 700)
        addChild(labelScore)
        
        let background = SKSpriteNode(imageNamed: "rac-thai-sinh-hoat")
        background.size = CGSize(width: self.size.width * 2, height: self.size.height)
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2) // Đặt vị trí ở giữa scene
        background.zPosition = -1 // Đảm bảo background ở phía sau các node khác
        addChild(background)
        addChild(playButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = nodes(at: location)
        for node in touchedNode {
            if node.name == "trash" && location.y >= 55{
                node.removeFromParent()
                score += 1
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = nodes(at: location)
        for node in touchedNode {
            if node.name == "play" {
                if hasWon {
                    onFinished()
                    node.removeFromParent()
                    return
                }
                node.removeFromParent()
                clearTrash()
                startGame()
            }
        }
    }
    private func clearTrash(){
        for node in self.children {
            if node.name == "trash" {
                node.removeFromParent()
            }
        }
    }
    private func startGame() {
        score = 0
        Task{
            for _ in 1...30 {
                let nametrash = trashesImg.randomElement()!
                let trash = SKSpriteNode(imageNamed: "trash/\(nametrash)-trash")
                trash.size = CGSize(width: 90, height: 90)
                trash.position = CGPoint(x: CGFloat.random(in: 0...frame.width), y: frame.height - 100)
                trash.physicsBody = SKPhysicsBody(circleOfRadius: 10)
                trash.name = "trash"
                addChild(trash)
                try await Task.sleep(for: .seconds(1))
            }
            considerToWin()
        }
    }
    private func considerToWin(){
        if score >= 20 {
            labelScore.text = "You win!"
            playButton.text = "Return"
            hasWon = true
            addChild(playButton)
            return
        } else{
            labelScore.text = "You lose!"
            playButton.text = "Play again"
            addChild(playButton)
        }
    }
}

// A sample SwiftUI creating a GameScene and sizing it
// at 300x400 points
struct SaveTheOceanView: View {
    var scene: SKScene {
        let scene = TrashCollectionGameScene()
        scene.onFinished = onFinished
        scene.size = CGSize(width: 400, height: 750)
        scene.scaleMode = .fill
        return scene
    }
    
    @State private var currentScene = 0
    @State private var script = [
        "Welcome to Ha Long Bay",
        "In Ha Long Bay, there are many trashes in the sea",
        "Help Minh to collect the trashes by tapping on them",
        "Let's start!"
    ]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    func onFinished() {
        presentationMode.wrappedValue.dismiss()
    }

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
                .frame(width: 400, height: 750)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
        }
    }
}
