//
//  GameScene.swift
//  SoundBall
//
//  Created by KangMinGyu on 2022/04/07.
//

import Foundation
import SpriteKit
import SwiftUI
import AVFoundation
import Combine

var soundPlayer: AVAudioPlayer!

// Categories
let BallCategory        : UInt32 = 0x1 << 0
let C3Category          : UInt32 = 0x1 << 1
let D3Category          : UInt32 = 0x1 << 2
let E3Category          : UInt32 = 0x1 << 3
let F3Category          : UInt32 = 0x1 << 4
let G3Category          : UInt32 = 0x1 << 5
let A3Category          : UInt32 = 0x1 << 6
let B3Category          : UInt32 = 0x1 << 7
let C4Category          : UInt32 = 0x1 << 8
let D4Category          : UInt32 = 0x1 << 9
let E4Category          : UInt32 = 0x1 << 10
let F4Category          : UInt32 = 0x1 << 11



// MARK: - GameScene Class
class GameScene: SKScene,SKPhysicsContactDelegate {
    static var shared = GameScene()
    //MARK: Var, Let
    let circleSize: CGFloat = 10
    var wallFlag: String = "rectWidth"
    var pitchFlag: String = "C3"
    var shapeNodes = Stack<SKShapeNode>()
    var ballNodes : [SKShapeNode] = []
    
    //MARK: Override
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "BackGround")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.speed = CGFloat(0.3)
        
        // Border
        addPhysicsBoundariesToScene()
            
        
        // Circle
        addBall()

    }
    public func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == C3Category {
            playAudio("C3")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == D3Category {
            playAudio("D3")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == E3Category {
            playAudio("E3")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == F3Category {
            playAudio("F3")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == G3Category {
            playAudio("G3")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == A3Category {
            playAudio("A3")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == B3Category {
            playAudio("B3")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == C4Category {
            playAudio("C4")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == D4Category {
            playAudio("D4")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == E4Category {
            playAudio("E4")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == F4Category {
            playAudio("F4")
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if wallFlag == "rectHeight"{
            addHeightWall(location)
            
        }else{
            addWidthWall(location)
            
        }

    }
    
    
    //MARK: function
    func playAudio(_ pitch : String){
        
        guard let audioData = NSDataAsset(name: pitch)?.data else {
            fatalError("Asset not found")
        }
        DispatchQueue.global().async {
            soundPlayer = try! AVAudioPlayer(data: audioData, fileTypeHint: "wav")
            soundPlayer.play()
        }

    }
    
    func collision(between ball: SKNode, object: SKNode){
        print(ball)
        print(object)
    }
    
    private func addPhysicsBoundariesToScene() {
           let physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
           physicsBody.friction = 0
            physicsBody.restitution = 1
           self.physicsBody = physicsBody
       }
    
    private func addHeightWall(_ location: CGPoint){
        let wallWidth = 50
        let wallHeight = 10
        let physicsBody = SKPhysicsBody(edgeLoopFrom: rotateRect(CGRect(x: -wallWidth/2, y: -wallHeight/2, width: wallWidth, height: wallHeight)))
        let wall = SKShapeNode(rect: rotateRect(CGRect(x: -wallWidth/2, y: -wallHeight/2, width: wallWidth, height: wallHeight)))
        
        wall.fillColor = selectColor(flag: pitchFlag)
        wall.position = location
        physicsBody.allowsRotation = false
        physicsBody.affectedByGravity = false
        physicsBody.isDynamic = false
        physicsBody.restitution = 1.0
        physicsBody.friction = 0.0
        physicsBody.linearDamping = 0.0
        
        wall.physicsBody = physicsBody
        
        shapeNodes.push(wall)
        addChild(wall)
        wall.physicsBody?.categoryBitMask = selectCategory(flag: pitchFlag)
        
    }
    private func addWidthWall(_ location: CGPoint){
        let wallWidth = 50
        let wallHeight = 10
        let wall = SKShapeNode(rect: CGRect(x: -wallWidth/2, y: -wallHeight/2, width: wallWidth, height: wallHeight))
        let physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -wallWidth/2, y: -wallHeight/2, width: wallWidth, height: wallHeight))
        
        wall.fillColor = selectColor(flag: pitchFlag)
        wall.position = location
        physicsBody.allowsRotation = false
        physicsBody.affectedByGravity = false
        physicsBody.isDynamic = false
        physicsBody.restitution = 1.0
        physicsBody.friction = 0.0
        physicsBody.linearDamping = 0.0
        
        wall.physicsBody = physicsBody
        
        shapeNodes.push(wall)
        addChild(wall)
        wall.physicsBody?.categoryBitMask = selectCategory(flag: pitchFlag)
    }
    
    open func addBall(){
        
        let location = CGPoint(x: self.frame.width/2, y: self.frame.height-100)
        let ball = SKShapeNode(circleOfRadius: circleSize)
        let physicsBody = SKPhysicsBody(circleOfRadius : circleSize)
        ball.fillColor = SKColor.black
        ball.position = location
       
        physicsBody.allowsRotation = false
        physicsBody.restitution = 1.0
        physicsBody.friction = 0.0
        physicsBody.linearDamping = 0.0
    
        
        ball.physicsBody = physicsBody
        ballNodes.append(ball)
        addChild(ball)
        ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: -10))
        ball.physicsBody?.categoryBitMask = BallCategory
        ball.physicsBody?.collisionBitMask = BallCategory | C3Category | D3Category | E3Category | F3Category | G3Category | A3Category | B3Category | C4Category | D4Category | E4Category | F4Category
        ball.physicsBody?.contactTestBitMask = BallCategory | C3Category | D3Category | E3Category | F3Category | G3Category | A3Category | B3Category | C4Category | D4Category | E4Category | F4Category
    }
    func selectCategory(flag : String) -> UInt32 {
        if flag == "C3"{
            return C3Category
        }
        if flag == "D3"{
            return D3Category
        }
        if flag == "E3"{
            return E3Category
        }
        if flag == "F3"{
            return F3Category
        }
        if flag == "G3"{
            return G3Category
        }
        if flag == "A3"{
            return A3Category
        }
        if flag == "B3"{
            return B3Category
        }
        if flag == "C4"{
            return C4Category
        }
        if flag == "D4"{
            return D4Category
        }
        if flag == "E4"{
            return E4Category
        }
        if flag == "F4"{
            return F4Category
        }
        else {
            return C3Category
        }
    }
    
    func selectColor(flag : String) -> UIColor {
        if flag == "C3"{
            return UIColor(red: 1, green: 0, blue: 0, alpha: 0.3)
        }
        if flag == "D3"{
            return UIColor(red: 1, green: 0.5, blue: 0, alpha: 0.3)
        }
        if flag == "E3"{
            return UIColor(red: 1, green: 1, blue: 0, alpha: 0.3)
        }
        if flag == "F3"{
            return UIColor(red: 0, green: 1, blue: 0, alpha: 0.3)
        }
        if flag == "G3"{
            return UIColor(red: 0, green: 1, blue: 1, alpha: 0.3)
        }
        if flag == "A3"{
            return UIColor(red: 0, green: 0, blue: 1, alpha: 0.3)
        }
        if flag == "B3"{
            return UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 0.3)
        }
        if flag == "C4"{
            return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
        if flag == "D4"{
            return UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)
        }
        if flag == "E4"{
            return UIColor(red: 1, green: 1, blue: 0, alpha: 1)
        }
        if flag == "F4"{
            return UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        else {
            return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
    
    open func stopWorld(_ flag: Bool){
        if flag{
            physicsWorld.speed = CGFloat(0.0)
        }
        else {
            physicsWorld.speed = CGFloat(0.3)
        }
    }
    
    func rotateRect(_ rect: CGRect) -> CGRect {
        let x = rect.midX
        let y = rect.midY
        let transform = CGAffineTransform(translationX: x, y: y) .rotated(by: .pi / 2)
                                    
        return rect.applying(transform)
    }
   
}

