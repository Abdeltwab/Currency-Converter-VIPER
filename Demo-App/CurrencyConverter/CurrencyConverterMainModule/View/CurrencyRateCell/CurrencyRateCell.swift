//
//
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class CurrencyRateCell: UITableViewCell {
    
    
    //MARK: - outlets
    @IBOutlet weak var currencyflagLabel: UILabel!
    @IBOutlet weak var currencyCodeLabel: UILabel!
    @IBOutlet weak var currencyRateLabel: UILabel!

}


//MARK: - Display
extension CurrencyRateCell{

    func setup(with currency: Currency){
        self.currencyflagLabel.text = String(currency.flagLetter.first!)
        self.currencyCodeLabel.text = currency.symbol
        self.currencyRateLabel.text = "\(currency.rate)"
    }
    
}

