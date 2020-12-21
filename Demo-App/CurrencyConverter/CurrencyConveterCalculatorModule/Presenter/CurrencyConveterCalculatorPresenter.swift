//
//  CurrencyConveterCalculatorPresenter.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxSwift

class CurrencyConveterCalculatorPresenter: CurrencyConveterCalculatorPresenterProtocol {

    
    //MARK: - Attributes
    weak private var viewController: CurrencyConveterCalculatorViewControllerProtocol?
    var interactor: CurrencyConveterCalculatorInteractorProtocol?
    private let router: CurrencyConveterCalculatorRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel:CurrencyConveterCalculatorViewModel

    
    
    //MARK:- init
    init(viewController: CurrencyConveterCalculatorViewControllerProtocol, interactor: CurrencyConveterCalculatorInteractorProtocol?, router: CurrencyConveterCalculatorRouterProtocol,viewModel:CurrencyConveterCalculatorViewModel) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
        self.viewModel = viewModel
    }
    
    
    
    //MARK:- Functions
    func attach() {
        handleBidning()
    }
}

//MARK:- Binding
extension CurrencyConveterCalculatorPresenter {

    private func handleBidning(){
        didTappedConvertButton()
    }
    
    private func didTappedConvertButton(){
        viewModel.calcualateAmountButtonButtonTapped
            .withLatestFrom(viewModel.baseCurrencyValue)
            .bind { [weak self] value in
                guard let self = self else {return}
                self.viewModel.selectedCurrencyValue.accept(self.calcualateAmount(value: value))
            }.disposed(by: disposeBag)
    }
    
    private func calcualateAmount(value: String) -> String {
        
        let selectedCurrecnyRate = self.viewModel.selectedCurrency.rate
        return "\((Double(Int(value) ?? 0) * selectedCurrecnyRate))"
        
    }
}
