//
//  CreateWorkoutView.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-31.
//
import SwiftUI

enum MuscleGroup: String,CaseIterable, Hashable{
    case chest,tricep,shoulders,back,bicep,legs,abs
}
extension MuscleGroup {

    var title: String {
        rawValue.capitalized
    }
    var targetMuscle:[String]{
        switch self{
        case .chest: return["chest","upper chest","lower chest","mid chest"]
        case .back: return["back","upper back","lats","mid back"]
        case .shoulders: return["shoulders"]
        case .bicep: return ["bicep"]
        case .tricep: return ["tricep"]
        case .legs: return ["quad","hamstring","calf"]
        case .abs: return ["abs","oblique"]
        
            
        }
    }
    var priority:Int{
        switch self{
        case .chest: return 0
        case .back: return 0
        case .shoulders: return 0
        case .legs: return 0
            
        case .bicep: return 1
        case .tricep: return 1
            
        case .abs: return 2
        }
    }
    var icon: String {
        switch self {
        case .chest: return "figure.strengthtraining.traditional"
        case .back: return "figure.walk"
        case .legs: return "figure.run"
        case .bicep: return "dumbbell"
        case .tricep: return "dumbbell"
        case .shoulders: return "figure.arms.open"
        case .abs: return "figure.core.training"
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
