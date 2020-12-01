//
//  CountryTableViewViewModelTests.swift
//  AssignmentAppTests
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import XCTest
@testable import AssignmentApp

class CountryTableViewViewModelTests: XCTestCase {

    // MARK: - getCountryData
    func testNormalTeamMemberCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.countryResult = .success(payload: CountriesDataResponse(Response: [Country.with()]))

        let viewModel = CountryViewModel(appServerClient)
        viewModel.getCountries()

        guard case .some(.normal(_)) = viewModel.countryCells.value.first else {
            XCTFail()
            return
        }
    }

    func testEmptyTeamMemberCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.countryResult = .success(payload: CountriesDataResponse(Response: []))

        let viewModel = CountryViewModel(appServerClient)
        viewModel.getCountries()

        guard case .some(.empty) = viewModel.countryCells.value.first else {
            XCTFail()
            return
        }
    }

    func testErrorTeamMemberCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.countryResult = .failure(AppServerClient.GetCountryDataFailure.notFound)

        let viewModel = CountryViewModel(appServerClient)
        viewModel.getCountries()

        guard case .some(.error(_)) = viewModel.countryCells.value.first else {
            XCTFail()
            return
        }
    }

}

private final class MockAppServerClient: AppServerClient {
    var countryResult: AppServerClient.GetCountryResult?

    override func getCountriesData(_ url: String, completion: @escaping AppServerClient.GetCountryCompletionHandler) {
        completion(countryResult!)
    }
}
