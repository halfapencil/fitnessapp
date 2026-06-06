//
//  WorkoutsView.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-31.
//

import SwiftUI

struct WorkoutsView: View {
    @State private var showCreate = false

    var body: some View {
        NavigationStack {
            List {

                Section {
                    Button("Generate Workout") {
                        showCreate = true
                    }
                }

                Section("History") {
                    Text("Push")
                    Text("Legs")
                }
            }
            .navigationTitle("Workouts")
            .navigationDestination(isPresented: $showCreate) {
                CreateWorkoutView()
            }
        }
    }
}
