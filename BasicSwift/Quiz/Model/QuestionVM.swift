//
//  QuestionVM.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 14/04/21.
//

import Foundation

struct QuestionVM {
    let quiz = [questionChoice(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                questionChoice(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                questionChoice(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                questionChoice(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                questionChoice(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                questionChoice(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                questionChoice(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                questionChoice(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                questionChoice(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                questionChoice(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")]
    
    var currentQuestion = 0
    var score = 0
    
    func currentQuestionPosition() -> String{
        return quiz[currentQuestion].q
    }
    
    mutating func checkAnswer(_ answer: String) -> Bool{
        
        if quiz[currentQuestion].a.contains(answer){
            if answer == quiz[currentQuestion].correctAnswer{
                score += 1
                return true
            }else{
                return false
            }
        }
        
        return false
    }
    
    mutating func nextQuestion(){
        if currentQuestion + 1 < quiz.count{
            currentQuestion += 1
        }else{
            currentQuestion = 0
            score = 0
        }
    }
    
    func buttonAnswer() -> [String]{
        let answer1 = quiz[currentQuestion].a[0]
        let answer2 = quiz[currentQuestion].a[1]
        let answer3 = quiz[currentQuestion].a[2]
        return[answer1, answer2, answer3]
    }
    
    func getScore() -> String{
        return "your score : \(score)"
    }
    
    func progress() -> Float{
        return Float(currentQuestion) / Float(quiz.count)
    }
}
