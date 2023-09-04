//
//  TrendingScreenDataModel.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 29.08.2023.
//

import Foundation

struct RecipeDataModelForCell: Decodable {
    let results: [Results]?
}

struct Results: Decodable {
    let cookingMinutes: Int?
    let extendedIngredients: [ExtendedIngredients]?
    let title: String?
    let image: String?
    let id: Int?
    let creditsText, sourceName: String?
}

struct ExtendedIngredients: Decodable {
    let id: Int?
}

