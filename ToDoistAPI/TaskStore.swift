//
//  TaskStore.swift
//  ToDoistAPI
//
//  Created by Carter Schofield on 11/15/23.
//

import Foundation
import UIKit

class TaskStore {
    
    func fetchUserTasks() {
        ToDoistAPI.getTasks { result in
            switch result {
            case .success(let tasks):
                // Handle the successful response data (projects is of type [Project])
                for task in tasks {
                    print("Task ID: \(task.taskID), Name: \(String(describing: task.taskName)), Project ID: \(task.projectID), Order: \(task.taskOrder), Desc: \(task.taskDescription)")
                    // Add your logic to handle each project
                }
            case .failure(let error):
                // Handle the error
                print("Error: \(error)")
            }
        }
    }
}
