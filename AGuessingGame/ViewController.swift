//
//  ViewController.swift
//  AGuessingGame
//
//  Created by Li, Muchen on 2019-09-30.
//  Copyright © 2019 Li, Muchen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: Properties - store information
    let targetNumber = Int.random(in: 1...100)
    @IBOutlet weak var submittedGuess: UITextField!
    
    //MARK: Initializers
    
    //MARK: Methods(functions) - behaviours

    //runs as soon as the view becomes visible to the user
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Make an object named 'synthesizer', which is an instance of the class 'AVpeechSynthesizer'
        let synthesizer = AVSpeechSynthesizer()
        
        //Make a string that contains what we want the computer to say
        let message = "I'm thinking of a number between 1 and 100. Guess what it is."
        
        //Make an object named 'utterance', which is an instance of the class 'AVSpeechUtternace'
        let utterance = AVSpeechUtterance(string: message)
        
        //Speak the message
        synthesizer.speak(utterance)
    }
    
    //will be used to check the guess
    @IBAction func checkGuess(_ sender: Any) {
        
        //obtain the guess value from th text field
        let guessText = submittedGuess.text!
        let guessNumber = Int(guessText)!
        
        //For testing purposes, what was the text?
        print("For testing purposes, the guess made was \(guessNumber)")
        let message1 = "Guess lower next time"
        let message2 = "Guess higher next time"
        let message3 = "You are correct"
        
        let synthesizer = AVSpeechSynthesizer()
        
        //give the appropriate feedback to the user
        if guessNumber > targetNumber{
            let utterance1 = AVSpeechUtterance(string: message1)
            synthesizer.speak(utterance1)
            
        } else if guessNumber < targetNumber {
            let utterance2 = AVSpeechUtterance(string: message2)
            synthesizer.speak(utterance2)
            
        } else {
            let utterance3 = AVSpeechUtterance(string: message3)
            synthesizer.speak(utterance3)
            
            
        }
    }
    
} 

