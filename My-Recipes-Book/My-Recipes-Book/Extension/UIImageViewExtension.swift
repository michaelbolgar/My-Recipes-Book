//
//  UIImageViewExtension.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 28.08.2023.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageFromURL(_ URLString: String, placeHolder: UIImage?) {
        
        self.image = nil
        //If imageurl's imagename has space then this line going to work for this
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
