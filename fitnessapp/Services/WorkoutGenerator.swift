//
//  WorkoutGenerator.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-31.
//
import Foundation

struct WorkoutGenerator{
    static func generate(from muscles: Set<MuscleGroup>, library:[Exercise]) -> Workout{
        var entries: [WorkoutEntry] = []
        if muscles.contains(.chest){
            let chestExercises = library.filter{$0.primaryMuscle.contains("chest")}
            if let first = chestExercises.first{
                entries.append(
                    WorkoutEntry(exerciseId: first.id, exerciseName: first.name, sets: defaultSets())
                )
            }
        }
        
        return Workout(entries:entries)
    }
    static func defaultSets() -> [WorkoutSet]{
        [
            WorkoutSet(reps: 8, weight: 225),
            WorkoutSet(reps: 8, weight: 225),
            WorkoutSet(reps: 8, weight: 225)
        ]
    }
}
