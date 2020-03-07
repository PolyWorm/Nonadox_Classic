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


class MenuScene: SKScene {

    
    var tapPow = 0
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    var timer4 = Timer()

    let taptostart = SKLabelNode(fontNamed:"Modern Sans")//the font
    let logo = SKSpriteNode(imageNamed: "TITLESCREEN")
    let play = SKSpriteNode(imageNamed: "play")
    let settings = SKSpriteNode(imageNamed: "settings")
    let credits = SKSpriteNode(imageNamed: "credits")
    let pause = SKSpriteNode(imageNamed: "")
    let numberFormatter = NumberFormatter()
    
    let defautlts = UserDefaults.standard
    
    
    override func didMove(to view: SKView) {
        
        
        
        //background
        let Back = SKSpriteNode(imageNamed: "bg_2-4")
        Back.size = CGSize(width: frame.size.width, height: frame.size.height)
        Back.zPosition = 0
        Back.position = CGPoint(x:frame.size.width * 0.5, y:frame.size.height * 0.5)
        
        //buttons

        logo.position = CGPoint(x: frame.size.width/2, y: frame.size.height * 0.5)
        logo.zPosition = 3
        logo.xScale = 1.5
        logo.yScale = 1.5
        logo.alpha = 0.0
        logo.size = CGSize(width: frame.size.height * 9/16, height: frame.size.height)
        
        taptostart.text = ("TAP TO BEGIN")
        taptostart.zPosition = 1
        taptostart.alpha = 0.0
        taptostart.fontColor = SKColor(red: 216/255, green: 217/255, blue: 195/255, alpha: 1.0)
        taptostart.fontSize = 40
        taptostart.position = CGPoint(x: frame.size.width/2, y: frame.size.height * 0.20)
        
        //stars
        

        timer2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(MenuScene.startwo), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(MenuScene.starone), userInfo: nil, repeats: true)
        timer3 = Timer.scheduledTimer(timeInterval: 1.45, target: self, selector: #selector(MenuScene.meteor), userInfo: nil, repeats: true)
        timer4 = Timer.scheduledTimer(timeInterval: 1.73, target: self, selector: #selector(MenuScene.meteor), userInfo: nil, repeats: true)
        
        let fadeIn = SKAction.fadeAlpha(to: 0.9, duration: 0.6)
        let wait = SKAction.wait(forDuration: 0.3)
        let sequence = SKAction.sequence([wait, fadeIn])



        
        self.addChild(Back)
        self.addChild(taptostart)
        self.addChild(logo)
        logo.run(sequence)
        taptostart.run(SKAction.repeatForever(SKAction.sequence([SKAction.fadeAlpha(to: 1.0, duration: 1.5),SKAction.fadeAlpha(to: 0.2, duration: 1.5)])))

        
        SKTAudio.sharedInstance().playBackgroundMusic("NonadoxOST.mp3")
        defautlts.set(0, forKey: "sound")
        defautlts.set(0, forKey: "page")
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            

            if logo.contains(touch.location(in: self)) {
                
                
                SKTAudio.sharedInstance().playSoundEffect("e.wav")
                
                run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    SKTAudio.sharedInstance().playSoundEffect("g#.wav")
                    }]))
                
                logo.run(SKAction.sequence([SKAction.wait(forDuration: 0.0), SKAction.fadeOut(withDuration: 0.3)]))
                taptostart.removeFromParent()

                Timer.scheduledTimer(timeInterval: TimeInterval(0.6), target: self, selector: #selector(MenuScene.playScene), userInfo: nil, repeats: false)
                
                
            }

            
        }
        
    }
    
    
    func starone(){
        
        let star1 = SKTexture(imageNamed: "star_1")
        let star2 = SKTexture(imageNamed: "star_4")
        let star3 = SKTexture(imageNamed: "star_3")
        let star4 = SKTexture(imageNamed: "star_2")
        
        let animate = SKAction.sequence([
            SKAction.animate(with: [star1, star2, star3, star4, star1, star3, star4], timePerFrame: 0.5)
            ])
        
        let particle = SKAction.repeat(animate, count: 10)
        
        let sprite = SKSpriteNode(texture: star1)
        
        
        
        let posX = CGFloat(arc4random_uniform(1000) + 1)
        let posY = CGFloat(arc4random_uniform(500) + 500)
        
        sprite.xScale = 0.2
        sprite.yScale = 0.2
        sprite.position = CGPoint(x:self.frame.size.width * (posX/1000), y:self.size.height * (posY/1000))
        sprite.alpha = 0.0
        sprite.zPosition = 2
        
        self.addChild(sprite)
        let fadeIn = SKAction.fadeIn(withDuration: 1.0)
        
        let fadeAway = SKAction.fadeOut(withDuration: 4.0)
        let removeNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fadeIn, particle, fadeAway, removeNode])
        sprite.run(sequence)
        
        
        
    }
    
    
    func startwo(){
        
        let star1 = SKTexture(imageNamed: "star_1")
        
        
        let sprite = SKSpriteNode(texture: star1)
        
        
        
        let posX = CGFloat(arc4random_uniform(1000) + 1)
        let posY = CGFloat(arc4random_uniform(1000) + 1)
        
        sprite.xScale = 0.3
        sprite.yScale = 0.3
        sprite.position = CGPoint(x:self.size.width * (posX/1000), y:self.size.height * (posY/1000))
        sprite.alpha = 0.0
        sprite.zPosition = 2
        
        
        self.addChild(sprite)
        let fadeIn = SKAction.fadeIn(withDuration: 1.0)
        
        let fadeAway = SKAction.fadeOut(withDuration: 10.0)
        let removeNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fadeIn, fadeAway, removeNode])
        sprite.run(sequence)
        
    }
    
    func meteor(){
        
        let star1 = SKTexture(imageNamed: "star_1")
        
        
        let sprite = SKSpriteNode(texture: star1)
        
        
        
        let posY = CGFloat(arc4random_uniform(500) + 700)
        
        let scale = CGFloat(arc4random_uniform(20) + 10)
        sprite.xScale = scale
        sprite.yScale = 0.2
        
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
    
    
    func playScene(){
        
        let nextScene = GameSelect(size: scene!.size)
        nextScene.scaleMode = .aspectFill

        
        scene?.view?.presentScene(nextScene)
        
    }

    
    func playSound(){
      
        
    }

    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */


    }
    
}




