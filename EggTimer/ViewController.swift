//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft":3, "Medium":4,"Hard":7]
   
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelection(_ sender: UIButton) {
        progressBar.progress = 0;
        secondsPassed = 0
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if totalTime > secondsPassed {
            secondsPassed += 1;
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player.play()
        }
        
    }
}
