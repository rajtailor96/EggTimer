//
//  ViewController.swift
//  Egg Timer
//
//  Created by Raj Tailor on 2/10/21.
//  Copyright © 2021 Raj Tailor. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    
    var secondsPassed = 0
    var timer = Timer()
    var totalTime = 0
    let eggTimes = ["Soft": 5,
                    "Medium": 8,
                    "Hard": 12]

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        totalTime = eggTimes[sender.currentTitle!]!
        
        timerProgress.progress = 0.0
        secondsPassed = 0
        titleLabel.text = sender.currentTitle!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let increment = Float(secondsPassed)/Float(totalTime)
            
            timerProgress.setProgress(increment, animated: true)
        } else {
            timer.invalidate()

            titleLabel.text = "Done!"
        }
    }
    
    @IBAction func musicSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            MP3.background.startMusic()
        } else {
            MP3.background.stopMusic()
        }
        
        
    }
}

class MP3{
    static let background = MP3()
    var audioPlayer: AVAudioPlayer?
    
    func startMusic(){
        if let bundle = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3"){
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else {return}
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    func stopMusic() {
        audioPlayer?.stop()
    }
}
