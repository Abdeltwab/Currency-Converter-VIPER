//
//  CurrencyRatesService.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/20/20.
//

import RxSwift

class CurrencyRatesService: BaseAPI<CurrencyRatesEndPoint>{
    
    func getCurrencyRate(For base: String, completion: @escaping(CurrencyRatesResponse?,String?)-> Void ) {
        return fetchData(target: .getCurrenceyRates(base: base), responseClass: CurrencyRatesResponse.self) { (res, err) in
            completion(res,err)
        }
    }
}
