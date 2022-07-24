//
//  TransactionRepository+DI.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

private struct TransactionRepositoryKey: InjectionKey {
    static var currentValue: TransactionRepository = TransactionRepositoryImpl(apiProvider: InjectedValues[\.apiProvider],
                                                                               transactionFactory: InjectedValues[\.transactionFactory])
}

extension InjectedValues {
    var transactionRepository: TransactionRepository {
        get { Self[TransactionRepositoryKey.self] }
        set { Self[TransactionRepositoryKey.self] = newValue }
    }
}
