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
	
	// Arrays of
	var placeholder : [SKShapeNode] = []
	var elementSprite: [SKSpriteNode] = []
	
	var gameState : Int
	var board : [[Int]] = [[0,0,0],[0,0,0],[0,0,0]]
	
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
		message.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
        
        /// Painting placeholders
        var i = 0
        for x in -1...1 {
            for y in -1...1 {

				// TODO: Works with iPhone 6, needs to be resized to other formats
				placeholder.append(SKShapeNode(rectOf: CGSize(width: 98, height: 98)))
				let valX = (gameScene.size.width/2) + CGFloat(115*x)
				let valY = ( gameScene.size.height/2) - CGFloat(118*y)
				
                placeholder[i].position = CGPoint(x: valX, y: valY)
                placeholder[i].fillColor = .clear
				placeholder[i].strokeColor = .clear
                placeholder[i].zPosition = 4
                placeholder[i].name = "Position \(i)"
                
                i += 1
            }
        }
        
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

		/// Game Variables
		gameState = 1
	}

	mutating func paintElement(position: Int) {
		// Check gameState
		if gameState == 1 {
			elementSprite.append(SKSpriteNode.init(imageNamed: "cross"))
		}
		if gameState == 2 {
			elementSprite.append(SKSpriteNode.init(imageNamed: "circle"))
		}
		
		// Paint Element
		placeholder[position].isHidden = true
		elementSprite.last?.position = placeholder[position].position
		elementSprite.last?.size = CGSize(width: 100, height: 100)
		elementSprite.last!.zPosition = 5
		gameScene.addChild(elementSprite.last!)
		placeholder[position].removeFromParent()
		
		// Set gameState
		gameState = gameStateMachine(lastState: gameState)
    }
	
	mutating func inputValue(posX: Int, posY: Int, value: Int) -> Bool {
		if ( board[posX][posY] == 0 ){
			board[posX][posY] = value
			paintElement(position: posX + (posY * 3))
			return true
		}
		else {
			return false
		}
	}
	
	// 0 = play, 1 = winX, 2 = winO, 3 = tie
	func checkPlayWinTie() -> Int {
		// Check for X Win
		if (board[0][0]==1 && board[0][1]==1 && board[0][2]==1) { return 1 }
		if (board[1][0]==1 && board[1][1]==1 && board[1][2]==1) { return 1 }
		if (board[2][0]==1 && board[2][1]==1 && board[2][2]==1) { return 1 }
		if (board[0][0]==1 && board[1][0]==1 && board[2][0]==1) { return 1 }
		if (board[0][1]==1 && board[1][1]==1 && board[2][1]==1) { return 1 }
		if (board[0][2]==1 && board[1][2]==1 && board[2][2]==1) { return 1 }
		if (board[0][0]==1 && board[1][1]==1 && board[2][2]==1) { return 1 }
		if (board[2][0]==1 && board[1][1]==1 && board[0][2]==1) { return 1 }
		
		// Check for O Win
		if (board[0][0]==2 && board[0][1]==2 && board[0][2]==2) { return 2 }
		if (board[1][0]==2 && board[1][1]==2 && board[1][2]==2) { return 2 }
		if (board[2][0]==2 && board[2][1]==2 && board[2][2]==2) { return 2 }
		if (board[0][0]==2 && board[1][0]==2 && board[2][0]==2) { return 2 }
		if (board[0][1]==2 && board[1][1]==2 && board[2][1]==2) { return 2 }
		if (board[0][2]==2 && board[1][2]==2 && board[2][2]==2) { return 2 }
		if (board[0][0]==2 && board[1][1]==2 && board[2][2]==2) { return 2 }
		if (board[2][0]==2 && board[1][1]==2 && board[0][2]==2) { return 2 }
		
		// Check that is not a Tie
		for posX in 0...2 {
			for posY in 0...2 {
				if board[posX][posY] == 0 {
					return 0
				}
			}
		}
		
		// Is a Tie
		return 3
	}
	
	// 1= playX, 2= playO, 3= winX, 4= winO, 5= tie, 0= error
	func gameStateMachine(lastState: Int) -> Int {
		if (lastState == 1 && checkPlayWinTie() == 0) {
			print("Play O")
			return 2 // Play O
		}
		if (lastState == 1 && checkPlayWinTie() == 1) {
			message.text = "Xs WIN"
			gameScene.addChild(message)
			print("Xs WIN")
			return 3 // Win X
		}
		if (lastState == 1 && checkPlayWinTie() == 3) {
			message.text = "TIE"
			gameScene.addChild(message)
			print("TIE")
			return 5 // Tie
		}
		if (lastState == 2 && checkPlayWinTie() == 0) {
			print("Play X")
			return 1 // Play X
		}
		if (lastState == 2 && checkPlayWinTie() == 2) {
			message.text = "Os WIN"
			gameScene.addChild(message)
			print("Os WIN")
			return 3 // Win O
		}
		if (lastState == 2 && checkPlayWinTie() == 3) {
			message.text = "TIE"
			gameScene.addChild(message)
			print("TIE")
			return 5 // Tie
		}
		return	0
	}
    
}
