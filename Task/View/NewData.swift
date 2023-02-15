//
//  NewData.swift
//  Task
//
//  Created by Kevin Amador Rios on 6/23/22.
//

import SwiftUI

struct NewData: View {
    //import the same model
    @ObservedObject var homeModel: HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            HStack {
                Text("New Task")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)
                Spacer(minLength: 0)
            }
            .padding()
            Divider()
            TextEditor(text: $homeModel.task_name)
                .padding()
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("Set Day")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 10) {
                DateButton(title: "Today", homeModel: homeModel)
                DateButton(title: "Tomorrow", homeModel: homeModel)
                
                //Add date picker
                DatePicker("", selection: $homeModel.date, displayedComponents: .date)
                    .labelsHidden()
            }
            
            //Add button
            Button(action: {
                //Invoque method
                homeModel.writeData(context: context)
            }, label: {
                Label(title: {
                    Text("Add task")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }, icon: {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.white)
                })
            })
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(
                LinearGradient(colors: [.purple, .white], startPoint: .topTrailing, endPoint: .leading)
            )
            .cornerRadius(8)
            .disabled(homeModel.task_name == "" ? true: false)
            .opacity(homeModel.task_name == "" ? 0.5:1)
            Spacer(minLength: 0)
        }
    }
}

