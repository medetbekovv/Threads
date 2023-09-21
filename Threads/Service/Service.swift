//
//  Service.swift
//  Threads
//
//  Created by Sultan on 6/9/23.
//

import UIKit


class ApiService {
    
    let baseUrl = "http://138.68.88.207/"
    
    
    func post(endpoint: String, parameters: [String : Any], completion : @escaping(Result<Data, Error>) -> Void) {
        guard let url = URL(string: baseUrl + endpoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Invalid response"])
                print("Invalid response")
                completion(.failure(error))
                return
            }
            
            let statusCode = httpResponse.statusCode
            if 200...299 ~= statusCode {
                if let data = data {
                    completion(.success(data))
                } else {
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Empty response data"])
                    print("Empty response data")
                    completion(.failure(error))
                }
            } else {
                let error  = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Request failed with status status status code: \(statusCode)"])
                print("Request failed with status code: \(statusCode)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    func postToken(enpoid: String, parameters: [String : Any], bearerToken : String, completion : @escaping(Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: baseUrl + enpoid) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Invalid response"])
                print("Invalid response")
                completion(.failure(error))
                return
            }
            
            let statusCode = httpResponse.statusCode
            if 200...299 ~= statusCode {
                if let data = data {
                    completion(.success(data))
                } else {
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Empty response data"])
                    print("Empty response data")
                    completion(.failure(error))
                }
            } else {
                let error  = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Request failed with status status status code: \(statusCode)"])
                print("Request failed with status code: \(statusCode)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
