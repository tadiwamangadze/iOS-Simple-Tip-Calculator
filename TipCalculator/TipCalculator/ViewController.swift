//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tadiwa Mangadze on 10/13/19.
//  Copyright © 2019 Tadiwa Mangadze. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOutlet
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    
    @IBOutlet weak var taxPercentageLabel: UILabel!
    @IBOutlet weak var taxPercentageSlider: UISlider!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var totalsLabel: UILabel!
    
    @IBOutlet weak var splitPercentageLabel: UILabel!
    @IBOutlet weak var splitNumberTextField: UITextField!
    
    @IBOutlet weak var splitResultsLabel: UILabel!
    
    
     //MARK: - Properties
    var TipCalc = tipCalc(amountBeforeTax: 0.00, count: 1, taxPercentage: 0.06, tipPercentage: 0.15)

       
       
       //MARK: - View Controller Life Cycle
       override func viewDidLoad() {
           super.viewDidLoad()

           amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [TipCalc.amountBeforeTax])
           tipPercentageLabel.text = String(format: "Tip %d%%", arguments: [Int(TipCalc.tipPercentage * 100)])
           taxPercentageLabel.text = String(format: "Tax: %d%%", arguments: [Int(TipCalc.taxPercentage * 100)])
       }
       func calcTip(){
           TipCalc.tipPercentage = Float(tipPercentageSlider.value)
           TipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text)! as NSString).floatValue
           TipCalc.count = ((splitNumberTextField.text)! as NSString).integerValue
           TipCalc.calculateTip()
           TipCalc.calculateSplit()
           updateUI()
       }

       func updateUI(){
           totalsLabel.text = String(format: "Total: $%0.2f Tax: $%0.2f Tip: $%0.2f", arguments: [TipCalc.totalAmount, TipCalc.taxAmount, TipCalc.tipAmount])
           splitResultsLabel.text = String(format: "Each Person Pays: $%0.2f", arguments: [TipCalc.eachPay])
       }
       
        
    //MARK: - UIControl events
    @IBAction func amountBeforeTaxTextFieldChanged(_ sender: Any) {
        calcTip()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if textField == amountBeforeTaxTextField{
            textField.resignFirstResponder()
            calcTip()
        }
        return true
    }
    @IBAction func tipPercentageSliderValueChange(_ sender: Any) {
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        calcTip()
    }
    @IBAction func amountEachPaysTextFieldChanged(_ sender: Any) {
        calcTip()
    }
    
        
}

