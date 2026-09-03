//
//  WorkoutDetailView.swift
//  BiggrDream
//
//  Created by Tony Lin on 2026-06-02.
//

import SwiftUI
struct WorkoutDetailView:View {
    
    @State var workout: Workout
    @FocusState private var isFocused: Bool
    var body: some View {
        ScrollView{
            LazyVStack {
                HStack{
                    WorkoutTimerView()
                }
                ForEach($workout.entries){ $entry in
                    VStack(alignment: .leading){
                        Text(entry.exerciseName).font(.headline)
                    }
                    HStack {
                        Text("Reps")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                        Text("Weight (lbs)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                        Spacer()
                            .font(.title2)
                    }
                    ForEach(Array($entry.sets.enumerated()), id:\.element.id){ index, $sets in
                        HStack{
                            Text("\(index + 1)").font(.subheadline).foregroundColor(.secondary).frame(width:20)
                            TextField("Reps", value:$sets.reps, format: .number).keyboardType(.numberPad).textFieldStyle(.roundedBorder).focused($isFocused)
                            TextField("Weight" , value: $sets.weight, format:
                                    .number).keyboardType(.numberPad).textFieldStyle(.roundedBorder)
                                .focused($isFocused)
                            Button(action: {
                                sets.isComplete.toggle()
                            }) {
                                Image(systemName: sets.isComplete ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(sets.isComplete ? .green : .gray)
                                    .font(.title2)
                            }
                            .buttonStyle(.plain)
                        }
                        .opacity(sets.isComplete ? 0.5: 1.0)
                    }
                    
                }
            }
            .navigationTitle(workout.muscleGroup.map{$0.title}.joined(separator: ", "))
            .onTapGesture{
                isFocused = false
            }.toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Finish"){
                        
                    }.fontWeight(.semibold)
                        .foregroundColor(.green)
                }
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        isFocused = false
                    }
                }
            }
        }
    }
}
