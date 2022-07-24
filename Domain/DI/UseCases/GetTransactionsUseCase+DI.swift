//
//  GetTransactionsUseCase+DI.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

private struct GetTransactionsUseCaseKey: InjectionKey {
    static var currentValue: GetTransactionsUseCase = GetTransactionsUseCaseImpl(transactionRepository: InjectedValues[\.transactionRepository])
}

extension InjectedValues {
    var getTransactionsUseCase: GetTransactionsUseCase {
        get { Self[GetTransactionsUseCaseKey.self] }
        set { Self[GetTransactionsUseCaseKey.self] = newValue }
    }
}
