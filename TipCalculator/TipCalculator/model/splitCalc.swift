//
//  splitCalc.swift
//  TipCalculator
//
//  Created by Tadiwa Mangadze on 10/14/19.
//  Copyright © 2019 Tadiwa Mangadze. All rights reserved.
//

import Foundation
class splitCalc: tipCalc{
    
    var eachPay: Float = 0
    
    init(count:Float){
        super.init(amountBeforeTax: amountBeforeTax, taxPercentage: taxPercentage, tipPercentage: tipPercentage, count: count)
    }
    
    func calculateSplit(){
        eachPay = (totalAmount/count)
    }
}


