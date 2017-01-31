//
//  ViewController.swift
//  WFarleyHW01
//
//  Created by William Farley on 1/25/17.
//  Copyright © 2017 William Farley. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    var awesomePlayer = AVAudioPlayer()
    
    var lastIndex = -1
    var lastImage = -1
    let numOfSounds = 7
    var lastSound = -1
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound(soundName: String) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be played as an audio file")
            }
        } else {
            print("ERROR: Could not load data from file \(soundName)")
        }
        
    }

    func nonRepeatedRandom(last: inout Int, range: Int) -> Int {
        var random: Int = Int(arc4random_uniform(UInt32(range)))
        
        while random == last {
            random = Int(arc4random_uniform(UInt32(range)))
        }
        
        last = random
        
        return random
    }
    
    //MARK: Actions
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        
        if soundSwitch.isOn == false {
            if lastSound != -1 {
                awesomePlayer.stop()
            }
        }
    }
    
    
    @IBAction func showMessage(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "I can't wait to use this app!",
                        "You Are Da Bomb"]

        let images = ["image0",
                      "image1",
                      "image2",
                      "image3",
                      "image4",
                      "image5",
                      "image6",
                      "image7",
                      "image8"]
        
        var random: Int
        
        random = nonRepeatedRandom(last: &lastIndex, range: messages.count)
        messageLabel.text = messages[random]

        random = nonRepeatedRandom(last: &lastImage, range: images.count)
        awesomeImage.isHidden = false
        awesomeImage.image = UIImage(named: images[random])
        
        if soundSwitch.isOn == true {
            random = nonRepeatedRandom(last: &lastSound, range: numOfSounds)
            playSound(soundName: "sound" + String(random)) }
    }
}


