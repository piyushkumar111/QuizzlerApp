//
//  VC_Search_Page.m
//  Location Search
//
//  Created by Piyush Kachariya on 6/2/18.
//  Copyright © 2018 kachariyainfotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAns : Bool = false
    var questionNumer : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQue = allQuestions.list[questionNumer]
        questionLabel.text = firstQue.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            pickedAns = true
        }
        else if sender.tag == 2
        {
            pickedAns = false
        }
        
        checkAnswer()
        
        questionNumer += 1
        
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumer+1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumer+1)
    }
    

    func nextQuestion() {
        
        if questionNumer<=12
        {
            questionLabel.text = allQuestions.list[questionNumer].questionText
            
            updateUI()

        }
        else
        {
            let alertController = UIAlertController(title: "Awesome", message: "You have finidhed all questions!", preferredStyle: .alert)
            

            let restart = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alertController.addAction(restart)
            
            present(alertController, animated: true) {
                
            }
            
            print("End of the Quiz!!!")
            questionNumer = 0
        }
    }
    
    
    func checkAnswer() {
        
        let correctAns = allQuestions.list[questionNumer].answer
        
        if pickedAns == correctAns {
            
            ProgressHUD.showSuccess("Correct")
            print("You got it")
            score = score + 1
            
        }
        else
        {
            ProgressHUD.showError("Wrong")
            print("Wrong Selection")
        }
        
    }
    
    
    func startOver() {
       questionNumer = 0
        nextQuestion()
    }
    

    
}
