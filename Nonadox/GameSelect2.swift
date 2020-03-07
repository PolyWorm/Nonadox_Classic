//
//  GameScene.swift
//  test
//
//  Created by Justin Li on 9/12/16.
//  Copyright (c) 2016 Justin Li. All rights reserved.
//

import SpriteKit
import Foundation
import AudioToolbox

class GameSelect2: SKScene {
    
    let defaults = UserDefaults.standard
    
    var tapPow = 0
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    var timer4 = Timer()
    let stages = SKLabelNode(fontNamed:"Modern Sans")
    let pause = SKSpriteNode(imageNamed: "")
    let numberFormatter = NumberFormatter()
    let levelselect = SKSpriteNode(imageNamed: "levelselect")
    
    var a1button = SKSpriteNode(imageNamed: "circle")
    var a2button = SKSpriteNode(imageNamed: "bronze")
    var a3button = SKSpriteNode(imageNamed: "silver")
    var a4button = SKSpriteNode(imageNamed: "silver")
    var b1button = SKSpriteNode(imageNamed: "gold")
    var b2button = SKSpriteNode(imageNamed: "circle")
    var b3button = SKSpriteNode(imageNamed: "circle")
    var b4button = SKSpriteNode(imageNamed: "circle")
    var c1button = SKSpriteNode(imageNamed: "circle")
    var c2button = SKSpriteNode(imageNamed: "circle")
    var c3button = SKSpriteNode(imageNamed: "circle")
    var c4button = SKSpriteNode(imageNamed: "circle")
    
    var d1button = SKSpriteNode(imageNamed: "circle")
    var d2button = SKSpriteNode(imageNamed: "circle")
    var d3button = SKSpriteNode(imageNamed: "circle")
    var d4button = SKSpriteNode(imageNamed: "circle")
    
    var page1 = SKSpriteNode(imageNamed: "page")
    var page2 = SKSpriteNode(imageNamed: "page")
    var page3 = SKSpriteNode(imageNamed: "page")
    var page4 = SKSpriteNode(imageNamed: "page")
    var threedots = SKSpriteNode(imageNamed: "threedots")
    
    var left = SKSpriteNode(imageNamed: "left")
    var right = SKSpriteNode(imageNamed: "right")
    
    let level1 = SKLabelNode(fontNamed:"Modern Sans")
    let level2 = SKLabelNode(fontNamed:"Modern Sans")
    let level3 = SKLabelNode(fontNamed:"Modern Sans")
    let level4 = SKLabelNode(fontNamed:"Modern Sans")
    let level5 = SKLabelNode(fontNamed:"Modern Sans")
    let level6 = SKLabelNode(fontNamed:"Modern Sans")
    let level7 = SKLabelNode(fontNamed:"Modern Sans")
    let level8 = SKLabelNode(fontNamed:"Modern Sans")
    let level9 = SKLabelNode(fontNamed:"Modern Sans")
    let level10 = SKLabelNode(fontNamed:"Modern Sans")
    let level11 = SKLabelNode(fontNamed:"Modern Sans")
    let level12 = SKLabelNode(fontNamed:"Modern Sans")
    let level13 = SKLabelNode(fontNamed:"Modern Sans")
    let level14 = SKLabelNode(fontNamed:"Modern Sans")
    let level15 = SKLabelNode(fontNamed:"Modern Sans")
    let level16 = SKLabelNode(fontNamed:"Modern Sans")
    
    let sound = SKSpriteNode(imageNamed: "sound1")
    let info = SKSpriteNode(imageNamed: "info")
    var menu = 0
    
    override func didMove(to view: SKView) {
        
        
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameSelect2.swipedRight(_:)))
        swipeRight.direction = .right
        swipeRight.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeRight)
        
        
        
        //background
        let Back = SKSpriteNode(imageNamed: "bg_2-4")
        Back.size = CGSize(width: frame.size.width, height: frame.size.height)
        Back.zPosition = 0
        Back.position = CGPoint(x:frame.size.width * 0.5, y:frame.size.height * 0.5)
        
        //Stages
        
        //stars
        
        load()
        fadein()
        
        defaults.set(1, forKey: "page")
        
        self.addChild(Back)
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            
            if menu == 1 {
                
                if info.contains(touch.location(in: self)){
                    
                    let url = NSURL(string: "http://imjustin.li")
                    UIApplication.shared.openURL(url as! URL)
                    
                }
                if sound.contains(touch.location(in: self)){
                    if defaults.integer(forKey: "sound") == 0 {
                        SKTAudio.sharedInstance().pauseBackgroundMusic()
                        sound.texture = SKTexture(imageNamed: "sound2")
                        defaults.set(1, forKey: "sound")
                    }
                    else if defaults.integer(forKey: "sound") == 1 {
                        SKTAudio.sharedInstance().resumeBackgroundMusic()
                        sound.texture = SKTexture(imageNamed: "sound1")
                        defaults.set(0, forKey: "sound")
                    }
                }
            }
            
            if threedots.contains(touch.location(in: self)){
                
                menuOut()
                
            }
            
            if a1button.contains(touch.location(in: self)) && defaults.integer(forKey: "s16") > 0 {
                
                fadeout()
                a1button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageSixteen(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            
            if a2button.contains(touch.location(in: self)) && defaults.integer(forKey: "s17") > 0{
                
                fadeout()
                a2button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageSeventeen(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if a3button.contains(touch.location(in: self)) && defaults.integer(forKey: "s18") > 0{
                
                fadeout()
                a3button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageEighteen(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if a4button.contains(touch.location(in: self)) && defaults.integer(forKey: "s19") > 0{
                
                fadeout()
                a4button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageNineteen(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if b1button.contains(touch.location(in: self)) && defaults.integer(forKey: "s20") > 0{
                
                fadeout()
                b1button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwenty(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if b2button.contains(touch.location(in: self)) && defaults.integer(forKey: "s21") > 0{
                
                fadeout()
                b2button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentyOne(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if b3button.contains(touch.location(in: self)) && defaults.integer(forKey: "s22") > 0{
                
                fadeout()
                b3button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentyTwo(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if b4button.contains(touch.location(in: self)) && defaults.integer(forKey: "s23") > 0{
                
                fadeout()
                b4button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentyThree(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if c1button.contains(touch.location(in: self)) && defaults.integer(forKey: "s24") > 0{
                
                fadeout()
                c1button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentyFour(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if c2button.contains(touch.location(in: self)) && defaults.integer(forKey: "s25") > 0{
                
                fadeout()
                c2button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentyFive(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if c3button.contains(touch.location(in: self)) && defaults.integer(forKey: "s26") > 0{
                
                fadeout()
                c3button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentySix(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if c4button.contains(touch.location(in: self)) && defaults.integer(forKey: "s27") > 0{
                
                fadeout()
                c4button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentySeven(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if d1button.contains(touch.location(in: self)) && defaults.integer(forKey: "s28") > 0{
                
                fadeout()
                d1button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentyEight(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if d2button.contains(touch.location(in: self)) && defaults.integer(forKey: "s29") > 0{
                
                fadeout()
                d2button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageTwentyNine(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            if d3button.contains(touch.location(in: self)) && defaults.integer(forKey: "s30") > 0{
                
                fadeout()
                d3button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageThirty(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }
            
            if d4button.contains(touch.location(in: self)) && defaults.integer(forKey: "s31") > 0{
                
                fadeout()
                d4button.alpha = 0.2
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                let nextScene = StageThirtyOne(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    let transition = SKTransition.crossFade(withDuration: 0.5)
                    self.scene?.view?.presentScene(nextScene, transition: transition)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                
            }

            if left.contains(touch.location(in: self)) {
                
                left.alpha = 0.2
                let nextScene = GameSelect(size: scene!.size)
                let wait = SKAction.wait(forDuration: 0.6)
                let block = SKAction.run({
                    nextScene.scaleMode = .aspectFill
                    
                    self.scene?.view?.presentScene(nextScene)
                })
                let sequence = SKAction.sequence([wait,block])
                run(sequence)
                fadeout()
                SKTAudio.sharedInstance().playSoundEffect("g#.wav")
                
            }
            
            
        }
        
    }
    
    
    func swipedRight(_ sender:UISwipeGestureRecognizer){
        
        
        let nextScene = GameSelect(size: scene!.size)
        let wait = SKAction.wait(forDuration: 0.6)
        let block = SKAction.run({
            nextScene.scaleMode = .aspectFill
            
            self.scene?.view?.presentScene(nextScene)
        })
        let sequence = SKAction.sequence([wait,block])
        run(sequence)
        fadeout()
        
    }
    
    func starone(){
        
        let star1 = SKTexture(imageNamed: "star_1")
        let star2 = SKTexture(imageNamed: "star_4")
        let star3 = SKTexture(imageNamed: "star_3")
        let star4 = SKTexture(imageNamed: "star_2")
        
        let animate = SKAction.sequence([
            SKAction.animate(with: [star1, star2, star3, star4, star1, star3, star4], timePerFrame: 0.2)
            ])
        
        let particle = SKAction.repeat(animate, count: 10)
        
        let sprite = SKSpriteNode(texture: star1)
        
        
        
        let posX = CGFloat(arc4random_uniform(1000) + 1)
        let posY = CGFloat(arc4random_uniform(1000) + 1)
        
        sprite.xScale = 1.5
        sprite.yScale = 1.5
        sprite.position = CGPoint(x:frame.size.width * (posX/1000), y:frame.size.height * (posY/1000))
        sprite.alpha = 0.0
        sprite.zPosition = 2
        
        self.addChild(sprite)
        let fadeIn = SKAction.fadeIn(withDuration: 1.0)
        
        let fadeAway = SKAction.fadeOut(withDuration: 5.0)
        let removeNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fadeIn, particle, fadeAway, removeNode])
        sprite.run(sequence)
        
        
        
    }
    
    
    func startwo(){
        
        let star1 = SKTexture(imageNamed: "star_1")
        
        
        let sprite = SKSpriteNode(texture: star1)
        
        
        
        let posX = CGFloat(arc4random_uniform(1000) + 1)
        let posY = CGFloat(arc4random_uniform(1000) + 1)
        
        sprite.xScale = 1
        sprite.yScale = 1
        sprite.position = CGPoint(x:frame.size.width * (posX/1000), y:frame.size.height * (posY/1000))
        sprite.alpha = 0.0
        sprite.zPosition = 2
        
        self.addChild(sprite)
        let fadeIn = SKAction.fadeIn(withDuration: 5.0)
        
        let fadeAway = SKAction.fadeOut(withDuration: 5.0)
        let removeNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fadeIn, fadeAway, removeNode])
        sprite.run(sequence)
        
    }
    func meteor(){
        
        let star1 = SKTexture(imageNamed: "star_1")
        
        
        let sprite = SKSpriteNode(texture: star1)
        
        
        
        let posY = CGFloat(arc4random_uniform(500) + 400)
        
        let scale = CGFloat(arc4random_uniform(20) + 10)
        sprite.xScale = scale
        sprite.yScale = 0.7
        
        sprite.position = CGPoint(x:-20, y: self.frame.size.height * (posY/1000))
        sprite.alpha = 0.5
        sprite.zPosition = 2
        
        self.addChild(sprite)
        let rotate = SKAction.rotate(byAngle: -0.26179, duration: 0)
        let move = SKAction.moveBy(x: self.frame.size.width, y: -self.frame.size.width * 0.2679, duration: 0.5)
        let removeNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([rotate, move, removeNode])
        sprite.run(sequence)
        
    }
    
    
    func playSound(){
        
        
    }
    func menuOut(){
        if menu == 0 {
            
            info.run(SKAction.sequence([SKAction.wait(forDuration: 0.05
                ), SKAction.fadeAlpha(to: 0.8, duration: 0.1)]))
            sound.run(SKAction.fadeAlpha(to: 0.8, duration: 0.1))
            menu = 1
        }
        else if menu == 1{
            
            info.run(SKAction.sequence([SKAction.wait(forDuration: 0.05), SKAction.fadeAlpha(to: 0.0, duration: 0.1)]))
            sound.run(SKAction.fadeAlpha(to: 0.0, duration: 0.1))
            
            menu = 0
        }
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func load(){
        
        if defaults.integer(forKey: "sound") == 0 {
            
            sound.texture = SKTexture(imageNamed: "sound1")
            
        }
        if defaults.integer(forKey: "sound") == 1 {
            
            sound.texture = SKTexture(imageNamed: "sound2")
            
        }
        sound.position = CGPoint(x: (frame.size.width  * 0.85), y: frame.size.height * 0.95)
        sound.zPosition = 4
        sound.size = CGSize(width: 60, height: 60)
        sound.alpha = 0.0
        
        info.position = CGPoint(x: (frame.size.width  * 0.75), y: frame.size.height * 0.95)
        info.zPosition = 4
        info.size = CGSize(width: 60, height: 60)
        info.alpha = 0.0
        
        switch defaults.integer(forKey: "s16"){
            
        case 0:
            a1button = SKSpriteNode(imageNamed: "locked")
        case 1:
            a1button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            a1button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            a1button = SKSpriteNode(imageNamed: "silver")
        case 4:
            a1button = SKSpriteNode(imageNamed: "gold")
        default:
            a1button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        
        switch defaults.integer(forKey: "s17"){
            
        case 0:
            a2button = SKSpriteNode(imageNamed: "locked")
        case 1:
            a2button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            a2button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            a2button = SKSpriteNode(imageNamed: "silver")
        case 4:
            a2button = SKSpriteNode(imageNamed: "gold")
        default:
            a2button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s18"){
            
        case 0:
            a3button = SKSpriteNode(imageNamed: "locked")
        case 1:
            a3button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            a3button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            a3button = SKSpriteNode(imageNamed: "silver")
        case 4:
            a3button = SKSpriteNode(imageNamed: "gold")
        default:
            a2button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s19"){
            
        case 0:
            a4button = SKSpriteNode(imageNamed: "locked")
        case 1:
            a4button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            a4button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            a4button = SKSpriteNode(imageNamed: "silver")
        case 4:
            a4button = SKSpriteNode(imageNamed: "gold")
        default:
            a4button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s20"){
            
        case 0:
            b1button = SKSpriteNode(imageNamed: "locked")
        case 1:
            b1button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            b1button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            b1button = SKSpriteNode(imageNamed: "silver")
        case 4:
            b1button = SKSpriteNode(imageNamed: "gold")
        default:
            b1button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s21"){
            
        case 0:
            b2button = SKSpriteNode(imageNamed: "locked")
        case 1:
            b2button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            b2button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            b2button = SKSpriteNode(imageNamed: "silver")
        case 4:
            b2button = SKSpriteNode(imageNamed: "gold")
        default:
            b2button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s22"){
            
        case 0:
            b3button = SKSpriteNode(imageNamed: "locked")
        case 1:
            b3button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            b3button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            b3button = SKSpriteNode(imageNamed: "silver")
        case 4:
            b3button = SKSpriteNode(imageNamed: "gold")
        default:
            b3button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s23"){
            
        case 0:
            b4button = SKSpriteNode(imageNamed: "locked")
        case 1:
            b4button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            b4button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            b4button = SKSpriteNode(imageNamed: "silver")
        case 4:
            b4button = SKSpriteNode(imageNamed: "gold")
        default:
            b4button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s24"){
            
        case 0:
            c1button = SKSpriteNode(imageNamed: "locked")
        case 1:
            c1button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            c1button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            c1button = SKSpriteNode(imageNamed: "silver")
        case 4:
            c1button = SKSpriteNode(imageNamed: "gold")
        default:
            c1button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s25"){
            
        case 0:
            c2button = SKSpriteNode(imageNamed: "locked")
        case 1:
            c2button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            c2button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            c2button = SKSpriteNode(imageNamed: "silver")
        case 4:
            c2button = SKSpriteNode(imageNamed: "gold")
        default:
            c2button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s26"){
            
        case 0:
            c3button = SKSpriteNode(imageNamed: "locked")
        case 1:
            c3button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            c3button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            c3button = SKSpriteNode(imageNamed: "silver")
        case 4:
            c3button = SKSpriteNode(imageNamed: "gold")
        default:
            c3button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s27"){
            
        case 0:
            c4button = SKSpriteNode(imageNamed: "locked")
        case 1:
            c4button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            c4button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            c4button = SKSpriteNode(imageNamed: "silver")
        case 4:
            c4button = SKSpriteNode(imageNamed: "gold")
        default:
            c4button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s28"){
            
        case 0:
            d1button = SKSpriteNode(imageNamed: "locked")
        case 1:
            d1button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            d1button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            d1button = SKSpriteNode(imageNamed: "silver")
        case 4:
            d1button = SKSpriteNode(imageNamed: "gold")
        default:
            d1button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s29"){
            
        case 0:
            d2button = SKSpriteNode(imageNamed: "locked")
        case 1:
            d2button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            d2button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            d2button = SKSpriteNode(imageNamed: "silver")
        case 4:
            d2button = SKSpriteNode(imageNamed: "gold")
        default:
            d2button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s30"){
            
        case 0:
            d3button = SKSpriteNode(imageNamed: "locked")
        case 1:
            d3button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            d3button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            d3button = SKSpriteNode(imageNamed: "silver")
        case 4:
            d3button = SKSpriteNode(imageNamed: "gold")
        default:
            d3button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        switch defaults.integer(forKey: "s31"){
            
        case 0:
            d4button = SKSpriteNode(imageNamed: "locked")
        case 1:
            d4button = SKSpriteNode(imageNamed: "unlocked")
        case 2:
            d4button = SKSpriteNode(imageNamed: "bronze")
        case 3:
            d4button = SKSpriteNode(imageNamed: "silver")
        case 4:
            d4button = SKSpriteNode(imageNamed: "gold")
        default:
            d4button = SKSpriteNode(imageNamed: "unlocked")
            
        }
        
        
        
        a1button.position = CGPoint(x: (frame.size.width  * 0.30), y: frame.size.height * 0.575)
        a1button.zPosition = 4
        a1button.size = CGSize(width: 80, height: 80)
        a1button.alpha = 0.0
        
        a2button.position = CGPoint(x: frame.size.width * 0.43333, y: frame.size.height * 0.575)
        a2button.zPosition = 4
        a2button.size = CGSize(width: 80, height: 80)
        a2button.alpha = 0.0
        
        a3button.position = CGPoint(x: frame.size.width * 0.56666, y: frame.size.height * 0.575)
        a3button.zPosition = 4
        a3button.size = CGSize(width: 80, height: 80)
        a3button.alpha = 0.0
        
        a4button.position = CGPoint(x: frame.size.width * 0.70, y: frame.size.height * 0.575)
        a4button.zPosition = 4
        a4button.size = CGSize(width: 80, height: 80)
        a4button.alpha = 0.0
        
        b1button.position = CGPoint(x: frame.size.width * 0.30, y: frame.size.height * 0.50)
        b1button.zPosition = 4
        b1button.size = CGSize(width: 80, height: 80)
        b1button.alpha = 0.0
        
        b2button.position = CGPoint(x: frame.size.width * 0.433333, y: frame.size.height * 0.50)
        b2button.zPosition = 4
        b2button.size = CGSize(width: 80, height: 80)
        b2button.alpha = 0.0
        
        b3button.position = CGPoint(x: frame.size.width * 0.56666, y: frame.size.height * 0.50)
        b3button.zPosition = 4
        b3button.size = CGSize(width: 80, height: 80)
        b3button.alpha = 0.0
        
        b4button.position = CGPoint(x: frame.size.width * 0.70, y: frame.size.height * 0.50)
        b4button.zPosition = 4
        b4button.size = CGSize(width: 80, height: 80)
        b4button.alpha = 0.0
        
        c1button.position = CGPoint(x: frame.size.width * 0.30, y: frame.size.height * 0.425)
        c1button.zPosition = 4
        c1button.size = CGSize(width: 80, height: 80)
        c1button.alpha = 0.0
        
        c2button.position = CGPoint(x: frame.size.width * 0.433333, y: frame.size.height * 0.425)
        c2button.zPosition = 4
        c2button.size = CGSize(width: 80, height: 80)
        c2button.alpha = 0.0
        
        c3button.position = CGPoint(x: frame.size.width * 0.56666, y: frame.size.height * 0.425)
        c3button.zPosition = 4
        c3button.size = CGSize(width: 80, height: 80)
        c3button.alpha = 0.0
        
        c4button.position = CGPoint(x: frame.size.width * 0.70, y: frame.size.height * 0.425)
        c4button.zPosition = 4
        c4button.size = CGSize(width: 80, height: 80)
        c4button.alpha = 0.0
        
        d1button.position = CGPoint(x: frame.size.width * 0.30, y: frame.size.height * 0.350)
        d1button.zPosition = 4
        d1button.size = CGSize(width: 80, height: 80)
        d1button.alpha = 0.0
        
        d2button.position = CGPoint(x: frame.size.width * 0.433333, y: frame.size.height * 0.350)
        d2button.zPosition = 4
        d2button.size = CGSize(width: 80, height: 80)
        d2button.alpha = 0.0
        
        d3button.position = CGPoint(x: frame.size.width * 0.566666, y: frame.size.height * 0.350)
        d3button.zPosition = 4
        d3button.size = CGSize(width: 80, height: 80)
        d3button.alpha = 0.0
        
        d4button.position = CGPoint(x: frame.size.width * 0.70, y: frame.size.height * 0.350)
        d4button.zPosition = 4
        d4button.size = CGSize(width: 80, height: 80)
        d4button.alpha = 0.0
        
        
        left.position = CGPoint(x: frame.size.width * 0.43, y: frame.size.height * 0.14)
        left.zPosition = 5
        left.size = CGSize(width: 100, height: 100)
        left.alpha = 1.0
        
        right.position = CGPoint(x: frame.size.width * 0.57, y: frame.size.height * 0.14)
        right.zPosition = 5
        right.size = CGSize(width: 100, height: 100)
        right.alpha = 1.0
        
        
        level1.text = ("16")
        level1.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level1.fontSize = 40
        level1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level1.position = CGPoint(x: (frame.size.width  * 0.30), y: frame.size.height * 0.565)
        level1.zPosition = 5
        level1.alpha = 0.0
        
        
        level2.text = ("17")
        level2.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level2.fontSize = 40
        level2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level2.position = CGPoint(x: (frame.size.width  * 0.433333), y: frame.size.height * 0.565)
        level2.zPosition = 5
        level2.alpha = 0.0
        
        
        
        level3.text = ("18")
        level3.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level3.fontSize = 40
        level3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level3.position = CGPoint(x: (frame.size.width  * 0.566666), y: frame.size.height * 0.565)
        level3.zPosition = 5
        level3.alpha = 0.0
        
        
        level4.text = ("19")
        level4.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level4.fontSize = 40
        level4.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level4.position = CGPoint(x: (frame.size.width  * 0.70), y: frame.size.height * 0.565)
        level4.zPosition = 5
        level4.alpha = 0.0
        
        
        level5.text = ("20")
        level5.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level5.fontSize = 40
        level5.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level5.position = CGPoint(x: frame.size.width * 0.30, y: frame.size.height * 0.49)
        level5.zPosition = 5
        level5.alpha = 0.0
        
        
        
        level6.text = ("21")
        level6.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level6.fontSize = 40
        level6.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level6.position = CGPoint(x: frame.size.width * 0.433333, y: frame.size.height * 0.49)
        level6.zPosition = 5
        level6.alpha = 0.0
        
        level7.text = ("22")
        level7.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level7.fontSize = 40
        level7.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level7.position = CGPoint(x: frame.size.width * 0.566666, y: frame.size.height * 0.49)
        level7.zPosition = 5
        level7.alpha = 0.0
        
        level8.text = ("23")
        level8.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level8.fontSize = 40
        level8.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level8.position = CGPoint(x: frame.size.width * 0.70, y: frame.size.height * 0.49)
        level8.zPosition = 5
        level8.alpha = 0.0
        
        level9.text = ("24")
        level9.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level9.fontSize = 40
        level9.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level9.position = CGPoint(x: frame.size.width * 0.30, y: frame.size.height * 0.415)
        level9.zPosition = 5
        level9.alpha = 0.0
        
        level10.text = ("25")
        level10.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level10.fontSize = 40
        level10.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level10.position = CGPoint(x: frame.size.width * 0.4333333, y: frame.size.height * 0.415)
        level10.zPosition = 5
        level10.alpha = 0.0
        
        level11.text = ("26")
        level11.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level11.fontSize = 40
        level11.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level11.position = CGPoint(x: frame.size.width * 0.566666, y: frame.size.height * 0.415)
        level11.zPosition = 5
        level11.alpha = 0.0
        
        level12.text = ("27")
        level12.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level12.fontSize = 40
        level12.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level12.position = CGPoint(x: frame.size.width * 0.70, y: frame.size.height * 0.415)
        level12.zPosition = 5
        level12.alpha = 0.0
        
        level13.text = ("28")
        level13.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level13.fontSize = 40
        level13.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level13.position = CGPoint(x: frame.size.width * 0.3, y: frame.size.height * 0.340)
        level13.zPosition = 5
        level13.alpha = 0.0
        
        level14.text = ("29")
        level14.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level14.fontSize = 40
        level14.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level14.position = CGPoint(x: frame.size.width * 0.433333, y: frame.size.height * 0.340)
        level14.zPosition = 5
        level14.alpha = 0.0
        
        level15.text = ("30")
        level15.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level15.fontSize = 40
        level15.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level15.position = CGPoint(x: frame.size.width * 0.566666, y: frame.size.height * 0.340)
        level15.zPosition = 5
        level15.alpha = 0.0
        
        level16.text = ("31")
        level16.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        level16.fontSize = 40
        level16.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        level16.position = CGPoint(x: frame.size.width * 0.70, y: frame.size.height * 0.340)
        level16.zPosition = 5
        level16.alpha = 0.0
        
        page1.position = CGPoint(x: frame.size.width * 0.48, y: frame.size.height * 0.20)
        page1.zPosition = 5
        page1.size = CGSize(width: 15, height: 15)
        page1.alpha = 0.3
        
        page2.position = CGPoint(x: frame.size.width * 0.52, y: frame.size.height * 0.20)
        page2.zPosition = 5
        page2.size = CGSize(width: 15, height: 15)
        page2.alpha = 1.0
        
        addChild(a1button)
        addChild(a2button)
        addChild(a3button)
        addChild(a4button)
        addChild(b1button)
        addChild(b2button)
        addChild(b3button)
        addChild(b4button)
        addChild(c1button)
        addChild(c2button)
        addChild(c3button)
        addChild(c4button)
        addChild(d1button)
        addChild(d2button)
        addChild(d3button)
        addChild(d4button)
        
        addChild(left)
        addChild(right)
        
        addChild(page1)
        addChild(page2)
        
        addChild(level1)
        addChild(level2)
        addChild(level3)
        addChild(level4)
        addChild(level5)
        addChild(level6)
        addChild(level7)
        addChild(level8)
        addChild(level9)
        addChild(level10)
        addChild(level11)
        addChild(level12)
        addChild(level13)
        addChild(level14)
        addChild(level15)
        addChild(level16)
        
        addChild(info)
        addChild(sound)
        
        
        
        
    }
    
    
    
    func fadeout(){
        
        let fade = SKAction.fadeOut(withDuration: 0.2)
        
        let wait = SKAction.wait(forDuration: 0.1)
        let wait2 = SKAction.wait(forDuration: 0.2)
        let wait3 = SKAction.wait(forDuration: 0.3)
        let sequence = SKAction.sequence([wait, fade])
        let sequence2 = SKAction.sequence([wait2, fade])
        let sequence3 = SKAction.sequence([wait3, fade])
        

        
        a1button.run(fade)
        a2button.run(fade)
        a3button.run(fade)
        a4button.run(fade)
        
        level1.run(fade)
        level2.run(fade)
        level3.run(fade)
        level4.run(fade)
        
        b1button.run(sequence)
        b2button.run(sequence)
        b3button.run(sequence)
        b4button.run(sequence)
        
        level5.run(sequence)
        level6.run(sequence)
        level7.run(sequence)
        level8.run(sequence)
        
        c1button.run(sequence2)
        c2button.run(sequence2)
        c3button.run(sequence2)
        c4button.run(sequence2)
        
        level9.run(sequence2)
        level10.run(sequence2)
        level11.run(sequence2)
        level12.run(sequence2)
        
        d1button.run(sequence3)
        d2button.run(sequence3)
        d3button.run(sequence3)
        d4button.run(sequence3)
        
        level13.run(sequence3)
        level14.run(sequence3)
        level15.run(sequence3)
        level16.run(sequence3)
        
        
        
    }
    func fadein(){
        
        
        let levelselect = SKSpriteNode(imageNamed: "levelselect")
        levelselect.zPosition = 5
        levelselect.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        levelselect.size = CGSize(width: frame.size.height * 9/16, height: frame.size.height)
        addChild(levelselect)
        
        threedots.zPosition = 5
        threedots.position = CGPoint(x: frame.size.width * 0.93, y: frame.size.height * 0.95)
        threedots.size = CGSize(width: 50, height: 50)
        addChild(threedots)

        let fade = SKAction.fadeIn(withDuration: 0.2)
        
        let wait = SKAction.wait(forDuration: 0.1)
        let wait2 = SKAction.wait(forDuration: 0.2)
        let wait3 = SKAction.wait(forDuration: 0.3)
        let sequence = SKAction.sequence([wait, fade])
        let sequence2 = SKAction.sequence([wait2, fade])
        let sequence3 = SKAction.sequence([wait3, fade])
        

        a1button.run(fade)
        a2button.run(fade)
        a3button.run(fade)
        a4button.run(fade)
        
        b1button.run(sequence)
        b2button.run(sequence)
        b3button.run(sequence)
        b4button.run(sequence)
        
        c1button.run(sequence2)
        c2button.run(sequence2)
        c3button.run(sequence2)
        c4button.run(sequence2)
        
        d1button.run(sequence3)
        d2button.run(sequence3)
        d3button.run(sequence3)
        d4button.run(sequence3)
        
        level1.run(fade)
        level2.run(fade)
        level3.run(fade)
        level4.run(fade)
        level5.run(sequence)
        level6.run(sequence)
        level7.run(sequence)
        level8.run(sequence)
        level9.run(sequence2)
        level10.run(sequence2)
        level11.run(sequence2)
        level12.run(sequence2)
        level13.run(sequence3)
        level14.run(sequence3)
        level15.run(sequence3)
        level16.run(sequence3)
        
        
    }
    
    
}




