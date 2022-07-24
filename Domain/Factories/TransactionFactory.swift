//
//  TransactionFactory.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation

class TransactionFactory {
    
    // MARK: - Internal methods
    
    func getTransaction(from transactionResponse: TransactionResponse) -> Transaction? {
        guard let sku = transactionResponse.sku,
              let amount = transactionResponse.amount,
              let currency = transactionResponse.currency,
              let currency = getCurrency(with: amount, in: currency)
        else { return nil }
        
        return Transaction(sku: sku,
                           currency: currency)
    }
    
    // MARK: - Private methods
    
    private func getCurrency(with amount: String, in type: String) -> Currency? {
        guard let amount = Float(amount),
              let type = CurrencyType(rawValue: type) else { return nil }
        return Currency(type: type,
                        amount: amount)
    }
}
