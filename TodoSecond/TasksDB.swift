//
//  TasksDB.swift
//  TodoSecond
//
//  Created by Maxim Gladkov on 02.07.2021.
//

import Foundation
import RealmSwift

class TasksDB {
    var realm: Realm = try! Realm()
    
    public func saveNewTask(_ task: Task){
        try! realm.write{
            realm.add(task)
        }
    }
    public func arrayOfTasks() -> Results<Task> {
        return realm.objects(Task.self)
    }
    
    public func deleteTask(_ task: Task) {
        try! realm.write{
            realm.delete(task)
        }
    }
    
    public func taskDone(_ task: Task) {
        try! realm.write{
            task.taskDone = true
        }

    }
    
    public func updTask(_ task: Task,_ changed: Task) {
        try! realm.write{
            task.taskName = changed.taskName
            task.taskDescription = changed.taskDescription
            task.taskDeadline = changed.taskDeadline
            task.taskDone = changed.taskDone
        }
        
    }
    
    
//    public func findByName() -> Task {
//        realm.
//    }
    
    
}
