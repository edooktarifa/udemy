//
//  MultipleChoice.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 14/04/21.
//

import Foundation

struct questionChoice {
    var q: String
    var a: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.q = q
        self.a = a
        self.correctAnswer = correctAnswer
    }
}
