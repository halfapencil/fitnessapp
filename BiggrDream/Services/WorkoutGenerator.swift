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
            let compounds = candidate.filter{$0.category.contains("compound")}.shuffled()
            let isolations = candidate.filter{!$0.category.contains("compound")}.shuffled()
            
            var added = 0
            if let compoundExercise = compounds.first, !usedFamilies.contains(compoundExercise.family){
                entries.append(WorkoutEntry(exerciseId: compoundExercise.id, exerciseName: compoundExercise.name, sets: defaultSets()))
                
                usedFamilies.insert(compoundExercise.family)
                added+=1
            }
            
            for exercise in isolations{
                if added == 2 {break}
                if usedFamilies.contains(exercise.family){
                    continue
                }
                usedFamilies.insert(exercise.family)
                entries.append(WorkoutEntry(exerciseId: exercise.id, exerciseName: exercise.name, sets: defaultSets()))
                added += 1
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
