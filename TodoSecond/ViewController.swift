//
//  ViewController.swift
//  TodoSecond
//
//  Created by Gladkov Maxim on 27.06.2021.
//

import UIKit

class ViewController: UITableViewController, TaskCreationProtocol{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        tableView.register(TaskCell.self, forCellReuseIdentifier: "cellID")
        setupNavBar()
    }
    // хуйзнает как обновлять ячейки после добавления новой таски
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = .systemTeal
        tableView.register(TaskCell.self, forCellReuseIdentifier: "cellID")
        setupNavBar()
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
        editTask(indexPath)
    }
    
    // MARK: NavigationBar
    
    func setupNavBar(){
//        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.title = "ToDo Second"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTask(_:)))
    }
    
    // MARK: Misc
    func createTasks(_ cell: TaskCell, _ indexPath: IndexPath) -> TaskCell{
        cell.nameLabel.text = taskArray[indexPath.row].taskName
        cell.descLabel.text = taskArray[indexPath.row].taskDescription
        cell.deadlineLabel.text = taskArray[indexPath.row].taskDeadline
        return cell
    }
    
    func editTask(_ indexPath: IndexPath){
        let editTaskController = EditTaskController()
        editTaskController.nameField.text = taskArray[indexPath.row].taskName
        editTaskController.descField.text = taskArray[indexPath.row].taskDescription
        editTaskController.taskToVC = self
//        editTaskController.deadline.setDate(Date(taskArray[indexPath.row].taskDeadline), animated: false)
        self.navigationController?.pushViewController(editTaskController, animated: true)
    }
    
    @objc func addTask(_ sender: UIBarButtonItem) {
        let addTaskView = EditTaskController()
        addTaskView.nameField.text = " "
        addTaskView.descField.text = " "
        self.navigationController?.pushViewController(addTaskView, animated: true)
    }
    
    func createNewTask(_ task: Task) {
        taskArray.append(task)
    }
    
    
    // MARK: Properties

    var taskArray = [
        Task(taskName: "Task 1", taskDescription: "Description 1", taskDone: false, taskDeadline: "date 1"),
        Task(taskName: "Task 2", taskDescription: "Description 2", taskDone: false, taskDeadline: "date 2"),
        Task(taskName: "Task 3", taskDescription: "Description 3", taskDone: false, taskDeadline: "date 3"),
        Task(taskName: "Task 4", taskDescription: "Description 4", taskDone: false, taskDeadline: "date 4")
    ]
    

}

