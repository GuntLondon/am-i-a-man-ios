//
//  ImageExperimentViewController.swift
//  Are you man enough
//
//  Created by Pete Graham on 02/05/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class ImageExperimentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background-01.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesClicked(sender: AnyObject) {
        let alert = UIAlertView()
        alert.title = "Hey"
        alert.message = "This is  one Alert"
        alert.addButtonWithTitle("Working!!")
        alert.show()
    }

}
