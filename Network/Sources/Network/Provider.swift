//
//  Provider.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation

open class Provider {
    
    init() {}
    
    public func request(
        target: API,
        completion: ((Result<(Data, URLResponse), Error>) -> Void)?
    ) {
        var components: URLComponents? = URLComponents(string: target.url)
        components?.queryItems = target.parameters?.map { key, value in
            URLQueryItem(name: key, value: String(describing: value))
        }
        
        guard let url = components?.url else {
            DispatchQueue.main.async {
                completion?(.failure(APIError.invalidURL))
            }
            return
        }
        
        let encoder = JSONEncoder()
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        target.headers?.forEach{ key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        if let data = target.data {
            request.httpBody = try? encoder.encode(data)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion?(.failure(error))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, let data = data else {
                DispatchQueue.main.async {
                    completion?(.failure(APIError.requestFailed))
                }
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                DispatchQueue.main.async {
                    completion?(.failure(APIError.requestFailed))
                }
                return
            }
            
            completion?(.success((data, response)))
        }
        .resume()
    }
}
