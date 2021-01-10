//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Krzysztof Jankowski on 10/01/2021.
//

import SwiftUI

struct MeetingTimerView: View {
    @Binding var speakers: [ScrumTimer.Speaker]
    var scrumColor: Color
    private var currentSpeaker: String { speakers.first(where: { !$0.isCompleted })?.name ?? "Someone" }
    @Binding var isRecording: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            VStack {
                Text(currentSpeaker)
                    .font(.title)
                Text("is speaking")
                Image(systemName: isRecording ? "mic" : "mic.slash")
                    .font(.title)
                    .padding(.top)
                    .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
            }
            .accessibilityElement(children: .combine)
            .foregroundColor(scrumColor.accessibleFontColor)
            ForEach(speakers) { speaker in
                if speaker.isCompleted,
                   let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                    SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                        .rotation(Angle(degrees: -90))
                        .stroke(scrumColor, lineWidth: 12)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    @State static var speakers = [ScrumTimer.Speaker(name: "Kim", isCompleted: true), ScrumTimer.Speaker(name: "Bill", isCompleted: false)]
    static var previews: some View {
        MeetingTimerView(speakers: $speakers, scrumColor: Color("Design"), isRecording: .constant(true))
    }
}
