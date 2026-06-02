//
//  WorkoutEntry.swift
//  fitnessapp
//  1 Exercise entry, includes an exercise, reps done, sets done
//  Created by Tony Lin on 2026-05-31.
//

import Foundation
struct WorkoutEntry:Identifiable, Hashable{
    let id:UUID
    var exerciseId:Int
    var exerciseName: String
    var sets: [WorkoutSet]
    init(id: UUID = UUID(), exerciseId: Int, exerciseName: String, sets: [WorkoutSet]) {
        self.id = id
        self.exerciseId = exerciseId
        self.exerciseName = exerciseName
        self.sets = sets
    }
}
