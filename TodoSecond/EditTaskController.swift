//
//  EditTaskController.swift
//  TodoSecond
//
//  Created by Gladkov Maxim on 27.06.2021.
//

import UIKit

class EditTaskController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createETCConstraints()
        customizeNB()
        // Do any additional setup after loading the view.
    }
    //delegate property
    var taskToVC: TaskCreationProtocol?
    //property flag to decide if adding a new task or editiing old one
    var makingNewTask: Bool?
    //property to call protocol method to edit existing task in array
    var indexPathRow: Int?
    
    
    // MARK: UI elements
    let taskNameLabel: UILabel = {
       var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Name of the task"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return lbl
    }()
    let taskDescLabel: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Description of the task"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .medium)

        return lbl
     }()
    let taskDeadlineLable: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Choose a deadline"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .medium)

        return lbl
     }()
    
    let nameField: UITextField = {
        var txtf = UITextField()
        txtf.translatesAutoresizingMaskIntoConstraints = false
        txtf.font = UIFont.systemFont(ofSize: 16)
        txtf.textAlignment = .left
        txtf.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return txtf
    }()
    let descField: UITextView = {
        var txtv = UITextView()
        txtv.translatesAutoresizingMaskIntoConstraints = false
        txtv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        txtv.textAlignment = .left
        txtv.font = UIFont.systemFont(ofSize: 16)
        return txtv
    }()
    let deadline: UIDatePicker = {
        var dpicker = UIDatePicker()
        dpicker.translatesAutoresizingMaskIntoConstraints = false
        dpicker.datePickerMode = .date
        return dpicker
    }()
    
    let warningLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Заполните все поля!"
        lbl.textColor = #colorLiteral(red: 1, green: 0.01224201724, blue: 0, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 28)
        lbl.isHidden = true
        return lbl
    }()
    
    //MARK: Constraints
    func createETCConstraints(){
        view.backgroundColor = .white
        view.addSubview(taskNameLabel)
        view.addSubview(nameField)
        view.addSubview(taskDescLabel)
        view.addSubview(descField)
        view.addSubview(taskDeadlineLable)
        view.addSubview(deadline)
        view.addSubview(warningLabel)

        let constraints = [
            taskNameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            taskNameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            taskNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            taskNameLabel.heightAnchor.constraint(equalToConstant: 30),
                           
            nameField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            nameField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            nameField.heightAnchor.constraint(equalToConstant: 30),

            taskDescLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 60),
            taskDescLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            taskDescLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            taskDescLabel.heightAnchor.constraint(equalToConstant: 30),

            descField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 90),
            descField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            descField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            descField.heightAnchor.constraint(equalToConstant: 60),

            taskDeadlineLable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 150),
            taskDeadlineLable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            taskDeadlineLable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            taskDeadlineLable.heightAnchor.constraint(equalToConstant: 30),

            deadline.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 180),
            deadline.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            deadline.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            warningLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 240),
            warningLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            warningLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func customizeNB(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(getNewTask(_:)))
    }

    @objc func getNewTask(_ sender: UIBarButtonItem) {
        if self.taskToVC != nil && self.nameField.text?.isEmpty == false && self.descField.text.isEmpty == false && self.makingNewTask == true {
            let date = dateToString(deadline)
            let newTask = Task(taskName: self.nameField.text!, taskDescription: descField.text!, taskDone: false, taskDeadline: "\(date)")
            taskToVC?.createNewTask(newTask)
            navigationController?.popViewController(animated: true)
        }
        else if self.taskToVC != nil && self.nameField.text?.isEmpty == false && self.descField.text.isEmpty == false && self.makingNewTask == false {
            let date = dateToString(deadline)
            let oldTask = Task(taskName: self.nameField.text!, taskDescription: descField.text!, taskDone: false, taskDeadline: "\(date)")
            taskToVC?.updateTask(oldTask, self.indexPathRow!)
            navigationController?.popViewController(animated: true)
        }
        else {
            warningLabel.isHidden = false
        }
    }
    
    func dateToString(_ datePicker: UIDatePicker)-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let date = formatter.string(from: datePicker.date)
        return date
    }
    
    
    
}
