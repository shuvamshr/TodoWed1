//
//  ContentView.swift
//  TodoWed1
//
//  Created by Shuvam Shrestha on 18/3/2026.
//

import SwiftUI

struct TodoTask: Identifiable {
    var id: UUID = UUID()
    
    var title: String
    var description: String
    var isCompleted: Bool = false
}


struct ContentView: View {
    
    var tasks: [TodoTask] = [
        TodoTask(title: "My First Task", description: "Description of my first task"),
        TodoTask(title: "My Second Task", description: "Description of my second task"),
        TodoTask(title: "My Third Task", description: "Description of my third task", isCompleted: true),
    ]
    
    var body: some View {
        ScrollView {
            ForEach(tasks) { task in
                TaskItemView(task: task)
            }
        }
    }
}

struct TaskItemView: View {
    
    var task: TodoTask
 
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                Text(task.description)
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            
            if task.isCompleted == true {
                Image(systemName: "checkmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(Color.green)
            } else {
                Image(systemName: "circle")
                    .font(.title)
                    .foregroundStyle(Color.secondary)
            }
            
            
        }
        .padding()
    }
}




#Preview {
    ContentView()
}
