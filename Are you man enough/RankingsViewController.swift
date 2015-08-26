//
//  RankingsViewController.swift
//  Are you man enough
//
//  Created by Hatch on 19/05/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

class RankingsViewController: UIViewController {

  let quiz = Quiz.sharedInstance
  
  @IBOutlet weak var ranksView: UIView!
  
  @IBAction func backToResults(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func resetButton(sender: AnyObject) {
    var alert = UIAlertController(title: "Are you sure you want to reset?", message: "All data will be lost. Real men don't reset", preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
      self.quiz.reset()
      self.performSegueWithIdentifier("resetSegue", sender: self)
    }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
      // Nothing to do on cancel
    }))
    presentViewController(alert, animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidAppear(animated: Bool) {

    let result = quiz.result()
    let labelWidth = CGRectGetWidth(ranksView.bounds)
    let labelHeight = (CGRectGetHeight(ranksView.bounds)-10) / CGFloat(result.levels.count)
    let bigLabelHeight = labelHeight + 10
    var currentTop:CGFloat = 0
    var count = 0
    
    for level in result.levels {
      count++
      let label: UILabel
      if level == result.my_level {
        label = UILabel(frame: CGRect(x: CGFloat(0), y: currentTop, width: labelWidth, height: bigLabelHeight))
        label.font = label.font.fontWithSize(19)
        currentTop += 10
      } else {
        label = UILabel(frame: CGRect(x: CGFloat(0), y: currentTop, width: labelWidth, height: labelHeight))
        label.font = label.font.fontWithSize(14)
      }
      let manLevel = level["level"]!
      let person = level["person"]!
      label.text = "\(count). \(manLevel) \(person)"
      label.textColor = UIColor(red: 0.796, green: 0.152, blue: 0.192, alpha: 1.0)
      ranksView.addSubview(label)
      currentTop += labelHeight
    }

  }

}
