//
//  tipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Tadiwa Mangadze on 10/13/19.
//  Copyright © 2019 Tadiwa Mangadze. All rights reserved.
//
import UIKit

class tipCalculatorViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    
    @IBOutlet weak var taxPercentageLabel: UILabel!
    @IBOutlet weak var taxPercentageSlider: UISlider!
    
    @IBOutlet weak var totalsLabel: UILabel!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var splitPercentageLabel: UILabel!
    @IBOutlet weak var splitPercentageSlider: UISlider!
    
    @IBOutlet weak var splitResultsLabel: UILabel!
    
    //MARK: - Properties
    var TipCalc = tipCalc(amountBeforeTax: 25.00, taxPercentage: 0.1, tipPercentage: 0.2)
    
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [TipCalc.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip %d%%", arguments: [Int(TipCalc.tipPercentage * 100)])
        taxPercentageLabel.text = String(format: "Tax %d%%:", arguments: [Int(TipCalc.taxPercentage * 100)])
    }
    func calcTip(){
        TipCalc.tipPercentage = Float(tipPercentageSlider.value)
        TipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text)! as NSString).floatValue
        TipCalc.calculateTip()
        updateUI()
    }
    func updateUI(){
        totalsLabel.text = String(format: "Total: $%0.2f Tax: $%0.2f Tip: $%0.2f", arguments: [TipCalc.totalAmount, TipCalc.taxAmount, TipCalc.tipAmount])
    }

}
