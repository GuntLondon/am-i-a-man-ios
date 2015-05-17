//
//  UISpeechBubble.swift
//  Are you man enough
//
//  Created by Hatch on 16/05/2015.
//  Copyright (c) 2015 Hatch. All rights reserved.
//

import UIKit

enum UISpeechBubbleSizes {
  case Small
  case Large
  case Huge
}

@IBDesignable class UISpeechBubble: UIView {

  var view: UIView!
  

  @IBOutlet weak var content: UILabel!
  @IBOutlet weak var bubble: UIImageView!
  
  @IBOutlet weak var contentBottomConstraint: NSLayoutConstraint!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    xibSetup()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    xibSetup()
    
    bubble.hidden = true
  }
  
  func xibSetup() {
    view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
    addSubview(view)
  }
  
  func loadViewFromNib() -> UIView {
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: "UISpeechBubble", bundle: bundle)
    let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    return view
  }
  
  
  func say ( message:String, size:UISpeechBubbleSizes, completion: (() -> Void)?) {
    
    content.text = message

    switch (size) {
    case .Huge:
      content.font = UIFont(name: content.font.fontName, size: 55)
    case .Large:
      content.font = UIFont(name: content.font.fontName, size: 44)
    default:
      content.font = UIFont(name: content.font.fontName, size: 23)
    }
    

    let bottomLeft = CGPointMake(0, view.frame.height)
    let bigSize = CGSizeMake(view.frame.width, view.frame.height)
    let smallSize = CGSizeMake(0, 0)
    
    let bigFrame = CGRectMake(0, 0, view.frame.width, view.frame.height);
    let smallFrame = CGRectMake(0, view.frame.height, 0, 0);
    
    //frameView.frame = smallFrame
    bubble.frame = smallFrame
    bubble.hidden = false
    content.hidden = true
    
    UIView.animateWithDuration(0.4, delay: 0.0, options: .CurveEaseOut, animations: {
        self.bubble.frame = bigFrame
      }, completion: { finished in
        self.content.hidden = false
        if completion != nil { completion!() }
      })


  }

}
