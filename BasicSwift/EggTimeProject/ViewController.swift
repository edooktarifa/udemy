//
//  ViewController.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 10/04/21.
//

import UIKit
import AVFoundation

enum eggTexture: Int {
    case softTime = 5
    case mediumTime = 7
    case hardTime = 12
}

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var statusLabel: UILabel!
    
    let eggTimes : [String: Int] = ["Soft" : 5, "Medium": 7, "Hard": 12]
    
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 5
        progressBar.subviews[1].clipsToBounds = true
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton){
        // MARK: -timer invalidate to cancel couting and handle duplicate countdown
        timer.invalidate()
        
        //MARK- hardness to get title button and compare with dictionary eggTimes
        let hardness = sender.currentTitle
        
        if hardness != nil{
            print(eggTimes[hardness!]!)
            totalTime = eggTimes[hardness!]!
        }
        
        secondPassed = 0
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondPassed < totalTime{
            secondPassed += 1
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
            titleLabel.text = "\(secondPassed) seconds"
            
            //MARK: -create total Time
            statusLabel.text = "\(secondPassed)" + " / " + "\(totalTime)"
        } else {
            timer.invalidate()
            titleLabel.text = "DONE"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
    }


}

