//
//  CurrencyNetworkingProtocol.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/20/20.
//

import RxSwift

public protocol CurrencyNetworkingProtocol {
    func getCurrencyRates(for base: String)-> Observable<[Currency]?>
}

extension CurrencyNetworkingProtocol {
    
    func getCurrencyRates(for base: String) -> Observable<[Currency]?>{
        let service = CurrencyRatesService()
        return Observable.create { observer in
            service.getCurrencyRate(base: base){ res,err in
                guard let error = err else {
                    let currencies = res?.rates.compactMap { Currency(symbol: $0.key, rate: $0.value) }
                    observer.onNext(currencies)
                    observer.onCompleted()
                    return
                }
                observer.onError(BaseError.networkingError(erro: error))
            }
            return Disposables.create()
        }
    }
    
    
    
}
