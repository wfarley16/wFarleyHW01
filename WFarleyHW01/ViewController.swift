//
//  ViewController.swift
//  WFarleyHW01
//
//  Created by William Farley on 1/25/17.
//  Copyright © 2017 William Farley. All rights reserved.

//  Had a massive file failure and decided to just start over. Sorry if the revision history makes it look like I did this all around 3 PM on the 25th. I promise I did not. Tried to rename the old file and when I opened it again I got about 10 errors saying files weren't there. Tried changing the name back but couldn't fix it and just decided to start over. I think I have everything through 2.8 in here.

//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "I can't wait to use this app!"]

        messageLabel.text = messages[index]
        
        if index == (messages.count - 1)
            {index = 0 }
            else {index = index + 1} }
    }


