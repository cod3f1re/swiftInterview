//
//  Question.swift
//  Example interview
//
//  Created by Abraham Rivera Rojas on 29/02/24.
//

import Foundation

struct Question:Codable, Identifiable{
    let id = UUID()
    let score : Int
    let title : String
}

struct ListQuestions: Codable{
    var items : [Question]
}

func performAPICall() async throws -> ListQuestions {
    let url = URL(string: "https://api.stackexchange.com/2.3/questions?pagesize=1&order=desc&sort=votes&site=stackoverflow&filter=)pe0bT2YUo)Qn0m64ED*6Equ")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let wrapper = try JSONDecoder().decode(ListQuestions.self, from: data)
    return wrapper
}






