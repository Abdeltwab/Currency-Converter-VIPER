//
//  CurrencyChangeRouter.swift
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxSwift
import RxCocoa


class CurrencyChangeRouter: CurrencyChangeRouterProtocol {
    
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    
    
    //MARK:- Assemple
    static func assembleModule(selectedCurrency: BehaviorRelay<Currency>,
                               CurrencysDataSource: BehaviorRelay<[Currency]>) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = CurrencyChangeViewController()
        let interactor = CurrencyChangeInteractor()
        let router = CurrencyChangeRouter()
        let viewModel = CurrencyChangeViewModel(dataSource: CurrencysDataSource, selectedCurrency: selectedCurrency)
        let presenter = CurrencyChangePresenter(viewController: view, interactor: interactor, router: router, viewModel: viewModel)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    //MARK: - Routing
    func go(to route:CurrencyChangeRoute) {
        switch route {
        case .close:
            viewController?.dismiss(animated: true, completion: nil)
        }
    }

}
