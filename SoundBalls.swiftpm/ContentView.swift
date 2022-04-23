import SwiftUI
import SpriteKit

public struct ContentView: View {
    public var scene: SKScene {
        let gameScene = GameScene.shared
        gameScene.size = CGSize(width: 600, height: 800)
        gameScene.scaleMode = .resizeFill
        
        return gameScene
    }
    
    public var body: some View {
        GeometryReader { geometry in
            SpriteView(scene: scene)
                .ignoresSafeArea()
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            
        }
    }
}

