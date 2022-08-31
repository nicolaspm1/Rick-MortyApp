//
//  LoginViewModel.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 30/08/2022.
//

import UIKit
import FirebaseAuth

protocol LoginViewModelDelegate: AnyObject {
    func didSuccess()
    func didFail(error: String)
}


class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate?
    
    
    func signInUserWith(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if error != nil {
                self?.delegate?.didFail(error: error!.localizedDescription)
                return
            }
            
            self?.delegate?.didSuccess()
            
        }
    }
    
    func signUpUserWith(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if error != nil {
                self?.delegate?.didFail(error: error!.localizedDescription)
                return
            }
            
            self?.delegate?.didSuccess()
        }
        
    }
    
}
