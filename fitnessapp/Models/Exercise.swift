//
//  Exercise.swift
//  fitnessapp
//
//  Created by Tony Lin on 2026-05-30.
//

import SwiftData

@Model
class Exercise{
    var name: String
    var muscleGroup: String
    var equipment: String

    init(name:String, muscleGroup:String, equipment: String){
        self.name = name
        self.muscleGroup = muscleGroup
        self.equipment = equipment
    }
}

