//
//  LoginViewModel.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 30/08/2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

protocol LoginViewModelDelegate: AnyObject {
    func didSuccess()
    func didFail(error: String)
}


class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate?
    
    func validateFieldsNotEmptyOrNil(_ field1: String?,  _ field2: String?) -> Bool {
        
        guard let user = field1, user != "" else {
            return false
        }
        
        guard let password = field2, password != "" else {
            return false
        }
        
        return true
    }
    
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
    
    func signInWithGoogle(from: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: from) { [unowned self] user, error in
            
            if let error = error {
                self.delegate?.didFail(error: error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            // Sign In
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    self.delegate?.didFail(error: error.localizedDescription)
                    return
                }
                self.delegate?.didSuccess()
            }
            
        }
    }
}
