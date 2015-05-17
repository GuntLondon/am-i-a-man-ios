//
//  ResultViewController.swift
//  Are you man enough
//
//  Created by Hatch on 12/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
  let quiz = Quiz.sharedInstance
  
  @IBOutlet weak var levelLabel: UILabel!
  @IBOutlet weak var pointsLabel: UILabel!
      
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let result = quiz.result()
    levelLabel.text = result.level
    pointsLabel.text = "With \(result.score) points"

      /*
        let result = quiz.result()
        var descriptor = ""
        if result.score >= 10 {
            descriptor = "mighty"
        }else{
            descriptor = "miserable"
        }
        message.text = "You are a \(result.level) with \(result.score) \(descriptor) man points."
        /*
        Twitter Facebook Email
        Rank
        */
*/
  }



}
