import SwiftUI
import SpriteKit

class GameScene: SKScene {
    private var score = 0
    private var label_score = SKLabelNode(fontNamed: "Chalkduster")
    override func didMove(to view: SKView) {
        label_score.fontColor = .red
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        label_score.text = "Score: \(score)"
        label_score.position = CGPoint(x: 200, y: 700)
        addChild(label_score)
        
        let background = SKSpriteNode(imageNamed: "rac-thai-sinh-hoat")
        background.size = CGSize(width: self.size.width * 2, height: self.size.height)
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2) // Đặt vị trí ở giữa scene
        background.zPosition = -1 // Đảm bảo background ở phía sau các node khác
        addChild(background)
        
        Task{
            for _ in 1...30 {
                //_ =  SKSpriteNode(imageNamed: "ball")
                let trash = SKSpriteNode(imageNamed: "banana")
                trash.size = CGSize(width: 30, height: 30)
                trash.position = CGPoint(x: CGFloat.random(in: 0...frame.width), y: frame.height - 100)
                trash.physicsBody = SKPhysicsBody(circleOfRadius: 10)
                trash.name = "trash"
                addChild(trash)
                try await Task.sleep(for: .seconds(0.5))
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = nodes(at: location)
        for node in touchedNode {
            if node.name == "trash" && location.y >= 55{
                node.removeFromParent()
                score += 1
                label_score.text = "Score: \(score)"
                print(score)
            }
        }
        print(location.y)
    }
}

// A sample SwiftUI creating a GameScene and sizing it
// at 300x400 points
struct ContentView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 400, height: 750)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 400, height: 750)
            .ignoresSafeArea()
    }
}
