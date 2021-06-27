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
        // Do any additional setup after loading the view.
    }
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
    
    //MARK: Constraints
    func createETCConstraints(){
        view.backgroundColor = .white
        view.addSubview(taskNameLabel)
        view.addSubview(nameField)
        view.addSubview(taskDescLabel)
        view.addSubview(descField)
        view.addSubview(taskDeadlineLable)
        view.addSubview(deadline)

        let constraints = [taskNameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
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

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
