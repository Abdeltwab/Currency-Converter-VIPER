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
        configureBinding()
    }

}



//MARK:- Binding
extension CurrencyConverterMainPresenter{
    
    private func configureBinding(){
        bindFetchingCurrencyRates()
        bindSelectedCurrency()
        bindChangeCurrency()
    }
    
    private func bindFetchingCurrencyRates(){
        viewModel
            .fetchCurrencyRates
            .flatMap { [weak self] _ -> Observable<[Currency]?> in
                guard let self = self else {return Observable.just([])}
                guard let interactor = self.interactor else {return Observable.just([])}
                return interactor.getCurrencyRates(for: "")
            }
            .filter{$0 != nil}
            .map{$0!}
            .observeOn(MainScheduler.asyncInstance)
            .subscribe { [weak self] res in
                guard let self = self else {return}
                self.viewModel.dataSource.accept(res)
            } onError: {err in
                print(err)
            }.disposed(by: disposeBag)
    }
    
    private func bindSelectedCurrency(){
        viewModel.selectedCurrency
            .bind(onNext: { [weak self] currency in
                guard let self = self else {return}
                self.navigateToSelectedCurrency()
            }).disposed(by: disposeBag)
    }
    
    private func bindChangeCurrency(){
        viewModel.changeCurrencyTap
            .bind(onNext: { [weak self] _ in
                guard let self = self else {return}
                self.navigateToChangeCurrency()
            }).disposed(by: disposeBag)
    }
}


//MARK:- Data Handeler
extension CurrencyConverterMainPresenter{
    
    private func handleError(_ error: Error) {
        switch error {
        default:break
//            viewController?.showSomethingWrongView(title: UserBouquetAddOnsLocalization.generalErrorTitle.localized, message: UserBouquetAddOnsLocalization.unexpextedError.localized, buttonTitle: UserBouquetAddOnsLocalization.retryBtnTitle.localized)
        }
    }
    
}


//MARK:- navigation
extension CurrencyConverterMainPresenter{
    
    private func navigateToSelectedCurrency(){
        let baseCurrency = self.viewModel.baseCurrency.value
        let selectedCurrency = self.viewModel.selectedCurrency.value
        router.go(to: .selectedCurrency(baseCurrency: baseCurrency, selectedCurrency: selectedCurrency))
    }
    
    private func navigateToChangeCurrency(){
        let currencies = self.viewModel.dataSource.value
        router.go(to: .changeCurrencyBase(selectedCurrency: self.viewModel.selectedCurrency, currencies: currencies))
    }
}
