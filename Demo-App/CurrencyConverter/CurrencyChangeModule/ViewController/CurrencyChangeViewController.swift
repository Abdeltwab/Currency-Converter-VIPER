//
//  CurrencyChangeViewController.swift
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxSwift
import RxCocoa

class CurrencyChangeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var screenIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var CurrencyPicker: UIPickerView!
    
    //MARK: - Attributes
	var presenter: CurrencyChangePresenterProtocol?
    let disposeBag = DisposeBag()
     
        
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.attach()
        configureBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.setSelectedRow()
    }
    
    private func setupUI() {
        setScreenTitle()
        cancelButtonImage()
        setPickerDelegate()
        confirmButtonImage()
        view.blur(withStyle: .dark)
    }
    
    private func configureBinding() {
        cancelTapAction()
        confirmTapAction()
    }
    
    private func setPickerDelegate() {
        CurrencyPicker.delegate = self
        CurrencyPicker.dataSource = self
    }
    
    private func setScreenTitle() {

        titleLabel.text = "Change Base Currency"
    }
    
    private func confirmButtonImage() {
        let image = UIImage(named: "next_arrow")
        confirmButton.setImageForAllStates(image!)
    }
    
    private func cancelButtonImage() {
        let image = UIImage(named: "bk_arrow")
        cancelButton.setImageForAllStates(image!)
    }
    
    private func cancelTapAction() {
        cancelButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.presenter?.close()
            }).disposed(by: disposeBag)
    }
    
    private func confirmTapAction() {
        guard let viewModel = presenter?.viewModel else {return}
        confirmButton
            .rx
            .tap
            .withLatestFrom(viewModel.dataSource)
            .subscribe(onNext: { [weak self] dataSource in
                guard let self = self else {return}
                let selectedRow = self.CurrencyPicker.selectedRow(inComponent: 0)
                
                if selectedRow < dataSource.count, selectedRow >= 0 {
                    viewModel.selectedCurrency.accept(viewModel.dataSource.value[selectedRow])
                    UIImpactFeedbackGenerator().impactOccurred()
                }
                
                self.presenter?.close()
            }).disposed(by: disposeBag)
    }
    

}

//MARK: - UIPickerViewDelegate & UIPickerViewDataSource
extension CurrencyChangeViewController: UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let viewModel = presenter?.viewModel else {return 0}
        return viewModel.dataSource.value.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        guard let viewModel = presenter?.viewModel else {return UIView()}
        var titleLabel: UILabel
        if let labelView = view as? UILabel{
            titleLabel = labelView
        } else {
            let width = UIScreen.main.bounds.width - (2 * 37)
            titleLabel = UILabel(frame: CGRect(x: 37, y: 0, width: width, height: 48))
        }
        titleLabel.tag = 1
        titleLabel.text = viewModel.dataSource.value[row].symbol
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20.0)
        titleLabel.textAlignment = .center
            
        if CurrencyPicker.selectedRow(inComponent: 0) == row {
            titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
            titleLabel.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.5019607843, alpha: 0.08)
        }
        
        return titleLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        reloadPickerView()
    }
}

//MARK: - CurrencyChangeViewControllerProtocol
extension CurrencyChangeViewController: CurrencyChangeViewControllerProtocol {
    
    func scrollToSelectedRow(_ row: Int) {
        CurrencyPicker.selectRow(row, inComponent: 0, animated: false)
    }
    
    func reloadPickerView() {
        CurrencyPicker.reloadAllComponents()
    }
    
    func showIndicator() {
        screenIndicator.startAnimating()
    }
    
    func hideIndicator() {
        screenIndicator.stopAnimating()
    }
    
}
