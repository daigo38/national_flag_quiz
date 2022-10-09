//
//  ResultViewController.swift
//  NationalFlagQuiz
//
//  Created by 横田大伍 on 2019/12/27.
//  Copyright © 2019 横田大伍. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var count = 0
    var trueCount = 0
    var questionNum = 0
    
    @IBOutlet weak var trueNumLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var questionNumLabel: UILabel!
    
    @IBOutlet weak var humanView: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let percent = Int((Double(trueCount) / Double(questionNum)) * 100)
        
        print(percent)
        
        switch percent{
        case (95...100):
            commentLabel.text = "あなたは博士レベルです！！！\n素晴らしいの一言です！"
            let human = UIImage(named: "character_hakase")
            humanView.image = human
            
        case (80..<95):
            commentLabel.text = "あなたは学校の先生レベル！！\nなぜそんなに物知りなんですか！？"
            let human = UIImage(named: "job_senesi")
            humanView.image = human
            
        case (70..<80):
            commentLabel.text = "あなたは優秀な生徒レベル！\n比較的物知りですね！"
            let human = UIImage(named: "sensei_homeru")
            humanView.image = human
            
        case (50..<70):
            commentLabel.text = "あなたは普通の生徒レベル\n一般常識は身についてますね！"
            let human = UIImage(named: "kaidan_suwaru_hanasu_school")
            humanView.image = human
            
        case (20..<50):
            commentLabel.text = "あなたは出来の悪い生徒レベル...\n何度も挑戦して一緒に学びましょう"
            let human = UIImage(named: "6021aba316b5c053b392579dffb411d3")
            humanView.image = human
            
        default:
            commentLabel.text = "あなたの頭は鶏レベルです。\nかける言葉が見つかりません。"
            let human = UIImage(named: "836138")
            humanView.image = human
        }
        
        
        
        questionNumLabel.text = String(questionNum) + "問中..."
        trueNumLabel.text = String(trueCount)
        percentLabel.text = "正答率：" + String(percent) + "％"
        // Do any additional setup after loading the view.
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
