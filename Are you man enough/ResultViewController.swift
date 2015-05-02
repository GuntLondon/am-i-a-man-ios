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
    
    @IBOutlet weak var level_label: UILabel!
    @IBOutlet weak var person_label: UILabel!
    @IBOutlet weak var person_image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let result = quiz.result()
        
        level_label.text = result.level
        person_label.text = result.person
        person_image.image = UIImage(named: result.image)
        
    }

    @IBAction func resetResults(sender: AnyObject) {
        quiz.reset()
        self.performSegueWithIdentifier("showHome", sender: self)
    }

}
