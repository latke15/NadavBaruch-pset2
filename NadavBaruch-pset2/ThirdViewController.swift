//
//  ThirdViewController.swift
//  NadavBaruch-pset2
//
//  Created by Nadav Baruch on 08-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var StoryText: UITextView!
    var rawText: String?
    var storyMaker = Story(stream: String())

    override func viewDidLoad() {
        super.viewDidLoad()
    StoryText.text = rawText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
