//
//  Brain.swift
//  Astrum
//
//  Created by Justin Li on 2/3/17.
//  Copyright © 2017 Justin Li. All rights reserved.
//

import Foundation
import SpriteKit

class TutorialBrains{
    
    // level number
    var levelNum:Int = 0
    var nextStage:Int = 0
    // create 2d array for locations
    var locations:[CGPoint]
    // create 2d array for directions
    var directions:[[Int]]
    // create array for current state
    var state:[Int] = [0,0,0,0,0,0,0,0,0]
    var winState:[Int] = [0,0,0,0,0,0,0,0,0]
    var won:Bool = false
    // create array for medals
    
    // create move integer
    var moves:Int
    var movesCounter:SKLabelNode = SKLabelNode(fontNamed: "Modern Sans")
    // create button array
    var buttons:[SKSpriteNode]
    var diamonds:[SKSpriteNode]
    var innerDiamonds:[SKSpriteNode]
    var scores:[Int] = [0,0,0]
    var medals:[SKSpriteNode] = [SKSpriteNode(imageNamed:"bronze"),SKSpriteNode(imageNamed:"silver"),SKSpriteNode(imageNamed:"gold")]
    
    var scene:SKScene = SKScene()
    var direct:[[Int]] = [[0,0],[0,0,0],[0,0],[0,0,0],[0,0,0,0],[0,0,0],[0,0],[0,0,0],[0,0]]
    var victory:SKSpriteNode = SKSpriteNode(imageNamed: "victoryback")
    
    let defaults = UserDefaults.standard
    var page = 0
    var Text:SKSpriteNode = SKSpriteNode(imageNamed: "text1")
    
    
    //set all the arrays
    init() {
        
        locations = [CGPoint(x: scene.size.width * 0.5, y: scene.size.height * 0.8),CGPoint(x: scene.size.width * 0.6, y: scene.size.height * 0.65), CGPoint(x: scene.size.width * 0.8, y: scene.size.height * 0.5), CGPoint(x: scene.size.width * 0.4, y: scene.size.height * 0.65),CGPoint(x: scene.size.width * 0.5, y: scene.size.height * 0.5),CGPoint(x: scene.size.width * 0.6, y: scene.size.height * 0.4), CGPoint(x: scene.size.width * 0.3, y: scene.size.height * 0.5),CGPoint(x: scene.size.width * 0.4, y: scene.size.height * 0.4),CGPoint(x: scene.size.width * 0.5, y: scene.size.height * 0.3)]
        diamonds = [SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0")]
        innerDiamonds = [SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0"), SKSpriteNode(imageNamed:"0")]
        directions = [[0,0],[0,0,0],[0,0],[0,0,0],[0,0,0,0],[0,0,0],[0,0],[0,0,0],[0,0]]
        buttons = [SKSpriteNode(imageNamed:"menu"),SKSpriteNode(imageNamed:"restart"),SKSpriteNode(imageNamed:"right"), SKSpriteNode(imageNamed:"left")]
        moves = 0
        
    }
    func setLocation(){
        
        locations = [CGPoint(x: scene.size.width * 0.5, y: scene.size.height * 0.6),
                     CGPoint(x: scene.size.width * 0.6, y: scene.size.height * 0.525),
                     CGPoint(x: scene.size.width * 0.7, y: scene.size.height * 0.45),
                     CGPoint(x: scene.size.width * 0.4, y: scene.size.height * 0.525),
                     CGPoint(x: scene.size.width * 0.5, y: scene.size.height * 0.45),
                     CGPoint(x: scene.size.width * 0.6, y: scene.size.height * 0.375),
                     CGPoint(x: scene.size.width * 0.3, y: scene.size.height * 0.45),
                     CGPoint(x: scene.size.width * 0.4, y: scene.size.height * 0.375),
                     CGPoint(x: scene.size.width * 0.5, y: scene.size.height * 0.3)]
        
    }
    
    func winningCondition(winState: [Int]){
        
        self.winState = winState
        
        for i in 0..<9 {
            
            if self.winState[i] == 0{
                diamonds[i] = SKSpriteNode(imageNamed: "0")
            }
            else if self.winState[i] == 1{
                diamonds[i] = SKSpriteNode(imageNamed: "1")
            }
            else if self.winState[i] == 2{
                diamonds[i] = SKSpriteNode(imageNamed: "2")
            }
            
            diamonds[i].position = locations[i]
            diamonds[i].size = CGSize(width: 170, height: 170)
            diamonds[i].zPosition = 3
            scene.addChild(diamonds[i])
            
        }
        
        
    }
    
    func setScene(scene: SKScene) {
        
        self.scene = scene
        
    }
    
    func levelNumber(levelNum: Int, nextNum: Int) {
        
        self.levelNum = levelNum
        nextStage = nextNum
        let stages = SKLabelNode(fontNamed:"Modern Sans")
        stages.text = ("T U T O R I A L")
        stages.fontSize = 42
        stages.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        stages.position = CGPoint(x: scene.frame.size.width * 0.5, y: scene.frame.size.height * 0.905)
        stages.zPosition = 2
        stages.fontColor = SKColor(red: 216/255, green: 217/255, blue: 195/255, alpha: 1.0)
        scene.addChild(stages)
        
    }
    
    func setDirections(direct: [[Int]]){
        
        self.direct = direct
        
        
        
        for i in 0..<9{
            for j in 0..<self.direct[i].count{
                if j == 0{
                    if self.direct[i][j] == 1{
                        let direction = SKSpriteNode(imageNamed:"single")
                        direction.position = locations[i]
                        direction.size = CGSize(width: 170, height: 170)
                        direction.zPosition = 3
                        scene.addChild(direction)
                    }
                    if self.direct[i][j] == 2{
                        let direction = SKSpriteNode(imageNamed:"double")
                        direction.position = locations[i]
                        direction.size = CGSize(width: 170, height: 170)
                        direction.zPosition = 3
                        scene.addChild(direction)
                    }
                }
                else if j == 1{
                    if self.direct[i][j] == 1{
                        let direction = SKSpriteNode(imageNamed:"single")
                        direction.position = locations[i]
                        direction.size = CGSize(width: 170, height: 170)
                        direction.zPosition = 3
                        direction.zRotation = CGFloat(M_PI) * 1.5
                        scene.addChild(direction)
                    }
                    if self.direct[i][j] == 2{
                        let direction = SKSpriteNode(imageNamed:"double")
                        direction.position = locations[i]
                        direction.size = CGSize(width: 170, height: 170)
                        direction.zPosition = 3
                        direction.zRotation = CGFloat(M_PI) * 1.5
                        scene.addChild(direction)
                    }
                }
                else if j == 2{
                    if self.direct[i][j] == 1{
                        let direction = SKSpriteNode(imageNamed:"single")
                        direction.position = locations[i]
                        direction.size = CGSize(width: 170, height: 170)
                        direction.zPosition = 3
                        direction.zRotation = CGFloat(M_PI)
                        scene.addChild(direction)
                    }
                    if self.direct[i][j] == 2{
                        let direction = SKSpriteNode(imageNamed:"double")
                        direction.position = locations[i]
                        direction.size = CGSize(width: 170, height: 170)
                        direction.zPosition = 3
                        direction.zRotation = CGFloat(M_PI)
                        scene.addChild(direction)
                    }
                }
                else if j == 3{
                    if self.direct[i][j] == 1{
                        let direction = SKSpriteNode(imageNamed:"single")
                        direction.position = locations[i]
                        direction.size = CGSize(width: 170, height: 170)
                        direction.zPosition = 3
                        direction.zRotation = CGFloat(M_PI) * 0.5
                        scene.addChild(direction)
                    }
                    if self.direct[i][j] == 2{
                        let direction = SKSpriteNode(imageNamed:"double")
                        direction.position = locations[i]
                        direction.size = CGSize(width: 170, height: 170)
                        direction.zPosition = 3
                        direction.zRotation = CGFloat(M_PI) * 0.5
                        scene.addChild(direction)
                    }
                }
            }
        }
    }
    
    func load() {
        
        won = false
        state = [0,0,0,0,0,0,0,0,0]
        
        let bg = SKSpriteNode(imageNamed: "bg_2-4")
        bg.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
        bg.size = CGSize(width: scene.size.height * 9/16, height: scene.size.height)
        
        let decor = SKSpriteNode(imageNamed: "decor2")
        decor.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
        decor.size = CGSize(width: scene.size.height * 9/16, height: scene.size.height)
        decor.zPosition = 1
        
        buttons[0].xScale = 1.1
        buttons[0].yScale = 1.1
        buttons[0].position = CGPoint(x: scene.size.width * 0.835, y: scene.size.height * 0.12)
        buttons[0].zPosition = 1
        
        buttons[1].xScale = 1.1
        buttons[1].yScale = 1.1
        buttons[1].position = CGPoint(x: scene.size.width * 0.77, y: scene.size.height * 0.08)
        buttons[1].zPosition = 1
        
        buttons[2].xScale = 1.0
        buttons[2].yScale = 1.0
        buttons[2].position = CGPoint(x: scene.size.width * 0.6, y: scene.size.height * 0.22)
        buttons[2].zPosition = 1
        
        buttons[3].xScale = 1.0
        buttons[3].yScale = 1.0
        buttons[3].position = CGPoint(x: scene.size.width * 0.40, y: scene.size.height * 0.22)
        buttons[3].zPosition = 1
        
        /*
        movesCounter.fontSize = 110
        movesCounter.text = ("\(moves)")
        movesCounter.position = CGPoint(x: scene.size.width / 2, y: scene.size.height * 0.725)
        movesCounter.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        movesCounter.zPosition = 2
        movesCounter.fontColor = SKColor(red: 216/255, green: 217/255, blue: 195/255, alpha: 1.0)
        
        for i in 0..<9 {
            
            innerDiamonds[i] = SKSpriteNode(imageNamed: "inner0")
            innerDiamonds[i].position = locations[i]
            innerDiamonds[i].size = CGSize(width: 170, height: 170)
            innerDiamonds[i].zPosition = 3
            scene.addChild(innerDiamonds[i])
            
        }*/
        
        scene.addChild(bg)
        scene.addChild(decor)
        scene.addChild(buttons[0])
        scene.addChild(buttons[1])
        scene.addChild(buttons[2])
        scene.addChild(buttons[3])
        //scene.addChild(movesCounter)
        scene.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
            self.starone()
            },SKAction.wait(forDuration: 0.43)])))
        scene.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
            self.startwo()
            },SKAction.wait(forDuration: 1.0)])))
        
        Text.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
        Text.size = CGSize(width: scene.size.height * 9/16, height: scene.size.height)
        Text.zPosition = 3
        scene.addChild(Text)
        
    }
    func nextText(){
        
        

        
        if page == 0 {
            
            Text.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.2), SKAction.run {
                self.Text.texture = SKTexture(imageNamed: "text1")
                }, SKAction.fadeIn(withDuration: 0.2)]))
            
            
            
        }
            
        else if page == 1 {
            
            Text.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.2), SKAction.run {
                    self.Text.texture = SKTexture(imageNamed: "text2")
                    }, SKAction.fadeIn(withDuration: 0.2)]))
                
            
        }
        else if page == 2 {
            Text.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.2), SKAction.run {
                self.Text.texture = SKTexture(imageNamed: "text3")
                }, SKAction.fadeIn(withDuration: 0.2)]))
        }
        else if page == 3 {
            Text.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.2), SKAction.run {
                self.Text.texture = SKTexture(imageNamed: "text4")
                }, SKAction.fadeIn(withDuration: 0.2)]))
        }
        else if page == 4 {
            Text.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.2), SKAction.run {
                self.Text.texture = SKTexture(imageNamed: "text5")
                }, SKAction.fadeIn(withDuration: 0.2)]))
        }
        else if page == 5 {
            let nextScene = Tutorial2(size: scene.size)
            let wait = SKAction.wait(forDuration: 0.1)
            let block = SKAction.run({
                nextScene.scaleMode = .aspectFill
                let transition = SKTransition.crossFade(withDuration: 0.5)
                self.scene.view?.presentScene(nextScene, transition: transition)
            })
            
            let sequence = SKAction.sequence([wait,block])
            scene.run(sequence)
        }
    }
    
    func animate(pointTwo: Int, angle: Int){
        
        var Angle = 0.0
        
        switch angle {
        case 0:
            Angle = 0.0
        case 1:
            Angle = M_PI / 2
        case 2:
            Angle = M_PI
        case 3:
            Angle = M_PI * 1.5
        default:
            break
        }
        let a1 = SKTexture(imageNamed: "a1")
        let a2 = SKTexture(imageNamed: "a2")
        let a3 = SKTexture(imageNamed: "a3")
        let a4 = SKTexture(imageNamed: "a4")
        let a5 = SKTexture(imageNamed: "b1")
        
        let b1 = SKTexture(imageNamed: "b1")
        let b2 = SKTexture(imageNamed: "b2")
        let b3 = SKTexture(imageNamed: "b3")
        let b4 = SKTexture(imageNamed: "b4")
        let b5 = SKTexture(imageNamed: "c1")
        
        let c1 = SKTexture(imageNamed: "c1")
        let c2 = SKTexture(imageNamed: "c2")
        let c3 = SKTexture(imageNamed: "c3")
        let c4 = SKTexture(imageNamed: "c4")
        let c5 = SKTexture(imageNamed: "a1")
        
        
        
        let AnimationOne = SKAction.sequence([
            SKAction.animate(with: [a1, a2, a3, a4, a5], timePerFrame: 0.022)
            ])
        let AnimationTwo = SKAction.sequence([
            SKAction.animate(with: [b1, b2, b3, b4, b5], timePerFrame: 0.022)
            ])
        let AnimationThree = SKAction.sequence([
            SKAction.animate(with: [c1, c2, c3, c4, c5], timePerFrame: 0.022)
            ])
        
        
        switch state[pointTwo] {
        case 0:
            innerDiamonds[pointTwo].run(SKAction.sequence([SKAction.rotate(byAngle: CGFloat(Angle), duration: 0),AnimationOne,SKAction.rotate(byAngle: -CGFloat(Angle), duration: 0)]))
            break
        case 1:
            innerDiamonds[pointTwo].run(SKAction.sequence([SKAction.rotate(byAngle: CGFloat(Angle), duration: 0),AnimationTwo,SKAction.rotate(byAngle: -CGFloat(Angle), duration: 0)]))
            break
        case 2:
            innerDiamonds[pointTwo].run(SKAction.sequence([SKAction.rotate(byAngle: CGFloat(Angle), duration: 0),AnimationThree,SKAction.rotate(byAngle: -CGFloat(Angle), duration: 0)]))
            break
            
        default: break
            
        }
        switch state[pointTwo] {
        case 0:
            state[pointTwo] = 1
            break
        case 1:
            state[pointTwo] = 2
            break
        case 2:
            state[pointTwo] = 0
            break
            
        default: break
            
        }
        
        
    }
    
    
    
    func update(point: Int){
        
        //everything is in here
        //use different functions when needed
        print("hello")
        
        if point == 0{
            
            if direct[0][0] == 1{
                animate(pointTwo: 1, angle: 2)
            }
            if direct[0][0] == 2{
                animate(pointTwo: 1, angle: 2)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 2, angle: 2)
                    }]))
                
            }
            if direct[0][1] == 1{
                animate(pointTwo: 3, angle: 1)
            }
            if direct[0][1] == 2{
                animate(pointTwo: 3, angle: 1)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 6, angle: 1)
                    }]))
            }
        }
        if point == 1{
            if direct[1][0] == 1{
                animate(pointTwo: 2, angle: 2)
            }
            if direct[1][1] == 1{
                animate(pointTwo: 4, angle: 1)
            }
            if direct[1][1] == 2{
                animate(pointTwo: 4, angle: 1)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 7, angle: 1)
                    }]))
            }
            if direct[1][2] == 1{
                animate(pointTwo: 0, angle: 0)
            }
        }
        if point == 2{
            if direct[2][1] == 1{
                animate(pointTwo: 5, angle: 1)
            }
            if direct[2][1] == 2{
                animate(pointTwo: 5, angle: 1)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 8, angle: 1)
                    }]))
            }
            if direct[2][2] == 1{
                animate(pointTwo: 1, angle: 0)
            }
            if direct[2][2] == 2{
                animate(pointTwo: 1, angle: 0)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 0, angle: 0)
                    }]))
            }
        }
        if point == 3{
            if direct[3][0] == 1{
                animate(pointTwo: 4, angle: 2)
            }
            if direct[3][0] == 2{
                animate(pointTwo: 4, angle: 2)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 5, angle: 2)
                    }]))
            }
            if direct[3][1] == 1{
                animate(pointTwo: 6, angle: 1)
            }
            if direct[3][3] == 1{
                animate(pointTwo: 0, angle: 3)
            }
        }
        if point == 4{
            if direct[4][0] == 1{
                animate(pointTwo: 5, angle: 2)
            }
            if direct[4][1] == 1{
                animate(pointTwo: 7, angle: 1)
            }
            if direct[4][2] == 1{
                animate(pointTwo: 3, angle: 0)
            }
            if direct[4][3] == 1{
                animate(pointTwo: 1, angle: 3)
            }
        }
        if point == 5{
            if direct[5][1] == 1{
                animate(pointTwo: 8, angle: 1)
            }
            if direct[5][2] == 1{
                animate(pointTwo: 4, angle: 0)
            }
            if direct[5][2] == 2{
                animate(pointTwo: 4, angle: 0)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 3, angle: 0)
                    }]))
            }
            if direct[5][3] == 1{
                animate(pointTwo: 2, angle: 3)
            }
        }
        if point == 6{
            if direct[6][0] == 1{
                animate(pointTwo: 7, angle: 2)
            }
            if direct[6][0] == 2{
                animate(pointTwo: 7, angle: 2)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 8, angle: 2)
                    }]))
            }
            if direct[6][3] == 1{
                animate(pointTwo: 3, angle: 3)
            }
            if direct[6][3] == 2{
                animate(pointTwo: 3, angle: 3)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 0, angle: 3)
                    }]))
            }
        }
        if point == 7{
            if direct[7][0] == 1{
                animate(pointTwo: 8, angle: 2)
            }
            if direct[7][2] == 1{
                animate(pointTwo: 6, angle: 0)
            }
            if direct[7][3] == 1{
                animate(pointTwo: 4, angle: 3)
            }
            if direct[7][3] == 2{
                animate(pointTwo: 4, angle: 3)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 1, angle: 3)
                    }]))
            }
        }
        if point == 8{
            if direct[8][2] == 1{
                animate(pointTwo: 7, angle: 0)
            }
            if direct[8][2] == 2{
                animate(pointTwo: 7, angle: 0)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 6, angle: 0)
                    }]))
            }
            if direct[8][3] == 1{
                animate(pointTwo: 5, angle: 3)
            }
            if direct[8][3] == 2{
                animate(pointTwo: 5, angle: 3)
                scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.1), SKAction.run {
                    self.animate(pointTwo: 2, angle: 3)
                    }]))
            }
        }
        
        
        //current state
        //score
        scoreUpdate()
        //winstate
        scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.101), SKAction.run {
            self.winning()
            }]))
        
    }
    func winning(){
        
        
        if winState == state{
            
            self.won = true
            
            victory = SKSpriteNode(imageNamed: "victoryback")
            victory.position = CGPoint(x: scene.size.width/2, y: scene.size.height * 0.45)
            victory.xScale = 1.4
            victory.yScale = 1.4
            victory.zPosition = 5
            victory.alpha = 0.0
            scene.addChild(victory)
            victory.run(SKAction.fadeIn(withDuration: 0.4))
            
            let VictoryText:SKLabelNode = SKLabelNode(fontNamed: "Modern Sans")
            VictoryText.position = CGPoint(x: scene.size.width * 0.5, y: scene.size.height * 0.51)
            VictoryText.fontSize = 80
            VictoryText.text = ("V I C T O R Y")
            VictoryText.zPosition = 6
            VictoryText.fontColor = SKColor(red: 216/255, green: 217/255, blue: 195/255, alpha: 1.0)
            VictoryText.alpha = 0
            scene.addChild(VictoryText)
            VictoryText.run(SKAction.fadeIn(withDuration: 0.4))
            
            let StageText:SKLabelNode = SKLabelNode(fontNamed: "Modern Sans")
            StageText.position = CGPoint(x: scene.size.width * 0.5, y: scene.size.height * 0.35)
            StageText.fontSize = 40
            StageText.text = ("N E X T  S T A G E")
            StageText.zPosition = 6
            StageText.fontColor = SKColor(red: 216/255, green: 217/255, blue: 195/255, alpha: 1.0)
            StageText.alpha = 0
            scene.addChild(StageText)
            StageText.run(SKAction.repeatForever(SKAction.sequence([SKAction.fadeAlpha(to: 1.0, duration: 1.0), SKAction.fadeAlpha(to: 0.3, duration: 1.0)])))
            
            
            
            
            if defaults.integer(forKey: "s" + "\(levelNum)") <= 1 && moves >= scores[2] {
                defaults.set(2, forKey: "s" + "\(levelNum)")
            }
            if defaults.integer(forKey: "s" + "\(levelNum)") <= 2 && moves > scores[0] && moves < scores[2] {
                defaults.set(3, forKey: "s" + "\(levelNum)")
            }
            if defaults.integer(forKey: "s" + "\(levelNum)") <= 3 && moves <= scores[0] {
                defaults.set(4, forKey: "s" + "\(levelNum)")
            }
            if defaults.integer(forKey: "s" + "\(nextStage)") == 0 {
                defaults.set(1, forKey: "s" + "\(nextStage)")
            }
            
            
        }
        
    }
    func setScore2(){
        

        
        medals[0] = SKSpriteNode(imageNamed: "gold")
        medals[0].position = CGPoint(x: scene.size.width * 0.42, y: scene.size.height * 0.1)
        medals[0].size = CGSize(width: 80, height: 80)
        medals[0].zPosition = 3
        medals[1] = SKSpriteNode(imageNamed: "silver")
        medals[1].position = CGPoint(x: scene.size.width * 0.28, y: scene.size.height * 0.1)
        medals[1].size = CGSize(width: 80, height: 80)
        medals[1].zPosition = 3
        medals[2] = SKSpriteNode(imageNamed: "bronze")
        medals[2].position = CGPoint(x: scene.size.width * 0.14, y: scene.size.height * 0.1)
        medals[2].size = CGSize(width: 80, height: 80)
        medals[2].zPosition = 3
        
        medals[0].alpha = 0.1

        medals[1].alpha = 0.1
    
        medals[2].alpha = 0.1
        
        scene.addChild(medals[0])
        scene.addChild(medals[1])
        scene.addChild(medals[2])
        
        
    }
    func setScore(gold: Int, silver: Int, bronze: Int){
        
        scores[0] = gold
        scores[1] = silver
        scores[2] = bronze
        
        let goldText:SKLabelNode = SKLabelNode(fontNamed: "Modern Sans")
        goldText.position = CGPoint(x: scene.size.width * 0.428, y: scene.size.height * 0.081)
        goldText.fontSize = 50
        goldText.text = ("\(gold)")
        goldText.zPosition = 4
        goldText.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        scene.addChild(goldText)
        
        let silverText:SKLabelNode = SKLabelNode(fontNamed: "Modern Sans")
        silverText.position = CGPoint(x: scene.size.width * 0.328, y: scene.size.height * 0.081)
        silverText.fontSize = 50
        silverText.text = ("\(silver)")
        silverText.zPosition = 4
        silverText.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        scene.addChild(silverText)
        
        let bronzeText:SKLabelNode = SKLabelNode(fontNamed: "Modern Sans")
        bronzeText.position = CGPoint(x: scene.size.width * 0.228, y: scene.size.height * 0.081)
        bronzeText.fontSize = 50
        bronzeText.text = ("\(bronze)")
        bronzeText.zPosition = 4
        bronzeText.fontColor = SKColor(red: 41/255, green: 34/255, blue: 33/255, alpha: 1.0)
        scene.addChild(bronzeText)
        
        medals[2].run(SKAction.fadeIn(withDuration: 0.3))
        medals[1].run(SKAction.sequence([SKAction.wait(forDuration: 0.1),SKAction.fadeIn(withDuration: 0.3)]))
        medals[0].run(SKAction.sequence([SKAction.wait(forDuration: 0.2),SKAction.fadeIn(withDuration: 0.3)]))
        

        
        
    }
    func scoreUpdate(){
        
        moves += 1
        movesCounter.text = ("\(moves)")
        //add medal blackout
        if moves > scores[0]{
            medals[0].run(SKAction.fadeAlpha(to: 0.2, duration: 0.5))
        }
        if moves > scores[1]{
            medals[1].run(SKAction.fadeAlpha(to: 0.2, duration: 0.5))
        }
        
        
    }
    func starone(){
        
        let star1 = SKTexture(imageNamed: "star_1")
        
        let sprite = SKSpriteNode(texture: star1)
        
        let posX = CGFloat(arc4random_uniform(1000) + 1)
        let posY = CGFloat(arc4random_uniform(1000) + 1)
        
        sprite.xScale = 0.4
        sprite.yScale = 0.4
        sprite.position = CGPoint(x:scene.frame.size.width * (posX/1000), y:scene.size.height * (posY/1000))
        sprite.alpha = 0.0
        sprite.zPosition = 2
        
        scene.addChild(sprite)
        let fadeIn = SKAction.fadeAlpha(to: 0.7, duration: 1.0)
        
        let fadeAway = SKAction.fadeAlpha(to: 0.1, duration: 1.0)
        let removeNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fadeIn, fadeAway, fadeIn, fadeAway, fadeIn, fadeAway,fadeIn, fadeAway,fadeIn, fadeAway, removeNode])
        sprite.run(sequence)
        
    }
    
    
    func startwo(){
        
        let star1 = SKTexture(imageNamed: "star_1")
        let sprite = SKSpriteNode(texture: star1)
        let posX = CGFloat(arc4random_uniform(1000) + 1)
        let posY = CGFloat(arc4random_uniform(1000) + 1)
        
        sprite.xScale = 0.7
        sprite.yScale = 0.7
        sprite.position = CGPoint(x:scene.size.width * (posX/1000), y:scene.size.height * (posY/1000))
        sprite.alpha = 0.0
        sprite.zPosition = 2
        
        scene.addChild(sprite)
        let fadeIn = SKAction.fadeAlpha(to: 0.6, duration: 1.0)
        
        let fadeAway = SKAction.fadeOut(withDuration: 10.0)
        let removeNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fadeIn, fadeAway, removeNode])
        sprite.run(sequence)
        
    }
    
    
    
}
