//
//  SecondViewController.swift
//  NadavBaruch-pset2
//
//  Created by Nadav Baruch on 07-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var inputField: UITextField!
    var rawText: String?
    var storyMaker = Story(stream: String())
    @IBOutlet weak var wordtypeLabel: UILabel!
    @IBOutlet weak var wordsLeft: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyMaker = Story(stream: rawText!)
        wordtypeLabel.text = "Fill in a " + String(storyMaker.getNextPlaceholder())
        wordsLeft.text = String(storyMaker.getPlaceholderRemainingCount()) + " " + "words left to fill in"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Fillin(_ sender: Any) {
        if storyMaker.getPlaceholderRemainingCount() == 0
        {
            self.performSegue(withIdentifier: "Segue23", sender: nil)
        }
        else{
        storyMaker.fillInPlaceholder(word: inputField.text!)
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
