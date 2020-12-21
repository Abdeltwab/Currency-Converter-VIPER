//
//  CurrencyConverterMainRouter.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxCocoa
import RxSwift


class CurrencyConverterMainRouter: CurrencyConverterMainRouterProtocol {
    
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    
    
    //MARK:- Assemple
    static func assembleModule() -> UIViewController {
        let view = CurrencyConverterMainViewController()
        let interactor = CurrencyConverterMainInteractor()
        let router = CurrencyConverterMainRouter()
        let defaultCurrency = Currency(symbol: "EUR", rate: 0.0)

        let viewModel = CurrencyConverterMainViewModel(defaultcurrency: defaultCurrency)
        let presenter = CurrencyConverterMainPresenter(viewController: view, interactor: interactor, router: router,viewModel: viewModel)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    //MARK: - Routing
    func go(to route:CurrencyConverterMainRoute) {
        switch route {
        case .selectedCurrency(let baseCurrency, let selectedCurrency):
            let vc = CurrencyConveterCalculatorRouter.assembleModule(baseCurrency: baseCurrency, selectedCurrency: selectedCurrency)
            self.viewController?.present(vc, animated: true, completion: nil)
        case .changeCurrencyBase(let selectedCurrency , let currencies):
            let vc = CurrencyChangeRouter.assembleModule(selectedCurrency: selectedCurrency, CurrencysDataSource: BehaviorRelay<[Currency]>(value: currencies))
            viewController?.present(vc, animated: true, completion: nil)
        }
    }

}
