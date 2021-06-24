//
//  XylophoneViewController.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 11/04/21.
//

import UIKit
import AVFoundation

class XylophoneViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func keyPressed(_ sender: UIButton){
        guard let buttonTitle = sender.currentTitle else { return }
        playSound(title: buttonTitle)
        
//        sender.isSelected = sender.isSelected == false ? sender.alpha == 1.0 : sender.alpha == 0.5
        sender.alpha = 0.5
               
       //Code should execute after 0.2 second delay.
       DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
           //Bring's sender's opacity back up to fully opaque.
           sender.alpha = 1.0
       }
    }
    
    func playSound(title: String){
        let url = Bundle.main.url(forResource: title, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }

}
