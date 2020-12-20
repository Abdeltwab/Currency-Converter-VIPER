//
//  CurrencyConverterMainPresenter.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxSwift

class CurrencyConverterMainPresenter: CurrencyConverterMainPresenterProtocol {

    
    //MARK: - Attributes
    weak private var viewController: CurrencyConverterMainViewControllerProtocol?
    var interactor: CurrencyConverterMainInteractorProtocol?
    private let router: CurrencyConverterMainRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel =  CurrencyConverterMainViewModel ()  

    
    
    //MARK:- init
    init(viewController: CurrencyConverterMainViewControllerProtocol, interactor: CurrencyConverterMainInteractorProtocol?, router: CurrencyConverterMainRouterProtocol) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    
    
    //MARK:- Functions
    func attach() {
       
    }
    
    //MARK:- Private functions

}
