//
//  TransactionDetailViewModel.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation
import SwiftUI

class TransactionDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let sku: String
    let totalAmount: Float
    
    // MARK: - Setup
    
    init(sku: String, transactions: [Transaction]) {
        self.sku = sku
        self.totalAmount = transactions.filter({ $0.sku == sku })
                                        .reduce(0) { $0 + $1.currency.amount }
    }
}
