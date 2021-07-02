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
    
}
