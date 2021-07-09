//
//  User.swift
//  TodoSecond
//
//  Created by Max Gladkov on 09.07.2021.
//

import Foundation

class User {
    let login: String
    let password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
