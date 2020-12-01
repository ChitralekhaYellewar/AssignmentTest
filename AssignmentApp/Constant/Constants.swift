//
//  Constants.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import Foundation

struct Constants {
    struct General {
        private init() {}
        static let VIEW_TITLE = "Countries"
        static let DETAIL_VIEW_TITLE = "Country Details: "
        static let NO_IMAGE = "no-image"
        static let HOST_NAME = "www.apple.com"
    }
    
    struct URLs {
        private init() {}
        static let COUNTRY_URL = "http://countryapi.gear.host/v1/Country/getCountries"
    }
    
    struct ERRORS {
        private init() {}
        static let NOT_FOUND = "Could not complete request, please try again."
        static let BAD_GATEWAY = "Server is not working..."
        static let NO_DATA = "No data available"
        static let NO_INTERNET = "Loading failed check internet connection"
    }
    
    //MARK: TableView cell identifiers Constants
    struct TABLEVIEWConstants {
        private init() {}
        static let CELL_IDENTIFIER = "countryCell"
    }
    
    struct CONSTRAINTS {
        private init() {}
        static let TABLEVIEW_CELL_HEIGHT = 100
    }
}

