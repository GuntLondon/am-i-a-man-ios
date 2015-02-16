//
//  Quiz.swift
//  Are you man enough
//
//  Created by Hatch on 08/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import Foundation


struct Category {
    var index: Int
    var title: String
    var image: String
    var number_of_questions: Int
}

struct Question {
    var index: Int
    var content: String
}

class Quiz {
    
    class var sharedInstance: Quiz {
        struct Static {
            static var instance: Quiz?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Quiz()
        }
        
        return Static.instance!
    }
    
    //piblic variables
    var number_of_categories: Int = 0
    
    var category = (
        index: 0,
        title: "",
        image: "",
        questions: []
    )
    var question = (
        index: 0,
        content: ""
    )
    
    //private variables
    private var user_defaults  = NSUserDefaults.standardUserDefaults()
    private var categories: NSArray
    private var score:Int = 0
    
    
    
    init() {
        // load questions data
        let path = NSBundle.mainBundle().pathForResource("Questions", ofType: "plist")
        categories = NSArray(contentsOfFile: path!)!
        number_of_categories = categories.count
        
        update_category()
        
        //set score
        score = user_defaults.integerForKey("score")
    }
    
    //public functions
    func reset() {
        user_defaults.setInteger(0, forKey: "category")
        user_defaults.setInteger(0, forKey: "question")
        user_defaults.setInteger(0, forKey: "score")
        update_category()
    }
    
    func answer(answer:Bool) {
        if (answer) {
            score++
            user_defaults.setInteger(score, forKey: "score")
        }
    }
    
    func increment_question() {
        user_defaults.setInteger(++question.index, forKey: "question")
        update_question()
    }
    
    func increment_category() {
        user_defaults.setInteger(++category.index, forKey: "category")
        user_defaults.setInteger(0, forKey: "question")
        update_category()
    }
    
    func result() -> (level:NSString, person:NSString, image:NSString) {
        
        return (level: "-level-", person: "-person-", image:"man1.png")
    }
    
    //private functions
    private func update_category() {
        let index = user_defaults.integerForKey("category")
        
        category.index = index
        category.title = categories[index]["title"] as NSString
        category.image = categories[index]["image"] as NSString
        category.questions = categories[index]["questions"] as NSArray
        
        update_question()
    }
    
    private func update_question() {
        question.index = user_defaults.integerForKey("question")
        question.content = category.questions[question.index] as NSString
    }

    
}
