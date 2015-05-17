//
//  QuestionViewController.swift
//  Are you man enough
//


import UIKit

class QuestionViewController: UIViewController {

  
  @IBOutlet weak var background: UIImageView!
  @IBOutlet weak var man: UIImageView!

  
  @IBOutlet weak var speechBubble: UISpeechBubble!
  @IBOutlet weak var questionProgress: UILabel!
  
  @IBOutlet weak var yesButton: UIButton!
  @IBOutlet weak var noButton: UIButton!
  @IBOutlet weak var finishButton: UIButton!
  
  @IBOutlet weak var noHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var yesHeightConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var categoryDetails: UIView!
  @IBOutlet weak var categoryProgress: UILabel!
  @IBOutlet weak var categoryTitle: UILabel!

  
  let quiz = Quiz.sharedInstance
  var showingCategory = true
  var hideQuestionProgress = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    if screenSize.height == 480.0 {
      // is iphone4
      hideQuestionProgress = true
      noHeightConstraint.constant = 103.0
      yesHeightConstraint.constant = 103.0
    }
    
    //show category details
    categoryTitle.text = quiz.category.title
    categoryProgress.text = "\(quiz.category.index+1)/\(quiz.number_of_categories)"
    man.image = UIImage(named: quiz.category.image)
    
  }
  
  override func viewDidAppear(animated: Bool) {
    
    
    if (quiz.question.index > 0) {
      // loading the screen mid way through a category,
      // go to the question, not cat details
      show_current_question()
      showingCategory = false
    } 
    

  }


  @IBAction func screen_tap(sender: AnyObject) {

    if ( showingCategory ) {
      //show first question
      showingCategory = false
      show_current_question()
    }

  }
  
  
  @IBAction func pressed_yes(sender: AnyObject) {
    
    if yesButton.alpha != 1.0 { return }
    
    yesButton.alpha = 0.0
    noButton.alpha = 0.0
    
    quiz.answer(true)
    speechBubble.say("MAN!", size: UISpeechBubbleSizes.Large, completion: {
      
      let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.75 * Double(NSEC_PER_SEC)))
      dispatch_after(delayTime, dispatch_get_main_queue()) {
        self.increment()
      }
      
    })
  }

  @IBAction func pressed_no(sender: AnyObject) {
    
    if noButton.alpha != 1.0 { return }
    
    yesButton.alpha = 0.0
    noButton.alpha = 0.0
    
    quiz.answer(false)
    increment()
  }

  
  func show_current_question() {

    categoryDetails.hidden = true

    yesButton.hidden = false
    noButton.hidden = false
    finishButton.hidden = false

    if hideQuestionProgress == false {
      questionProgress.text = "\(quiz.question.index+1)/\(quiz.category.questions.count)"
      questionProgress.hidden = false
    }
    
    
    speechBubble.say(quiz.question.content, size: .Small, completion: nil )
    speechBubble.hidden = false
  }
  
  func increment() {
    if (quiz.question.index+1 < quiz.category.questions.count) {
      // next question
      quiz.increment_question()
      show_current_question()
      
      UIView.animateWithDuration(1, animations: {
        self.yesButton.alpha = 1.0
        self.noButton.alpha = 1.0
      })
      
    } else if ( quiz.category.index+1 < quiz.number_of_categories ) {
      // next category
      quiz.increment_category()
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let vc = storyboard.instantiateViewControllerWithIdentifier("question_view") as! UIViewController
      self.showViewController(vc, sender: self)
      
    } else {
      // show result
      self.performSegueWithIdentifier("showResult", sender: self)
    }
  }
}
