//
//  CurrencyConveterCalculatorContract.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import Foundation
import RxSwift


//MARK: - Router
enum CurrencyConveterCalculatorRoute {
}

protocol CurrencyConveterCalculatorRouterProtocol: class {
    func go(to route:CurrencyConveterCalculatorRoute)
}



//MARK: - Presenter
protocol CurrencyConveterCalculatorPresenterProtocol: class {
    func attach()
    var viewModel: CurrencyConveterCalculatorViewModel  { get }

}



//MARK: - Interactor
protocol CurrencyConveterCalculatorInteractorProtocol: class {

    
}



//MARK: - View
protocol CurrencyConveterCalculatorViewControllerProtocol: class {

  var presenter: CurrencyConveterCalculatorPresenterProtocol?  { get set }
}
