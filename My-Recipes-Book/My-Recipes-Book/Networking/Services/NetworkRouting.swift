//
//  NetworkRouting.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 01.09.2023.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

class NetworkRouter {
    private var task: URLSessionTask?
    
    func sendRequest(to urlRequest: URLRequest?, completion: @escaping NetworkRouterCompletion) {
        guard let urlRequest = urlRequest else { return }
        let session = URLSession.shared
        
        task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            completion(data, response, error)
        })
        
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}
