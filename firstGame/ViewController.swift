//
//  ViewController.swift
//  firstGame
//
//  Created by Molina, Gabriella C on 2/24/20.
//  Copyright © 2020 Molina, Gabriella C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //variables
    
    var score:Int = 0
    var name:String = ""
    var chars:Int = Int(arc4random_uniform(20) + 2)
    var counter:Int = 30
    var timer = Timer()
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    
    //outlets
    
    @IBOutlet weak var myScore: UILabel!

    @IBOutlet weak var myName: UITextField!
    
    @IBOutlet weak var myGreeting: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var rackupMessage: UITextField!
    
    @IBOutlet weak var sweetLabel: UIButton!
    
    @IBOutlet weak var saltyLabel: UIButton!
    
    @IBOutlet weak var saltyImage: UIImageView!
    
    @IBOutlet weak var sweetImage: UIImageView!
    //actions
    
    @IBAction func mySubmit(_ sender: Any) {
        name = myName.text!
        myGreeting.text = "Hi \(name), will you get chips or candy?"
        myName.resignFirstResponder()
    }
    
    
    @IBAction func sweetButton(_ sender: Any){
        didScore(points:1)
        if isTimerRunning == false {
        runTimer()
        }
    }
    
    @IBAction func saltyButton(_ sender: Any) {
        didScore(points:5)
        if isTimerRunning == false {
        runTimer()
        }
    }
    
    
    @IBAction func myScore(_ sender: Any) {
    }
    
        
    func didScore(points:Int){
       score = score + points
            if(score % chars == 0) {
               score=0 }
           myScore.text = "Score: \(score)"
    }
    
    func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
                }
        
    @objc func updateTimer() {
            counter -= 1
            timerLabel.text = "\(counter)"
            if(counter == 0) {
                timerLabel.text = "Time's Up!"
                timer.invalidate()
                sweetLabel.isHidden = true
                saltyLabel.isHidden = true
                
                if(score <= 1) {
                          rackupMessage.text = "You get candy!"
                          sweetImage.image = UIImage(named: "candy")
                      }
                      else if(score > 30 && score <= 50){
                          rackupMessage.text = "You get chips!"
                          saltyImage.image = UIImage(named: "chips")
                }
                    else if (score > 50 && score <= 100){
                        rackupMessage.text = "You get both!"
                        sweetImage.image = UIImage(named: "candy")
                        saltyImage.image = UIImage(named: "chips")
                    }
        }
    }

    @IBAction func myReset(_ sender: Any) {
         score = 0
               myScore.text = "Score: \(score)"
               timer.invalidate()
               counter = 30
               timerLabel.text = "\(counter)"
               isTimerRunning = false
               sweetLabel.isHidden = false
               saltyLabel.isHidden = false
                chars = Int(arc4random_uniform(10) + 2)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

