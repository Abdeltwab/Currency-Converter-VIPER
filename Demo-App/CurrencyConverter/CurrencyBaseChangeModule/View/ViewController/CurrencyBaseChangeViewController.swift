//
//
//  Created Abdeltwab on 12/21/20.
//
//12/21/20.

import UIKit
import RxSwift
import RxCocoa

class CurrencyBaseChangeViewController: UIViewController, CurrencyBaseChangeViewControllerProtocol, UISearchBarDelegate {
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var customNavigationItem: UINavigationItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    // MARK: - Attributes
	var presenter: CurrencyBaseChangePresenterProtocol?
    let disposeBag = DisposeBag()
     
    var selectedCurrency:Currency!
    var sortedFirstLetters = [String]()
    
    struct UIElements {
        static let rowHeight = CGFloat(50)
        static let sectionHeight = CGFloat(30)
        static let separatorColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4)
    }

    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach()
//        initAttributes()
//        setupUI()
//        configureBinding()
    }
    
//    // MARK: - UIStatusBarStyle
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    
//    // MARK: - Attributes initialization
//    func initAttributes() {
//        selectedCountry = self.presenter?.viewModel
//            .selectedCountryCode.value
//    }
//    
//    // MARK: - Handle UI
//    private func setupUI() {
//        searchBar.delegate = self
//        searchBar.textField.backgroundColor = UIColor.black
//        searchBar.textField.textColor = .white
//        searchBar.placeholder = presenter?.viewModel.generalLocalizedString.search
//        handleNavigationBar()
//        setTableViewUI()
//        setErrorUI()
//        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
//    }
//    
//    private func handleNavigationBar() {
//        setNavigationBarTitleUI()
//        setCancelBarButtonUI()
//        setDoneBarButtonUI()
//    }
//    
//    private func setNavigationBarTitleUI() {
//         guard let selectCountryLocalization = self.presenter?.viewModel.selectCountryLocalizationString else { return }
//        self.customNavigationItem.title = selectCountryLocalization.selectCountryCodeScreenTitle
//    }
//    
//    private func setCancelBarButtonUI() {
//        guard let generalLocalization = self.presenter?.viewModel.generalLocalizedString else { return }
//        cancelBarButton.tintColor = UIColor.cherryRed
//        cancelBarButton.title = generalLocalization.cancel
//    }
//    
//    private func setDoneBarButtonUI() {
//        guard let generalLocalization = self.presenter?.viewModel.generalLocalizedString else { return }
//        doneBarButton.tintColor = UIColor.cherryRed
//        doneBarButton.title = generalLocalization.done
//    }
//    
//    private func setErrorUI() {
//        guard let viewModel = presenter?.viewModel else {return}
//        errorLabel.text = viewModel.selectCountryLocalizationString.resultNotFound
//        errorLabel.isHidden = true
//    }
//    
//    private func setTableViewUI() {
//        tableView.separatorColor = UIElements.separatorColor
//        tableView.bounces = false
//        tableView.backgroundColor = nil
//        tableView.removeFooterLines()
//        tableView.layer.masksToBounds = true
//        
//        //Side index Menu
//        tableView.sectionIndexBackgroundColor = .clear
//        tableView.sectionIndexTrackingBackgroundColor = .clear
//        tableView.sectionIndexColor = .cherryRed
//    }
//    
//    // MARK: - Actions
//    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
//        self.presenter?.viewModel.selectedCountryCode
//            .accept(selectedCountry)
//        self.presenter?.back()
//    }
//    
//    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
//        self.presenter?.back()
//    }
//    
//    // MARK: - Binding
//    private func configureBinding() {
//        configureTableViewWithDataSource()
//        handleItemSelection()
//        handleFetchTextFromSearchBar()
//        scrollToSelectedCountry()
//        handleCaseNoResultFound()
//    }
//    
//    func configureTableViewWithDataSource() {
//        
//        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(configureCell: { _, tableView, indexPath, item in
//            
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CountryTableViewCell.self),
//                                                     for: indexPath) as? CountryTableViewCell ?? CountryTableViewCell()
//            cell.displayCellData(countryName: item.name,
//                                 countryFlag: item.flagLetter, dialCode: item.dialCode)
//            
//            return cell
//        },titleForHeaderInSection: { ds, raw in
//            return ds.sectionModels[raw].header
//        })
//        
//        //side Indecies
//        dataSource.sectionIndexTitles = { _ in
//             return self.presenter?.viewModel.countriesSections.value.map { $0.header }
//        }
//        
//        dataSource.sectionForSectionIndexTitle = { _, title, index in
//            
//            self.tableView.scrollToRow(at: IndexPath(row: 0, section: index), at: .top , animated: false)
//            let sortedHeader = self.presenter?.viewModel.countriesSections.value.map { $0.header }
//            
//            return sortedHeader!.firstIndex(of: title)!
//            }
//        
//        //bind DataSource
//        self.presenter?.viewModel.filtedCountriesSection
//            .bind(to: self.tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
//        
//        tableView.rx.setDelegate(self)
//            .disposed(by: disposeBag)
//        
//    }
//    
//    private func handleCaseNoResultFound() {
//        guard let viewModel = presenter?.viewModel else {return}
//         viewModel.filtedCountriesSection
//            .subscribe(onNext: { [weak self] dataSource in
//                guard let self = self else {return}
//                if dataSource.isEmpty {
//                    self.tableView.isHidden = true
//                    self.errorLabel.isHidden = false
//                } else if self.tableView.isHidden && !dataSource.isEmpty {
//                    self.tableView.isHidden = false
//                    self.errorLabel.isHidden = true
//                }
//            }).disposed(by: disposeBag)
//    }
//    
//    private func handleFetchTextFromSearchBar() {
//        guard let viewModel = presenter?.viewModel else { return }
//        searchBar.rx.text
//            .orEmpty
//            .bind(to: viewModel.queryString)
//            .disposed(by: disposeBag)
//    }
//    
//    private func handleItemSelection() {
//        tableView.rx.modelSelected(Country.self)
//            .observeOn(MainScheduler.instance)
//            .subscribe (onNext: { [weak self] countryModel in
//                     self?.selectedCountry = countryModel
//            }).disposed(by: disposeBag)
//    }
//    
//    // MARK: - Scroll To selected country
//    private func scrollToSelectedCountry() {
//        guard let viewModel = presenter?.viewModel else { return }
//        viewModel.selectedCountryIndexInSection
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext: { [weak self] section, raw in
//                guard let self = self else { return }
//                guard let section = section else { return }
//                guard let raw = raw else { return }
//
//                if self.tableView.numberOfRows(inSection: section) > raw {
//                    let indexP = IndexPath(row: raw, section: section)
//                    self.tableView.selectRow(at: indexP, animated: false, scrollPosition: .top)
//                    let rawSelected = raw > 0 ? raw - 1 : raw
//                    self.tableView.scrollToRow(at: IndexPath(row: rawSelected, section: section), at: .top, animated: false)
//                }
//                
//        }).disposed(by: disposeBag)
//    }
//    
//}
//
//// MARK: - Search extension
//extension CountryCodeViewController: UISearchBarDelegate, UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let viewModel = presenter?.viewModel else { return }
//        searchController.searchBar.rx.text
//            .orEmpty
//            .bind(to: viewModel.queryString)
//            .disposed(by: disposeBag)
//    }
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
//}
//
//// MARK: - TableView Extension
//extension CountryCodeViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return UIElements.sectionHeight
//    }
//    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        let header = view as? UITableViewHeaderFooterView ?? UITableViewHeaderFooterView()
//        header.backgroundView?.backgroundColor = .greyishBrown
//        header.textLabel?.textColor = .white
//    }
//}
//
//// MARK: - Country Extension
//extension Country {
//    
//    var titleFirstLetter: String {
//        return String(self.name[self.name.startIndex]).uppercased()
//    }
}

// MARK: - abdo Must Alocate to TooliEngine
extension UITableView {
    func removeFooterLines() {
        self.tableFooterView = UIView()
    }
}
