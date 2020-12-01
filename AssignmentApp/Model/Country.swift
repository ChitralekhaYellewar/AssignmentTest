//
//  Country.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import Foundation

//MARK:- Country Data Response Model
struct CountriesDataResponse: Codable {
    var Response: [Country]
}

class Country: Codable {
    var Name: String?
    var Region: String?
    var FlagPng: String?
    
    var Alpha2Code: String?
    var NativeName: String?
    var Latitude: String?
    var Longitude: String?
    var CurrencyName: String?
    var CurrencySymbol: String?
    
    convenience init(name: String?,
                     region: String?,
                     flagPng: String?,
                     code: String?,
                     nativeName: String?,
                     lat: String?,
                     long: String?,
                     currencyName: String?,
                     currencySymbol: String?) {
        self.init()
        Name = name
        Region = region
        FlagPng = flagPng
        Alpha2Code = code
        NativeName = nativeName
        Latitude = lat
        Longitude = long
        CurrencyName = currencyName
        CurrencySymbol = currencySymbol
    }
}
