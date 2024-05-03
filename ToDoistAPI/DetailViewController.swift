//
//  DetailViewController.swift
//  ToDoistAPI
//
//  Created by Carter Schofield on 11/20/23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var TaskNameField: UITextField!
    @IBOutlet var TaskDescField: UITextField!
    
    var item: Task! {
        didSet {
            navigationItem.title = item.taskName
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // If there is no item, don't do anything
        
        TaskNameField.text = item.taskName
        TaskDescField.text = item.taskDescription
    }
}
