//
//  ContentView.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-27.
//
//changes
import SwiftUI

struct ContentView: View {
    
    let exercises = ["Bench press", "Chest Fly", "Tricep Extention",""]
    var body: some View {

        VStack{
            List {
                ForEach(exercises, id:\.self){
                    exercise in Text(exercise)
                }
            }
        }
        TabView{
            HistoryView().tabItem { Label("History",systemImage: "person.3") }
            SettingsView().tabItem { Label("Settings", systemImage: ) }
        }
    
        }
    }

#Preview {
    ContentView()
}
