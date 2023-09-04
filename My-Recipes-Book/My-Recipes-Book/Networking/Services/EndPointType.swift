//
//  EndPointType.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 01.09.2023.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpHead: HTTPHeaders? { get }
    var requestParameters: Parameters { get }
}

enum HTTPMethod: String {
    case get = "GET"
}
