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
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func viewDidAppear(animated: Bool) {

    let result = quiz.result()
    
    let labelWidth = CGRectGetWidth(ranksView.bounds)
    let labelHeight = (CGRectGetHeight(ranksView.bounds)-10) / CGFloat(result.levels.count)
    let bigLabelHeight = labelHeight + 10
    var currentTop:CGFloat = 0
    
    for level in result.levels {
      
      if level == result.my_level {
        var label = UILabel(frame: CGRect(x: CGFloat(0), y: currentTop, width: labelWidth, height: bigLabelHeight))
        label.text = level["level"]! + " / " + level["person"]!
        label.font = label.font.fontWithSize(19)
        label.textColor = UIColor(red: 0.796, green: 0.152, blue: 0.192, alpha: 1.0)
        
        //http://makeapppie.com/2014/10/20/swift-swift-using-attributed-strings-in-swift/
        ranksView.addSubview(label)
        currentTop += 10
      } else {
        var label = UILabel(frame: CGRect(x: CGFloat(0), y: currentTop, width: labelWidth, height: labelHeight))
        label.text = level["level"]! + " / " + level["person"]!
        label.font = label.font.fontWithSize(14)
        label.textColor = UIColor(red: 0.796, green: 0.152, blue: 0.192, alpha: 1.0)
        ranksView.addSubview(label)
      }
      
      currentTop += labelHeight
    }
    


  }

  
}
