//
//  RootViewController.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/21/20.
//

import UIKit

class RootViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var currencyConverterChallengeBrn: UIButton!
    
    
    //MARK: Actions
    @IBAction func currencyCovverterBtnTapped(_ sender: UIButton) {
        self.navigateToCurrencyConverterChallenge()
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//MARK: Navigation
extension RootViewController{
    
    private func navigateToCurrencyConverterChallenge(){
        let vc = CurrencyConverterMainRouter.assembleModule()
        self.present(vc, animated: true, completion: nil)
    }
}


