//
//  Currency.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/20/20.
//

import Foundation

public struct Currency {
    
    public var symbol: String = ""
    public var rate: Double = 0.0
    public var flagLetter: String = ""


    init(symbol:String, rate:Double) {
        self.symbol =  symbol
        self.rate = rate
    }
    
}
