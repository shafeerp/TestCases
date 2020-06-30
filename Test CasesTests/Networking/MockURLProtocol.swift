//
//  MockURLProtocol.swift
//  Test CasesTests
//
//  Created by Shafeer P on 30/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

import Foundation
typealias MockRequestType = (response : HTTPURLResponse,data : Data?)
class MockURLProtocol : URLProtocol {
    
    static var requestInfo : MockRequestType?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let requestInfo = MockURLProtocol.requestInfo,let client = client else { fatalError() }
        client.urlProtocol(self, didReceive: requestInfo.response, cacheStoragePolicy: .notAllowed)
        if let data = requestInfo.data {
            client.urlProtocol(self, didLoad: data)
        }else {
            client.urlProtocol(self, didFailWithError: MockNetowrkingError.apiError)
        }
        client.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}

enum  MockNetowrkingError : Error {
    case apiError
}
