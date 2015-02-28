//
//  BaseController.swift
//  Are you man enough
//
//  Created by Pete Graham on 28/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import Foundation

import UIKit

class BaseController: UIViewController {
    
    let quiz = Quiz.sharedInstance
    
    func go_to_next_screen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if (quiz.question.index+1 < quiz.category.questions.count) {
            quiz.increment_question()
            let vc = storyboard.instantiateViewControllerWithIdentifier("question_view") as UIViewController
            self.showViewController(vc, sender: self)
            
        } else if ( quiz.category.index+1 < quiz.number_of_categories ) {
            quiz.increment_category()
            let vc = storyboard.instantiateViewControllerWithIdentifier("category_view") as UIViewController
            self.showViewController(vc, sender: self)
            
        } else {
            self.performSegueWithIdentifier("showResult", sender: self)
        }
    }
}