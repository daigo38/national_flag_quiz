//
//  StartViewController.swift
//  NationalFlagQuiz
//
//  Created by 横田大伍 on 2019/12/27.
//  Copyright © 2019 横田大伍. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var questionNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Start(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "GameView") as! GameViewController
        nextView.questionNum = Int(questionNum.text!)!
        
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
