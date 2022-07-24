//
//  GetTransactionsUseCase.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation
import Combine

protocol GetTransactionsUseCase {
    func execute() -> AnyPublisher<[Transaction], ApiError>
}

final class GetTransactionsUseCaseImpl: GetTransactionsUseCase {
    
    // MARK: - Dependencies
    
    private let transactionRepository: TransactionRepository
    
    // MARK: - Setup
    
    init(transactionRepository: TransactionRepository) {
        self.transactionRepository = transactionRepository
    }
    
    // MARK: - Implementation
    
    func execute() -> AnyPublisher<[Transaction], ApiError> {
        return transactionRepository.getTransactions()
    }
}
