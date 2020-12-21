//
//  CurrencyConveterCalculatorRouter.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit

class CurrencyConveterCalculatorRouter: CurrencyConveterCalculatorRouterProtocol {
    
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    
    
    //MARK:- Assemple
    static func assembleModule(baseCurrency: Currency, selectedCurrency:Currency) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = CurrencyConveterCalculatorViewController()
        let interactor = CurrencyConveterCalculatorInteractor()
        let router = CurrencyConveterCalculatorRouter()
        let viewModel = CurrencyConveterCalculatorViewModel(baseCurrency: baseCurrency, selectedCurrency: selectedCurrency)
        let presenter = CurrencyConveterCalculatorPresenter(viewController: view, interactor: interactor, router: router,viewModel: viewModel)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    //MARK: - Routing
    func go(to route:CurrencyConveterCalculatorRoute) {
        switch route {
        default: break
        }
    }

}
