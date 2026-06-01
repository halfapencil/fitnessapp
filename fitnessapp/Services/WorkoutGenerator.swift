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
        var usedFamilies = Set<String>()
        
        let orderedMuscles = muscles.sorted{$0.priority < $1.priority}
        
        for muscle in orderedMuscles {
            var candidate = library.filter{$0.primaryMuscle.contains(muscle.rawValue)}
            
            candidate.shuffle()
            var added = 0
            
            
            for exercise in candidate{
                if usedFamilies.contains(exercise.family){
                    continue
                }
                usedFamilies.insert(exercise.family)
                entries.append(WorkoutEntry(exerciseId: exercise.id, exerciseName: exercise.name, sets: defaultSets()))
                added += 1
                if added == 2 {break}
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
