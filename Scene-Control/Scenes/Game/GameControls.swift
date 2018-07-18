//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct GameControls {
	
	/// Exit Button and Label
	let buttonReplay: SKSpriteNode
    let buttonExit: SKSpriteNode
    var crossSprite: [SKSpriteNode] = []
    
    let net: SKSpriteNode
    let background: SKSpriteNode
    
    var placeholder : [SKShapeNode] = []
    
	
	init(inThisScene: GameScene) {
        
        /// Net Image
        net = SKSpriteNode.init(imageNamed: "Net")
        net.name = "label-Title"
        net.zPosition = 2
        net.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        
        /// Background Image
        background = SKSpriteNode.init(imageNamed: "Background")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
		
		/// Replay  Button
		buttonReplay = SKSpriteNode.init(imageNamed: "ButtonReplay")
		buttonReplay.name = "buttonSprite-Replay"
		buttonReplay.zPosition = 3
		buttonReplay.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*7/40))
        
        /// Replay  Button
        buttonExit = SKSpriteNode.init(imageNamed: "ButtonExit")
        buttonExit.name = "buttonSprite-Exit"
        buttonExit.zPosition = 3
        buttonExit.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*3/40))
        
        /// Painting placeholders
        var i = 0
        for x in 0...2 {
            for y in 0...2 {

                placeholder.append(SKShapeNode(rectOf: CGSize(width: 100, height: 100)))
                let valX = (inThisScene.size.width*3.8/20) + CGFloat(118*x)
                let valY = ( inThisScene.size.height*13.6/20) - CGFloat(119*y)
                placeholder[i].position = CGPoint(x: valX, y: valY)
                placeholder[i].fillColor = .red
                placeholder[i].zPosition = 4
                placeholder[i].name = "Position \(i)"
                
                i += 1
            }
        }
        
        /// Resizing buttons
        let resizeFactorX:CGFloat = inThisScene.size.width/407.0
        let resizeFactorY:CGFloat = inThisScene.size.height/599.0
        let originalSize = buttonReplay.size
        buttonReplay.size = CGSize(width: originalSize.width*resizeFactorX/2.5, height: originalSize.height*resizeFactorY/2.8)
        buttonExit.size = CGSize(width: originalSize.width*resizeFactorX/3.4, height: originalSize.height*resizeFactorY/3.2)
        
        /// Resizing Background
        let resizeFactorBgX:CGFloat = inThisScene.size.width/384.0
        let resizeFactorBgY:CGFloat = inThisScene.size.height/675.0
        let backgroundOriginalSize = background.size
        background.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
        
        /// Resizing Net
        let resizeFactorNetX:CGFloat = inThisScene.size.width/818.0
        let resizeFactorNetY:CGFloat = inThisScene.size.height/889.0
        let netOriginalSize = net.size
        net.size = CGSize(width: netOriginalSize.width*resizeFactorNetX/1.2, height: netOriginalSize.height*resizeFactorNetY/1.9)

	}

    func paintCross(posX: Int, posY: Int) {
        // TODO: Paint Cross
        
        
    }
    
}
