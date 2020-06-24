//
//  NewsCell+ViewRender.swift
//  Test Cases
//
//  Created by Shafeer P on 24/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

extension NewsCell : CellUpdateProtocol {
    func updateCellContent(_ data : Articles) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        articleImageView.downloaded(data.urlToImage ?? "")
    }
}
