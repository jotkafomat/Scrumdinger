//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Krzysztof Jankowski on 30/12/2020.
//

import Foundation
import SwiftUI


struct DailyScrum: Identifiable {
    
    init(id: UUID = UUID(), title: String, attendees: [String], lenghtInMinutes: Int, color: Color) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lenghtInMinutes = lenghtInMinutes
        self.color = color
    }
    
    let id: UUID
    var title: String
    var attendees: [String]
    var lenghtInMinutes: Int
    var color: Color
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Gromit", "RubberDuck"], lenghtInMinutes: 10, color: Color("Design")),
            DailyScrum(title: "App Dev", attendees: ["Big Pompon", "Little Pompon"], lenghtInMinutes: 6, color: Color("App Dev")),
            DailyScrum(title: "Web Dev", attendees: ["Giraffe", "Frog"], lenghtInMinutes: 12, color: Color("Web Dev"))
        ]
    }
}
