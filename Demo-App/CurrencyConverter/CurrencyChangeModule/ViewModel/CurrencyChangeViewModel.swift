//
//  CurrencyChangeViewModel.swift
//
//  Created Abdeltwab on 12/21/20.
//
//

import Foundation

import RxCocoa
import RxSwift

struct CurrencyChangeViewModel {
    
    let dataSource: BehaviorRelay<[Currency]>
    let selectedCurrency: BehaviorRelay<Currency>
}
