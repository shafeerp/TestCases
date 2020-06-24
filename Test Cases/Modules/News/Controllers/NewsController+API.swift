//
//  NewsController+API.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//
import Foundation
extension NewsController {
    func fetchNewsResponse() {
        guard let viewModel = newsViewModel else { return }
        viewModel.getAllNewsDatum { [weak self] (isAPISuccess, _) in
            guard let selfObject = self else { return }
            if isAPISuccess {
                DispatchQueue.main.async {
                    selfObject.tableView.reloadData()
                }
            }
        }
    }
}
