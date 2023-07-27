//
//  Repo.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation
import DomainLayer

public struct Repo: Codable {
    public let name: String
    public let language: String?
    
    public init(
        name: String,
        language: String
    ){
        self.name = name
        self.language = language
    }
}

extension Repo: DataModel {
    typealias DomainModel = DomainLayer.Repo
    
    func toDomain() -> DomainLayer.Repo {
        return DomainLayer.Repo(
            name: name,
            language: language ?? ""
        )
    }
    
    static func from(domain: DomainLayer.Repo) -> Repo {
        return Repo(
            name: domain.name,
            language: domain.language
        )
    }
}
