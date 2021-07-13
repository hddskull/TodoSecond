//
//  EditTaskController.swift
//  TodoSecond
//
//  Created by Gladkov Maxim on 27.06.2021.
//

import UIKit
import SnapKit

class EditTaskController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeNB()
        self.hideKeyboard()
        initTFdelegates()
//        createETCConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        snapConstraints()
    }
    
    
    //MARK: Properties
    //delegate property
    var taskToVC: TaskCreationProtocol?
    //property flag to decide if adding a new task or editiing old one
    var makingNewTask: Bool?
    //property to call protocol method to edit existing task in array
    var indexPathRow: Int?
    
    
    // MARK: UI elements
    
    
    var scrollView = UIScrollView(frame: .zero)
    let stackview = UIStackView()
    let contentView = UIView()
    let taskNameLabel = UILabel()
    let taskDescLabel = UILabel()
    let taskDeadlineLable = UILabel()
    let nameField = UITextField()
    let descField = UITextView()
    var deadline = UIDatePicker()
    let emptyLabel = UILabel()

    
    func customizeNB(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(getNewTask(_:)))
    }

    //MARK: Save button
    @objc func getNewTask(_ sender: UIBarButtonItem) {
        //create new task
        if self.taskToVC != nil && self.nameField.text?.isEmpty == false && self.descField.text.isEmpty == false && self.makingNewTask == true {
            let date = dateToString(deadline)
            let newTask = Task(taskName: self.nameField.text!, taskDescription: descField.text!, taskDone: false, taskDeadline: date)
            
            taskToVC?.createNewTask(newTask)
            navigationController?.popViewController(animated: true)
        }
        else if self.taskToVC != nil && self.nameField.text?.isEmpty == false && self.descField.text.isEmpty == false && self.makingNewTask == false {
            let date = dateToString(deadline)
            let oldTask = Task(taskName: self.nameField.text!, taskDescription: descField.text!, taskDone: false, taskDeadline: date)
            
            taskToVC?.updateTask(oldTask, self.indexPathRow!)
            navigationController?.popViewController(animated: true)
        }
        else {
            let alertFields = UIAlertController(title: "Error", message: "Please fill in the name, description and deadline date", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertFields.addAction(ok)
            navigationController?.present(alertFields, animated: true, completion: nil)
        }
    }
    
    func dateToString(_ datePicker: UIDatePicker)-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let date = formatter.string(from: datePicker.date)
        return date
    }
    
    
    //MARK: Move to next TextField
    
    
    func initTFdelegates(){
        nameField.delegate = self
        descField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            nameField.resignFirstResponder()
            descField.becomeFirstResponder()
        }
        return true
    }
    
    
    //MARK: Constraints
    
    
    func createETCConstraints(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        
        
        
//        contentView.addArrangedSubview(taskNameLabel)
//        contentView.addArrangedSubview(nameField)
//        contentView.addArrangedSubview(taskDescLabel)
//        contentView.addArrangedSubview(descField)
//        contentView.addArrangedSubview(taskDeadlineLable)
//        contentView.addArrangedSubview(deadline)
 
        
        
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            nameField.heightAnchor.constraint(equalToConstant: 30),
            
            descField.heightAnchor.constraint(equalToConstant: 80),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func snapConstraints () {
        
        
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = .purple
        scrollView.frame = self.view.bounds
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.snp.makeConstraints { (make) -> Void in
            make.top.bottom.leading.trailing.width.equalTo(view)
        }
        
        
        scrollView.addSubview(stackview)
        
        stackview.backgroundColor = .systemBlue
        stackview.axis = .vertical
//        scrollView.contentSize = contentView.frame.size
        stackview.snp.makeConstraints { (make) -> Void in
            make.top.bottom.equalTo(scrollView)
            make.leading.trailing.equalTo(view)
        }
        
        stackview.addArrangedSubview(taskNameLabel)
        
        taskNameLabel.text = "Name of the task"
        taskNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        taskNameLabel.textColor = .black
        
//        taskNameLabel.snp.makeConstraints { (make) -> Void in
//            make.top.equalTo(contentView.snp.top).offset(100)
//            make.leading.equalTo(contentView.snp.leading).inset(40)
//            make.trailing.equalTo(contentView.snp.trailing).inset(20)
//            make.height.equalTo(30)
//        }
        
        stackview.addArrangedSubview(nameField)
        
        nameField.font = UIFont.systemFont(ofSize: 16)
        nameField.textAlignment = .left
        nameField.textColor = .black
        nameField.backgroundColor = .white
        nameField.layer.cornerRadius = 12
        nameField.layer.borderWidth = 1
    
//        nameField.snp.makeConstraints { (make)-> Void in
//            make.top.equalTo(taskNameLabel.snp.bottom)
//            make.leading.equalTo(contentView.snp.leading).inset(20)
//            make.trailing.equalTo(contentView.snp.trailing).inset(20)
//            make.height.equalTo(40)
//        }
        
        stackview.addArrangedSubview(taskDescLabel)
        
        taskDescLabel.text = "Description of the task"
        taskDescLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        taskDescLabel.textColor = .black
        
//        taskDescLabel.snp.makeConstraints { (make)-> Void in
//            make.top.equalTo(nameField.snp.bottom).offset(10)
//            make.leading.trailing.height.equalTo(taskNameLabel)
//        }
        
        stackview.addArrangedSubview(descField)
        
        descField.textAlignment = .left
        descField.font = UIFont.systemFont(ofSize: 16)
        descField.textColor = .black
        descField.backgroundColor = .white
        descField.layer.cornerRadius = 12
        descField.layer.borderWidth = 1
        
        descField.snp.makeConstraints { (make)->Void in
//            make.top.equalTo(taskDescLabel.snp.bottom)
//            make.leading.trailing.equalTo(nameField)
            make.height.equalTo(400)
        }
    
        stackview.addArrangedSubview(taskDeadlineLable)
        
        taskDeadlineLable.text = "Choose a deadline"
        taskDeadlineLable.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        taskDeadlineLable.textColor = .black
        
//        taskDeadlineLable.snp.makeConstraints { (make)->Void in
//            make.top.equalTo(descField.snp.bottom).offset(10)
//            make.leading.trailing.height.equalTo(taskNameLabel)
//        }
        
        stackview.addArrangedSubview(deadline)
        
        deadline.datePickerMode = .date
        deadline.preferredDatePickerStyle = UIDatePickerStyle.wheels
        deadline.backgroundColor = .systemGray2
        deadline.datePickerMode = UIDatePicker.Mode.date
        deadline.layer.masksToBounds = true
        deadline.layer.cornerRadius = 12
        
//        deadline.snp.makeConstraints{ (make)->Void in
//            make.top.equalTo(taskDeadlineLable.snp.bottom)
//            make.leading.trailing.equalTo(descField)
//        }
        
        stackview.addArrangedSubview(emptyLabel)
        
        emptyLabel.backgroundColor = .systemYellow
        emptyLabel.snp.makeConstraints { (make)->Void in
            make.width.equalTo(stackview.snp.width)
            make.height.equalTo(100)
        }
        
        scrollView.contentSize = stackview.frame.size
        print(scrollView.contentSize)
        
    }
}
