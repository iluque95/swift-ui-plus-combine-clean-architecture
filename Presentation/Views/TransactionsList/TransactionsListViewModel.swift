//
//  TransactionsListViewModel.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation
import Combine

class TransactionsListViewModel: ObservableObject {
    
    // MARK: - Constants
    
    private enum Constants {
        enum Currency {
            static let type: CurrencyType = .EUR
        }
    }
    
    // MARK: - Properties
    
    @Published var transactions: [Transaction]
    
    private var cancellables: Set<AnyCancellable>
    
    // MARK: - Dependencies
    
    let getTransactionsUseCase: GetTransactionsUseCase
    let getRatesUseCase: GetRatesUseCase
    let transformTransactionsUseCase: TransformTransactionsUseCase
    
    // MARK: - Setup
    
    init(getTransactionsUseCase: GetTransactionsUseCase,
         getRatesUseCase: GetRatesUseCase,
         transformTransactionsUseCase: TransformTransactionsUseCase) {
        self.transactions = .init()
        self.cancellables = .init()
        
        self.getTransactionsUseCase = getTransactionsUseCase
        self.getRatesUseCase = getRatesUseCase
        self.transformTransactionsUseCase = transformTransactionsUseCase
        
        fetchData()
    }
    
    // MARK: - Private methods
    
    private func fetchData() {        
        Publishers.Zip(getTransactionsUseCase.execute(),
                       getRatesUseCase.execute())
            .receive(on: RunLoop.main)
            .sink { error in
                print(error)
            } receiveValue: { transactions, rates in
                self.transactions = self.transformTransactionsUseCase.execute(from: transactions, to: Constants.Currency.type, with: rates)
            }.store(in: &cancellables)
    }
}
