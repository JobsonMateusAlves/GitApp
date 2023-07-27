//
//  File.swift
//  
//
//  Created by Jobson Mateus on 24/07/23.
//

import Foundation

protocol DataModel {
    associatedtype DomainModel
    
    func toDomain() -> DomainModel
    static func from(domain: DomainModel) -> Self
}
