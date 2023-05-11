//
//  ViewController.swift
//  chessTimer
//
//  Created by Gabriel Delgado Ramos on 3/9/23.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var timerTwo = Timer()
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playerOne: UILabel!
    @IBOutlet weak var playerTwo: UILabel!
    
    var counterOne = 600
    var counterTwo = 600
    var playerOneTurn = true
    var playerTwoTurn = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        playerOneTurn.toggle()
        playerTwoTurn.toggle()
        
        if playerOneTurn == true {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(steve), userInfo: nil, repeats: true)
            imageView.image = UIImage(named: "leftClockOn")
            timerTwo.invalidate()
        } else if playerTwoTurn == true {
            timer.invalidate()
            timerTwo = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(steveTwo), userInfo: nil, repeats: true)
            imageView.image = UIImage(named: "rightClockOn")
        }
    }
    
    
    @IBAction func playerOnePress(_ sender: UIButton) {
        if playerOneTurn == true {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(steve), userInfo: nil, repeats: true)
        } else if playerTwoTurn == true {
            timerTwo = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(steveTwo), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func playerTwoPress(_ sender: UIButton) {
        if playerTwoTurn == true {
            timerTwo = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(steveTwo), userInfo: nil, repeats: true)
        } else if playerOneTurn == true {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(steve), userInfo: nil, repeats: true)
        }
    }
    
    
    
    @objc func steve(){
        counterOne -= 1
        playerOne.text = "\(counterOne)"
        invalidateTimer()
    }
    
    @objc func steveTwo(){
        counterTwo -= 1
        playerTwo.text = "\(counterTwo)"
        invalidateTimer()
    }
    
    func invalidateTimer() {
        if counterOne <= 0 || counterTwo <= 0 {
            playerOne.isHidden = true
            playerTwo.isHidden = true
            timer.invalidate()
            timerTwo.invalidate()
        }
    }
    
    
}

