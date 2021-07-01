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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = .systemTeal
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
    
    // MARK: Swipe Actions
    
    //swipe to finish task
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Done") {
            (action, view, completionHandler) in self.doneHandeler(indexPathRow: indexPath.row)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    //swipe to delete task
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, completionHandler) in self.deleteHandler(indexPathRow: indexPath.row)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    // MARK: NavigationBar
    
    func setupNavBar(){
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
        editTaskController.makingNewTask = false
        editTaskController.indexPathRow = indexPath.row
        let date = stringToDate(taskArray[indexPath.row].taskDeadline!)
        editTaskController.deadline.setDate(date, animated: true)
        self.navigationController?.pushViewController(editTaskController, animated: true)
    }
    
    @objc func addTask(_ sender: UIBarButtonItem) {
        let addTaskView = EditTaskController()
        addTaskView.taskToVC = self
        addTaskView.makingNewTask = true
        self.navigationController?.pushViewController(addTaskView, animated: true)
    }
    
    func createNewTask(_ task: Task) {
        taskArray.append(task)
        self.tableView.reloadData()
    }
    func updateTask(_ task: Task, _ indexPathRow: Int){
        var taskToUpd = taskArray[indexPathRow]
        taskArray.remove(at: indexPathRow)
        taskToUpd.taskName = task.taskName
        taskToUpd.taskDescription = task.taskDescription
        taskToUpd.taskDeadline = task.taskDeadline
        taskToUpd.taskDone = task.taskDone
        taskArray.insert(taskToUpd, at: indexPathRow)
        self.tableView.reloadData()
    }

    func stringToDate(_ date: String)-> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let date = formatter.date(from: date)
        return date!
    }
    
    func doneHandeler(indexPathRow: Int){
        taskArray[indexPathRow].taskDone = true
    }
    
    func deleteHandler(indexPathRow: Int){
        taskArray.remove(at: indexPathRow)
        self.tableView.reloadData()
    }
    
    // MARK: Properties
    
//    var taskArray = [Task]()
    var taskArray = [
        Task(taskName: "Task 1", taskDescription: "Description 1", taskDone: false, taskDeadline: "date 1"),
        Task(taskName: "Task 2", taskDescription: "Description 2", taskDone: false, taskDeadline: "date 2"),
        Task(taskName: "Task 3", taskDescription: "Description 3", taskDone: false, taskDeadline: "date 3"),
        Task(taskName: "Task 4", taskDescription: "Description 4", taskDone: false, taskDeadline: "date 4")
    ]


}

