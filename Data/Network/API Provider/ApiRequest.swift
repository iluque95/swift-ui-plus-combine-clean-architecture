//
//  ApiRequest.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation

enum Method: String {
    case GET = "GET"
}

protocol BaseApiRequest {
    
    var baseUrl: URL { get }
    var path: String { get }
    var method: Method { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    
    associatedtype Response: Decodable
}
