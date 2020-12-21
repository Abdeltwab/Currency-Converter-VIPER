//
//  CurrencyConverterMainViewController.swift
//  Demo-App
//
//  Created Abdeltwab on 12/21/20.
//
//

import UIKit
import RxSwift
import RxCocoa

class CurrencyConverterMainViewController: UIViewController, CurrencyConverterMainViewControllerProtocol {
    
    //MARK: - Outlets
    @IBOutlet weak var baseCurrencyViewBtn: UIButton!
    @IBOutlet weak var baseCurrencyLabel: UIView!
    @IBOutlet weak var currencyRatesTable: UITableView!

    
    
    //MARK: - Attributes
	var presenter: CurrencyConverterMainPresenterProtocol?
    let disposeBag = DisposeBag()

    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter?.viewModel.fetchCurrencyRates.accept(())
    }
}

//MARK: - UI
extension CurrencyConverterMainViewController{
    private func setupUI(){
        configureBinding()
        configuureTableView()
        bindBaseCurrencyViewTapped()
    }
    
    private func configureBinding(){
        
    }
    
    private func bindBaseCurrencyViewTapped(){
        baseCurrencyViewBtn.rx.tap
            .do(onNext: { [weak self] _ in
                guard let viewModel = self?.presenter?.viewModel else {return}
                viewModel.changeCurrencyTap.accept(())
            }).subscribe()
            .disposed(by: disposeBag)
    }
    
}

//MARK: - Tabel View Configuration
extension CurrencyConverterMainViewController{
    
    private func configuureTableView(){
        registerTableViewCells()
        setupTableViewLayout()
        bindTabelViewSelection()
        bindTableViewDataSource()
    }

    private func registerTableViewCells() {
        let nib = UINib(nibName: "\(CurrencyRateCell.self)", bundle: nil)
        currencyRatesTable.register(nib, forCellReuseIdentifier: "\(CurrencyRateCell.self)")
    }

    private func setupTableViewLayout() {
        currencyRatesTable.rowHeight = 60
    }

    private func bindTableViewDataSource(){
        guard let viewModel = self.presenter?.viewModel else {return}
        viewModel.dataSource
            .bind(to: currencyRatesTable.rx.items) { table, index, item in
                let cell = table.dequeueReusableCell(withIdentifier: "\(CurrencyRateCell.self)") as! CurrencyRateCell
                cell.setup(with: item)
                return cell
        }.disposed(by: disposeBag)
    }

    private func bindTabelViewSelection(){
        currencyRatesTable
            .rx
            .itemSelected
            .subscribe(onNext:{ [weak self] index in
                guard let self = self else {return}
                guard let presenter = self.presenter else {return}
                let viewModel = presenter.viewModel
                if viewModel.dataSource.value.indices.contains(index.row) {
                    let currency = viewModel.dataSource.value[index.row]
                    viewModel.selectedCurrency.accept(currency)
                }
            }).disposed(by: disposeBag)
    }
}
