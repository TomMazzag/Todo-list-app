//
//  customTodoList.swift
//  Todo-list-app
//
//  Created by Tom Mazzag on 13/02/2024.
//

import SwiftUI

struct customTodoList: View {
    
    @State private var todoList = [
        TodoItem(name: "Task 1", completed: false),
        TodoItem(name: "Task 2", completed: false),
        TodoItem(name: "Task 3", completed: false),
        TodoItem(name: "Task 4", completed: false)
    ]
    
    @State private var taskTextField: [String] = Array(repeating: "", count: 4)
    
    @State var allCompleted = false
    @State var edit = false
    
    private var completedEmoji: String {
        return allCompleted ? "✅" : "❌"
    }
    // Body is the only mandatory element that needs to be passed into a UIVIew
    var body: some View {
        VStack {
            Image("Todo")
                .resizable()
                .frame(width: 350, height: 250)
            HStack {
                Spacer()
                Text("Todos!")
                    .font(.largeTitle)
                Spacer()
                Button{
                    edit = !edit
                } label: {
                    withAnimation{
                        Text(edit ? "Done" : "Edit")
                    }
                }
            }
            .padding()
            
            
            ForEach(todoList.indices, id: \.self) { index in
                HStack {
                    Toggle(isOn: $todoList[index].completed) {
                        TextField(todoList[index].name, text: $taskTextField[index])
                    }
                    .onChange(of: todoList[index].completed) {
                        checkAllCompleted()
                    }
                    edit ? Button(action: {
                        if todoList.indices.contains(index) {
                            todoList.remove(at: index)
                            taskTextField.remove(at: index)
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.red)
                    } : nil
                }
            }
            
            if edit {
                Button("Add a new task") {
                    todoList.append(TodoItem(name: "New Task", completed: false))
                    taskTextField.append("")
                    checkAllCompleted()
                }
            }
            
            Spacer()
            Button("Completed \(completedEmoji)") {
                print(taskTextField)
            }
            .padding()
        }
        .padding()
        .onAppear {
            // Set the count of taskTextFields to the length of todoList
            taskTextField = Array(repeating: "", count: todoList.count)
        }
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
    customTodoList()
}
