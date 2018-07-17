//
//  TestTableTests.swift
//  TestTableTests
//
//  Created by mohammad mahdi on ۱۳۹۷/۴/۱۶.
//  Copyright © ۱۳۹۷ mohammad mahdi. All rights reserved.
//

import XCTest
@testable import TestTable

class TestTableTests: XCTestCase {
    var app: XCUIApplication!
    var t : TableViewController!
    override func setUp() {
        super.setUp()
        t = TableViewController()
        
        
        APImanager().getData{(result) in
            self.t.list = result
            
            self.t.filtered = self.t.list
            self.t.tableView.reloadData()
        }

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertEqual(self.t.filtered.ListOfRep.count, 0)
        XCTAssertTrue(self.t.tableView.numberOfRows(inSection: 0)>0)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
