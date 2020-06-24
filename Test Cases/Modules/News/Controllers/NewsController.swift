//
//  NewsController.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {
    
    lazy var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        return activityIndicator
    }()

    var newsViewModel           : NewsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsViewModel = NewsViewModel()
        viewModelBinder()
        setupLayout()
        fetchNewsResponse()
    }
}
