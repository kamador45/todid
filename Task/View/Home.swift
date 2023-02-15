//
//  Home.swift
//  Task
//
//  Created by Kevin Amador Rios on 6/22/22.
//

import SwiftUI
import CoreData

struct Home: View {
    @ObservedObject var homeModel: HomeViewModel = HomeViewModel()
    
    //Fetching process or query to model
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)], animation: .spring()) var results:FetchedResults<Task>
    
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack {
                
                HStack {
                    Text("Tasks Schedule")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                List {
                    ForEach(results) { task in
                        HStack {
                            Text(task.task_name ?? "")
                                .font(.title2)
                                .foregroundColor(.purple)
                        }
                    }
                }
                .listStyle(.inset)
//                ScrollView(.vertical, showsIndicators: true, content: {
//                    LazyVStack(alignment: .leading, spacing: 20) {
//                        ForEach(results) { task in
//                            VStack(alignment: .leading, spacing: 5) {
//                                Text(task.task_name ?? "")
//                                    .font(.title)
//                                    .foregroundColor(.purple)
//                                Text(task.date ?? Date(), style: .date)
//                                    .fontWeight(.bold)
//                                    .font(.system(size: 15))
//                                    .foregroundColor(.gray)
//                                Divider()
//                            }
//                        }
//                    }
//                })
            }
            
            Button(action: {
                homeModel.isNewTask = true
            }, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: .init(colors: [.purple, .purple]), center: .center)
                    )
                    .clipShape(Circle())
            })
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.01).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeModel.isNewTask) {
            NewData(homeModel: homeModel)
        }
    }
    
    //Attempt to delete items
    func deleteItems() {
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
