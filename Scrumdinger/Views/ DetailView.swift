//
//   DetailView.swift
//  Scrumdinger
//
//  Created by Krzysztof Jankowski on 31/12/2020.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel(Text("Start meeting"))
                HStack {
                    Label("Lenght", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                    
                }
                .accessibilityElement(children: .ignore)
                Section(header: Text("Atendees")) {
                    ForEach(scrum.attendees, id: \.self) { attendee in
                        Label(attendee, systemImage: "person")
                            .accessibilityLabel(Text("Person"))
                            .accessibilityValue(Text(attendee))
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}