//
//  QuestionViewController.swift
//  Are you man enough
//
//  Created by Hatch on 04/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class QuestionViewController: BaseController {
    
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
        celebration()
    }
    
    @IBAction func no_button(sender: AnyObject) {
        quiz.answer(false)
        go_to_next_screen()
    }
    
    // TODO: can we use an emoj for function name?
    func celebration() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("celebration_view") as UIViewController
        self.showViewController(vc, sender: self)
    }
}
