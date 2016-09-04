//
//  ChooseViewController.swift
//  RockPaperScissors
//
//  Created by David Gibbs on 22/08/2016.
//  Copyright © 2016 SixtySticks. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {
    
    var choice: Int?
    var iPhoneChoice: Int?
    
    func iPhoneRandomChoice() -> Int {
        let randomValue = 1 + arc4random() % 3
        return Int(randomValue)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "choiceMade" {
            let controller = segue.destinationViewController as! ResultsViewController
            controller.passedOnChoice = choice
            controller.passedOnIPhoneChoice = iPhoneChoice
        }
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        choice = sender.tag
        iPhoneChoice = iPhoneRandomChoice()
        
        performSegueWithIdentifier("choiceMade", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

