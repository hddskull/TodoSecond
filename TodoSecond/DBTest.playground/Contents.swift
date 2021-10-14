import UIKit

let dataBase = TasksDB()
let fullTask = Task(taskName: "Test", taskDescription: "Test", taskDone: false, taskDeadline: "31.12.2021")
let emptyTask = Task()

func testingDBCreate(emptyTask: Task, fullTask: Task){
    
    do {
        dataBase.saveNewTask(emptyTask)
        print("testingDBCreate - emptyTask: Success")
    }  catch {
        print("testingDBCreate - emptyTask: Fail")
    }
    
    do {
        dataBase.saveNewTask(fullTask)
        print("testingDBCreate - fullTask: Success")
    }  catch {
        print("testingDBCreate - fullTask: Fail")
    }
}

func testingDBRead(){
    
    do {
        dataBase.arrayOfTasks()
        print("testingDBread - emptyTask: Success")
    }  catch {
        print("testingDBread - emptyTask: Fail")
    }

}

func testingDBDelete(emptyTask: Task, fullTask: Task){
    
    do {
        dataBase.deleteTask(emptyTask)
        print("testingDBDelete - emptyTask: Success")
    }  catch {
        print("testingDBDelete - emptyTask: Fail")
    }
    
    do {
        dataBase.deleteTask(fullTask)
        print("testingDBDelete - fullTask: Success")
    }  catch {
        print("testingDBDelete - fullTask: Fail")
    }
}

func testingDBUpdateStatus(emptyTask: Task, fullTask: Task){
    
    do {
        dataBase.taskDone(emptyTask)
        print("testingDBUpdateStatus - emptyTask: Success")
    }  catch {
        print("testingDBUpdateStatus - emptyTask: Fail")
    }
    
    do {
        dataBase.taskDone(fullTask)
        print("testingDBUpdateStatus - fullTask: Success")
    }  catch {
        print("testingDBUpdateStatus - fullTask: Fail")
    }
}

func testingDBUpdateTask(emptyTask: Task, fullTask: Task){
    
    do {
        dataBase.updTask(emptyTask, fullTask)
        print("testingDBUpdateTask - emptyTask: Success")
    }  catch {
        print("testingDBUpdateTask - emptyTask: Fail")
    }
    
    do {
        dataBase.updTask(fullTask, emptyTask)
        print("testingDBUpdateTask - fullTask: Success")
    }  catch {
        print("testingDBUpdateTask - fullTask: Fail")
    }
}

testingDBCreate(emptyTask: emptyTask, fullTask: fullTask)
testingDBRead()
testingDBUpdateStatus(emptyTask: emptyTask, fullTask: fullTask)
testingDBUpdateTask(emptyTask: emptyTask, fullTask: fullTask)
testingDBDelete(emptyTask: emptyTask, fullTask: fullTask)
