//
//  CardView.swift
//  Scrumdinger
//
//  Created by Krzysztof Jankowski on 30/12/2020.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: scrum.attendees.count < 3 ? "person.2": "person.3")
                    .accessibilityElement(children:.ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("\(scrum.attendees.count)"))
                Spacer()
                Label("\(scrum.lenghtInMinutes)", systemImage: "clock")
                    .accessibilityElement(children:.ignore)
                    .accessibilityLabel(Text("Meeting lenght"))
                    .accessibilityValue(Text("\(scrum.lenghtInMinutes) minutes"))
                    .padding(.trailing)
            }
            .font(.caption)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .foregroundColor(scrum.color.accessibleFontColor)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
           // .environment(\.accessibilityInvertColors, true)
    }
}
