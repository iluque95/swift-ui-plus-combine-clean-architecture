//
//  TransactionFactory+DI.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

private struct TransactionFactoryKey: InjectionKey {
    static var currentValue: TransactionFactory = TransactionFactory()
}

extension InjectedValues {
    var transactionFactory: TransactionFactory {
        get { Self[TransactionFactoryKey.self] }
        set { Self[TransactionFactoryKey.self] = newValue }
    }
}
