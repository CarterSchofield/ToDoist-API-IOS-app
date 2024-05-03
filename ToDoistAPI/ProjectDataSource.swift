//
//  ProjectDataSource.swift
//  ToDoistAPI
//
//  Created by Carter Schofield on 11/19/23.
//

import UIKit

//class ProjectDataSource: NSObject, UITableViewDataSource {
//    
//    var projects: [Project] = []
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // The number of sections is the number of projects
//        return ProjectStore.projectsDictionary.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // The number of rows in each section is the number of tasks for that project
//        let projectKeys = Array(ProjectStore.projectsDictionary.keys)
//        let projectID = projectKeys[section]
//        return ProjectStore.projectsDictionary[projectID]?.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectViewCell", for: indexPath) as! ProjectViewCell
//        
//        // Configure the cell with data from the projectsDictionary
//        let projectKeys = Array(ProjectStore.projectsDictionary.keys)
//        let projectID = projectKeys[indexPath.section]
//        if let tasks = ProjectStore.projectsDictionary[projectID] {
//            let task = tasks[indexPath.row]
//            // Configure the cell with task data (e.g., task.taskName)
//            cell.taskName?.text = task.taskName
//        }
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let projectKeys = Array(ProjectStore.projectsDictionary.keys)
//        let projectID = projectKeys[section]
//        if let tasks = ProjectStore.projectsDictionary[projectID] {
//            let task = tasks[0]
//            return task.projectID
//        }
//        return "No Project"
//    }
//}

