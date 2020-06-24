//
//  NewsController+UI.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//
import UIKit
extension NewsController {
    
    func setupLayout() {
        title = "News"
        view.backgroundColor = UIColor.white
        setupTableView()
        setupActivityIndicator()
    }
    
    fileprivate func setupTableView() {
        tableView.register(NewsCell.self, forCellReuseIdentifier: String(describing: NewsCell.self))
    }
    
    fileprivate func setupActivityIndicator() {
        tableView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 50).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
