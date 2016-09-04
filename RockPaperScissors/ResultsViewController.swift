//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by David Gibbs on 22/08/2016.
//  Copyright © 2016 SixtySticks. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var playerChoice: UILabel!
    @IBOutlet weak var iPhoneChoice: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var winnerImage: UIImageView!
    @IBOutlet weak var winnerResult: UILabel!
    
    var passedOnChoice: Int?
    var passedOnIPhoneChoice: Int?
    var winningImage = UIImage()
    
    enum Result: Int {
        case Rock = 1, Paper, Scissors
    }
    
    @IBAction func startAgain(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if passedOnChoice != nil {
            setLabels()
        } else {
            print("No choice made")
        }
    }
    
    func setLabels() {
        playerChoice.text = "\(Result(rawValue: passedOnChoice!)!)"
        iPhoneChoice.text = "\(Result(rawValue: passedOnIPhoneChoice!)!)"
        
        let winnerLabelTuple = pickWinner(choice1: passedOnChoice!, choice2: passedOnIPhoneChoice!)
        
        if playerChoice.text == iPhoneChoice.text {
            winnerImage.image = UIImage(named: "\(playerChoice.text!).png")
            winnerLabel.text = "You both chose \(playerChoice.text!)"
            winnerResult.text = "It's  a  draw!"
        } else {
            winnerLabel.text = "\(winnerLabelTuple.0) \(winnerLabelTuple.1)"
            winnerImage.image = UIImage(named: "\(winnerLabelTuple.0).png")
            
            if playerChoice.text == winnerLabelTuple.0 {
                winnerResult.text = "You  win!"
            } else {
                winnerResult.text = "You  lose!"
            }
        }
    
    }
    
    func pickWinner(choice1 choice1: Int, choice2: Int) -> (String, String) {
        let choiceArray = [choice1, choice2]
        
        if choice1 == choice2 {
            return ("Draw", "It's a draw!")
        } else {
            if choiceArray.contains(1) && choiceArray.contains(2) {
                return ("Paper", "covers Rock")
            } else if choiceArray.contains(2) && choiceArray.contains(3) {
                return ("Scissors", "cut Paper")
            } else {
                return ("Rock", "crushes Scissors")
            }
        }
        
    }
    
}
