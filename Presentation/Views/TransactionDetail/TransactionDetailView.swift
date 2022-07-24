//
//  TransactionDetailView.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import SwiftUI

struct TransactionDetailView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: TransactionDetailViewModel
    
    // MARK: - View
    
    var body: some View {
        Text("\(viewModel.sku)")
            .bold()
            .font(.system(size: 36))
        
        Text("Total amount: \(viewModel.totalAmount)")
    }
}
