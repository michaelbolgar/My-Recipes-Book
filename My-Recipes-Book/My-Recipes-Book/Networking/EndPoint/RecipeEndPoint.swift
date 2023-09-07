//
//  RecipeEndPoint.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 01.09.2023.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]

//Here you need to add what kind of data you want to get
//(In case the right type was not found)
enum RecipeAPI {
//For example, this case means that I want to get data for the "Trending" module
    case trendingNowScreen
    case trendingNowMainScreen
    case popularItems(type: String)
    case recentRecipe
    case recipeDetail(recipeID: String)
}

extension RecipeAPI: EndPointType {
//specify what parameters your request type should have.
    var requestParameters: Parameters {
        switch self {
        case .trendingNowScreen:
            return [
                "sort": "popularity",
                "addRecipeInformation": true,
                "fillIngredients": true
            ]
        case .trendingNowMainScreen:
            return [
                "sort": "popularity",
                "number": 5,
                "fillIngredients": false,
                "includeNutrition": false,
                "instructionsRequired": false,
                "addRecipeInformation": true,
                "addRecipeNutrition": false
            ]
        case .popularItems(let type):
            return [
                "number": 5,
                "type": type,
                "fillIngredients": false,
                "includeNutrition": false,
                "instructionsRequired": false,
                "addRecipeInformation": true,
                "addRecipeNutrition": false
            ]
        case .recentRecipe:
            return [
                "sort": "time",
                "number": 5,
                "fillIngredients": false,
                "includeNutrition": false,
                "instructionsRequired": false,
                "addRecipeInformation": true,
                "addRecipeNutrition": false
            ]
        case .recipeDetail:
            return [
                "includeNutrition": false
            ]
        }
    }

    var baseURL: URL {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/") else { fatalError("Wrong URL") }
        return url
    }

    var path: String {
        switch self {
        case .recipeDetail(let id) :
            return "\(id)/information"
        default:
            return "complexSearch"
        }
    }

    var httpMethod: HTTPMethod {
        .get
    }

    var httpHead: HTTPHeaders? {
        return [
            "Content-Type": "application/json",
            "x-api-key": "5ae93d38d7cf4f94912465f822fa82eb"
        ]
    }
}
