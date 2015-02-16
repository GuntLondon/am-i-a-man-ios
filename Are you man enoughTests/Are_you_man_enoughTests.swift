//
//  Are_you_man_enoughTests.swift
//  Are you man enoughTests
//
//  Created by Hatch on 04/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit
import XCTest

class Are_you_man_enoughTests: XCTestCase {
    
    let quiz = Quiz()
    
    override func setUp() {
        super.setUp()

        quiz.reset()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialState() {
        
        XCTAssert( quiz.category.index == 0, "initial category is 0")
        XCTAssert( quiz.question.index == 0, "initial question is 0")
        
    }
    
}
