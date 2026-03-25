//
//  ContentView.swift
//  TodoWed1
//
//  Created by Shuvam Shrestha on 18/3/2026.
//

import SwiftUI

// Model

struct TodoTask: Identifiable {
    var id: UUID = UUID()
    
    var title: String
    var description: String
    var isCompleted: Bool = false
    var priority: Priority = .medium
}

enum Priority: String, CaseIterable {
    case low = "Low Priority"
    case medium = "Medium Priority"
    case high = "High Priority"
}

// Page

struct ContentView: View {
    
    @State private var tasks: [TodoTask] = [
        TodoTask(title: "My First Task", description: "Description of my first task"),
        TodoTask(title: "My Second Task", description: "Description of my second task"),
        TodoTask(title: "My Third Task", description: "Description of my third task", isCompleted: true),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(tasks) { task in
                    TaskItemView(task: task)
                }
                
                
            }
            .navigationTitle("Things To-Do")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
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
    
    func addSampleTask() {
        let sampleTask: TodoTask = TodoTask(title: "Sample Task", description: "Some Description")
        
        tasks.append(sampleTask)
        
    }
}

// Component

struct TaskItemView: View {
    
    var task: TodoTask
 
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Button(task.priority.rawValue) {
                    
                }
                .controlSize(.mini)
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

// Page

struct NewTaskView: View {
    
    @Binding var tasks: [TodoTask]
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var prioirity: Priority = .medium
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        Form {
            TextField("Enter New Title", text: $title)
            TextEditor(text: $description)
            Picker("Select Priority", selection: $prioirity) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue)
                        .tag(priority)
                }
            }
        }
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addNewTask()
                        dismiss()
                    } label: {
                        Label("Save", systemImage: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!isInputValid)
                }
            }
    }
    
    private func addNewTask() {
        let newTask = TodoTask(title: title, description: description)
        
       tasks.append(newTask)
    }
    
    private var isInputValid: Bool {
        if title.isEmpty {
            return false
        } else {
            return true
        }
    }
}


#Preview {
    ContentView()
}
