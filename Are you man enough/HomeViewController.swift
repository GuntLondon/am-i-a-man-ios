//
//  HomeViewController.swift
//  Are you man enough
//
//  Created by Hatch on 04/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let quiz = Quiz.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //quiz.reset()
        
        if (quiz.question.index > 0) {
            self.performSegueWithIdentifier("showQuestion", sender: self)
        } else if (quiz.category.index > 0) {
            self.performSegueWithIdentifier("showCategory", sender: self)
        }
        
        
    }



}
