//
//  NetworkingHelper.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//
import Foundation

protocol URLRequestGenerator {
    func generateURLRequest() -> URLRequest?
}

enum URLRequestType : String {
    case GET
}
