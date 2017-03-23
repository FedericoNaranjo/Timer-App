//
//  ViewController.swift
//  Timer
//
//  Created by Federico Naranjo Bellina on 20/5/16.
//  Copyright © 2016 Rico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Foundation.Timer()
    var interval = 0.01
    var currentTime = 0.0
    var go = false, hasStarted = false, running = false



    @IBOutlet var label: UILabel!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var stopButton: UIButton!

    @IBAction func playPause(_ sender: UIButton) {
        
        if(!running) {
            timer = Foundation.Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(ViewController.increaseTime), userInfo: nil, repeats: true)
            hasStarted = true
            running = true
            sender.setTitle("Pause", for: UIControlState())
        }
        else {
            timer.invalidate()
            running = false
            sender.setTitle("Play", for: UIControlState())
            
        }
        
    }

    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        running = false
        currentTime = 0.0
        label.text = "0.0"
    }
    
    
    func increaseTime() {
        currentTime += interval
        label.text = String(format: "%0.2f",currentTime)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
