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
    let readyInMinutes: Int?
    let title: String?
    let image: String?
    let id: Int?
    let creditsText, sourceName: String?
    let extendedIngredients: [Ingredient]?
    let instructions: String?
    let analyzedInstructions: [AnalyzedInstructions]?
}

struct ExtendedIngredients: Decodable {
    let id: Int?
}

struct Ingredient: Codable {
    let id: Int
    let name: String
    let amount: Double
    let unit: String
    let image: String
}

struct Step: Codable {
    let number: Int
    let step: String
}

struct AnalyzedInstructions: Codable {
    let steps: [Step]
}
