//
//  HomeViewController.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 27/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOut))
        self.title = "Home"
    }
    
    
    @objc func logOut() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}