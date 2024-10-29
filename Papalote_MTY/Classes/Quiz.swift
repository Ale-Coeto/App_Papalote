//
//  Quiz.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 25/10/24.
//

import Foundation

class Question: ObservableObject {
    // Properties for question text and responses
    @Published var questionText: String
    @Published var responses: [String]
    
    // Initializer
    init(questionText: String, responses: [String] = []) {
        self.questionText = questionText
        self.responses = responses
    }
}



