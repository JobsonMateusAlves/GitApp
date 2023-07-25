//
//  APIError.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case requestFailed
    case parseFailed
}
