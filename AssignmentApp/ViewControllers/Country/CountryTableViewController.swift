//
//  CountryTableViewController.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import UIKit

class CountryTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CountryViewModel()
    
    override func viewDidLoad() {
        title = Constants.General.VIEW_TITLE
        bindViewModel()
        viewModel.getCountries()
    }
    
    //MARK: - bind ViewModel data.
    func bindViewModel() {
        viewModel.countryCells.bindAndFire() { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
}
