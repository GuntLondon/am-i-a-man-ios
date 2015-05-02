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
        
        if(quiz.isComplete()){
            self.performSegueWithIdentifier("showResults", sender: self)
        }else{
            if (quiz.question.index > 0) {
                self.performSegueWithIdentifier("showQuestion", sender: self)
            } else if (quiz.category.index > 0) {
                self.performSegueWithIdentifier("showCategory", sender: self)
            }
        }
    }

    @IBAction func generateFakeResults(sender: AnyObject) {
        quiz.generateFakeResults()
        self.performSegueWithIdentifier("showResults", sender: self)
    }


}
