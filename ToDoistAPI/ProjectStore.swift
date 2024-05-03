//
//  ProjectStore.swift
//  ToDoistAPI
//
//  Created by Carter Schofield on 11/18/23.
//

import Foundation
import UIKit

enum ProjectError: Error {
    case projectCreationError
    case missingProjectURL
}

class ProjectStore {
    static var projectsDictionary: [String: [Task]] = [:]
    static var projectNames: [String: Project] = [:]
    static var projectColors: [String: UIColor] = [:]

    func fetchUserProjects(completion: @escaping (Result<Void, Error>) -> Void) {
        ToDoistAPI.getProjects { result in
            switch result {
            case .success(let projects):
                // Handle the successful response data (projects is of type [Project])
                for project in projects {
                    print("Project ID: \(project.projectID), Name: \(project.projectName)")
                    ProjectStore.projectsDictionary[project.projectID] = []
                    ProjectStore.projectNames[project.projectID] = project
                }
                completion(.success(()))
            case .failure(let error):
                // Handle the error
                print("Error: \(error)")
                completion(.failure(error))
            }
        }
    }

    func fetchUserTasks(completion: @escaping (Result<Void, Error>) -> Void) {
        ToDoistAPI.getTasks { result in
            switch result {
            case .success(let tasks):
                // Handle the successful response data (tasks is of type [Task])
                for task in tasks {
                    print("Task ID: \(task.taskID), Name: \(task.taskName)")

                    if var projectTasks = ProjectStore.projectsDictionary[task.projectID] {
                        projectTasks.append(task)
                        ProjectStore.projectsDictionary[task.projectID] = projectTasks
                    }
                }
                completion(.success(()))
            case .failure(let error):
                // Handle the error
                print("Error: \(error)")
                completion(.failure(error))
            }
        }
    }
}


//class ProjectStore {
//    static var projectsDictionary: [String: [Task]] = [:]
//    static var projectNames: [String: Project] = [:]
//
//    func fetchUserProjects(completion: @escaping (Result<Void, Error>) -> Void) {
//        ToDoistAPI.getProjects { result in
//            switch result {
//            case .success(let projects):
//                // Handle the successful response data (projects is of type [Project])
//                for project in projects {
//                    print("Project ID: \(project.projectID), Name: \(project.projectName)")
//                    ProjectStore.projectsDictionary[project.projectID] = []
//                    ProjectStore.projectNames[project.projectID] = project
//                }
//                completion(.success(()))
//            case .failure(let error):
//                // Handle the error
//                print("Error: \(error)")
//                completion(.failure(error))
//            }
//        }
//    }
//
//    func fetchUserTasks(completion: @escaping (Result<Void, Error>) -> Void) {
//        ToDoistAPI.getTasks { result in
//            switch result {
//            case .success(let tasks):
//                // Handle the successful response data (tasks is of type [Task])
//                for task in tasks {
//                    print("Task ID: \(task.taskID), Name: \(task.taskName)")
//
//                    if var projectTasks = ProjectStore.projectsDictionary[task.projectID] {
//                        projectTasks.append(task)
//                        ProjectStore.projectsDictionary[task.projectID] = projectTasks
//                    }
//                }
//                completion(.success(()))
//            case .failure(let error):
//                // Handle the error
//                print("Error: \(error)")
//                completion(.failure(error))
//            }
//        }
//    }
//}

