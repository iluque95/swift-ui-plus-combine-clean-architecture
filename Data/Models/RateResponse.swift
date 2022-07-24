//
//  RateResponse.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

struct RateResponse: Decodable {
    let from: String?
    let to: String?
    let rate: String?
}
