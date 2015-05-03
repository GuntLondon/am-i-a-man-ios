//
//  QuestionViewController.swift
//  Are you man enough
//


import UIKit

class QuestionViewController: UIViewController {

  
  @IBOutlet weak var background: UIImageView!
  @IBOutlet weak var man: UIImageView!
  
  @IBOutlet weak var speechBubble: UIView!
  @IBOutlet weak var questionProgress: UILabel!
  @IBOutlet weak var question: UILabel!
  
  @IBOutlet weak var yesButton: UIButton!
  @IBOutlet weak var noButton: UIButton!
  
  
  @IBOutlet weak var categoryOpening: UILabel!
  @IBOutlet weak var categoryProgress: UILabel!
  @IBOutlet weak var categoryTitle: UILabel!
  
  let quiz = Quiz.sharedInstance
  var showingCategory = true
  
  override func viewDidLoad() {
    super.viewDidLoad()

    if (quiz.question.index > 0) {
      // loading the screen mid way through a category,
      // go to the question, not cat details
      hide_category()
      show_current_question()
    } else {
      //show category details
      categoryTitle.text = quiz.category.title
      categoryProgress.text = "\(quiz.category.index+1)/\(quiz.number_of_categories)"
      man.image = UIImage(named: quiz.category.image)
    }
  }


  @IBAction func screen_tap(sender: AnyObject) {
    if ( showingCategory ) {
      //show first question
      hide_category()
      show_current_question()
    }
  }
  
  
  @IBAction func pressed_yes(sender: AnyObject) {
    quiz.answer(true)
    increment()
  }

  @IBAction func pressed_no(sender: AnyObject) {
    quiz.answer(false)
    increment()
  }

  func hide_category() {
    categoryOpening.hidden = true
    categoryTitle.hidden = true
    categoryProgress.hidden = true
    
    yesButton.hidden = false
    noButton.hidden = false
  }
  
  func show_current_question() {
    questionProgress.text = "\(quiz.question.index+1)/\(quiz.category.questions.count)"
    question.text = quiz.question.content
    speechBubble.hidden = false
  }
  
  func increment() {
    if (quiz.question.index+1 < quiz.category.questions.count) {
      // next question
      quiz.increment_question()
      show_current_question()
      
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
