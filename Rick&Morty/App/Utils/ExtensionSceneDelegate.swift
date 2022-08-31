//
//  ExtensionSceneDelegate.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 31/08/2022.
//

import UIKit
import FirebaseAuth

extension SceneDelegate {
    
    func getRootViewController() -> UIViewController {
        
        var rootViewController: UIViewController
        
        if Auth.auth().currentUser != nil {
            rootViewController = HomeViewController()
            
        } else {
            rootViewController = LoginViewController()
        }
        
        return rootViewController
    }
}
