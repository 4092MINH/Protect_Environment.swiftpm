import SwiftUI
import SpriteKit

class TrashCollectionGameScene: SKScene {
    private var trashesImg = ["apple","banana","fish","bottle"]
    private var score = 0 {
        didSet {
            labelScore.text = "Score: \(score)"
        }
    }
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
                node.removeFromParent()
                startGame()
            }
        }
    }
    
    func startGame() {
        score = 0
        Task{
            for _ in 1...30 {
                if score == 10 {
                    labelScore.text = "You win!"
                    return
                }
                let nametrash = trashesImg.randomElement()!
                let trash = SKSpriteNode(imageNamed: "trash/\(nametrash)-trash")
                trash.size = CGSize(width: 30, height: 30)
                trash.position = CGPoint(x: CGFloat.random(in: 0...frame.width), y: frame.height - 100)
                trash.physicsBody = SKPhysicsBody(circleOfRadius: 10)
                trash.name = "trash"
                addChild(trash)
                try await Task.sleep(for: .seconds(0.5))
            }
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
        scene.size = CGSize(width: 400, height: 750)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        //IntroView()
        SpriteView(scene: scene)
            .frame(width: 400, height: 750)
            .ignoresSafeArea()
    }
}
