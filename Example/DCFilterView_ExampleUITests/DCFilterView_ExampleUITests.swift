//
//  DCFilterView_ExampleUITests.swift
//  DCFilterView_ExampleUITests
//
//  Created by Vincent Berihuete on 9/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class DCFilterView_ExampleUITests: XCTestCase {
    
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFilterChange(){
        app.staticTexts["Oldest"].tap()
        XCTAssert(app.staticTexts["Selected 2"].exists)
        app.staticTexts["Popular"].tap()
        XCTAssert(app.staticTexts["Selected 0"].exists)
        app.staticTexts["Related"].tap()
        XCTAssert(app.staticTexts["Selected 1"].exists)
    }
    
}
