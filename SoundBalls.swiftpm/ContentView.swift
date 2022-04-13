import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 600, height: 800)
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .white
        
        return scene
    }
    
    var body: some View {
        GeometryReader { geometry in
            SpriteView(scene: scene)
                .ignoresSafeArea()
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            
        }
    }
}

