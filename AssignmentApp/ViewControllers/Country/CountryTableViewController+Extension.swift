//
//  CountryTableViewController+Extension.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import UIKit

extension CountryTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countryCells.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.countryCells.value[indexPath.row] {
        case .normal(let viewModel):
            guard let countryCell = tableView.dequeueReusableCell(withIdentifier: Constants.TABLEVIEWConstants.CELL_IDENTIFIER) as? CountryTableViewCell else {
                return UITableViewCell()
            }
            countryCell.viewModel = viewModel

            return countryCell
        case .error(let error):
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = error
            return cell
        case .empty:
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = Constants.ERRORS.NO_DATA
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.CONSTRAINTS.TABLEVIEW_CELL_HEIGHT)
    }
}
