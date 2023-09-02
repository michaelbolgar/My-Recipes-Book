//
//  NetworkManagment.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 01.09.2023.
//

/*
 A note in case I forget the principle of operation.
 First of all, the request configuration (endPoint) is set in the Recipe API.
 After that, based on the configuration, RequestBuilder collects the request into one.
 The collected request is transmitted to the Router, sent to the server and, depending on the response (Status Code), decodes the data or outputs an error message.
*/

import Foundation

class NetworkManager {
    private var requestBuilder: RequestBuilder?
    private let networkRouter: NetworkRouter?
    
    init() {
        requestBuilder = RequestBuilder()
        networkRouter = NetworkRouter()
    }
    
    func getRecipesData(with endPoint: EndPointType, completion: @escaping (_ recipes: TrendingScreenDataModel?, _ error: String?) -> Void) {
        requestBuilder?.assignEndPoint(with: endPoint)
        let assembledRequest = requestBuilder?.buildRequest()
        networkRouter?.sendRequest(to: assembledRequest, completion: { data, response, error in
            if error != nil {
                completion(nil, "Check your internet connection")
            }
            //the basic logic of this function relies on the URL response.
            //Further actions depend on which statusCode will come
            if let response = response as? HTTPURLResponse {
                let result = self.hundleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(TrendingScreenDataModel.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        })
    }
    
    fileprivate func hundleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    // interpreting Xcode error messages in a more understandable way
    enum NetworkResponse: String {
        case success
        case authenticationError = "You need to be authenticated first"
        case badRequest = "Bad request"
        case outdated = "Your URL request is outdated"
        case failed = "Network request failed"
        case noData = "Response returned with no data to decode"
        case unableToDecode = "We could not decode the response"
    }
    
    enum Result<String> {
        case success
        case failure(String)
    }
}
