//
//  ContentView.swift
//  saltybible
//
//  Created by Torey Mercurio on 1/27/23.
//

import SwiftUI

func formatDate(month: Int, day: Int) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM, d"
    let dateComponents = DateComponents(month: month, day: day)
    let date = Calendar.current.date(from: dateComponents) ?? Date.now
    return dateFormatter.string(from: date)
}

func isDayComplete(readings: [Reading]) -> Bool {
    for reading in readings {
        if (!reading.hasRead) {
            return false
        }
    }
    return true
}

struct ContentView: View {
    @State var readingPlan: [DailyReading]
    
    func updateReadingPlan(dayIndex: Int, readingIndex: Int) {
        readingPlan[dayIndex].readings[readingIndex].hasRead = !readingPlan[dayIndex].readings[readingIndex].hasRead
    }
    
    var body: some View {
        List() {
            ForEach(Array(readingPlan.enumerated()), id: \.element) { i, dailyReading in
                let isPreviousDayComplete = i > 0 ? isDayComplete(readings: readingPlan[i - 1].readings) : true
                if (!isDayComplete(readings: dailyReading.readings) && isPreviousDayComplete) {
                    Section(header: Text(formatDate(month: dailyReading.month, day: dailyReading.day))) {
                        ForEach(Array(dailyReading.readings.enumerated()), id: \.element) { j, reading in
                            HStack {
                                Text(reading.title)
                                Spacer()
                            }
                            .contentShape(Rectangle())
                            .strikethrough(reading.hasRead)
                            .onTapGesture {
                                self.updateReadingPlan(dayIndex: i, readingIndex: j)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(readingPlan: Reading.sampleReadingPlan)
    }
}
