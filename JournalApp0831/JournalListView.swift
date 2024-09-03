//
//  JournalListView.swift
//  JournalApp0831
//
//  Created by Arun Chandrasekaran on 8/31/24.
//

import SwiftUI
import SwiftData

struct JournalListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var journals: [Journal]
    
    @State var newJournal: Journal?
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach (journals) { journal in
                    NavigationLink {
                        JournalDetailView(journal: journal, isNew: false)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(journal.title)
                                .font(.headline)
                            
                            Text(String.SubSequence(repeating: "⭐️", count: journal.rating))
                                .font(.subheadline)
                            
                            Text(journal.date, style: .date)
                                .font(.caption)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $newJournal) { journal in
                NavigationStack {
                    JournalDetailView(journal: journal, isNew: true)
                }
            }
            .navigationTitle("\(journals.count) Journals")
        }
        detail: {
            Text("Select a journal")
                .navigationTitle("Journal")
        }
    }
    
    
    private func addItem() {
        withAnimation {
            let newItem = Journal(
                id: UUID(),
                title: "",
                rating: 0,
                text: "",
                date: Date()
            )
            modelContext.insert(newItem)
            newJournal = newItem
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(journals[index])
            }
        }
    }
}

#Preview {
    JournalListView()
        .modelContainer(for: Journal.self, inMemory: true)
}
