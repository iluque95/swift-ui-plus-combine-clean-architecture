//
//  ApiError.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import Foundation

enum ApiError: Error {
    case responseError
    case parseError(Error)
}
