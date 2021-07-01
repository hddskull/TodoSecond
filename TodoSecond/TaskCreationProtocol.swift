//
//  TaskCreationProtocol.swift
//  TodoSecond
//
//  Created by Maxim Gladkov on 30.06.2021.
//

import Foundation

protocol TaskCreationProtocol {
    func createNewTask(_ task: Task)
    func updateTask(_ task: Task, _ indexPathRow: Int)
}
