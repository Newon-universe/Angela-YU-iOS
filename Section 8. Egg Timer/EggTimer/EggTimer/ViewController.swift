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
    
    @IBOutlet weak var headTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let url =  Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft":5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    
    override func viewDidLoad() {
        progressBar.layer.cornerRadius = 10
        progressBar.clipsToBounds = true
        player = try! AVAudioPlayer(contentsOf: url!)
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        startTimer(minute: eggTimes[sender.currentTitle!]!, titleLabel: sender.currentTitle)
    }
    
    func startTimer(minute: Int, titleLabel: String?) {
        timer.invalidate()
        player.stop()
        player.currentTime = 0
        headTitle.text = titleLabel
        progressBar.progress = 0
        
        var times = Float(0)
        let totalTimes = Float(minute)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            times += 1
            self.progressBar.progress = times / totalTimes
            print(times, terminator: " seconds.\n")
            
            if times == totalTimes {
                timer.invalidate()
                self.headTitle.text = "Done"
                self.player.play()
                return
            }
        }
    }
    
}
