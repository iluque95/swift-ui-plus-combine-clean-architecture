//
//  RateRepository.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation
import Combine

protocol RateRepository {
    func getRates() -> AnyPublisher<[Rate], ApiError>
}

final class RateRepositoryImpl: RateRepository {
    
    // MARK: - Dependencies
    
    private let apiProvider: ApiProvider
    private let rateFactory: RateFactory
    
    // MARK: - Setup
    
    init(apiProvider: ApiProvider,
         rateFactory: RateFactory) {
            self.apiProvider = apiProvider
            self.rateFactory = rateFactory
        }
    
    // MARK: - Implementation
    
    func getRates() -> AnyPublisher<[Rate], ApiError> {
        return apiProvider.response(from: RatesRequest())
            .map { [weak self] ratesResponse in
                return ratesResponse.compactMap { rateResponse in
                    return self?.rateFactory.getRate(from: rateResponse)
                }
            }.eraseToAnyPublisher()
    }
}
