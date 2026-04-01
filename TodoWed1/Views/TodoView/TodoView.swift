//
//  TodoView.swift
//  TodoWed1
//
//  Created by Shuvam Shrestha on 18/3/2026.
//


import SwiftUI

struct TodoView: View {
    
    @State private var tasks: [TodoTask] = [
        TodoTask(
            title: "Organise workspace",
            description: "Clean desk and arrange files for better focus",
            priority: .low
        ),
        TodoTask(
            title: "Prepare presentation slides",
            description: "Finalize content and visuals for tomorrow's meeting",
            priority: .medium
        ),
        TodoTask(
            title: "Submit assignment",
            description: "Complete and upload before the deadline",
            isCompleted: true,
            priority: .high
        ),
        TodoTask(
            title: "Read a few pages",
            description: "Spend 15 minutes reading a book before bed",
            priority: .low
        )
    ]
    
    var body: some View {

        NavigationStack {
            List {
                ForEach(tasks) { task in
                    TaskItemView(task: task, tasks: $tasks)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Things To-Do")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        NewTaskView(tasks: $tasks)
                    } label: {
                        Label("Add New Task", systemImage: "plus")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}





#Preview {
    TodoView()
}
