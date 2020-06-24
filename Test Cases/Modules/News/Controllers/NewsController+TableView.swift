//
//  NewsController+TableView.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//
import UIKit
extension NewsController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = newsViewModel, let newsResponse = viewModel.newsResponse else { return 0 }
        return newsResponse.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsCell.self), for: indexPath) as? NewsCell,let viewModel = newsViewModel, let newsResponse = viewModel.newsResponse else { return UITableViewCell() }
        cell.textLabel?.text = newsResponse[indexPath.row].title
        cell.detailTextLabel?.text = newsResponse[indexPath.row].description
        return cell
    }
}
