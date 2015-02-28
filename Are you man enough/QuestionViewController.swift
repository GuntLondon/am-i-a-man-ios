//
//  QuestionViewController.swift
//  Are you man enough
//
//  Created by Hatch on 04/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    let quiz = Quiz.sharedInstance
    
    @IBOutlet var progress_label: UILabel!
    @IBOutlet var title_label: UILabel!
    @IBOutlet var question_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progress_label.text = "\(quiz.question.index+1)/\(quiz.category.questions.count)"
        title_label.text = quiz.category.title
        question_label.text = quiz.question.content
        
    }


    @IBAction func yes_button(sender: AnyObject) {
        quiz.answer(true)
        go_to_next_screen()
    }
    

    @IBAction func no_button(sender: AnyObject) {
        quiz.answer(false)
        go_to_next_screen()
    }
    
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
