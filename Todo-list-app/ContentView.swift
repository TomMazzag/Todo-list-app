//
//  ContentView.swift
//  Todo-list-app
//
//  Created by Tom Mazzag on 12/02/2024.
//

import SwiftUI

struct TodoItem {
    var name: String
    var completed: Bool
}

struct ContentView: View {
    var todoListTasks = ["Task 1", "Task 2", "Task 3", "Task 4"]
    @State private var todoList = [
        TodoItem(name: "Task 1", completed: false),
        TodoItem(name: "Task 2", completed: false),
        TodoItem(name: "Task 3", completed: false),
        TodoItem(name: "Task 4", completed: false)
    ]
    @State var allCompleted = false
    
    private var completedEmoji: String {
        return allCompleted ? "✅" : "❌"
    }
    // Body is the only mandatory element that needs to be passed into a UIVIew
    var body: some View {
        VStack {
            Image("Todo")
                .resizable()
                .frame(width: 350, height: 250)
            Text("Todos!")
                .font(.largeTitle)
            ForEach(todoList.indices, id: \.self) { index in
                HStack {
                    Toggle(isOn: $todoList[index].completed) {
                        Text(todoList[index].name)
                    }
                    .onChange(of: todoList[index].completed) {
                        checkAllCompleted()
                    }
                }
            }
            HStack {
                Image(systemName: "tick")
                Button("Completed \(completedEmoji)") {
                    allCompleted = !allCompleted
                    print(todoList[1].completed)
                }
            }
            Spacer()
        }
        .padding()
    }
    
    func checkAllCompleted() {
        if todoList.allSatisfy({ $0.completed }) {
            allCompleted = true
        } else if allCompleted == true {
            allCompleted = false
        }
    }
}

#Preview {
    ContentView()
}
