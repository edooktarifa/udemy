//
//  Question.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 14/04/21.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
