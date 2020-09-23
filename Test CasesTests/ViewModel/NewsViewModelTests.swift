//
//  NewsViewModelTests.swift
//  Test CasesTests
//
//  Created by Shafeer P on 30/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

import XCTest
@testable import Test_Cases

class NewsViewModelTests: XCTestCase {
    
    var viewModel           : NewsViewModel?
    var apiClient           : APIClient?
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        apiClient = APIClient(session: URLSession(configuration: configuration))
        viewModel = NewsViewModel(apiClient: apiClient!)
    }

    override func tearDown() {
        super.tearDown()
        apiClient = nil
        viewModel = nil
    }

    func testGetMoviesAPI_Success() {
        guard let viewModel = viewModel,let expectedURL = URL(string: "http://newsapi.org/v2/everything") else {
            XCTFail()
            return
        }
        let moviesExpectation = expectation(description: "Movies API")
        let json = """
{
    "articles": [{
            "source": {
                "id": null,
                "name": "Freethoughtblogs.com"
            },
            "author": "Marcus Ranum",
            "title": "The Grumpy Old Fart Routine",
            "description": "Recently I was invited to do a talk for the Minnesota ISSA at their June chapter meeting; I hope they don’t regret it. If you haven’t done conference speaking, the routine is usually that you get contacted with an invitation, say “yes” or “no”, nail down a da…",
            "url": "https://freethoughtblogs.com/stderr/2020/06/29/the-grumpy-old-fart-routine/",
            "urlToImage": "https://freethoughtblogs.com/stderr/wp-content/themes/ftb2-theme/images/logo.png",
            "publishedAt": "2020-06-30T03:34:57Z",
            "content": "Recently I was invited to do a talk for the Minnesota ISSA at their June chapter meeting; I hope they don’t regret it.If you haven’t done conference speaking, the routine is usually that you get co… [+9295 chars]"
        },
        {
            "source": {
                "id": null,
                "name": "Yahoo Entertainment"
            },
            "author": "Zheping Huang",
            "title": "Chinese Crypto Miner Aims to Double Sales Via New Exchange",
            "description": "(Bloomberg) -- Chinese crypto mining giant Ebang International Holdings Inc. is planning to launch an offshore exchange for digital assets this year, hoping to expand beyond a sector that tends to boom and bust with Bitcoin prices.The Hangzhou-based maker of …",
            "url": "https://finance.yahoo.com/news/china-crypto-miner-ebang-plans-112535066.html",
            "urlToImage": "https://s.yimg.com/uu/api/res/1.2/mgT.02EfjYB697XrbtlX4A--~B/aD02NzU7dz0xMjAwO3NtPTE7YXBwaWQ9eXRhY2h5b24-/https://media.zenfs.com/en/bloomberg_technology_68/64b49c3f797efa80f0782e9db595c162",
            "publishedAt": "2020-06-30T02:26:08Z",
            "content": "(Bloomberg) -- Chinese crypto mining giant Ebang International Holdings Inc. is planning to launch an offshore exchange for digital assets this year, hoping to expand beyond a sector that tends to bo… [+2624 chars]"
        }
    ]
}

"""
        let data = json.data(using: .utf8)
        let response = HTTPURLResponse(url: expectedURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
        MockURLProtocol.requestInfo = (response,data)
        
        viewModel.getAllNewsDatum { (isSucess, error) in
            XCTAssertNil(error)
            XCTAssertTrue(isSucess)
            moviesExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetMoviesAPI_Failure() {
            guard let viewModel = viewModel,let expectedURL = URL(string: "http://newsapi.org/v2/everything") else {
                XCTFail()
                return
            }
            let moviesExpectation = expectation(description: "Movies API")
            let response = HTTPURLResponse(url: expectedURL, statusCode: 400, httpVersion: nil, headerFields: nil)!
            MockURLProtocol.requestInfo = (response,nil)
            
            viewModel.getAllNewsDatum { (isSucess, error) in
                XCTAssertNotNil(error)
                XCTAssertFalse(isSucess)
                moviesExpectation.fulfill()
            }
            waitForExpectations(timeout: 1, handler: nil)
        }
    
    func testGetMoviesAPI_Failure_SelfNil() {
        guard let expectedURL = URL(string: "http://newsapi.org/v2/everything") else {
            XCTFail()
            return
        }
        let moviesExpectation = expectation(description: "Movies API")
        let response = HTTPURLResponse(url: expectedURL, statusCode: 400, httpVersion: nil, headerFields: nil)!
        MockURLProtocol.requestInfo = (response,nil)
        
        viewModel?.getAllNewsDatum { (isSucess, error) in
            XCTAssertNil(error)
            XCTAssertFalse(isSucess)
            moviesExpectation.fulfill()
        }
        viewModel = nil
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetMoviesAPI_Success_WorngData() {
        guard let viewModel = viewModel,let expectedURL = URL(string: "http://newsapi.org/v2/everything") else {
            XCTFail()
            return
        }
        let moviesExpectation = expectation(description: "Movies API")
        let json = """
        {
            "articles": "test"
        }

        """
        let data = json.data(using: .utf8)
        let response = HTTPURLResponse(url: expectedURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
        MockURLProtocol.requestInfo = (response,data)
        
        viewModel.getAllNewsDatum { (isSucess, error) in
            XCTAssertNil(error)
            XCTAssertFalse(isSucess)
            moviesExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGenerateNewsAPIParameters() {
        guard let viewModel = viewModel else {
            XCTFail()
            return
        }
        let params = viewModel.generateNewsAPIParameters()
        XCTAssertEqual(params["q"] as? String, "bitcoin")
        XCTAssertEqual(params["from"] as? String, Date().convertToFormat())
        XCTAssertEqual(params["apiKey"] as? String, "c9a8fa2da18946c789a18bdb8cf6575c")
    }
}
