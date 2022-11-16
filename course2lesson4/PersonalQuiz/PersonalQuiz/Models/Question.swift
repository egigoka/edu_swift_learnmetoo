//
//  Question.swift
//  PersonalQuiz
//
//  Created by egigoka on 16/11/2022.
//

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Question {
    let text: String
    let type: ResponseTime
    let answers: [Answer]
    
}
