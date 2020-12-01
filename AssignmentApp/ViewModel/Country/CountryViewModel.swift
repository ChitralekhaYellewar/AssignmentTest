//
//  CountryViewModel.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import UIKit
import MBProgressHUD

class CountryViewModel {
    
    //MARK:- enum Country tableView Cell Type.
    enum CountryTableViewCellType {
        case normal(cellViewModel: CountryCellViewModel)
        case error(message: String)
        case empty
    }
    
    let countryCells = Bindable([CountryTableViewCellType]())
    
    var countryDataResponse = CountriesDataResponse(Response:[])

    let appServerClient: AppServerClient
    
    //MARK:- Country View Model initialiser (Dependency Injection).
    init(_ appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    //MARK:- get Country data from App Server Client.
    func getCountries() {
        if appServerClient.isNetworkReachable() {
            AppUtils.showProgressIndicator()
            appServerClient.getCountriesData(Constants.URLs.COUNTRY_URL) { [weak self] result in
                AppUtils.hideProgressIndicator()
                switch result {
                case .success(let country):
                    guard country.Response.count > 0 else {
                        self?.countryCells.value = [.empty]
                        return
                    }
                    self?.countryDataResponse = country
                    
                    self?.countryCells.value = country.Response.compactMap {
                        CountryTableViewCellType.normal(cellViewModel: $0 as CountryCellViewModel)
                    }
                    
                case .failure(let error):
                    self?.countryCells.value = [.error(message: error?.getErrorMessage() ?? Constants.ERRORS.NO_INTERNET)]
                }
            }
        } else {
            self.countryCells.value = [.error(message: Constants.ERRORS.NO_INTERNET)]
        }
    }
}

//MARK:- get Country data failure reason messages.
fileprivate extension AppServerClient.GetCountryDataFailure {
    func getErrorMessage() -> String? {
        switch self {
        case .badGateway:
            return Constants.ERRORS.BAD_GATEWAY
        case .notFound:
            return Constants.ERRORS.NOT_FOUND
        }
    }
}

