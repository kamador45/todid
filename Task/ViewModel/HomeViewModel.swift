//
//  HomeViewModel.swift
//  Task
//
//  Created by Kevin Amador Rios on 6/22/22.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    //Define vars
    @Published var task_name = ""
    @Published var date = Date()
    
    //Set bool value
    @Published var isNewTask = false
    
    //MARK: Check and update date from calendar
    let calendar = Calendar.current
    
    func checkDate() -> String {
        //check date
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return "Other days"
        }
    }
    
    //MARK: Update date
    func UpdateDate(value:String) {
        if value == "Today" {
            date = Date()
        } else if value == "Tomorrow" {
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        }
    }
    
    //MARK: Write Data
    func writeData(context: NSManagedObjectContext) {
        //Access to model
        let newTask = Task(context: context)
        newTask.task_name = task_name
        newTask.date = date
        
        //Attempt to save data
        do {
            try context.save()
            
            //if is successfully dismiss sheet
            isNewTask = false
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
