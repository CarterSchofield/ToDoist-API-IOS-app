//
//  Project.swift
//  ToDoistAPI
//
//  Created by Carter Schofield on 11/19/23.
//

import Foundation

class Project: Codable {
    let projectName: String
    let remoteURL: URL
    let projectID: String
    let projectOrder: Int
    let projectColor: String
    
    enum CodingKeys: String, CodingKey {
            case projectName = "name"
            case remoteURL = "url"
            case projectID = "id"
            case projectOrder = "order"
            case projectColor = "color"
        }
}

class Task: Codable, CustomStringConvertible {

    let taskName: String
    let remoteURL: URL
    let taskID: String
    let projectID: String
    let taskOrder: Int
    let priorityNum: Int
    let taskDescription: String
    let taskCompleted: Bool

    enum CodingKeys: String, CodingKey {
        case taskName = "content"
        case remoteURL = "url"
        case taskID = "id"
        case projectID = "project_id"
        case taskOrder = "order"
        case priorityNum = "priority"
        case taskDescription = "description"
        case taskCompleted = "is_completed"
    }

    // Conform to CustomStringConvertible
    var description: String {
        return "Task ID: \(taskID), Name: \(taskName), Project ID: \(projectID), Completed: \(taskCompleted)"
    }
}
