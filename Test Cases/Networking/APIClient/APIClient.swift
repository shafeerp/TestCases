//
//  APIClient.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//
import Foundation

typealias APICompletion<T:Decodable> = (T?,Error?) -> Void

class APIClient {
    
    var session : URLSession
    
    init(session : URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchAPIResponse<T:Decodable>(urlRequest : URLRequest?,completion : @escaping APICompletion<T>) {
        guard let urlRequest = urlRequest else {
            completion(nil,nil)
            return
        }
        session.dataTask(with: urlRequest) { (data, _, error) in
            if let apiError = error {
                completion(nil,apiError)
                return
            }
            guard let data = data else {
                completion(nil,nil)
                return
            }
            do {
                let model : T = try JSONDecoder().decode(T.self, from: data)
                completion(model,nil)
                
            }catch let parsingError {
                completion(nil,parsingError)
            }
            
        }.resume()
    }
}

