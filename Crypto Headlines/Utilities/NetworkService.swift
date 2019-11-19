//
//  DataService.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//


import SwiftUI
import Combine

class NetworkService: ObservableObject {
    
    static let shared = NetworkService()
    
    // MARK: GENERIC GET REQUEST METHOD
    func fetchData<T: Decodable>(urlString: String, parameters: [String: String]? = nil, completion: @escaping (T?, Error?) -> ()) {
        var components = URLComponents(string: urlString)!
        if let parameters = parameters {
            // Setup parameters
            components.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
            
        }
        // Clean up the url
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        // Create a URLRequest Object from URLComponents
        let request = URLRequest(url: components.url!)
        print(request)
        
        // Create a data task
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Check if there are errors
            if let error = error {
                print("Server Error: \(error)")
                completion(nil, error)
            }

            guard let data = data else { return }
            // Decode JSON and parse it nicely into one of the model objects
            do {
                // NOTE:  uncomment code for debugging
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
//                    print("JSON GET:\n\(String(describing: json))")
//                } catch let error {
//                    print("SERVER ERROR: \(error)")
//                }
                
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(object, nil)
                }
            } catch let jsonError {
                print("Failed to serialize json: \(jsonError)")
                completion(nil, jsonError)
            }
        }.resume() // call the server!
        
    }
    
    // MARK: POST REQUEST METHOD
    func createPost(url: String, params: [String: String]?, completion: @escaping (Data?, Error?) -> ()) {
        guard let url = URL(string: url) else { return }

        var components = URLComponents(string: "\(url)")!
        if let parameters = params {
            // Setup parameters
            components.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
            
        }
        // Clean up the url
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")

        // Create a URLRequest Object from URLComponents
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "POST"

        // let params = ["title": title, "postBody": body]
        do {
            let data = try JSONSerialization.data(withJSONObject: params!, options: .init())

            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            print(urlRequest)
            URLSession.shared.dataTask(with: urlRequest) { (data, resp, err) in
                // check error
                guard let data = data else { return }

                completion(data,nil)

                }.resume()
        } catch {
            completion(nil,error)
        }
    }
}
