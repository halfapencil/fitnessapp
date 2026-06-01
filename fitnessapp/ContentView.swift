//
//  ContentView.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-27.
//
//changes
import SwiftUI

struct ContentView: View {
    let exercises = [
        "Bench Press",
        "Chest Fly",
        "Tricep Extension"
    ]
    var body: some View {
        WorkoutsView()
    }
}

#Preview {
    ContentView()
}
