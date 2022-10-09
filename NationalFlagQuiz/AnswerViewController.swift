//
//  AnswerViewController.swift
//  NationalFlagQuiz
//
//  Created by 横田大伍 on 2019/12/27.
//  Copyright © 2019 横田大伍. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    var answer = 0
    var answerRight = 0
    var count = 0
    var trueCount = 0
    var questionNum = 0
    var answerCountry = ""
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var rest: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var buttonResult: UIButton!
    @IBOutlet weak var humanView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonResult.isHidden = true
        button.isHidden = false
        answerLabel.isHidden = true
        if answer == answerRight{
            let human = UIImage(named: "test_print_happy_schoolboy")
            humanView.image = human
            Label.text = "正解です！"
            answerLabel.isHidden = false
            answerLabel.text = "その調子！！"
            trueCount += 1
        }else{
            let human = UIImage(named: "test_print_gakkari_schoolgirl")
            humanView.image = human
            Label.text = "不正解です..."
            answerLabel.isHidden = false
            answerLabel.text = "正解は" + answerCountry + "でした"
        }
        
        if count == questionNum{
            button.isHidden = true
            buttonResult.isHidden = false
            rest.isHidden = true
            
            
            
            
        }else{
            
            rest.text = "あと" + String(questionNum - count) + "問です"
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "GameView") as! GameViewController
        nextView.count = count
        nextView.questionNum = questionNum
        nextView.trueCount = trueCount
        self.present(nextView, animated: true, completion: nil)
        
    }
    
    @IBAction func Result(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "ResultView") as! ResultViewController
        nextView.count = count
        nextView.trueCount = trueCount
        nextView.questionNum = questionNum
        
        self.present(nextView, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
