//
//  GetRatesUseCase.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation
import Combine

protocol GetRatesUseCase {
    func execute() -> AnyPublisher<[Rate], ApiError>
}

final class GetRatesUseCaseImpl: GetRatesUseCase {
    
    // MARK: - Dependencies
    
    private let rateRepository: RateRepository
    
    // MARK: - Setup
    
    init(rateRepository: RateRepository) {
        self.rateRepository = rateRepository
    }
    
    // MARK: - Implementation
    
    func execute() -> AnyPublisher<[Rate], ApiError> {
        return rateRepository.getRates()
    }
}
