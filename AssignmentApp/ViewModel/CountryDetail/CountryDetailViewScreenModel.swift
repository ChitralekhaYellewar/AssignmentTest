//
//  CountryDetailViewScreenModel.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import Foundation

protocol CountryDetailViewModel {
    var countryViewModel: CountryCellViewModel? { get }
}

class CountryDetailViewScreenModel: CountryDetailViewModel {
    var countryViewModel: CountryCellViewModel?
    
    init(countryVM: CountryCellViewModel) {
        self.countryViewModel = countryVM
    }
}
