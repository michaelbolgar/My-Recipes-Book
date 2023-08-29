//
//  Recipe.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 28.08.2023.
//

import Foundation

struct Recipe: Codable {
    let id: Int
    let title: String
    let image: String
    let extendedIngredients: [Ingredient]

}

struct Ingredient: Codable {
    let id: Int
    let name: String
    let amount: Double
    let unit: String
    let image: String
}
