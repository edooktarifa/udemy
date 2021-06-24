//
//  QuizMultipleChoiceVC.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 14/04/21.
//

import UIKit

class QuizMultipleChoiceVC: UIViewController {
    
    @IBOutlet weak var answer1Btn: UIButton!
    @IBOutlet weak var answer2Btn: UIButton!
    @IBOutlet weak var answer3Btn: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progresView: UIProgressView!
    
    var quiz = QuestionVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButton1Pressed(_ sender: UIButton){
        checkAnswer(answer: quiz.buttonAnswer()[0], currentButton: answer1Btn)
    }
    
    @IBAction func answerButton2Pressed(_ sender: UIButton){
        checkAnswer(answer: quiz.buttonAnswer()[1], currentButton: answer2Btn)
    }
    
    @IBAction func answerButton3Pressed(_ sender: UIButton){
        checkAnswer(answer: quiz.buttonAnswer()[2], currentButton: answer3Btn)
    }
    
    func updateUI() {
        answer1Btn.setTitle(quiz.buttonAnswer()[0], for: .normal)
        answer2Btn.setTitle(quiz.buttonAnswer()[1], for: .normal)
        answer3Btn.setTitle(quiz.buttonAnswer()[2], for: .normal)
        questionLabel.text = quiz.currentQuestionPosition()
        scoreLabel.text = quiz.getScore()
        progresView.progress = quiz.progress()
        answer3Btn.backgroundColor = .clear
        answer2Btn.backgroundColor = .clear
        answer1Btn.backgroundColor = .clear
    }
    
    func checkAnswer(answer: String, currentButton: UIButton){
        if quiz.checkAnswer(answer){
            currentButton.backgroundColor = .green
        }else{
            currentButton.backgroundColor = .red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.quiz.nextQuestion()
            self.updateUI()
        })
    }
}
