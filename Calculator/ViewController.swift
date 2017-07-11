//
//  ViewController.swift
//  Calculator
//
//  Created by byxx on 11.07.17.
//  Copyright © 2017 byxx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //instance variables are properties
    
    //BTW :Type form(external name) startx(internal name)
   // func drawHorizontalLine(from startX: Double to endX: Double, using color: UIColor)
    
    //App Crash during development is great
    //Swift Method
    
    var userIsInTheMiddleOfTyping = false
    
    //Optionals are initialized by Automatically set to nil
    @IBOutlet weak var display: UILabel!
    
    
    //Set Label to 0 in Attribute Inspector
    //Use Autoshrink in Attribute Inspector
    @IBAction func touchDigit(_ sender: UIButton) {
    let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
    let textCurrentlyInDisplay = display.text!
        display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
            }
    }
    
    //Computed property (calculated)
    var displayValue: Double {
        get {
         return Double(display.text!)!
        }
        set {
        display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        //Fix:
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                if display.text != nil {
                displayValue = sqrt(displayValue)
                }
            default:
                break
                
            }
        }
    }
    
}
