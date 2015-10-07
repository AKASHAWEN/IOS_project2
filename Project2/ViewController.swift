//
//  ViewController.swift
//  Project2
//
//  Created by Yuchao Chen on 15/10/5.
//  Copyright © 2015年 Yuchao Chen. All rights reserved.
//
import GameplayKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var contries = [String]()
    var correctAnswer = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contries += ["estonia","france","germany","italy","nigeria"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        askQuestion()
    }
    func askQuestion(action: UIAlertAction! = nil){
        
        contries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(contries) as! [String]
        button1.setImage(UIImage(named: contries[0]), forState: .Normal)
        button2.setImage(UIImage(named: contries[1]), forState: .Normal)
        button3.setImage(UIImage(named: contries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        
        title = contries[correctAnswer].uppercaseString
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        } else {
            title = "Wrong"
            --score
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "play again", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
