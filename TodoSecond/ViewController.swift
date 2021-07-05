//
//  ViewController.swift
//  TodoSecond
//
//  Created by Gladkov Maxim on 27.06.2021.
//

import UIKit
import RealmSwift

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
//        return taskArray.count
        return tasksDB.arrayOfTasks().count
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
    
    // MARK: Task functions
    func createTasks(_ cell: TaskCell, _ indexPath: IndexPath) -> TaskCell{
        cell.nameLabel.text = tasksDB.arrayOfTasks()[indexPath.row].taskName
        cell.descLabel.text = tasksDB.arrayOfTasks()[indexPath.row].taskDescription
        cell.deadlineLabel.text = tasksDB.arrayOfTasks()[indexPath.row].taskDeadline
        return cell
    }
    
    func editTask(_ indexPath: IndexPath){
        let editTaskController = EditTaskController()
        let taskToEdit = tasksDB.arrayOfTasks()[indexPath.row]
        
        editTaskController.nameField.text = taskToEdit.taskName
        editTaskController.descField.text = taskToEdit.taskDescription
        let date = stringToDate(taskToEdit.taskDeadline!)
        editTaskController.deadline.setDate(date, animated: true)
        
        editTaskController.taskToVC = self
        editTaskController.makingNewTask = false
        editTaskController.indexPathRow = indexPath.row

        self.navigationController?.pushViewController(editTaskController, animated: true)
    }
    
    // action for bar button
    @objc func addTask(_ sender: UIBarButtonItem) {
        let addTaskView = EditTaskController()
        addTaskView.taskToVC = self
        addTaskView.makingNewTask = true
        self.navigationController?.pushViewController(addTaskView, animated: true)
    }
    
    func createNewTask(_ task: Task) {
        tasksDB.saveNewTask(task)
        self.tableView.reloadData()
    }
    
    func updateTask(_ task: Task, _ indexPathRow: Int){
        let taskToUpd = tasksDB.arrayOfTasks()[indexPathRow]
        tasksDB.deleteTask(taskToUpd)
        tasksDB.saveNewTask(task)
        self.tableView.reloadData()
    }

    func stringToDate(_ date: String)-> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let date = formatter.date(from: date)
        return date!
    }
    
    func doneHandeler(indexPathRow: Int){
        let taskDone = tasksDB.arrayOfTasks()[indexPathRow]
        tasksDB.taskDone(taskDone)
        self.tableView.reloadData()
    }
    
    func deleteHandler(indexPathRow: Int){
        let taskToDelete = tasksDB.arrayOfTasks()[indexPathRow]
        tasksDB.deleteTask(taskToDelete)
        self.tableView.reloadData()
    }
    

    // MARK: Properties
    
    var tasksDB = TasksDB()
    
}

