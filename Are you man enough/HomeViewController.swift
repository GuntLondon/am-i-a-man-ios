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

  @IBOutlet weak var speechBubble: UISpeechBubble!
  @IBOutlet weak var message: UILabel!
  @IBOutlet weak var button: UIImageView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    quiz.reset()
    //quiz.generateFakeResults()
    
    if quiz.isComplete() {
      
      let vc = self.storyboard?.instantiateViewControllerWithIdentifier("result_view") as! ResultViewController
      self.navigationController?.pushViewController(vc, animated: false)
      
    } else if quiz.question.index > 0 || quiz.category.index > 0 {
      
      let vc = self.storyboard?.instantiateViewControllerWithIdentifier("question_view") as! QuestionViewController
      self.navigationController?.pushViewController(vc, animated: false)
      
    } 

    self.message.alpha = 0.0
    self.button.alpha = 0.0
  }
  
  override func viewDidAppear(animated: Bool) {
    speechBubble.say("Am I a\nman, yet?", size: .Huge, completion: {
      UIView.animateWithDuration(1, animations: {
        self.message.alpha = 1.0
        self.button.alpha = 1.0
      })
    })
  }

  
    @IBAction func generateFakeResults(sender: AnyObject) {
        quiz.generateFakeResults()
        self.performSegueWithIdentifier("showResult", sender: self)
    }


}
