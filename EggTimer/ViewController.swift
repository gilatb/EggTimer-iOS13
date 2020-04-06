//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggtimes: [String: Int] = [
         "Soft": 3,
         "Medium": 4,
         "Hard": 7
    ]
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected (_ sender: UIButton) {
        timer.invalidate()
        let hardnessSelected = sender.currentTitle!
        totalTime = Float(eggtimes[hardnessSelected]!)
        
        progressBar.progress  = 0.0
        secondsPassed = 0.0
        topLabel.text = "How do you like your eggs ?"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer (){
        if secondsPassed < totalTime {
            let percentageProgress: Float = secondsPassed / totalTime
            secondsPassed += 1
            progressBar.progress = percentageProgress
            print(percentageProgress)
        } else {
            timer.invalidate()
            topLabel.text = "DONE!"
            progressBar.progress = 1.0
        }
    }
    
}
