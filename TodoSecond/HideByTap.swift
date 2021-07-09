//
//  HideByTap.swift
//  TodoSecond
//
//  Created by Max Gladkov on 07.07.2021.
//

import UIKit

// to use in viewController add
//         self.hideKeyboard()
// in viewDidLoad()

extension UIViewController {
    
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
