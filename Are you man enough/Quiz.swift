//
//  Quiz.swift
//  Are you man enough
//
//  Created by Hatch on 08/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import Foundation


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
    
    //public variables
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
        score = 0;
        update_category()
    }
    
    func isComplete() -> Bool {
        let last_category_index = number_of_categories - 1
        let last_category: NSDictionary = categories.lastObject as NSDictionary
        let last_category_questions: NSArray = last_category["questions"] as NSArray
        let last_question_index: Int = last_category_questions.count - 1
        let current_category_index: Int = user_defaults.integerForKey("category")
        let current_question_index: Int = user_defaults.integerForKey("question")
        return current_category_index == last_category_index && current_question_index == last_question_index
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
    
    func result() -> (level:String, person:String, image:String) {
        
        //load levels
        let path = NSBundle.mainBundle().pathForResource("Levels", ofType: "plist")
        let levels = NSArray(contentsOfFile: path!)!
        
        // TODO: calculate dynamically from question set 
        let number_of_questions = 25;
        
        let level_i = Int((Float(score) / Float(number_of_questions)) * Float(levels.count))

        println( level_i )
        println( levels[level_i]["level"] )
        
        return (
            level: levels[level_i]["level"] as String,
            person: levels[level_i]["person"] as String,
            image: levels[level_i]["image"] as String
        )
    }
    
    //private functions
    private func update_category() {
        let index = user_defaults.integerForKey("category")
        
        category.index = index
        category.title = categories[index]["title"] as String
        category.image = categories[index]["image"] as String
        category.questions = categories[index]["questions"] as NSArray
        
        update_question()
    }
    
    private func update_question() {
        question.index = user_defaults.integerForKey("question")
        question.content = category.questions[question.index] as String
    }

    
}
