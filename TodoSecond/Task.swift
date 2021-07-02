//
//  Task.swift
//  TodoSecond
//
//  Created by Gladkov Maxim on 27.06.2021.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var taskName: String?
    @objc dynamic var taskDescription: String?
    @objc dynamic var taskDone: Bool = false
    @objc dynamic var taskDeadline: String?
    
    convenience init(taskName: String, taskDescription: String, taskDone: Bool, taskDeadline: String){
        self.init()
        self.taskName = taskName
        self.taskDescription = taskDescription
        self.taskDone = false
        self.taskDeadline = taskDeadline
    }
}

