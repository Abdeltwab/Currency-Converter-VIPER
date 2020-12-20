//
//  CurrencyEndPoint.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/20/20.
//

import Alamofire


enum CurrencyRatesEndPoint{
    case getCurrenceyRates(base: String)
}


extension CurrencyRatesEndPoint: TargetType{
    
    var apiKey: String {
        return "2efed38141caa5076c9f25f4ce1a4fb4"
    }
    
    var baseURL: String {
        return "http://data.fixer.io/api/"
    }
    
    var path: String {
        switch self {
        case .getCurrenceyRates:
            return "/latest"
        }
    }
    
    var task: Task {
        var bodyParam: [String: Any] = [:]
        switch self {
        case .getCurrenceyRates:
            bodyParam = ["access_key":apiKey]
            return .requestParameters(parameters: bodyParam)
        }
    }

}

