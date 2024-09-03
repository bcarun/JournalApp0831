//
//  JournalDetailView.swift
//  JournalApp0831
//
//  Created by Arun Chandrasekaran on 8/31/24.
//

import SwiftUI
import SwiftData


struct JournalDetailView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var journal: Journal
    let isNew: Bool
        
    var body: some View {
        Form {
            TextField("Title", text: $journal.title)
            TextField("Rating", value: $journal.rating, format: .number)
            DatePicker("Date", selection: $journal.date, displayedComponents: .date)
            TextEditor(text: $journal.text)
        }
        .navigationTitle(isNew ? "New Journal" : "Journal")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    modelContext.delete(journal)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        JournalDetailView(
            journal: Journal(
                id: UUID(),
                title: "Test",
                rating: 3,
                text: "Some text and another text etc..",
                date: Date()
            ), 
            isNew: true)
        .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(for: Journal.self, inMemory: true)
}
