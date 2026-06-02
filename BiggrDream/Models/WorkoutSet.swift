//
//  WorkoutSet.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-31.
//

import Foundation

struct WorkoutSet: Identifiable{
    let id:UUID
    var reps: Int
    var weight: Double
    var isComplete: Bool
    init(id: UUID = UUID(), reps: Int, weight: Double, isComplete: Bool = false)  {
        self.id = id
        self.reps = reps
        self.weight = weight
        self.isComplete = isComplete
    }
}
