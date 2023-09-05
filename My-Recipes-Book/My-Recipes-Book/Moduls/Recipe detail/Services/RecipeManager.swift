//
//  RecipeManager.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 28.08.2023.
//

import Foundation

// MARK: - NetworkError
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

// MARK: - Link
enum Link: String {
    case recipeURL = "https://api.spoonacular.com/recipes/324694/information?apiKey=5ae93d38d7cf4f94912465f822fa82eb&includeNutrition=false"
    case ingredientImageURL = "https://spoonacular.com/cdn/ingredients_100x100/"
}

// MARK: - RecipeManager
class RecipeManager {
    static let shared = RecipeManager()
    
    private init() {}
    
    // MARK: - Public Methods
    func fetch(from url: String, completion: @escaping (Result<Recipe,NetworkError> ) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let recipe = try JSONDecoder().decode(Recipe.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(recipe))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchImage(from url: String, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
            
        }
        
        fetchImageData(from: url, completion: completion)
    }
    
    func fetchIngredientImage(from name: String, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: "\(Link.ingredientImageURL.rawValue)\(name)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        fetchImageData(from: url, completion: completion)
    }
    
    // MARK: - Private Methods
    private func fetchImageData(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
}
