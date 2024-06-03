//
//  SearchViewModelTest.swift
//  DunbleNewsTests
//
//  Created by Hema K S on 03/06/2024.
//

import Foundation
import XCTest
import Combine
@testable import DunbleNews

class SearchViewModelTest: XCTestCase {
    private var searchViewModel: SearchViewModel!
    private var cancellable: AnyCancellable?
    
    private var filename = "NewsResponse"
    private var searchQuerySuccesses = "Half Life"
    private var searchQueryFail = " "
    
    private let searchQuerySuccessesExpectation = XCTestExpectation(description: "search query is valid")
    private let searchQueryFailExpectation = XCTestExpectation(description: "search query does not valid")
    private let isloadingExpectation = XCTestExpectation(description: "isLoading true")
    
    override func setUp() {
        super.setUp()
        
        searchViewModel = SearchViewModel(service: MockHttpClient(filename: filename))
    }
    
    override func tearDown() {
        searchViewModel = nil
        
        super.tearDown()
    }
    
    func test_Search_Query_Valid() {
        XCTAssertEqual(searchQuerySuccesses.isValid(), false)
        searchQuerySuccessesExpectation.fulfill()
        wait(for: [searchQuerySuccessesExpectation], timeout: 1)
    }
    
    func test_Search_Query_Invalid() {
        XCTAssertEqual(searchQueryFail.isValid(), true)
        searchQueryFailExpectation.fulfill()
        wait(for: [searchQueryFailExpectation], timeout: 1)
    }
    
    func test_ShowingAlert() {
       filename = "error"
       setUp()
       searchViewModel.checkValidation()
       
       cancellable = searchViewModel.objectWillChange.eraseToAnyPublisher().sink { _ in
           XCTAssertEqual(self.searchViewModel.showingAlert, true)
           self.isloadingExpectation.fulfill()
       }
       wait(for: [isloadingExpectation], timeout: 1)
   }
}
