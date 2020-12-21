//
//  CurrencyBaseChangeViewController.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxSwift
import RxCocoa

class CurrencyBaseChangeViewController: UIViewController, CurrencyBaseChangeViewControllerProtocol {

    
    
    //MARK: - Outlets
    
    
    
    //MARK: - Attributes
	var presenter: CurrencyBaseChangePresenterProtocol?
    let disposeBag = DisposeBag()

    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach()
    }
    
    
    //MARK: - Display
}
