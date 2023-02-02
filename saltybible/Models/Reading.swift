import Foundation

struct Reading: Hashable, Identifiable {
    var title: String
    var group: String
    var hasRead: Bool
    var tags: [String]
    let id = UUID()
}

struct DailyReading: Hashable, Identifiable {
    var month: Int
    var day: Int
    var readings: [Reading]
    let id = UUID()
}

extension Reading {
    static let sampleReadingPlan: [DailyReading] =
    [
        DailyReading(month: 0, day: 1, readings: [
            Reading(title: "Matthew 1:1-17", group: "NT1", hasRead: true, tags: ["NT", "Gospel"]),
            Reading(title: "Acts 1:1-11", group: "NT2", hasRead: true, tags: ["NT", "Gospel"]),
            Reading(title: "Psalms 1", group: "OT1", hasRead: true, tags: ["OT"]),
            Reading(title: "Genesis 1-2", group: "OT2", hasRead: true, tags: ["OT"])
        ]),
        DailyReading(month: 0, day: 2, readings: [
            Reading(title: "Matthew 1:18-25", group: "NT1", hasRead: false, tags: ["NT", "Gospel"]),
            Reading(title: "Acts 1:12-26", group: "NT2", hasRead: true, tags: ["NT", "Gospel"]),
            Reading(title: "Psalms 2", group: "OT1", hasRead: false, tags: ["OT"]),
            Reading(title: "Genesis 3-4", group: "OT2", hasRead: true, tags: ["OT"])
        ]),
        DailyReading(month: 0, day: 3, readings: [
            Reading(title: "Matthew 1:18-25", group: "NT1", hasRead: false, tags: ["NT", "Gospel"]),
            Reading(title: "Acts 1:12-26", group: "NT2", hasRead: true, tags: ["NT", "Gospel"]),
            Reading(title: "Psalms 2", group: "OT1", hasRead: false, tags: ["OT"]),
            Reading(title: "Genesis 3-4", group: "OT2", hasRead: true, tags: ["OT"])
        ]),
        DailyReading(month: 0, day: 4, readings: [
            Reading(title: "Matthew 2:1-13", group: "NT1", hasRead: false, tags: ["NT", "Gospel"]),
            Reading(title: "Acts 2:1-21", group: "NT2", hasRead: false, tags: ["NT", "Gospel"]),
            Reading(title: "Psalms 3", group: "OT1", hasRead: false, tags: ["OT"]),
            Reading(title: "Genesis 5-8", group: "OT2", hasRead: false, tags: ["OT"])
        ])
    ]
}
