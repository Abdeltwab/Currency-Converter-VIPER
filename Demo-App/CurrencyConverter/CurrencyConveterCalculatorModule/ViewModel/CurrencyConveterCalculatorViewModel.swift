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

    let baseCurrencyValue = BehaviorRelay<String>(value: "")
    let selectedCurrencyValue = BehaviorRelay<String>(value: "")
    let calcualateAmountButtonButtonTapped = PublishRelay<Void>()


    init(baseCurrency:Currency, selectedCurrency: Currency) {
        self.selectedCurrency = selectedCurrency
        self.baseCurrency = baseCurrency
    }
}
