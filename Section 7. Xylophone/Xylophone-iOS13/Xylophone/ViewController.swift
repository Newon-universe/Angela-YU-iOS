//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // Audio Visual Foundational module

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        if let sound = sender.currentTitle {
            sender.alpha = 0.5
            playSound(sound)
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
                sender.layer.opacity = 1
            }
        }
    }
    
    func playSound(_ input: String) {
        let url = Bundle.main.url(forResource: input, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

