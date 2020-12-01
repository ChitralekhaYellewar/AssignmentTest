//
//  CountryTableViewCell.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import UIKit
import SDWebImage

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    
    //MARK:- Country tableView Cell viewModel.
    var viewModel : CountryCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    //MARK:- bind view model data to uitableview cell.
    func bindViewModel() {
        guard let flagImage = viewModel?.countryImg, let imgUrl = URL(string: flagImage) else {
            countryImage.image = UIImage(named: Constants.General.NO_IMAGE)
            return
        }
        countryImage.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: Constants.General.NO_IMAGE))
        countryName.text = viewModel?.countryName
        countryRegion.text = viewModel?.countryRegion
    }
}

