//
//  Currency+Extension.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

extension Currency {
    /// Convert to given currency type using currency rates.
    /// - Parameters:
    ///   - type: to convert.
    ///   - rates: rates from other currencies.
    ///   - rateIndex: current index of rates recursion.
    /// - Returns: New currency converted to given type and recaculated its amount.
    func convert(to type: CurrencyType, rates: [Rate], rateIndex: Int = 0) -> Currency {
        if self.type != type {
            if let rate = rates.first(where: { $0.from.rawValue == self.type.rawValue }) {
                let amount = (Float(rate.rate) ?? 0.0) * self.amount
                return Currency(type: type, amount: amount)
            }
            
            guard rateIndex < rates.count else { return self }
            
            let rate = rates[rateIndex]
            let amount = Float(rate.rate) ?? 0.0 * self.amount
            return Currency(type: rate.to,
                            amount: amount)
                .convert(to: type,
                         rates: rates,
                         rateIndex: rateIndex+1)
        }
        return self
    }
}
