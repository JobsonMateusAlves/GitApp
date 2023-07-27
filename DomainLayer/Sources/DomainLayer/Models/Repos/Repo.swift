//
//  Repo.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation

public struct Repo {
    public let name: String
    public let language: String
    
    public init(
        name: String,
        language: String
    ){
        self.name = name
        self.language = language
    }
}
