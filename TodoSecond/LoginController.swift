//
//  RegistrationController.swift
//  TodoSecond
//
//  Created by Max Gladkov on 07.07.2021.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, RegistrationProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        createConstraintsRC()
        self.hideKeyboard()
        initTFdelegates()
        // Do any additional setup after loading the view.
    }

    
    //MARK: UI elements
    let scrollView: UIScrollView = {
       let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .systemBlue
        return sv
    }()
    
    let loginField: UITextField = {
        let lbl = UITextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.placeholder = "Login"
        lbl.textColor = .black
        lbl.borderStyle = .roundedRect
        lbl.backgroundColor = .systemGray2
        return lbl
    }()
    
    let passwordField: UITextField = {
        let lbl = UITextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.placeholder = "Password"
        lbl.textColor = .black
        lbl.borderStyle = .roundedRect
        lbl.backgroundColor = .systemGray2
        return lbl
    }()
    
    let regButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Registration", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(regBtnAction), for: .touchUpInside)
        return btn
    }()
    
    let loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .systemTeal
        btn.clipsToBounds = true
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(loginBtnAction(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    //MARK: Move to next TextField
    
    func initTFdelegates(){
        passwordField.delegate = self
        loginField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginField {
            loginField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            passwordField.resignFirstResponder()
        }
        return true
    }
    
    //MARK: Properties
    var loginData = [User(login: "Test", password: "Test"),
                     User(login: "T", password: "T")
        ]
    
    
    
    
    //MARK: login funcs
    // create a user object to validate
    func createUserFromLoginData() -> User{
        let loginUser = User(login: loginField.text!, password: passwordField.text!)
        return loginUser
    }
    
    func fieldsAreFilled() -> Bool {
        if !loginField.text!.isEmpty && !passwordField.text!.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    @objc func loginBtnAction(_ sender: UIButton) {
        if fieldsAreFilled() {
            let loginUser = createUserFromLoginData()
            
            if isUserHere(loginUser) {
                navigationController?.pushViewController(ViewController(), animated: true)
            } else {
                let alertData = UIAlertController(title: "Error", message: "Incorrect login and password", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertData.addAction(ok)
                self.present(alertData, animated: true, completion: nil)
            }
            
        } else {
            let alertFields = UIAlertController(title: "Error", message: "Fill in login and password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertFields.addAction(ok)
            self.present(alertFields, animated: true, completion: nil)
        }
    }
    
    func isUserHere(_ loginUser: User) ->Bool {
        for user in loginData {
            if user.login == loginUser.login && user.password == user.password{
                return true
            }
        }
        return false
    }
    
    
    //MARK: Registration funcs
    
    
    @objc func regBtnAction(_ sender: UIButton){
        let RC = RegistrationController()
        RC.delegate = self
        navigationController?.pushViewController(RC, animated: true)
    }
    
    //MARK: Reg Protocol functions
    
    
    func addNewUser(newUser: User) {
        loginData.append(newUser)
    }
    
    //MARK: Constraints
    func createConstraintsRC(){
        
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(loginField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(regButton)
        
        navigationController?.navigationBar.isTranslucent = true
        
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            loginField.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/3),
            loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginField.widthAnchor.constraint(equalToConstant: 285),
            loginField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 10),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 285),
            passwordField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            regButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            regButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            regButton.widthAnchor.constraint(equalToConstant: 120),
            regButton.heightAnchor.constraint(equalToConstant: 40),

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
