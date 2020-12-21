//
//  CurrencyConveterCalculatorViewModel.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import Foundation
import RxSwift
import RxCocoa


struct CurrencyConveterCalculatorViewModel {
    
    let selectedCurrency: Currency
    let baseCurrency:Currency

    let baseCurrencyValue = BehaviorRelay<String>(value: "0.0")
    let selectedCurrencyValue = BehaviorRelay<String>(value: "0.0")
    let calcualateAmountButtonButtonTapped = PublishRelay<Void>()


    init(baseCurrency:Currency, selectedCurrency: Currency) {
        self.selectedCurrency = selectedCurrency
        self.baseCurrency = baseCurrency
    }
}
