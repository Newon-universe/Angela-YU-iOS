//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var example = StoryBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyLabel.text = example.getTitle()
        choice1Button.setTitle(example.getChoices()[0], for: UIControl.State.normal)
        choice2Button.setTitle(example.getChoices()[1], for: UIControl.State.normal)
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        example.nextChoice()
        
        storyLabel.text = example.getTitle()
        choice1Button.setTitle(example.getChoices()[0], for: UIControl.State.normal)
        choice2Button.setTitle(example.getChoices()[1], for: UIControl.State.normal)
    }
    


}

