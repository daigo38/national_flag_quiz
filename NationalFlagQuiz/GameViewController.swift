//
//  GameViewController.swift
//  NationalFlagQuiz
//
//  Created by 横田大伍 on 2019/12/27.
//  Copyright © 2019 横田大伍. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var Number: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var QuestionView: UIImageView!
    var count = 0
    var QuestionRight = 0
    var getTag = 0
    var questionNum = 0
    var trueCount = 0
    var countryList = ["日本","アメリカ","ロシア","イギリス","中国","インド","インドネシア","デンマーク","ブラジル","カンボジア","カメルーン","エジプト","フランス","ガーナ","ギリシャ","イタリア","ケニア","マダガスカル","ルーマニア","サウジアラビア","シンガポール","南アフリカ共和国","韓国","スペイン","タイ","オランダ","トルコ","ウガンダ","スウェーデン","フィンランド","バングラデシュ","コスタリカ","ドイツ","オーストラリア","カナダ","ジャマイカ","クウェート","北朝鮮"]
    var flagImage: [UIImage] = []
    var choice = ["","","","",""]
    var rightCountry = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count += 1
        Number.text = "第 " + String(count) + " 問"
        
        for var x in 1...38{
            let image = UIImage(named: "image\(x)")!
            flagImage.append(image)
        }
        
        
        let randomRight = Int.random(in: 0...37)
        QuestionView.image = flagImage[randomRight]
        choice[0] = countryList[randomRight]
        rightCountry = countryList[randomRight]
        countryList.remove(at: randomRight)
        
        
        for var i in 1...4{
            let random = Int.random(in: 1..<countryList.count)
            choice[i] = countryList[random]
            countryList.remove(at: random)
        }
        
        for i in 0 ..< choice.count{
            let r = Int(arc4random_uniform(UInt32(choice.count - 1)))
            choice.swapAt(i, r)
            
        }
        
        for n in 0 ..< choice.count{
            if choice[n] == rightCountry{
                QuestionRight = n + 1
                
            }
        }
        
        
        QuestionLabel.text = "どこの国の国旗でしょう\n1." + choice[0] + "\n2." + choice[1] + "\n3." + choice[2] + "\n4." + choice[3] + "\n5." + choice[4]
        // Do any additional setup after loading the view.
    }
    @IBAction func input(_ sender: Any) {
        getTag = (sender as AnyObject).tag
        
        
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "AnswerView") as! AnswerViewController
        nextView.answer = getTag
        nextView.count = count
        nextView.answerRight = QuestionRight
        nextView.questionNum = questionNum
        nextView.trueCount = trueCount
        nextView.answerCountry = rightCountry
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
