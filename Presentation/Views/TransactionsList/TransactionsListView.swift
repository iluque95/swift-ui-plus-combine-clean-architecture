//
//  ContentView.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import SwiftUI

struct TransactionsListView: View {
    
    // MARK: - Constants
    
    private enum Constants {
        static let navigationTitle = "Transactions"
    }
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: TransactionsListViewModel = InjectedValues[\.transactionsListViewModel]
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            List(viewModel.transactions) { transaction in
                NavigationLink {
                    TransactionDetailView(viewModel: .init(sku: transaction.sku,
                                                           transactions: viewModel.transactions))
                } label: {
                    Text(transaction.string)
                }
                .navigationTitle(Constants.navigationTitle)
            }
        }
    }
}
