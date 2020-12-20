//
//  ViewController.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/20/20.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController,CurrencyNetworkingProtocol {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getCurrencyRates(for: "EUR")
            .bind { res in
                print(res.0?.rates)
        }.disposed(by: disposeBag)
    }


}

