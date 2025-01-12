//
//  DiscoverViewModelTest.swift
//  DunbleNewsTests
//
//  Created by Hema K S on 03/06/2024.
//

import XCTest
import Combine
@testable import DunbleNews

class DiscoverViewModelTest: XCTestCase {
    private var discoverViewModel: DiscoverViewModel!
    private let defaultCategoryExpectation = XCTestExpectation(description: "is default category general")
    private let allCategoriesExpectation = XCTestExpectation(description: "all categories")
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        discoverViewModel = nil
        
        super.tearDown()
    }
    
    func test_Default_Category() {
        XCTAssertEqual(self.discoverViewModel.defaultCategory, .general)
        self.defaultCategoryExpectation.fulfill()
        
        wait(for: [defaultCategoryExpectation], timeout: 1)
    }
    
    func test_All_Categories() {
        let equal = discoverViewModel.allCategories.last?.title == "Technology"
        XCTAssertEqual(equal,true)
        self.defaultCategoryExpectation.fulfill()
        wait(for: [defaultCategoryExpectation], timeout: 1)
    }
}
