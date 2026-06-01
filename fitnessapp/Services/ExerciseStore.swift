//
//  ExerciseStore.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-31.
//

import Foundation

struct Exercise:Codable, Identifiable{
    let id:Int
    let name:String
    let primaryMuscle:String
    let secondaryMuscle:[String]
    let category:[String]
    let equipment:String
    let family:String
}

final class ExerciseStore: ObservableObject{
    @Published var exercises: [Exercise] = []
    
    func load() {
        print("🔵 loading exercises...")

        guard let url = Bundle.main.url(forResource: "ExerciseLibrary", withExtension: "json") else {
            print("❌ JSON NOT FOUND IN BUNDLE")
            return
        }

        print("✅ found json:", url)

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Exercise].self, from: data)
            exercises = decoded
            print("✅ decoded exercises:", decoded.count)
        } catch {
            print("❌ decode error:", error)
        }
    }
}
