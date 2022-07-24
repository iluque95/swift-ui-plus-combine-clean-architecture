//
//  Injected+PropertyWrapper.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//
// Source: https://www.avanderlee.com/swift/dependency-injection/

import Foundation

@propertyWrapper
struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
