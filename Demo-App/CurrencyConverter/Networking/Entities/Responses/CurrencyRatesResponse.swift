//
//  CurrencyRatesResponse.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/20/20.
//

import ObjectMapper

public class CurrencyRatesResponse:Mappable{
 
    // MARK: - Proprties
    public var success: Bool = true
    public var timestamp: Int = 0
    public var base: String = ""
    public var date: String = ""
    public var rates: [String:Double] = [:]

    
    // MARK: - INIT
    public init() {}
    required public init?(map: Map) {}
    
    
    // MARK: - Mapping
    public func mapping(map: Map) {
        success <- map["success"]
        timestamp <- map["timestamp"]
        base <- map["base"]
        date <- map["date"]
        rates <- map["rates"]
    }
}
