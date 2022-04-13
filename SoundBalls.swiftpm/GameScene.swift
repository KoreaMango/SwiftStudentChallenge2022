//
//  GameScene.swift
//  SoundBalls
//
//  Created by KangMinGyu on 2022/04/07.
//

import Foundation
import SpriteKit

// MARK: GameScene
class GameScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        physicsBody =  SKPhysicsBody (edgeLoopFrom: self .frame)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        addBall(location)
    }
    
    private func addBall(_ location: CGPoint){
        let circle = SKShapeNode(circleOfRadius: 10)
        circle.fillColor = SKColor.red
        circle.position = location
        circle.physicsBody = SKPhysicsBody(circleOfRadius : 10)
        circle.physicsBody?.allowsRotation = false
        circle.physicsBody?.restitution = 1.0
        circle.physicsBody?.friction = 0.0
        circle.physicsBody?.linearDamping = 0.0
        circle.physicsBody?.angularDamping = 0.0
        
        addChild(circle)
    }
    
    private func addWall(_ location: CGPoint){
        let wall = SKShapeNode(rect: CGRect())
        
    }
    
    
}

// MARK: button Function
func stopBall() {
    
}

func startBall() {
    
}

func backAction() {
    
}
