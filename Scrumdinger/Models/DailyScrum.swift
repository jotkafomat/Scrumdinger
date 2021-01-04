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
        self.lengthInMinutes = lenghtInMinutes
        self.color = color
    }
    
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees:
                        ["Gromit", "RubberDuck"], lenghtInMinutes: 10,
                       color: Color("Design")),
            DailyScrum(title: "App Dev", attendees:
                        ["Big Pompon", "Little Pompon"], lenghtInMinutes: 6,
                       color: Color("App Dev")),
            DailyScrum(title: "Web Dev", attendees:
                        ["Giraffe", "Frog"], lenghtInMinutes: 12,
                       color: Color("Web Dev"))
        ]
    }
}
extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .random
    }
    var data: Data {
        return Data(title: title, attendees: attendees,
                    lengthInMinutes: Double(lengthInMinutes),
                    color: color)
    }
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
    }
}

