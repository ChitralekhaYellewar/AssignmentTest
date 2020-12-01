//
//  CountryCellViewModel.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import UIKit

//MARK:- CountryCellViewModel protocol
protocol CountryCellViewModel {
    var country: Country? { get }
    var countryImg: String? { get }
    var countryName: String? { get }
    var countryRegion: String? { get }
    
    var countryCode: String? { get }
    var countryNativeName: String? { get }
    var countryLatitude: String? { get }
    var countryLongitude: String? { get }
    var countryCurrencyName: String? { get }
    var countryCurrencySymbol: String? { get }
}

extension Country: CountryCellViewModel {
    var country: Country? {
        return self
    }
    
    var countryImg: String? {
        return flagImg
    }
    
    var countryName: String? {
        return name
    }
    
    var countryRegion: String? {
        return region
    }
    
    var countryNativeName: String? {
        return nativeName
    }
    
    var countryLatitude: String? {
        return latitude
    }
    
    var countryLongitude: String? {
        return longitude
    }
    
    var countryCurrencyName: String? {
        return currencyName
    }
    
    var countryCurrencySymbol: String? {
        return currencySymbol
    }
    
    var countryCode: String? {
        return code
    }
}
