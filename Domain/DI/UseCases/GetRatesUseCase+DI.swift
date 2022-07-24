//
//  GetCurrenciesUseCase.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

private struct GetRatesUseCaseKey: InjectionKey {
    static var currentValue: GetRatesUseCase = GetRatesUseCaseImpl(rateRepository: InjectedValues[\.rateRepository])
}

extension InjectedValues {
    var getRatesUseCase: GetRatesUseCase {
        get { Self[GetRatesUseCaseKey.self] }
        set { Self[GetRatesUseCaseKey.self] = newValue }
    }
}
