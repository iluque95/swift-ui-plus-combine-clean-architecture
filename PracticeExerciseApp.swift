//
//  PracticeExerciseApp.swift
//  PracticeExercise
//
//  Created by Itiel Luque Díaz on 23/7/22.
//

import SwiftUI

/*
 
 TODO:
 
 *  Obtener rates
 *  Crear use case que transforme las transacciones
    con la moneda a euros.
 
 */

@main
struct PracticeExerciseApp: App {
    var body: some Scene {
        WindowGroup {
            TransactionsListView()
        }
    }
}
