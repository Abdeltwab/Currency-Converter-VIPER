//
//  CurrencyEndPoint.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/20/20.
//

import Alamofire


enum CurrencyEndPoint{
    //MARK: base has not effect as the API only suuport EUR for        current plan
    case getCurrenceyRates(base: String = "EUR")
}


extension CurrencyEndPoint: TargetType{
    
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
           //MARK: not usd
            bodyParam = ["access_key":apiKey]
            return .requestParameters(parameters: bodyParam)
        }
    }

}

