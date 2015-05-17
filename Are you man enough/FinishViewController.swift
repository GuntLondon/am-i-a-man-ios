//
//  FinishViewController.swift
//  Are you man enough
//
//  Created by Hatch on 17/05/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

  
  @IBOutlet weak var speechBubble: UISpeechBubble!
  
  override func viewDidAppear(animated: Bool) {
    speechBubble.say("Be a man and answer all the questions!", size: .Small, completion: nil )
    let timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "goBack", userInfo: nil, repeats: false)
  }
  
  @IBAction func screenTap(sender: AnyObject) {
    goBack()
  }
  
  func goBack() {
    self.navigationController?.popViewControllerAnimated(true)
  }
  

  
  
}
