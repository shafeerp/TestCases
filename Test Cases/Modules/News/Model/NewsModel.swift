//
//  NewsModel.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

struct NewsModel : Decodable {
    var articles        : [Articles]?
}

struct Articles : Decodable {
    var author          : String?
    var title           : String?
    var description     : String?
    var urlToImage      : String?
}
