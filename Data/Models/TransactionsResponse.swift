//
//  TransactionsResponse.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation

struct TransactionResponse: Decodable {
    let sku: String?
    let amount: String?
    let currency: String?
}
