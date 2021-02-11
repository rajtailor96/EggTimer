//
//  ViewController.swift
//  Egg Timer
//
//  Created by Raj Tailor on 2/10/21.
//  Copyright © 2021 Raj Tailor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5,
                    "Medium": 8,
                    "Hard": 12]

    @IBAction func hardnessSelected(_ sender: UIButton) {

        let hardness = sender.currentTitle
        
        print(eggTimes[hardness!]!)
    }
    
}
