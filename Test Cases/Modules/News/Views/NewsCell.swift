//
//  NewsCell.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.textColor = UIColor.lightGray
        return label
    }()
    
    lazy var articleImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
