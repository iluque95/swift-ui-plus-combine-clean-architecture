//
//  TransformTransactionsUseCase.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

protocol TransformTransactionsUseCase {
    func execute(from transactions: [Transaction],
                 to type: CurrencyType,
                 with rates: [Rate]) -> [Transaction]
}

final class TransformTransactionsUseCaseImpl: TransformTransactionsUseCase {
        
    // MARK: - Implementation
    
    func execute(from transactions: [Transaction],
                 to type: CurrencyType,
                 with rates: [Rate]) -> [Transaction] {
        return transactions.compactMap({
            let currency = $0.currency.convert(to: type, rates: rates)
            return Transaction(sku: $0.sku,
                        currency: currency)
        })
    }
}

