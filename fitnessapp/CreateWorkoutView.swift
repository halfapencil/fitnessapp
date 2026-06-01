//
//  CreateWorkoutView.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-31.
//
import SwiftUI

enum MuscleGroup: String,CaseIterable, Hashable{
    case chest,back,legs,bicep,tricep,shoulders
}
extension MuscleGroup {

    var title: String {
        rawValue.capitalized
    }

    var icon: String {
        switch self {
        case .chest: return "figure.strengthtraining.traditional"
        case .back: return "figure.walk"
        case .legs: return "figure.run"
        case .bicep: return "dumbbell"
        case .tricep: return "dumbbell"
        case .shoulders: return "figure.arms.open"
        }
    }
}
struct CreateWorkoutView: View {

    @StateObject private var store = ExerciseStore()

    @State private var selected = Set<MuscleGroup>()

    var body: some View {
        VStack {

            Text("Select Muscle Groups")
            MuscleSelectionView(selected: $selected)
            Button("Generate Workout") {
                let workout = WorkoutGenerator.generate(
                    from: selected,
                    library: store.exercises
                )

                print(workout)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .onAppear {
            store.load()
        }
    }
}
