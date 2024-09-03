//
//  Journal.swift
//  JournalApp0831
//
//  Created by Arun Chandrasekaran on 8/31/24.
//

import Foundation
import SwiftData

@Model
final class Journal {
    var id: UUID = UUID()
    var title: String = String()
    var rating: Int = 0
    var text: String = String()
    var date: Date = Date()
    
    init(id: UUID, title: String, rating: Int, text: String, date: Date) {
        self.id = id
        self.title = title
        self.rating = rating
        self.text = text
        self.date = date
    }
}

var sampleJournals = [
    Journal(
        id: UUID(),
        title: "Trip to Paris",
        rating: 5,
        text: "Had an amazing time exploring the city!",
        date: Date()),
    Journal(
        id: UUID(),
        title: "Birthday Party",
        rating: 4,
        text: "Celebrated my friend's birthday with a fun party.",
        date: Date()),
    Journal(
        id: UUID(),
        title: "Work Presentation",
        rating: 3,
        text: "Gave a presentation at work. It went well.",
        date: Date())
]
