//
//  GameScene.swift
//  FlappyClone
//
//  Created by Sanat Manhas on 06/06/16.
//  Copyright (c) 2016 Sanat Manhas. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let Ghost : UInt32 = 0x1 << 1
    static let Ground : UInt32 = 0x1 << 2
    static let Wall : UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    var Ground = SKSpriteNode()
    var Ghost = SKSpriteNode()
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.setScale(0.5)
        Ground.position = CGPoint(x: self.frame.width / 2 , y: 0 + Ground.frame.height / 2 )
        
        Ground.physicsBody = SKPhysicsBody(rectangleOfSize: Ground.size)
        Ground.physicsBody?.categoryBitMask = PhysicsCategory.Ground
        Ground.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
        Ground.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.dynamic = false
        
        
        
        
        
        self.addChild(Ground)
        
        
        
        Ghost = SKSpriteNode(imageNamed: "Ghost")
        Ghost.size = CGSize(width: 60, height: 70)
        Ghost.position = CGPoint(x: self.frame.width / 2 - Ghost.frame.width , y: self.frame.height / 2 )
        
        Ghost.physicsBody = SKPhysicsBody(circleOfRadius: Ghost.frame.height / 2 )
        Ghost.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
        Ghost.physicsBody?.collisionBitMask = PhysicsCategory.Ground | PhysicsCategory.Wall
        Ghost.physicsBody?.contactTestBitMask = PhysicsCategory.Ground | PhysicsCategory.Wall
        Ghost.physicsBody?.affectedByGravity = true
        Ghost.physicsBody?.dynamic = true
        
        
        
        
        
        
        self.addChild(Ghost)
        
        createWalls()
        
           }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    }
   
    func createWalls() {
        
        let wallPair = SKNode()
        let topWall = SKSpriteNode(imageNamed: "Wall")
        let btmWall = SKSpriteNode(imageNamed: "Wall")
        
        topWall.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 350)
        btmWall.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 - 350)
        
        
        topWall.setScale(0.5)
        btmWall.setScale(0.5)
    
        wallPair.addChild(topWall)
        wallPair.addChild(btmWall)
        
        
        self.addChild(wallPair)
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
