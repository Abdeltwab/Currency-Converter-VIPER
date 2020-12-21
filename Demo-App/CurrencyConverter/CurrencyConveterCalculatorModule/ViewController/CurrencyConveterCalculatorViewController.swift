//
//  CurrencyConveterCalculatorViewController.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxSwift
import RxCocoa

class CurrencyConveterCalculatorViewController: UIViewController, CurrencyConveterCalculatorViewControllerProtocol {
    
    //MARK: - Outlets
    @IBOutlet weak var baseCurrencyTextField: UITextField!
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var selectedCurrencyTextField: UITextField!
    @IBOutlet weak var selectedCurrencyLabel: UILabel!
    @IBOutlet weak var calcualateAmountButton: UIButton!
    
    
    //MARK: - Attributes
	var presenter: CurrencyConveterCalculatorPresenterProtocol?
    let disposeBag = DisposeBag()

    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach()
        setupUI()
        configureUIBinding()
    }
    //MARK: - Display
}


//MARK: - Display
extension CurrencyConveterCalculatorViewController{
    
    private func setupUI(){
        selectedCurrencyTextField.isUserInteractionEnabled = false
        configureCurrencyCodesText()
    }
    
    private func configureCurrencyCodesText(){
        guard  let viewModel = self.presenter?.viewModel else {return}
        self.selectedCurrencyLabel.text = viewModel.selectedCurrency.symbol
        self.baseCurrencyLabel.text = viewModel.baseCurrency.symbol
    }
}


//MARK: - Binding
extension CurrencyConveterCalculatorViewController{
    
    private func configureUIBinding(){
        bindCalcualateAmountButtonTap()
        bindSelectedCurrencyTextFieldUpdating()
        bindBaseCurrencyTextFieldEditing()
    }
        
    private func bindBaseCurrencyTextFieldEditing(){
        guard  let viewModel = self.presenter?.viewModel else {return}
        self.baseCurrencyTextField.rx
            .text.orEmpty.bind(to: viewModel.baseCurrencyValue).disposed(by: disposeBag)
    }
    
    private func bindSelectedCurrencyTextFieldUpdating(){
        guard  let viewModel = self.presenter?.viewModel else {return}
        viewModel.selectedCurrencyValue
            .bind(to: selectedCurrencyTextField.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func bindCalcualateAmountButtonTap(){
        self.calcualateAmountButton.rx.tap
            .bind { [weak self] _  in
                guard let self = self else {return}
                self.presenter?.viewModel.calcualateAmountButtonButtonTapped.accept(())
            }.disposed(by: disposeBag)
    }
}
