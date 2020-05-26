//
//  tipCalc.swift
//  TipCalculator
//
//  Created by Tadiwa Mangadze on 10/13/19.
//  Copyright © 2019 Tadiwa Mangadze. All rights reserved.
//

import Foundation

class tipCalc{
    var tipAmount: Float = 0
    var taxAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    var taxPercentage: Float = 0
    var count: Int = 0
    var eachPay: Float = 0
    
    init(amountBeforeTax: Float, count: Int, taxPercentage: Float, tipPercentage:Float){
        self.amountBeforeTax = amountBeforeTax
        self.count = count
        self.taxPercentage = taxPercentage
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip(){
        
        taxAmount = amountBeforeTax * taxPercentage
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = tipAmount + amountBeforeTax + taxAmount
    }
    
    func calculateSplit(){
        eachPay = totalAmount/Float(count)
    }
    
}
