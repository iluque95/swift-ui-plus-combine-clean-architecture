//
//  TransactionsTarget.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation

struct TransactionsRequest: BaseApiRequest {
    
    var baseUrl: URL {
        return URL(string: "https://quiet-stone-2094.herokuapp.com")!
    }
    
    var path: String {
        return "/transactions"
    }
    
    var method: Method {
        return .GET
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json",
                "Accept": "application/json"]
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    typealias Response = [TransactionResponse]
}
