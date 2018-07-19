//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct GameControls {
	
	let gameScene: GameScene!
	
	/// Exit Buttons and Labels
	let buttonReplay: SKSpriteNode
    let buttonExit: SKSpriteNode
    let net: SKSpriteNode
    let background: SKSpriteNode
	let message: SKLabelNode
	
	init(inThisScene: GameScene) {
		
		gameScene = inThisScene
        
        /// Net Image
        net = SKSpriteNode.init(imageNamed: "Net")
        net.name = "label-Title"
        net.zPosition = 2
        net.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
        
        /// Background Image
        background = SKSpriteNode.init(imageNamed: "Background")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
		
		/// Replay  Button
		buttonReplay = SKSpriteNode.init(imageNamed: "ButtonReplay")
		buttonReplay.name = "buttonSprite-Replay"
		buttonReplay.zPosition = 3
		buttonReplay.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*7/40))
        
        /// Replay  Button
        buttonExit = SKSpriteNode.init(imageNamed: "ButtonExit")
        buttonExit.name = "buttonSprite-Exit"
        buttonExit.zPosition = 3
        buttonExit.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*3/40))
		
		/// Label Message
		message = SKLabelNode.init(text: "")
		message.name = "gameMessage"
		message.fontName = "Avenir-Heavy"
		message.horizontalAlignmentMode = .center
		message.verticalAlignmentMode = .center
		message.fontColor = .white
		message.fontSize = 80
		message.zPosition = 6
		message.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*18/20))
        
        /// Resizing buttons
        let resizeFactorX:CGFloat = gameScene.size.width/407.0
        let resizeFactorY:CGFloat = gameScene.size.height/599.0
        let originalSize = buttonReplay.size
        buttonReplay.size = CGSize(width: originalSize.width*resizeFactorX/2.5, height: originalSize.height*resizeFactorY/2.8)
        buttonExit.size = CGSize(width: originalSize.width*resizeFactorX/3.4, height: originalSize.height*resizeFactorY/3.2)
        
        /// Resizing Background
        let resizeFactorBgX:CGFloat = gameScene.size.width/384.0
        let resizeFactorBgY:CGFloat = gameScene.size.height/675.0
        let backgroundOriginalSize = background.size
        background.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
        
        /// Resizing Net
        let resizeFactorNetX:CGFloat = gameScene.size.width/818.0
        let resizeFactorNetY:CGFloat = gameScene.size.height/889.0
        let netOriginalSize = net.size
        net.size = CGSize(width: netOriginalSize.width*resizeFactorNetX/1.2, height: netOriginalSize.height*resizeFactorNetY/1.9)

	}
	
}
