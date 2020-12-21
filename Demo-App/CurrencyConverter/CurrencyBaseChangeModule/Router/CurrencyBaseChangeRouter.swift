//
//  CurrencyBaseChangeRouter.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit

class CurrencyBaseChangeRouter: CurrencyBaseChangeRouterProtocol {
    
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    
    
    //MARK:- Assemple
    static func assembleModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = CurrencyBaseChangeViewController()
        let interactor = CurrencyBaseChangeInteractor()
        let router = CurrencyBaseChangeRouter()
        let presenter = CurrencyBaseChangePresenter(viewController: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    //MARK: - Routing
    func go(to route:CurrencyBaseChangeRoute) {
        switch route {
        default: break
        }
    }

}
