//
//  LoginViewController.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 23/08/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Rick&MortyTitle")
        return imageView
    }()
    
    private let userNameTextField: UITextField = {
        let spacer = UIView()
        spacer.setDimensions(height: 40, width: 12)
        
        let userField = UITextField()
        userField.leftView = spacer
        userField.leftViewMode = .always
        userField.placeholder = "Email"
        userField.layer.borderWidth = 2
        userField.layer.cornerRadius = 3
        userField.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        userField.layer.backgroundColor = CGColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.2339869619)
        userField.autocapitalizationType = .none
        userField.autocorrectionType = .no
        userField.setHeight(40)
        return userField
    }()
    
    private let passwordTextField: UITextField = {
        
        let spacer = UIView()
        spacer.setDimensions(height: 40, width: 12)
        
        let passwordField = UITextField()
        passwordField.leftView = spacer
        passwordField.leftViewMode = .always
        passwordField.placeholder = "Password"
        passwordField.layer.borderWidth = 2
        passwordField.layer.cornerRadius = 3
        passwordField.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        passwordField.layer.backgroundColor = CGColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.2339869619)
        passwordField.autocapitalizationType = .none
        passwordField.isSecureTextEntry = true
        passwordField.setHeight(40)
        return passwordField
    }()
    
    
    private let errorMessage: UILabel = {
        let label = UILabel()
        label.text = "Error message"
        label.textColor = .red
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        let color = UIColor(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.backgroundColor = color.withAlphaComponent(0.5)
        button.setTitleColor(UIColor(named: "White"), for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        let color = UIColor(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.backgroundColor = color.withAlphaComponent(0.5)
        button.setTitleColor(UIColor(named: "White"), for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 25
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 25
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @objc func signIn() {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    @objc func signUp(){
        
    }
    
    private func setup(){
        self.view.backgroundColor = .white
        addSubviews()
        setConstraints()
        setDelegates()
    }
    
    private func addSubviews() {
        self.view.addSubview(stack)
        
        [loginButton, signUpButton].forEach { subView in
            buttonStack.addArrangedSubview(subView)
        }
        
        [image, userNameTextField, passwordTextField, errorMessage, buttonStack].forEach { subview in
            stack.addArrangedSubview(subview)
        }
    }
    
    private func setConstraints() {
        image.setHeight(80)
        stack.centerX(inView: self.view, topAnchor: self.view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
    }
    
    private func setDelegates() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
}
