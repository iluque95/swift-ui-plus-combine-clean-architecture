//
//  RateFactory.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

class RateFactory {
    
    // MARK: - Internal methods
    
    func getRate(from rateResponse: RateResponse) -> Rate? {
        guard let from = rateResponse.from,
              let from = CurrencyType(rawValue: from),
              let to = rateResponse.to,
              let to = CurrencyType(rawValue: to),
              let rate = rateResponse.rate
        else { return nil }
        
        return Rate(from: from,
                    to: to,
                    rate: rate)
    }
}
