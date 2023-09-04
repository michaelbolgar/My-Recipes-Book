//
//  DataBase.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 04.09.2023.
//

import Foundation
import UIKit

class DataBase {
    static let shared = DataBase()
    private init() {}
    
    let creatorImagesArray = [UIImage(named: "images"),
                              UIImage(named: "images-2"),
                              UIImage(named: "images-3"),
                              UIImage(named: "images-4"),
                              UIImage(named: "images-5"),
                              UIImage(named: "images-6"),
                              UIImage(named: "images-7"),
                              UIImage(named: "images-8"),
                              UIImage(named: "images-9"),
                              UIImage(named: "images-10"),
                              UIImage(named: "images-11")]
}
