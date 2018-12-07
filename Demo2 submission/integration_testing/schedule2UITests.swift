//
//  schedule2UITests.swift
//  schedule2UITests
//
//  Created by Ruicheng Peng on 10/30/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//

import XCTest

class schedule2UITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // when you perform UItest,you should delete the program from simulator first(Or delete all the assignments in tableview). Otherwise it will take the first "assignment" in the table view which is not absolutely 0.1 min and cause you to wait, also mess up the test data we create.
    func testExample()
    {
        
        let app = XCUIApplication()
        app.buttons["Sign in"].tap()
        let IDTest=app.textFields["Create a new UserID"]
        IDTest.tap()
        IDTest.typeText("Test")
        let passwdTest=app.textFields["Enter Password"]
        passwdTest.tap()
        passwdTest.typeText("Test")
        app.buttons["Confirm"].tap()
        
        //next login
        let IDlogin=app.textFields["Enter UserID"]
        IDlogin.tap()
        IDlogin.typeText("Test")
        let passwdLogin=app.textFields["Enter Password"]
        passwdLogin.tap()
        passwdLogin.typeText("Test")
        app.buttons["Login"].tap()
        //login in successfully, mission list
        app.navigationBars["Mission List"].buttons["Add"].tap()
        //backup Macro
        /*app.buttons["Add"].tap()
         let app = XCUIApplication()
         app.buttons["Use as a guest"].tap()
         app.navigationBars["Mission List"].buttons["Add"].tap()
         app.navigationBars["Add Mission"].buttons["Save"].tap()
         */
        let nameTest=app.textFields["name "]
        nameTest.tap()
        nameTest.typeText("test")
        let timeTest=app.textFields["time"]
        timeTest.tap()
        timeTest.typeText("0.1")
        app.navigationBars["Add Mission"].buttons["Save"].tap()
        app.tables.cells.allElementsBoundByIndex[0].tap()
        app.buttons["Confirm"].tap()
        app.buttons["START"].tap()
        //wait for 30 s
        Thread.sleep(forTimeInterval: 10)
        //wait(for: <#T##[XCTestExpectation]#>, timeout: 30)
        app.buttons["Confirm"].tap()
        Thread.sleep(forTimeInterval: 5)
        app.tables.cells.allElementsBoundByIndex[0].swipeLeft()
        //store UI test
        app.tabBars.buttons["More"].tap()
        let buyButton = app.buttons["BUY"]
        buyButton.tap()
        Thread.sleep(forTimeInterval: 3)
        app.buttons["Confirm"].tap()
        
    }
    
}

