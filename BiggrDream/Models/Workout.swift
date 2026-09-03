//
//  Workout.swift
//  fitnessapp
//  1 Workout, Includes date done, duration, list of workouts done, Muscle groups?
//  Created by Tony Lin on 2026-05-31.
//
import Foundation
struct Workout:Identifiable, Hashable, Codable{
    let id:UUID
    let date: Date
    var name: String
    var muscleGroup :[MuscleGroup]
    var entries: [WorkoutEntry]
    init(id: UUID = UUID(), date: Date = Date(), name: String = "Workout", entries: [WorkoutEntry] = [], muscleGroup: [MuscleGroup] = []) {
        self.id = id
        self.date = date
        self.name = name
        self.entries = entries
        self.muscleGroup = muscleGroup
    }
}
