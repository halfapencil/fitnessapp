//
//  ContentView.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-27.
//
//changes
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WorkoutsView()
                .tabItem {
                    Label("Generate", systemImage: "plus.circle.fill")
                }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage: "person.fill")
                }
        }	
    }
}

#Preview {
    ContentView()
}
