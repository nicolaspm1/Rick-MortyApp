//
//  LoginViewModel.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 30/08/2022.
//

import Foundation
import UIKit

protocol LoginViewModelDelegate: AnyObject {
    func didSuccess()
    func didFail(error: String)
}


class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate?
    
    
    func signInUserWith(email: String, password: String, from vc: UIViewController) {
        
    }
    
    func signUpUserWith(email: String, password: String, from vc: UIViewController) {
        
    }
    
}
