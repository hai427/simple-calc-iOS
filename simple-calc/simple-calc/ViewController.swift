//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 10/24/16.
//  Copyright © 2016 hainguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstInput = Double()
    var secondInput = Double()
    var operationInput = String()
    var operationSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func numberPressed(_ sender: UIButton) {
        if operationSelected {
            resultLabel.text = ""
            operationSelected = false
        }
        resultLabel.text = resultLabel.text! + sender.titleLabel!.text!
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        if resultLabel.text! != "" {
            firstInput = Double(resultLabel.text!)!
            operationInput = sender.titleLabel!.text!
            resultLabel.text = sender.titleLabel!.text!
            operationSelected = true
        }
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        if resultLabel.text! != "" {
            secondInput = Double(resultLabel.text!)!
            switch operationInput {
            case "+":
                resultLabel.text = String(firstInput + secondInput)
            case "-":
                resultLabel.text = String(firstInput - secondInput)
            case "*":
                resultLabel.text = String(firstInput * secondInput)
            case "/":
                resultLabel.text = String(firstInput / secondInput)
            default:
                resultLabel.text = ""
            }
            firstInput = 0.0
            secondInput = 0.0
            operationInput = ""
            operationSelected = false
            resultLabel.text = ""
        }
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        resultLabel.text = nil
    }
}
