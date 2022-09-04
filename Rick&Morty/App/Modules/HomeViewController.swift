//
//  HomeViewController.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 27/08/2022.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Characters", "Episodes", "Locations"]
    
    private lazy var homeTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setConstraints()
        setupNavigationBar()
    }
    
    private func setup() {
        self.view.backgroundColor = .white
        view.addSubview(homeTableView)
        homeTableView.backgroundColor = .clear
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        homeTableView.tableHeaderView = headerView
    }
    
    
    private func setConstraints() {
        homeTableView.centerX(inView: self.view, topAnchor: self.view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        homeTableView.anchor(left: self.view.safeAreaLayoutGuide.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOut))
        self.title = "Home"
    }
    
    
    @objc func logOut() {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

//MARK: - TableViewDelegate and DataSource protocols
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalized
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
}
