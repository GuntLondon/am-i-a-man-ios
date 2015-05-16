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
    
    if quiz.isComplete() {
      println("show results")
      
      let vc = self.storyboard?.instantiateViewControllerWithIdentifier("result_view") as! ResultViewController
      self.navigationController?.pushViewController(vc, animated: false)
      
    } else if quiz.question.index > 0 || quiz.category.index > 0 {
      
      let vc = self.storyboard?.instantiateViewControllerWithIdentifier("question_view") as! QuestionViewController
      self.navigationController?.pushViewController(vc, animated: false)
      
    }

  }

  
    @IBAction func generateFakeResults(sender: AnyObject) {
        quiz.generateFakeResults()
        self.performSegueWithIdentifier("showResult", sender: self)
    }


}
