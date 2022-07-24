//
//  ApiProvider.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation
import Combine

protocol ApiProvider {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, ApiError> where Request: BaseApiRequest
}

final class ApiProviderImpl: ApiProvider {

    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, ApiError> where Request: BaseApiRequest {
    
        let pathURL = URL(string: request.path, relativeTo: request.baseUrl)!
        
        let urlComponents: URLComponents = {
            var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
            urlComponents.queryItems = request.queryItems
            
            return urlComponents
        }()
        
        let urlRequest: URLRequest = {
            var urlRequest = URLRequest(url: urlComponents.url!)
            request.headers?.forEach({
                urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
            })
            
            return urlRequest
        }()
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { data, urlResponse in
                data
            }
            .mapError { _ in ApiError.responseError }
            .decode(type: Request.Response.self, decoder: decoder)
            .mapError(ApiError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
