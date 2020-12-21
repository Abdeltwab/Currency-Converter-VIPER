//
//  CurrencyChangePresenter.swift
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit

import RxSwift

class CurrencyChangePresenter: CurrencyChangePresenterProtocol {
    
    //MARK: - Attributes
    weak private var viewController: CurrencyChangeViewControllerProtocol?
    var interactor: CurrencyChangeInteractorProtocol?
    private let router: CurrencyChangeRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel: CurrencyChangeViewModel
    
    
    //MARK:- init
    init(viewController: CurrencyChangeViewControllerProtocol, interactor: CurrencyChangeInteractorProtocol?, router: CurrencyChangeRouterProtocol, viewModel: CurrencyChangeViewModel) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
        self.viewModel = viewModel
    }
        
    //MARK:- Functions
    func attach() {
       loadCurrencys()
    }
    
    private func loadCurrencys() {
        if viewModel.dataSource.value.isEmpty {
            viewController?.showIndicator()
        }
        self.viewModel.dataSource.accept(self.viewModel.dataSource.value)
        self.viewController?.reloadPickerView()
        self.viewController?.hideIndicator()

    }
    
    func setSelectedRow() {
        viewModel.selectedCurrency
            .withLatestFrom(viewModel.dataSource) { return ($0 , $1) }
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] (selectedCurrency , dataSource) in
                let selectedIndex = dataSource.firstIndex {
                    return $0.symbol == selectedCurrency.symbol
                }
                guard let selectedRow = selectedIndex else {return}
                self?.viewController?.scrollToSelectedRow(selectedRow)
            }).disposed(by: disposeBag)
    }
    
    // MARK: - Navigation
    func close() {
        router.go(to: .close)
    }
    
}
