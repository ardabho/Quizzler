//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Arda Büyükhatipoğlu on 15.03.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    let quizArray = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], ta: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], ta: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], ta: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], ta: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], ta: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], ta: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], ta: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], ta: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], ta: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], ta: "Australia")

    ]
    
    ///Check if the User Answer was correct
    mutating func checkAnswer(answer userAnswer: String) -> Bool {
        if userAnswer == quizArray[questionNumber].correctAnswer{
            //User got it right
            score += 1
            return true
        } else {
            //User got it wrong
            return false
        }
    }
    
    ///Update the questionNumber property
    mutating func updateQuestionNumber() {
        if questionNumber + 1 < quizArray.count {
            questionNumber += 1
        } else {
            //reset the question number and score
            questionNumber = 0
            score = 0
        }
    }
    
    ///Returns the quiz question text
    func getQuestionText() -> String {
        return quizArray[questionNumber].text
    }
    
    ///Returns the current progress
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quizArray.count)
    }
    
    ///Returns the current score
    func getScore() -> Int {
        return score
    }
    
    ///Returns the answers of the current question in the form of an array
    func getAnswerArray() -> [String]{
        return quizArray[questionNumber].answers
    }
    
}
