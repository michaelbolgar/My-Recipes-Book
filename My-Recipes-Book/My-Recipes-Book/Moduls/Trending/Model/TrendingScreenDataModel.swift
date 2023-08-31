//
//  TrendingScreenDataModel.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 29.08.2023.
//

import Foundation

struct TrendingScreenDataModel: Decodable {
    let results: [TrendingRecipeData]?
}

struct TrendingRecipeData: Decodable {
    let cookingMinutes: Int?
    let extendedIngredients: [TrendingExtendedIngredients]
    let title: String?
    let image: String? 
}

struct TrendingExtendedIngredients: Decodable {
    let id: Int?
}
