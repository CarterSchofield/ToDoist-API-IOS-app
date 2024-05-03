//
//  ItemCell.swift
//  ToDoistAPI
//
//  Created by Carter Schofield on 11/19/23.
//

import Foundation
import UIKit

class ProjectViewCell: UITableViewCell {
    
    @IBOutlet var projectNameLabel: UILabel!
    @IBOutlet var taskNameLabel: UILabel!
    @IBOutlet var taskDescriptionLabel: UILabel!
    @IBOutlet var taskBullet: UIView!
    
    var projectBackgroundColor: UIColor = .gray {
            didSet {
                taskBullet.backgroundColor = projectBackgroundColor
            }
        }
    
    
    func configure(with task: Task) {
            projectNameLabel.text = task.taskName
            taskNameLabel.text = task.priorityNum.description
            taskDescriptionLabel.text = task.taskDescription
        if let projectID = task.projectID as? String {
                if let projectColor = ProjectStore.projectColors[projectID] {
                    projectBackgroundColor = projectColor
                } else {
                    let randomColor = generateRandomColor()
                    ProjectStore.projectColors[projectID] = randomColor
                    projectBackgroundColor = randomColor
                }
            }
        }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.red
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.brown
    }
    
    private func generateRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0.0...1.0)
        let green = CGFloat.random(in: 0.0...1.0)
        let blue = CGFloat.random(in: 0.0...1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}
