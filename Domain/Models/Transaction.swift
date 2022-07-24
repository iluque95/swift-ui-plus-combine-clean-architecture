//
//  Transaction.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let sku: String
    let currency: Currency
    
    var string: String {
        return "\(sku) -> (\(currency.amount) \(currency.type))"
    }
}
