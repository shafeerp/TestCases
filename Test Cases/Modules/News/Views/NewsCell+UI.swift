//
//  NewsCell+UI.swift
//  Test Cases
//
//  Created by Shafeer P on 24/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

extension NewsCell {
    func setupLayout() {
        setupLayoutSubviews()
        setupLayoutConstraints()
    }
    
    fileprivate func setupLayoutSubviews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(articleImageView)
    }
    
    fileprivate func setupLayoutConstraints() {
        titleLabel.anchors(top: topAnchor, topConstants: 10, leading: leadingAnchor, leadingConstants: 16, bottom: descriptionLabel.topAnchor, bottomConstants: -2, trailing: trailingAnchor, trailingConstants: -16)
        descriptionLabel.anchors(top: titleLabel.bottomAnchor, topConstants: 2, leading: titleLabel.leadingAnchor, bottom: articleImageView.topAnchor, bottomConstants: -20, trailing: titleLabel.trailingAnchor)
        articleImageView.anchors(top: descriptionLabel.bottomAnchor, topConstants: 20, leading: descriptionLabel.leadingAnchor, bottom: bottomAnchor, bottomConstants: -30, trailing: descriptionLabel.trailingAnchor, heightConstants: 140)
    }
}
