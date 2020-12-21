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
    
    
    
    //MARK: - Attributes
	var presenter: CurrencyConveterCalculatorPresenterProtocol?
    let disposeBag = DisposeBag()

    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach()
    }
    
    
    //MARK: - Display
}
