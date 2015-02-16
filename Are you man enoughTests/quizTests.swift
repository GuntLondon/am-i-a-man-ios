//
//  quizTests.swift
//  Are you man enough
//
//  Created by Hatch on 13/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit
import XCTest

class quizTests: XCTestCase {

    let quiz = Quiz()
    
    override func setUp() {
        super.setUp()
        quiz.reset()
    }
    
    func testInitialState() {
        XCTAssert( quiz.category.index == 0, "initial category is 0")
        XCTAssert( quiz.question.index == 0, "initial question is 0")
    }
    
    func testIncrementQuestion() {
        
        let initial_content = quiz.question.content
        quiz.increment_question()
        XCTAssert( quiz.question.index == 1, "question index incremented")
        XCTAssert( initial_content != quiz.question.content, "question content changed")
        
    }
    
    
    func testIncrimentCategory() {
        
        let initial_category_title = quiz.category.title
        quiz.increment_category()
        XCTAssert( quiz.category.index == 1, "category index incremented")
        XCTAssert( initial_category_title != quiz.category.title, "category title changed")
        
    }
    
    

    

}
