//
//  RateRepository+DI.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

private struct RateRepositoryKey: InjectionKey {
    static var currentValue: RateRepository = RateRepositoryImpl(apiProvider: InjectedValues[\.apiProvider],
                                                                 rateFactory: InjectedValues[\.rateFactory])
}

extension InjectedValues {
    var rateRepository: RateRepository {
        get { Self[RateRepositoryKey.self] }
        set { Self[RateRepositoryKey.self] = newValue }
    }
}
