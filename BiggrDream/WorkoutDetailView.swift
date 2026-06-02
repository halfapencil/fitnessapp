//
//  WorkoutDetailView.swift
//  BiggrDream
//
//  Created by Tony Lin on 2026-06-02.
//

import SwiftUI
struct WorkoutDetailView:View {
    let workout: Workout
    var body: some View {
        List {
            ForEach(workout.entries){ entry in
                VStack(alignment: .leading){
                    Text(entry.exerciseName).font(.headline)
                    Text("\(entry.sets.count) Sets").font(.subheadline)
                }
                
            }
        }
        .navigationTitle("Workout")
    }
}
