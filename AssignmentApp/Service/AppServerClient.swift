//
//  AppServerClient.swift
//  AssignmentApp
//
//  Created by Chitralekha Yellewar on 01/12/20.
//

import Alamofire
import MBProgressHUD

class AppServerClient {
    //MARK:- Server call failure enum.
    enum GetCountryDataFailure: Int, Error {
        case notFound = 404
        case badGateway = 502
    }
    
    //MARK:- Server call Result enum.
    enum Result<T, U: Error> {
        case success(payload: T)
        case failure(U?)
    }
    
    typealias GetCountryResult = Result<CountriesDataResponse, GetCountryDataFailure>
    typealias GetCountryCompletionHandler = (_ result: GetCountryResult) -> Void
    
    //MARK:- get Country data from API.
    func getCountriesData(_ url: String, completion: @escaping GetCountryCompletionHandler) {
        AF.request(url).response { response in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else {
                        completion(.failure(nil))
                        return
                    }
                    let country = try JSONDecoder().decode(CountriesDataResponse.self, from: data)
                    completion(.success(payload: country))
                } catch {
                    completion(.failure(nil))
                }
            case .failure:
                if let statusCode = response.response?.statusCode,
                   let status = GetCountryDataFailure(rawValue: statusCode) {
                    completion(.failure(status))
                }
                completion(.failure(nil))
            }
        }
    }
    
    //MARK:- check internet connectivity.
    func isNetworkReachable() -> Bool {
        return NetworkReachabilityManager(host: Constants.General.HOST_NAME)!.isReachable
    }
}
