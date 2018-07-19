//
//  GameScene.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	/// GameViewControl setup as reference to handle SceneStates
	var gameViewController: GameViewController!
	
	/// Game Controls
	var gameControls: GameControls!
	
	/// Game TicTacToe
	var gameTicTacToe : GameTicTacToe!
	
    private var lastUpdateTime : TimeInterval = 0

	/// Custom Initializer
	init(sceneSize: CGSize, referenceGVC: GameViewController) {
		
		/// Set reference of GameViewControl
		gameViewController = referenceGVC
		
		/// Create scene from code
		super.init(size: sceneSize)
		
		/// Game Controls and TicTacToe
		gameControls = GameControls.init(inThisScene: self)
		gameTicTacToe = GameTicTacToe.init(inThisScene: self)
		
		/// Load scene
		if let skView = gameViewController.view as! SKView? {
			self.size = skView.bounds.size
			self.scaleMode = .fill
			
			// TODO: Comment or remove before release to App Store
			skView.ignoresSiblingOrder = true
			skView.showsFPS = true
			skView.showsNodeCount = true
		}
	}

	/// Included because is a requisite if a custom Init is used
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	/// Present Elements to the Scene
	override func didMove(to view: SKView) {
		
		
		/// Present Label and Button
        self.addChild(gameControls.background)
		self.addChild(gameControls.buttonReplay)
        self.addChild(gameControls.buttonExit)
        self.addChild(gameControls.net)
		
		gameTicTacToe.gameState = 1
		gameTicTacToe.board = [[0,0,0],[0,0,0],[0,0,0]]
		
        /// Add Placeholders
        for i in 0...8 {
			gameTicTacToe.placeholder[i].isHidden = false
            self.addChild(gameTicTacToe.placeholder[i])
        }
		
	}
	
	/// Before another Scence will be presented
	override func willMove(from view: SKView) {
		removeAllChildren()
	}
	
	/// Touch event
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			let item = atPoint(location)
			
			/// Exit and return to GameScene
			if (item.name == "buttonSprite-Exit") {
				exit(0)
			}
			else {
				if (item.name == "buttonSprite-Replay") || (gameTicTacToe.gameState >= 3){
					gameViewController.sceneStateMachine.enter(MenuSceneState.self)
				}
				else {
					for i in 0...8 {
						if gameTicTacToe.placeholder[i] == item {
							if !(gameTicTacToe.inputValue(posX: i % 3, posY: i / 3, value: gameTicTacToe.gameState)) {
								print("Invalid position, try again")
							}
						}
					}
				}
			}
		}
	}
	
}
