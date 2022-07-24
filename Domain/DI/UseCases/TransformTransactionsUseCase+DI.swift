//
//  TransformTransactionsUseCase+DI.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

private struct TransformTransactionsUseCaseKey: InjectionKey {
    static var currentValue: TransformTransactionsUseCase = TransformTransactionsUseCaseImpl()
}

extension InjectedValues {
    var transformTransactionsUseCase: TransformTransactionsUseCase {
        get { Self[TransformTransactionsUseCaseKey.self] }
        set { Self[TransformTransactionsUseCaseKey.self] = newValue }
    }
}
