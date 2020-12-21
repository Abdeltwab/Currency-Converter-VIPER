//
//  CurrencyBaseChangeContract.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import Foundation
import RxSwift


//MARK: - Router
enum CurrencyBaseChangeRoute {
}

protocol CurrencyBaseChangeRouterProtocol: class {
    func go(to route:CurrencyBaseChangeRoute)
}



//MARK: - Presenter
protocol CurrencyBaseChangePresenterProtocol: class {
    func attach()
    var viewModel: CurrencyBaseChangeViewModel  { get }

}



//MARK: - Interactor
protocol CurrencyBaseChangeInteractorProtocol: class {

    
}



//MARK: - View
protocol CurrencyBaseChangeViewControllerProtocol: class {

  var presenter: CurrencyBaseChangePresenterProtocol?  { get set }
}
