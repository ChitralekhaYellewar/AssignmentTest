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
    
    var code: String? { get }
    var nativeName: String? { get }
    var latitude: String? { get }
    var longitude: String? { get }
    var currencyName: String? { get }
    var currencySymbol: String? { get }
}

extension Country: CountryCellViewModel {
    var code: String? {
        return Alpha2Code
    }
    
    var nativeName: String? {
        return NativeName
    }
    
    var latitude: String? {
        return Latitude
    }
    
    var longitude: String? {
        return Longitude
    }
    
    var currencyName: String? {
        return CurrencyName
    }
    
    var currencySymbol: String? {
        return CurrencySymbol
    }
    
    var country: Country? {
        return self
    }
    
    var countryImg: String? {
        return FlagPng
    }
    
    var countryName: String? {
        return Name
    }
    
    var countryRegion: String? {
        return Region
    }
}
