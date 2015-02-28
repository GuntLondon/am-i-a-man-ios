//
//  CategoryViewController.swift
//  Are you man enough
//
//  Created by Hatch on 04/02/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class CelebrationViewController: BaseController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timeToMoveOn", userInfo: nil, repeats: false)
    }
    
    func timeToMoveOn() {
        go_to_next_screen()
    }
}