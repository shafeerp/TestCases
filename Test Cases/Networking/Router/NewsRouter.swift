//
//  NewsRouter.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//
import Foundation

enum NewsRouter : URLRequestGenerator {
    case GenerateAllNews([String:Any])
    
    func generateURLRequest() -> URLRequest? {
        var requestType : URLRequestType {
            switch self {
            case .GenerateAllNews(_):
                return .GET
            }
        }
        
        var url : URL? {
            switch self {
            case .GenerateAllNews(let params):
                var urlComponents = URLComponents(string: "http://newsapi.org")
                urlComponents?.path = APIEndPoints.AllNews
                urlComponents?.queryItems = params.map {
                    URLQueryItem(name: String($0), value: ($1 as? String))
                }
                return urlComponents?.url
            }
        }
        guard let requestURL = url else { return nil }
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = requestType.rawValue
        urlRequest.allHTTPHeaderFields = APIHeaders.allHeaders()
        return urlRequest
    }
    
    
    
}
