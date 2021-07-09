//
//  RegistrationController.swift
//  TodoSecond
//
//  Created by Max Gladkov on 08.07.2021.
//

import UIKit

class RegistrationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createConstaintsRC()
        // Do any additional setup after loading the view.
    }
    
    var delegate: RegistrationProtocol?
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let emailLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Enter email"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 20)
        return lbl
    }()
    
    let emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "mail@gmail.com"
        tf.borderStyle = .roundedRect
        tf.textColor = .black
        tf.backgroundColor = .systemGray2
        return tf
    }()
    
    let passwordLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Enter Password"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 20)
        return lbl
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password123!"
        tf.borderStyle = .roundedRect
        tf.textColor = .black
        tf.backgroundColor = .systemGray2
        
        return tf
    }()
    
    let createButton: UIButton = {
        let btn = UIButton(type: .custom, primaryAction: nil)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Create", for: .normal)
        btn.backgroundColor = .systemTeal
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(createNewUser(_:)), for: .touchUpInside)
        return btn
    }()
    
    //MARK: Create Button funcs
    @objc func createNewUser(_ sender: UIButton){
        if checkfields() {
            let newUser = User(login: emailTF.text!,
                               password: passwordTF.text!)
            delegate?.addNewUser(newUser: newUser)
            navigationController?.popViewController(animated: true)
        }
        else {
            let alertFields = UIAlertController(title: "Error", message: "Fill in email and password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertFields.addAction(ok)
            self.present(alertFields, animated: true, completion: nil)
        }
        
        
    }
    
    func checkfields() -> Bool {
        if !emailTF.text!.isEmpty && !passwordTF.text!.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func createConstaintsRC() {
        navigationController?.navigationBar.isTranslucent = true
        
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.addSubview(emailLabel)
        scrollView.addSubview(emailTF)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordTF)
        scrollView.addSubview(createButton)
        
        let viewFrame = view.bounds
        
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            
            emailTF.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            emailTF.topAnchor.constraint(equalTo: view.topAnchor, constant: viewFrame.height/2),
            emailTF.widthAnchor.constraint(equalToConstant: 285),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            
            emailLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 10),
            emailLabel.bottomAnchor.constraint(equalTo: emailTF.topAnchor, constant: -10),
            emailLabel.widthAnchor.constraint(equalTo: emailTF.widthAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 10),
            passwordLabel.widthAnchor.constraint(equalTo: emailLabel.widthAnchor),
            passwordLabel.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 15),
            passwordLabel.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTF.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            passwordTF.widthAnchor.constraint(equalTo: emailTF.widthAnchor),
            passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            
            createButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            createButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 40),
            createButton.widthAnchor.constraint(equalToConstant: 120),
            createButton.heightAnchor.constraint(equalToConstant: 40),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
