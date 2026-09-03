//
//  WorkoutTimerView.swift
//  BiggrDream
//
//  Created by Tony Lin on 2026-06-05.
//

import SwiftUI

struct WorkoutTimerView:View {
    @State var startDate: Date?
    @State var isRunning = true
    @State var finalTime: TimeInterval?
    var body: some View {
        VStack{
            if isRunning{
                TimelineView(.periodic(from: .now, by: 1)){
                    context in
                    Text(
                        formattedTime(context.date.timeIntervalSince(startDate ?? .now))
                    ).font(.largeTitle.monospacedDigit())
                        .onAppear(){
                            startDate = .now
                            finalTime = nil
                            isRunning = true
                        }
                }
            }else {
                Text(
                    formattedTime(finalTime ?? 0)
                ).font(.largeTitle.monospacedDigit())
            }
            
            
            
        }
    }
    private func formattedTime(
        _ interval:TimeInterval
    ) -> String{
        let hour = Int(interval)/3600
        let min = Int(interval) % 3600 / 60
        let sec = Int(interval) % 60
        return String(format: "%02d:%02d:%02d",
                      hour,min,sec)
    }
}
