//
//  ViewController.swift
//  NadavBaruch-pset2
//
//  Created by Nadav Baruch on 07-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var pickerView: UIPickerView!
    
    // A variable to store the story in
    var text = String()
    var stories = ["madlib0_simple", "madlib1_tarzan", "madlib2_university", "madlib3_clothes", "madlib4_dance"]
    var titles = ["Simple", "Tarzan", "University", "Clothes", "Dance"]
    var picked = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// A function that loads a text file and stores it into a string
    func loadText() -> String {
        var contents = String()
        if let filepath = Bundle.main.path(forResource: picked, ofType: "txt")
        {
            do {
                contents = try String(contentsOfFile: filepath)
            } catch {
                print(error)
            }
        } else {
            // example.txt not found!
        }
        return contents
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titles[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        picked = stories[row]
    }
    
        // segue contents to the rawtext variable in the the next view
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            text = loadText()
            if let destination: SecondViewController = (segue.destination as? SecondViewController){
                destination.rawText = text}
    }
}
