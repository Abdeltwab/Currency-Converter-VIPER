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
    var viewModel =  CurrencyConveterCalculatorViewModel ()  

    
    
    //MARK:- init
    init(viewController: CurrencyConveterCalculatorViewControllerProtocol, interactor: CurrencyConveterCalculatorInteractorProtocol?, router: CurrencyConveterCalculatorRouterProtocol) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    
    
    //MARK:- Functions
    func attach() {
       
    }
    
    //MARK:- Private functions

}
