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
    @IBOutlet weak var wordtypeLabel: UILabel!
    @IBOutlet weak var wordsLeft: UILabel!
    var rawText = String()
    var storyMaker = Story(stream: String())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyMaker = Story(stream: rawText)
        inputField.placeholder = "Fill in a " + storyMaker.getNextPlaceholder()
        wordsLeft.text = String(storyMaker.getPlaceholderRemainingCount()) + " words left to fill in"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Fillin(_ sender: Any) {
        if inputField.text!.isEmpty{
            let alert = UIAlertController(title: "Alert", message: "You didn't type in a word!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }
        if !inputField.text!.isEmpty{
        storyMaker.fillInPlaceholder(word: inputField.text!)
        wordsLeft.text = String(storyMaker.getPlaceholderRemainingCount()) + " words left to fill in"
        inputField.placeholder = "Fill in a " + storyMaker.getNextPlaceholder()
        inputField.text = nil
        }
        if storyMaker.getPlaceholderRemainingCount() == 0
        {
            self.performSegue(withIdentifier: "Segue23", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        rawText = storyMaker.toString()
        let destination1 = segue.destination as! ThirdViewController
        destination1.rawText = rawText
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
