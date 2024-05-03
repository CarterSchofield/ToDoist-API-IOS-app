//
//  ViewController.swift
//  ToDoistAPI
//
//  Created by Carter Schofield on 11/15/23.
//
import UIKit

class TasksViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var store = ProjectStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.dataSource = self
        
        fetchProjectsAndTasks()
    }
    
    func fetchProjectsAndTasks() {
        let projectStore = ProjectStore()
        
        projectStore.fetchUserProjects { result in
            switch result {
            case .success:
                print("Projects fetched successfully")
                
                // Now that projects are fetched, fetch tasks
                projectStore.fetchUserTasks { taskResult in
                    switch taskResult {
                    case .success:
                        print("Tasks fetched successfully")
                        
                        // Reload the table view to reflect the new data
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    case .failure(let error):
                        print("Error fetching tasks: \(error)")
                    }
                }
                
            case .failure(let error):
                print("Error fetching projects: \(error)")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections (number of projects)
        return ProjectStore.projectsDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows (number of tasks for the selected project)
        let projectIDs = Array(ProjectStore.projectsDictionary.keys)
        let selectedProjectID = projectIDs[section]
        return ProjectStore.projectsDictionary[selectedProjectID]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectViewCell", for: indexPath) as? ProjectViewCell else {
            fatalError("Failed to dequeue ProjectViewCell")
        }
        
        // Configure the cell with data (e.g., task details)
        let projectIDs = Array(ProjectStore.projectsDictionary.keys)
        let selectedProjectID = projectIDs[indexPath.section]
        
        if let tasks = ProjectStore.projectsDictionary[selectedProjectID] {
            let task = tasks[indexPath.row]
            cell.configure(with: task)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return the project name for each section
        let projectIDs = Array(ProjectStore.projectsDictionary.keys)
        let selectedProjectID = projectIDs[section]
        if let project = ProjectStore.projectNames[selectedProjectID] {
            return project.projectName
        }
        return nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showTask":
            if let indexPath = tableView.indexPathForSelectedRow {
                let section = indexPath.section
                let row = indexPath.row

                let projectIDs = Array(ProjectStore.projectsDictionary.keys)
                let selectedProjectID = projectIDs[section]

                if let tasks = ProjectStore.projectsDictionary[selectedProjectID], row < tasks.count {
                    let task = tasks[row]
                    let detailViewController = segue.destination as! DetailViewController
                    detailViewController.item = task
                }
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }


    
    
    

}
