//
//  CurrencyChangeContract.swift
//
//  Created Abdeltwab on 12/21/20.
//
//

import Foundation
import RxSwift


//MARK: - Router
enum CurrencyChangeRoute {
    case close
}

protocol CurrencyChangeRouterProtocol: class {
    func go(to route:CurrencyChangeRoute)
}



//MARK: - Presenter
protocol CurrencyChangePresenterProtocol {
    var viewModel: CurrencyChangeViewModel { get }
    func setSelectedRow()
    func attach()
    func close()
}



//MARK: - Interactor
protocol CurrencyChangeInteractorProtocol {
    
}



//MARK: - View
protocol CurrencyChangeViewControllerProtocol: UIViewController {
    var presenter: CurrencyChangePresenterProtocol?  { get set }
    func scrollToSelectedRow(_ row: Int)
    func reloadPickerView()
    func showIndicator()
    func hideIndicator()
}
