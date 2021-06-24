//
//  QuizViewController.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 14/04/21.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var rightAnswer = 0
    var wrongAnswer = 0
    
   
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton){
        
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        if userGotItRight{
            sender.backgroundColor = .green
            rightAnswer += 1
        }else{
            wrongAnswer += 1
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
    }
    
    func updateUI(){
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.currentProgress()
        questionLabel.text = quizBrain.currentQuestion()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }

}
