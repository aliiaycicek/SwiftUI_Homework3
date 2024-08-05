//
//  ContentView.swift
//  Homework3
//
//  Created by Ali Ayçiçek on 5.08.2024.
//

import SwiftUI


struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool = false
}

struct ContentView: View {
   
    @State private var tasks: [Task] = []
    @State private var taskText: String = ""

    var body: some View {
        ZStack {
            Color.teal.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                   
                    TextField("Task:", text: $taskText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        if !taskText.isEmpty {
                            let newTask = Task(name: taskText)
                            tasks.append(newTask)
                            taskText = ""
                        }
                    }) {
                        Text("Add")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.red)
                            .cornerRadius(5)
                    }
                }
                .padding()

               
                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        HStack {
                            Text(tasks[index].name)
                                .foregroundColor(.red)
                                .strikethrough(tasks[index].isCompleted, color: .red)
                                .onTapGesture {
                                    tasks[index].isCompleted.toggle()
                                }
                            Spacer()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding()
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


