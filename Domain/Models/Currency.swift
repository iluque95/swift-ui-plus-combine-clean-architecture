//
//  Currency.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

enum CurrencyType: String {
    case EUR
    case USD
    case CAD
    case AUD
}

struct Currency {
    let type: CurrencyType
    let amount: Float
}
