//
//  ApiProvider+DI.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 24/7/22.
//

import Foundation

private struct ApiProviderKey: InjectionKey {
    static var currentValue: ApiProvider = ApiProviderImpl()
}

extension InjectedValues {
    var apiProvider: ApiProvider {
        get { Self[ApiProviderKey.self] }
        set { Self[ApiProviderKey.self] = newValue }
    }
}
