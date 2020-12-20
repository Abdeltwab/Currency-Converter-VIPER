//
//  CurrencyNetworkingProtocol.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/20/20.
//

import RxSwift

public protocol CurrencyNetworkingProtocol {
    func getCurrencyRates(for base: String)-> Observable<(CurrencyRatesResponse?,String?)>
}

extension CurrencyNetworkingProtocol {
    
    func getCurrencyRates(for base: String) -> Observable<(CurrencyRatesResponse?, String?)>{
        let service = CurrencyRatesService()
        return Observable.create { observer in
            service.getCurrencyRate(base: base) { res,err in
                observer.onNext((res,err))
            }
            return Disposables.create()
        }
    }
    
    
    
}
