//
//  RecipeModel.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 03.09.2023.
//

import Foundation
// MARK: - RecipeData
struct RecipeData: Codable {
    let results: [Results]
}

// MARK: - Result
struct Results: Codable {
    
    let cookingMinutes  : Int
    let creditsText, sourceName: String
    let id: Int
    let title: String
    let readyInMinutes: Int
    let image: String

}


//
//  RecipeJSONModel.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 03.09.2023.
//

//import Foundation
//// MARK: - RecipeData
//struct RecipeData: Codable {
//    let results: [Results]
//    //let offset, number, totalResults: Int
//}
//
//// MARK: - Result
//struct Result: Codable {
////    let vegetarian, vegan, glutenFree, dairyFree: Bool
////    let veryHealthy, cheap, veryPopular, sustainable: Bool
////    let lowFodmap: Bool
////    let weightWatcherSmartPoints: Int
//    let gaps: String
//    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int
//    let creditsText, sourceName: String
////    let pricePerServing: Double
//    let id: Int
//    let title: String
//    let readyInMinutes, servings: Int
////    let sourceURL: String
//    let image: String
////    let imageType, summary: String
////    let cuisines, dishTypes, diets, occasions: [String]
////    let analyzedInstructions: [AnalyzedInstruction]
////    let spoonacularSourceURL: String
////    let license: String?
//
////    enum CodingKeys: String, CodingKey {
////        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, sourceName, pricePerServing, id, title, readyInMinutes, servings
////        case sourceURL = "sourceUrl"
////        case image, imageType, summary, cuisines, dishTypes, diets, occasions, analyzedInstructions
////        case spoonacularSourceURL = "spoonacularSourceUrl"
////        case license
////    }
//}
//
////// MARK: - AnalyzedInstruction
////struct AnalyzedInstruction: Codable {
////    let name: String
////    let steps: [Step]
////}
//
////// MARK: - Step
////struct Step: Codable {
////    let number: Int
////    let step: String
////    let ingredients, equipment: [Ent]
////    let length: Length?
////}
//
//// MARK: - Ent
//struct Ent: Codable {
//    let id: Int
//    let name, localizedName, image: String
//}
//
////// MARK: - Length
////struct Length: Codable {
////    let number: Int
////    let unit: Unit
//}
//
//enum Unit: String, Codable {
//    case minutes = "minutes"
//}
