//
//  CategoryViewController.swift
//  Are you man enough
//
//  Created by Hatch on 04/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    @IBOutlet var title_label: UILabel!
    @IBOutlet var category_label: UILabel!
    @IBOutlet var category_image: UIImageView!
    @IBOutlet var question_count_label: UILabel!
    
    let quiz = Quiz.sharedInstance

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title_label.text = quiz.category.title
        category_label.text = "Category \(quiz.category.index+1)/\(quiz.number_of_categories)"
        category_image.image = UIImage(named: quiz.category.image)
        question_count_label.text = "\(quiz.category.questions.count) questions"
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "timeToMoveOn", userInfo: nil, repeats: false)
    }
    
    func timeToMoveOn() {
        // TODO: add ability to skip by clicking too. Only trigger if the user hasn't clicked.
        self.performSegueWithIdentifier("showQuestion", sender: self)
    }

}
