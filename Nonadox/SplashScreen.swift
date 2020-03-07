//
//  SplashScree.swift
//
//
//  Created by Justin Li on 1/11/17.
//  Copyright (c) 2016 Justin Li. All rights reserved.
//

import SpriteKit
import Foundation
import AudioToolbox
import GameplayKit

class SplashScreen: SKScene {
    

    
    override func didMove(to view: SKView) {

        let data = Data()
        data.set()
        self.backgroundColor = SKColor(red: 239/255, green: 239/255, blue: 221/255, alpha: 1.0)
        let bg = SKSpriteNode(imageNamed: "Splash")
        bg.size = CGSize(width: self.size.width, height: self.size.height)
        bg.zPosition = 2
        bg.anchorPoint = CGPoint(x: 1.0, y: 1.0)
        bg.position = CGPoint(x:self.size.width * 0.5, y:self.size.height * 0.5)
        self.addChild(bg)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.5), target: self, selector: #selector(SplashScreen.playScene), userInfo: nil, repeats: false)

        
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        }
        
    
    

    
    func playScene(){
        
        let nextScene = MenuScene(size: scene!.size)
        nextScene.scaleMode = .aspectFill
        
        
        
        scene?.view?.presentScene(nextScene)
 
    }
    

    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
        
    }
    
}

extension SystemSoundID {
    static func playFileNamed(_ fileName: String, withExtenstion fileExtension: String? = "aif") {
        var sound: SystemSoundID = 0
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &sound)
            AudioServicesPlaySystemSound(sound)
        }
    }
}



