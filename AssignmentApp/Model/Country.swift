//
//  Country.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import Foundation
import RealmSwift

//MARK:- Country Data Response Model
struct CountriesDataResponse: Codable {
    var Response: [Country]
}

class Country: Object, Codable {
    @objc dynamic var name: String?
    @objc dynamic var region: String?
    @objc dynamic var flagImg: String?
    
    @objc dynamic var code: String?
    @objc dynamic var nativeName: String?
    @objc dynamic var latitude: String?
    @objc dynamic var longitude: String?
    @objc dynamic var currencyName: String?
    @objc dynamic var currencySymbol: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case region = "Region"
        case flagImg = "FlagPng"
        case code = "Alpha2Code"
        case nativeName = "NativeName"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case currencyName = "CurrencyName"
        case currencySymbol = "CurrencySymbol"
    }
    
    func decode(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.region = try container.decode(String.self, forKey: .region)
        self.flagImg = try container.decode(String.self, forKey: .flagImg)
        self.code = try container.decode(String.self, forKey: .code)
        self.nativeName = try container.decode(String.self, forKey: .nativeName)
    }
    
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
        self.name = name
        self.region = region
        self.flagImg = flagPng
        self.code = code
        self.nativeName = nativeName
        self.latitude = lat
        self.longitude = long
        self.currencyName = currencyName
        self.currencySymbol = currencySymbol
    }
}
