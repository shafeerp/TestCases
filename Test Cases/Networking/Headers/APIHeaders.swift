//
//  APIHeaders.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

struct APIHeaders {
    static func allHeaders() -> [String:String] {
        var headers = [String:String]()
        headers["application/json"] = "Accept"
        headers["application/json"] = "Content-Type"
        return headers
    }
}
