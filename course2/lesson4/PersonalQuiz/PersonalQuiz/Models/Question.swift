//
//  Question.swift
//  PersonalQuiz
//
//  Created by egigoka on 24/10/2024.
//

enum ResponseType{
    case single
    case multiple
    case ranged
}

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}
