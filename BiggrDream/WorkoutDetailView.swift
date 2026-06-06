//
//  WorkoutDetailView.swift
//  BiggrDream
//
//  Created by Tony Lin on 2026-06-02.
//

import SwiftUI
struct WorkoutDetailView:View {
    
    @State var workout: Workout
    var body: some View {
        List {
            Section{
                WorkoutTimerView()
            }
            ForEach($workout.entries){ $entry in
                VStack(alignment: .leading){
                    Text(entry.exerciseName).font(.headline)
                    Text("\(entry.sets.count) Sets").font(.subheadline)
                    ForEach($entry.sets){ $sets in
                        HStack{
                            TextField(
                                "Reps",
                                value: $sets.reps,
                                format: .number
                            ).keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                            TextField(
                                "Weight",
                                value: $sets.weight,
                                format: .number
                            ).keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                    }
                }
                
            }
        }
        .navigationTitle(workout.muscleGroup.map{$0.title}.joined(separator: ", "))
    }
}
