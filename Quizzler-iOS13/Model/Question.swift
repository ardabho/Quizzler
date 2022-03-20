//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Arda Büyükhatipoğlu on 15.03.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ta: String) {
        self.text = q
        self.answers = a
        self.correctAnswer = ta
    }
}
