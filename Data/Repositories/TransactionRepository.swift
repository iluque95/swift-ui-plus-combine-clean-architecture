//
//  TransactionRepository.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation
import Combine

protocol TransactionRepository {
    func getTransactions() -> AnyPublisher<[Transaction], ApiError>
}

final class TransactionRepositoryImpl: TransactionRepository {
    
    // MARK: - Dependencies
    
    private let apiProvider: ApiProvider
    private let transactionFactory: TransactionFactory
    
    // MARK: - Setup
    
    init(apiProvider: ApiProvider,
         transactionFactory: TransactionFactory) {
            self.apiProvider = apiProvider
            self.transactionFactory = transactionFactory
        }
    
    // MARK: - Implementation
    
    func getTransactions() -> AnyPublisher<[Transaction], ApiError> {
        return apiProvider.response(from: TransactionsRequest())
            .map { [weak self] transactionsResponse in
                return transactionsResponse.compactMap { transactionResponse in
                    return self?.transactionFactory.getTransaction(from: transactionResponse)
                }
            }.eraseToAnyPublisher()
    }
}
