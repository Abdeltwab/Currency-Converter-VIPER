//
//  CurrencyConverterMainViewModel.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import RxCocoa
import RxSwift


struct CurrencyConverterMainViewModel {
    
    let dataSource = BehaviorRelay<[Currency]>(value: [])
    let selectedCurrency = PublishRelay<Currency>()
    let fetchCurrencyRates = PublishRelay<Void>()
}
