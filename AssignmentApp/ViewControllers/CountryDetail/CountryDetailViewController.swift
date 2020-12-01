//
//  CountryDetailViewController.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    @IBOutlet weak var countryDetailImage: UIImageView!
    @IBOutlet weak var countryDetailName: UILabel!
    @IBOutlet weak var countryDetailRegion: UILabel!
    @IBOutlet weak var countryDetailCode: UILabel!
    @IBOutlet weak var countryDetailNativeName: UILabel!
    @IBOutlet weak var countryDetailLatitude: UILabel!
    @IBOutlet weak var countryDetailLongitude: UILabel!
    @IBOutlet weak var countryDetailCurrencyName: UILabel!
    @IBOutlet weak var countryDetailCurrencySymbol: UILabel!
    
    var detailContent: CountryDetailViewScreenModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetailView()
    }
    
    func configureDetailView() {
        if let content = detailContent?.countryViewModel {
            guard let flagImage = content.countryImg, let imgUrl = URL(string: flagImage) else {
                countryDetailImage.image = UIImage(named: Constants.General.NO_IMAGE)
                return
            }
            countryDetailImage.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: Constants.General.NO_IMAGE))
            countryDetailName.text = content.countryName
            countryDetailRegion.text = content.countryRegion
            countryDetailCode.text = content.code
            countryDetailNativeName.text = content.nativeName
            countryDetailLatitude.text = content.latitude
            countryDetailLongitude.text = content.longitude
            countryDetailCurrencyName.text = content.currencyName
            countryDetailCurrencySymbol.text = content.currencySymbol
        }
    }
}
