//
//  CountriesViewController.swift
//  CurrencyConverter
//
//  Created by Антон Дубино on 08.10.2022.
//

import UIKit
import RxSwift
import RxCocoa

class CountriesViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let db = DisposeBag()
    var viewModel: CountriesViewControllerViewModelType? = CountriesViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CountriesTableViewCell", bundle: nil), forCellReuseIdentifier: "Country")
        bind()
        setSearchBar(searchBar, self.navigationController!)
        searchBarTextDidBeginEditing(searchBar)
        searchBarCancelButtonClicked(searchBar)
    }
   
// Setting search bar
    
    func setSearchBar(_ sb: UISearchBar, _ nc: UINavigationController)
    {
        nc.navigationBar.prefersLargeTitles = true
        sb.placeholder = "Поиск"
        sb.setValue("Отмена", forKey: "cancelButtonText")
        sb.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ sb: UISearchBar) {
            sb.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ sb: UISearchBar) {
            sb.showsCancelButton = false
            sb.text = ""
            sb.resignFirstResponder()
    }

// Binding
    
    func bind() {
        searchBar.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map({
                query in
                self.viewModel!.allCountries().value.filter({
                    country in
                    query.isEmpty || country.value.lowercased().contains(query.lowercased())
                })
            })
            .filter { !$0.isEmpty } 
            .bind(to: tableView.rx.items(cellIdentifier: "Country", cellType: CountriesTableViewCell.self)) {
                (tv, tableViewItem, cell) in
                cell.initCell(data: tableViewItem)
            }
            .disposed(by: db)
            
        tableView.rx.modelSelected(Country.self)
            .subscribe { object in
                if self.viewModel?.countryNumber == 1 {
                    self.viewModel?.saveFirstData(object)
                } else {
                    self.viewModel?.saveSecondData(object)
                }
                self.navigationController?.popViewController(animated: true)
            }
            .disposed(by: db)
    }
 
// Button actions
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
