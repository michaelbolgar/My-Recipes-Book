//
//  RecipeEndPoint.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 01.09.2023.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]

enum RecipeAPI {
    case trendingRecipesData
}

extension RecipeAPI: EndPointType {
    var requestParameters: Parameters {
        switch self {
        case .trendingRecipesData:
            return [
                "sort": "popularity",
                "addRecipeInformation": true,
                "fillIngredients": true
            ]
        }
    }

    var baseURL: URL {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/") else { fatalError("Wrong URL")}
        return url
    }

    var path: String {
        return "complexSearch"
    }

    var httpMethod: HTTPMethod {
        .get
    }

    var httpHead: HTTPHeaders? {
        return [
            "Content-Type": " application/json",
            "x-api-key": "5ae93d38d7cf4f94912465f822fa82eb"
        ]
    }
}
