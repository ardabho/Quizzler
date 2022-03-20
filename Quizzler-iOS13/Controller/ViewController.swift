

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        
        //check if the user answer is correct and assign it to result
        let result = quizBrain.checkAnswer(answer: userAnswer!)
        
        //check if the answer is true or false
        if result{
            sender.backgroundColor = UIColor.green
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        //update the question number
        quizBrain.updateQuestionNumber()
        
        //start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        
        //Updates the UI elements
        let answers = quizBrain.getAnswerArray()
        firstAnswer.setTitle(answers[0], for: .normal)
        secondAnswer.setTitle(answers[1], for: .normal)
        thirdAnswer.setTitle(answers[2], for: .normal)
        
        //update score and progressbar value
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
        
        //clear the background color of all buttons
        firstAnswer.backgroundColor = UIColor.clear
        secondAnswer.backgroundColor = UIColor.clear
        thirdAnswer.backgroundColor = UIColor.clear
        
        
    }
    
}

