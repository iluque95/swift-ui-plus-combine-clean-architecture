//
//  RateFactory+DI.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

private struct RateFactoryKey: InjectionKey {
    static var currentValue: RateFactory = RateFactory()
}

extension InjectedValues {
    var rateFactory: RateFactory {
        get { Self[RateFactoryKey.self] }
        set { Self[RateFactoryKey.self] = newValue }
    }
}
