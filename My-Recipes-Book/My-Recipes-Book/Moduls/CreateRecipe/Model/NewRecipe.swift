//
//  NewRecipe.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import Foundation

struct NewRecipe {
    var image: Data?
    var name: String
    var serves: Int
    var cookTime: String
    var ingrediets: [NewIngredient]
}

struct NewIngredient {
    var name: String
    var quantity: Int
}
