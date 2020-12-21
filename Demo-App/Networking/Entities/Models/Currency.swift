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

    public init(){}

    init(symbol:String, rate:Double) {
        let flagBase = UnicodeScalar("🇦").value - UnicodeScalar("A").value
        self.symbol =  symbol
        self.rate = rate
        symbol.uppercased().unicodeScalars.forEach {
            if let scaler = UnicodeScalar(flagBase + $0.value) {
                self.flagLetter.append(String(describing: scaler))
            }
        }
    }
    
}
