//
//  MockContent.swift
//  AssignmentAppTests
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import Foundation
@testable import AssignmentApp

extension Country {
    static func with(name: String = "",
                     region: String = "",
                     flagPng: String = "",
                     code: String = "",
                     nativeName: String = "",
                     lat: String = "",
                     long: String = "",
                     currencyName: String = "",
                     currencySymbol: String = "") -> Country {
        return Country(name: name, region: region, flagPng: flagPng, code: code, nativeName: nativeName, lat: lat, long: long, currencyName: currencyName, currencySymbol: currencySymbol)
    }
}
