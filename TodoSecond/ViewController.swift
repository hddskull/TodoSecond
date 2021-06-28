//
//  ViewController.swift
//  TodoSecond
//
//  Created by Gladkov Maxim on 27.06.2021.
//

import UIKit

class ViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        tableView.register(TaskCell.self, forCellReuseIdentifier: "cellID")
        // Do any additional setup after loading the view.
    }

    
    // MARK: TableView configuration
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TaskCell
        cell = createTasks(cell, indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editTaskController = EditTaskController()
        editTaskController.nameField.text = taskArray[indexPath.row].taskName
        editTaskController.descField.text = taskArray[indexPath.row].taskDescription
//        editTaskController.deadline.setDate(Date(taskArray[indexPath.row].taskDeadline), animated: false)
        self.navigationController?.pushViewController(editTaskController, animated: true)
    }
    
    // MARK: Misc
    func createTasks(_ cell: TaskCell, _ indexPath: IndexPath) -> TaskCell{
        cell.nameLabel.text = taskArray[indexPath.row].taskName
        cell.descLabel.text = taskArray[indexPath.row].taskDescription
        cell.deadlineLabel.text = taskArray[indexPath.row].taskDeadline
        return cell
    }
    
    let taskArray = [
        Task(taskName: "Task 1", taskDescription: "Description 1", taskDone: false, taskDeadline: "date 1"),
        Task(taskName: "Task 2", taskDescription: "Description 2", taskDone: false, taskDeadline: "date 2"),
        Task(taskName: "Task 3", taskDescription: "Description 3", taskDone: false, taskDeadline: "date 3"),
        Task(taskName: "Task 4", taskDescription: "Description 4", taskDone: false, taskDeadline: "date 4")
    ]

}

