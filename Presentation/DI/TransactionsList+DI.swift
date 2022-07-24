//
//  TransactionsList+DI.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation


private struct TransactionsListViewModelKey: InjectionKey {
    static var currentValue = TransactionsListViewModel(getTransactionsUseCase: InjectedValues[\.getTransactionsUseCase],
                                                        getRatesUseCase: InjectedValues[\.getRatesUseCase],
                                                        transformTransactionsUseCase: InjectedValues[\.transformTransactionsUseCase])
}

extension InjectedValues {
    var transactionsListViewModel: TransactionsListViewModel {
        get { Self[TransactionsListViewModelKey.self] }
        set { Self[TransactionsListViewModelKey.self] = newValue }
    }
}
