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
    let eggTimes = ["Soft":5 , "Medium":4, "Hard": 7 ]
    var player : AVAudioPlayer!
    var timer = Timer()
    var counter = 0
    var totalTime = 0
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    @IBOutlet weak var eggsLabel: UILabel!

    @IBOutlet weak var progressView: UIProgressView!
    @objc func updateTimer(){
        
    
    if (counter<totalTime){
        counter+=1
        print("\(counter) seconds remaining")
        progressView.progress = Float(Float(counter)/Float(totalTime))
        print(progressView.progress)
        
        
    } else {
            
            eggsLabel.text = "Your Eggs are Ready"
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        timer.invalidate()}
    }
    @IBAction func hardnessPressed(_ sender: UIButton) {
        player.stop()
        progressView.progress = 0.0
        
        counter = 0
        eggsLabel.text = "Eggis are Cooking"
        timer.invalidate()
        let hardness = sender.currentTitle!
       
           totalTime = eggTimes[hardness]!
            
           
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector (updateTimer), userInfo: nil, repeats: true)
       
        
        
    }
    


}
