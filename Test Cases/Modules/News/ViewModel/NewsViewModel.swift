//
//  NewsViewModel.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.


typealias NewsResponse = (Bool,String?) -> Void
import Foundation
class NewsViewModel {
    
    var isFetchingAPI               = Bindable<Bool>()
    var newsResponse                : [Articles]?
    
    func getAllNewsDatum(completion : @escaping NewsResponse) {
        isFetchingAPI.value = true
        
        NewsRouter.GenerateAllNews(generateNewsAPIParameters()).fetchAPIResponse { [weak self] (value : NewsModel?, error) in
            guard let selfObject = self else {
                completion(false,nil)
                return
            }
            selfObject.isFetchingAPI.value = false
            if let errorObject = error {
                completion(false,errorObject.localizedDescription)
                return
            }
            guard let value = value else {
                completion(false,nil)
                return
            }
            selfObject.newsResponse = value.articles
            completion(true,nil)
        }
    }
    
    func generateNewsAPIParameters() -> [String:Any] {
        var params = [String:Any]()
        params["q"] = "bitcoin"
        params["from"] = Date().convertToFormat()
        params["sortBy"] = "publishedAt"
        params["apiKey"] = "c9a8fa2da18946c789a18bdb8cf6575c"
        return params
    }
}
