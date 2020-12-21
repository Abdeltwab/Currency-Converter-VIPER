//
//  CurrencyBaseChangePresenter.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxSwift

class CurrencyBaseChangePresenter: CurrencyBaseChangePresenterProtocol {

    
    //MARK: - Attributes
    weak private var viewController: CurrencyBaseChangeViewControllerProtocol?
    var interactor: CurrencyBaseChangeInteractorProtocol?
    private let router: CurrencyBaseChangeRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel =  CurrencyBaseChangeViewModel ()  

    
    
    //MARK:- init
    init(viewController: CurrencyBaseChangeViewControllerProtocol, interactor: CurrencyBaseChangeInteractorProtocol?, router: CurrencyBaseChangeRouterProtocol) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    
    
    //MARK:- Functions
    func attach() {
       
    }
    
    //MARK:- Private functions

}
