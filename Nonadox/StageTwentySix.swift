//
//  TemplateStage.swift
//  Astrum
//
//  Created by Justin Li on 2/3/17.
//  Copyright © 2017 Justin Li. All rights reserved.
//

import SpriteKit
import Foundation
import AudioToolbox

class StageTwentySix: SKScene {
    
    let brain:Brain = Brain()
    
    override func didMove(to view: SKView) {
        
        brain.setScene(scene: self)
        brain.setLocation()
        brain.levelNumber(levelNum: 26, nextNum: 27)
        brain.setDirections(direct:[[1,1],[1,0,1],[0,1,1],[1,0,0,0],[0,0,1,1],[0,1,1,0],[1,0,0,2],[1,0,1,0],[0,0,1,2]])
        brain.setScore(gold: 13, silver: 16, bronze: 19)
        brain.winningCondition(winState:[0,1,0,1,0,1,1,1,2])
        brain.load()
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            if brain.victory.contains(touch.location(in: self)) && brain.won == true{
                
                let nextScene = StageTwentySeven(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.2)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
            }
            
            if brain.buttons[0].contains(touch.location(in: self)) {
                
                brain.buttons[0].alpha = 0.2
                
            }
            if brain.buttons[1].contains(touch.location(in: self)) {
                
                brain.buttons[1].alpha = 0.2
                
            }
            
            if brain.won == false{
                if brain.diamonds[0].contains(touch.location(in: self)) {
                    
                    brain.diamonds[0].alpha = 0.7
                    brain.innerDiamonds[0].alpha = 0.4
                    
                }
                if brain.diamonds[1].contains(touch.location(in: self)) {
                    
                    brain.diamonds[1].alpha = 0.7
                    brain.innerDiamonds[1].alpha = 0.4
                    
                }
                if brain.diamonds[2].contains(touch.location(in: self)) {
                    
                    brain.diamonds[2].alpha = 0.7
                    brain.innerDiamonds[2].alpha = 0.4
                    
                }
                if brain.diamonds[3].contains(touch.location(in: self)) {
                    
                    brain.diamonds[3].alpha = 0.7
                    
                    brain.innerDiamonds[3].alpha = 0.4
                }
                if brain.diamonds[4].contains(touch.location(in: self)) {
                    
                    brain.diamonds[4].alpha = 0.7
                    brain.innerDiamonds[4].alpha = 0.4
                    
                }
                if brain.diamonds[5].contains(touch.location(in: self)) {
                    
                    brain.diamonds[5].alpha = 0.7
                    brain.innerDiamonds[5].alpha = 0.4
                    
                }
                if brain.diamonds[6].contains(touch.location(in: self)) {
                    
                    brain.diamonds[6].alpha = 0.7
                    brain.innerDiamonds[6].alpha = 0.4
                    
                }
                if brain.diamonds[7].contains(touch.location(in: self)) {
                    
                    brain.diamonds[7].alpha = 0.7
                    brain.innerDiamonds[7].alpha = 0.4
                    
                }
                if brain.diamonds[8].contains(touch.location(in: self)) {
                    
                    brain.diamonds[8].alpha = 0.7
                    brain.innerDiamonds[8].alpha = 0.4
                }
            }
            
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            if brain.buttons[0].contains(touch.location(in: self)) {
                
                let nextScene = GameSelect2(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.2)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
            }
            if brain.buttons[1].contains(touch.location(in: self)) {
                
                let nextScene = StageTwentySix(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.2)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
            }
            brain.buttons[0].run(SKAction.fadeIn(withDuration: 0.2))
            brain.buttons[1].run(SKAction.fadeIn(withDuration: 0.2))
            if brain.won == false{
                if brain.diamonds[0].contains(touch.location(in: self)) {
                    
                    brain.update(point: 0)
                    
                }
                if brain.diamonds[1].contains(touch.location(in: self)) {
                    
                    brain.update(point: 1)
                    
                }
                if brain.diamonds[2].contains(touch.location(in: self)) {
                    
                    brain.update(point: 2)
                    
                }
                if brain.diamonds[3].contains(touch.location(in: self)) {
                    
                    brain.update(point: 3)
                    
                }
                if brain.diamonds[4].contains(touch.location(in: self)) {
                    
                    brain.update(point: 4)
                    
                }
                if brain.diamonds[5].contains(touch.location(in: self)) {
                    
                    brain.update(point: 5)
                    
                }
                if brain.diamonds[6].contains(touch.location(in: self)) {
                    
                    brain.update(point: 6)
                    
                }
                if brain.diamonds[7].contains(touch.location(in: self)) {
                    
                    brain.update(point: 7)
                    
                }
                if brain.diamonds[8].contains(touch.location(in: self)) {
                    
                    brain.update(point: 8)
                    
                }
                for i in 0..<9{
                    brain.diamonds[i].run(SKAction.fadeIn(withDuration: 0.2))
                    brain.innerDiamonds[i].run(SKAction.fadeIn(withDuration: 0.2))
                }
                
                
            }
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
    }
    
}




