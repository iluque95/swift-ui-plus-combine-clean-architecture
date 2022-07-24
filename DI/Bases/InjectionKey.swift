//
//  InjectionKey.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//
// Source: https://www.avanderlee.com/swift/dependency-injection/

import Foundation

public protocol InjectionKey {
    
    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value
    
    /// The default value for the dependency injection key.
    static var currentValue: Self.Value { get set }
}
